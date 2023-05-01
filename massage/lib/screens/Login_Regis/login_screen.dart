import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:massage/models/post.dart';
import 'package:massage/screens/Homes/home_screen.dart';
import 'package:massage/screens/Login_Regis/register_status.dart';
import 'package:massage/screens/Navigators/navigationbar.dart';
import 'package:massage/screens/UserScreen.dart';
import 'package:massage/services/remote_service.dart';
import 'package:validators/validators.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // TextEditingController _textEditingController = TextEditingController();

  // final _formKey = GlobalKey<FormState>();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  // bool isHidden = true;
  // bool authenticatingStatus = false;

  // @override
  // void dispose() {
  //   email.dispose(); // ยกเลิกการใช้งานที่เกี่ยวข้องทั้งหมดถ้ามี
  //   password.dispose();
  //   super.dispose();
  // }

  Future<String> login(String email, String password) async {
    String url = 'http://10.0.2.2:8000/login';
    Map<String, String> data = {'email': email, 'password': password};
    Map<String, String> headers = {'Content-Type': 'application/json'};
    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON.
      var data = response.body;
      return data;
    } else {
      // If that call was not successful, throw an error.
      print(response.statusCode);
      print(response.body);
      throw Exception('Failed to load data.');
    }
  }

  // List<UserRegisPost>? posts;
  // var isLoaded = false;

  // @override
  // void initState() {
  //   super.initState();
  //   getData();
  // }

  // getData() async {
  // posts = await RemoteService().postData();
  // if (posts != null) {
  //   setState(() {
  //     isLoaded = true;
  //   });
  // }
  // }

  // @override
  // void dispose() {
  //   _textEditingController.clear();
  //   super.dispose();
  // }

  bool isEmailCorrect = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 168, 120),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Form(
              // key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.network(
                      'https://assets1.lottiefiles.com/packages/lf20_ssmouzg5.json',
                      animate: true,
                      height: 170,
                      width: 600),
                  Text(
                    'Log In',
                    style: GoogleFonts.chakraPetch(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                      ),
                    ),
                  ),
                  Text(
                    'Please login to continue using our app',
                    style: GoogleFonts.chakraPetch(
                      textStyle: TextStyle(
                          color: Colors.black.withOpacity(0.5),
                          fontWeight: FontWeight.w300,
                          // height: 1.5,
                          fontSize: 15),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: isEmailCorrect ? 280 : 300,
                    // _formKey!.currentState!.validate() ? 200 : 600,
                    // height: isEmailCorrect ? 260 : 182,
                    width: MediaQuery.of(context).size.width / 1.1,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, bottom: 20, top: 20),
                          child: TextFormField(
                            controller: email,
                            onChanged: (val) {
                              setState(() {
                                isEmailCorrect = isEmail(val);
                              });
                            },
                            decoration: const InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.purple,
                              ),

                              filled: true,
                              fillColor: Colors.white,
                              labelText: "E-mail",
                              hintText: 'e-mail',
                              labelStyle: TextStyle(color: Colors.purple),
                              // suffixIcon: IconButton(
                              //     onPressed: () {},
                              //     icon:
                              //         Icon(Icons.close, color: Colors.purple))
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Form(
                            // key: _formKey,
                            child: TextFormField(
                              controller: password,
                              obscuringCharacter: '*',
                              obscureText: true,
                              decoration: const InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Colors.purple,
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                labelText: "Password",
                                hintText: '*********',
                                labelStyle: TextStyle(color: Colors.purple),
                              ),
                              validator: (value) {
                                if (value!.isEmpty && value.length < 5) {
                                  return 'Enter a valid password';
                                  {
                                    return null;
                                  }
                                }
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  backgroundColor: isEmailCorrect == false
                                      ? Colors.red
                                      : Colors.purple,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 131, vertical: 20)
                                  // padding: EdgeInsets.only(
                                  //     left: 120, right: 120, top: 20, bottom: 20),
                                  ),
                              onPressed: () {
                                // if (_formKey.currentState!.validate()) {
                                // If the form is valid, display a snackbar. In the real world,
                                // you'd often call a server or save the information in a database.
                                // ScaffoldMessenger.of(context).showSnackBar(
                                //   const SnackBar(
                                //       content: Text('Processing Data')),
                                // );
                                String email = this.email.text;
                                String password = this.password.text;

                                print(email);
                                print(password);

                                // login(email, password);
                                // var result = await login.fromJson(this.email, this.password);
                                // login(this.email, this.password);
                                // }

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => NavigaBar()));
                              },
                              child: Text(
                                'Log In',
                                style: TextStyle(fontSize: 17),
                              )),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'You have\'t any account?',
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.6),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      RegisterStatus()));
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                              color: Colors.purple,
                              fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
