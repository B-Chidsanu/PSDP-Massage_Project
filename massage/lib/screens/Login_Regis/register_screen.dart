import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:massage/screens/Login_Regis/InputBox/inputbox.dart';
import 'package:massage/screens/Login_Regis/InputBox/button.dart';
import 'package:massage/screens/Login_Regis/Profile.dart';
import 'package:massage/screens/Login_Regis/login_screen.dart';

import 'package:http/http.dart';

enum ProductTypeEnum { Male, Female }

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController _textarea = TextEditingController();

  File? image;
  File? image1;

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imageTamporary = File(image.path);
      setState(() => this.image = imageTamporary);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future pickImage1(ImageSource source) async {
    try {
      final image1 = await ImagePicker().pickImage(source: source);
      if (image1 == null) return;
      final imageTamporary = File(image1.path);
      setState(() => this.image1 = imageTamporary);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  ProductTypeEnum? _productTypeEnum;

  // Profile profile = Profile();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 168, 120),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                    width: 180, height: 170, "assets/images/massage_logo.png"),
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
                    InputBox(
                      'Username',
                      'Enter Your Username',
                      Icons.person,
                      Colors.purple,
                    ),
                    InputBox('Password', 'Enter Your Password', Icons.key,
                        Colors.purple),
                    InputBox(
                        'Name', 'Enter Your Name', Icons.person, Colors.purple),
                    InputBox('Phone', 'Enter Your Phone number', Icons.phone,
                        Colors.purple),
                    Row(
                      children: [
                        Expanded(
                          child: RadioListTile<ProductTypeEnum>(
                              value: ProductTypeEnum.Male,
                              groupValue: _productTypeEnum,
                              activeColor: Color.fromARGB(255, 197, 90, 216),
                              contentPadding: EdgeInsets.all(0.0),
                              // tileColor: Colors.white,
                              title: Text(
                                ProductTypeEnum.Male.name,
                                style: TextStyle(color: Colors.purple),
                              ),
                              onChanged: (val) {
                                setState(() {
                                  _productTypeEnum = val;
                                });
                              }),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: RadioListTile<ProductTypeEnum>(
                              value: ProductTypeEnum.Female,
                              groupValue: _productTypeEnum,
                              activeColor: Color.fromARGB(255, 197, 90, 216),
                              contentPadding: EdgeInsets.all(0.0),
                              // tileColor: Colors.white,
                              title: Text(ProductTypeEnum.Female.name,
                                  style: TextStyle(color: Colors.purple)),
                              onChanged: (val) {
                                setState(() {
                                  _productTypeEnum = val;
                                });
                              }),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    InputBox('E-mail', 'Enter Your E-mail', Icons.email,
                        Colors.purple),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 20),
                      child: TextFormField(
                        controller: _textarea,
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
                    image != null
                        ? Image.file(
                            image!,
                            width: 150,
                            height: 150,
                            fit: BoxFit.cover,
                          )
                        : Image.network(
                            'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png',
                            width: 150,
                            height: 150,
                            fit: BoxFit.fill,
                          ),
                    CertiButton(
                        title: 'Certificate',
                        icon: Icons.image_outlined,
                        onClick: () => pickImage(ImageSource.gallery)),
                    //PickImage ID-Card
                    image1 != null
                        ? Image.file(
                            image1!,
                            width: 300,
                            height: 150,
                            fit: BoxFit.cover,
                          )
                        : Image.network(
                            'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png',
                            width: 300,
                            height: 150,
                            fit: BoxFit.fill,
                          ),
                    CertiButton(
                        title: 'ID-Card',
                        icon: Icons.image_outlined,
                        onClick: () => pickImage1(ImageSource.gallery)),
                    Row(
                      children: [
                        Expanded(
                            child: InputButton(
                                LoginScreen(), Colors.blueAccent, 'OK')),
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
    );
  }
}

Widget CertiButton(
    {required String title,
    required IconData icon,
    required VoidCallback onClick}) {
  return Container(
      width: 150,
      child: ElevatedButton(
        onPressed: onClick,
        child: Row(children: [
          Icon(Icons.upload_file),
          SizedBox(
            width: 20,
          ),
          Text(title)
        ]),
      ));
}
