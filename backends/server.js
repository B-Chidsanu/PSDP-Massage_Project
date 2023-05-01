
const express = require('express')
const app = express()
const port = 3000
const mysql2 = require('mysql2')
const bcrypt = require('bcrypt')

const saltRound = 10;
app.use(express.json())
app.use(express.urlencoded({ extended: true }))

const conn = mysql2.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'massage'
});

// if(!conn){
//     console.log("False")
// }else{
//     console.log("True")
// }

app.get('/user', async (req, res) => {
    let sql = "SELECT * FROM user"
    await conn.execute(sql,
        (err, result) => {
            if (err) {
                res.status(400).json({
                    message: err.message
                })
                return
            } else {
                res.status(200).json({
                    message: "Connected to Data complet",
                    data: result
                })
            }

        })
})

// app.post('/user', async (req, res) => {
//     const { username, password, name, tel, gender, email, address } = req.body
//     bcrypt.genSalt(saltRound, (err, salt) => {
//         bcrypt.hash(password, salt, (err, hash) => {
//             let sql = "INSERT INTO user (username, password, name, tel, gender, email, address) VALUES (?,?,?,?,?,?,?)"
//             conn.execute(sql,
//                 [username, hash, name, tel, gender, email, address],
//                 (err, result) => {
//                     if (err) {
//                         res.status(400).json({
//                             message: err.message
//                         })
//                         return
//                     }
//                     res.status(200).json({
//                         message: "Add Data is complet",
//                         data: result
//                     })
//                 })
//         })
//     })
// })

//Register
app.post("/register", async (req, res) => {
    const { username, password, name, tel, gender, email, address, certificateimg, cardidimg } = req.body;
    let sql = "SELECT * FROM user WHERE email = ?";
    conn.execute(sql, [email], (err, results) => {
        if (err) {
            return res.status(500).json({
                status: "Error",
                message: "Internal server error",
            });
        } else if (results.length > 0) {
            return res.status(400).json({
                status: "False",
                message: "Email already exists",
            });
        } else {
            bcrypt.genSalt(saltRound, (err, salt) => {
                bcrypt.hash(password, salt, (err, hash) => {
                    let values = [username, hash, name, tel, gender, email, address, certificateimg, cardidimg];

                    for (let i = 0; i < values.length; i++) {
                        if (values[i] === undefined) {
                            values[i] = null;
                        }
                    }
                    let sql = "INSERT INTO user (username, password, name, tel, gender, email, address, certificateimg, cardidimg) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
                    conn.execute(sql, values, (err, results) => {
                        if (err) {
                            return res.status(500).json({
                                status: "Error",
                                message: "Internal server error",
                            });
                        } else {
                            return res.status(200).json({
                                status: "True",
                                message: "User created",
                            });
                        }
                    });
                });
            });
        }
    });
});




//Login
app.post('/login', async (req, res) => {
    const { email, password } = req.body;
    let sql = "SELECT * FROM user WHERE email = ? ";
    conn.execute(sql, [email], async (err, result) => {
        if (err) {
            res.status(400).json({
                message: err.message
            });
        }
        if (result.length == 0) {
            return res.status(200).json({
                status: "False",
            });
        } else {
            const hashedPassword = result[0].password;
            bcrypt.compare(password, hashedPassword, (err, result) => {
                if (result) {
                    sql = " SELECT * FROM user";
                    conn.execute(sql, (err, result) => {
                        if (err) {
                            return res.status(400).json({
                                message: err.message
                            });

                        } else {
                            return res.status(200).json({
                                status: "True",
                                data: result,
                            });
                        }
                    });
                } else {
                    return res.status(200).json({
                        status: "False",
                    });
                }
            });
        }
    })
});


app.listen(port, () => {
    console.log(`Example app listening on port ${port}`)
})