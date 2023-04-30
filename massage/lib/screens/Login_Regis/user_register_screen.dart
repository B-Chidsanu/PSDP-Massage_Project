import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:massage/models/post.dart';
import 'package:massage/screens/Login_Regis/InputBox/inputbox.dart';
import 'package:massage/screens/Login_Regis/InputBox/button.dart';
import 'package:massage/screens/Login_Regis/login_screen.dart';
import 'package:massage/services/remote_service.dart';
import 'package:http/http.dart' as http;

// enum ProductTypeEnum { Male, Female }

class UserRegister extends StatefulWidget {
  const UserRegister({super.key});

  @override
  State<UserRegister> createState() => _UserRegisterState();
}

class _UserRegisterState extends State<UserRegister> {
  @override
  final formkey = GlobalKey<FormState>();

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController address = TextEditingController();

  // Future register() async {
  //   String url = "http://127.0.0.1:8000/users/";
  //   final respons = await http.post(Uri.parse(url), body: {
  //     'username': username.text,
  //     'password': password.text,
  //     'name': name.text,
  //     'phone': phone.text,
  //     'gender': _selectedGender,
  //     'email': email.text,
  //     'address': address.text,
  //   });
  //   var data = json.decode(respons.body);
  //   if (data == "Error") {
  //     Navigator.pushNamed(context, 'UserRegister');
  //   } else {
  //     Navigator.pushNamed(context, 'HomeScreen');
  //   }
  // }

  bool _registeringStatus = false;

  @override
  void dispose() {
    username.dispose();
    password.dispose();
    name.dispose();
    phone.dispose();
    gender.dispose();
    email.dispose();
    super.dispose();
  }

  // List<UserRegisPost>? posts;
  // var isLoaded = false;

  // @override
  // void initState() {
  //   super.initState();
  //   postData();
  // }

  // postData() async {
  //   posts = await RemoteService().post();
  //   if (posts != null) {
  //     setState(() {
  //       isLoaded = true;
  //     });
  //   }
  // }

  String _selectedGender = 'male';

  // @override
  // Void initState() {
  //   super.initState();
  //   getName();
  // }

  // void getName() {
  //   print('ดึงชื่อ');
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 168, 120),
      body: SafeArea(
        child: Form(
          key: formkey,
          child: Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                      width: 180,
                      height: 170,
                      "assets/images/massage_logo.png"),
                  Text(
                    'Register',
                    style: GoogleFonts.chakraPetch(
                        textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    )),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.1,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(children: [
                      InputBox('Username', 'Enter Your Username', Icons.person,
                          Colors.purple, username),
                      InputBox('Password', 'Enter Your Password', Icons.key,
                          Colors.purple, password),
                      InputBox('Name', 'Enter Your Name', Icons.person,
                          Colors.purple, name),
                      InputBox('Phone', 'Enter Your Phone number', Icons.phone,
                          Colors.purple, phone),
                      Row(
                        children: [
                          Expanded(
                            child: RadioListTile(
                                value: 'Male',
                                groupValue: _selectedGender,
                                activeColor: Color.fromARGB(255, 197, 90, 216),
                                contentPadding: EdgeInsets.all(0.0),
                                title: Text(
                                  'Male',
                                  style: TextStyle(color: Colors.purple),
                                ),
                                onChanged: (val) {
                                  setState(() {
                                    _selectedGender = val!;
                                  });
                                }),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: RadioListTile(
                                value: 'Female',
                                groupValue: _selectedGender,
                                activeColor: Color.fromARGB(255, 197, 90, 216),
                                contentPadding: EdgeInsets.all(0.0),
                                // tileColor: Colors.white,
                                title: Text('Female',
                                    style: TextStyle(color: Colors.purple)),
                                onChanged: (val) {
                                  setState(() {
                                    _selectedGender = val!;
                                  });
                                }),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      InputBox('E-mail', 'Enter Your E-mail', Icons.email,
                          Colors.purple, email),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, bottom: 20),
                        child: TextFormField(
                          controller: address,
                          keyboardType: TextInputType.multiline,
                          maxLines: 4,
                          maxLength: 200,
                          decoration: const InputDecoration(
                              hintText: "Write Your Address",
                              focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1, color: Colors.redAccent)),
                              filled: true,
                              fillColor: Colors.white),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                ),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.blueAccent),
                                padding: MaterialStateProperty.all<
                                    EdgeInsetsGeometry>(
                                  EdgeInsets.symmetric(
                                    horizontal:
                                        MediaQuery.of(context).size.width / 10,
                                    vertical: 10,
                                  ),
                                ),
                              ),
                              onPressed: () {
                                bool password =
                                    formkey.currentState!.validate();
                                if (password) {
                                  UserRegister();
                                } else {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginScreen(),
                                          settings:
                                              RouteSettings(arguments: Null)));
                                }
                              },
                              child: Text('OK'),
                            ),
                          ),
                          Expanded(
                              child: InputButton(
                                  LoginScreen(), Colors.redAccent, 'cencel'))
                        ],
                      )
                    ]),
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
