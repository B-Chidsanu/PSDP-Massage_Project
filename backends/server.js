
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
    let sql = "SELECT * FROM register_user"
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



//Register
app.post("/register", async (req, res) => {
    const { username, password, name, phone, gender, email, address, role, img1, img2 } = req.body;
    let sql = "SELECT * FROM register_user WHERE email = ?";
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
                    let values = [username, hash, name, phone, gender, email, address, role, img1, img2];

                    // Replace undefined values with null
                    values = values.map((value) => (typeof value === "undefined" ? null : value));

                    let sql = "INSERT INTO register_user (username, password, name, phone, gender, email, address, role, img1, img2) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"
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



// //Login
app.post('/login', async (req, res) => {
    const { email, password } = req.body;
    if (!email || !password) {
        return res.status(400).json({
            message: "Email and password are required."
        });
    }
    let sql = "SELECT * FROM register_user WHERE email = ? ";
    conn.execute(sql, [email || null], async (err, result) => {
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
                    sql = " SELECT * FROM register_user";
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


//หน้า Post หมอนวด
app.put("/post_provider/:id", async (req, res) => {
    const { id } = req.params;
    const {
        detail,
        price,
    } = req.body;

    let sql =
        "UPDATE  register_user SET  detail = ?, price = ? WHERE id = ?";
    conn.execute(
        sql,
        [
            detail,
            price,
            id
        ],
        (err, results) => {
            if (err) {
                res.status(500).json({
                    status: false,
                    message: err.message,
                });
                return
            } else {
                res.status(200).json({
                    status: true,
                    message: "Success",
                    data: results,
                });
            }
        }
    );
});

//หน้าเลือกหมอนวดที่ออนไลน์
app.get('/select_provider', async (req, res) => {

    let sql = "SELECT register_user id, name, price, detail FROM  WHERE role = 'provider' AND status = 'online'";

    await conn.execute(sql,
        (err, result) => {
            if (err) {
                res.status(500).json({
                    message: err.message
                })
                return
            }
            res.status(200).json({
                message: "เรียกข้อมูลสำเร็จ",
                data: result
            })
        })
})

//หน้าจองหมอนวด
app.get('/reserve_provider/:id', async (req, res) => {
    const { id } = req.params
    let sql = "SELECT name, detail FROM  WHERE id = ?"
    await conn.execute(sql,
        [id],
        (err, result) => {
            if (err) {
                res.status(500).json({
                    message: err.message
                })
                return
            }
            res.status(200).json({
                message: "เรียกข้อมูลสำเร็จ",
                data: result
            })
        })
})


app.listen(port, () => {
    console.log(`Example app listening on port ${port}`)
})