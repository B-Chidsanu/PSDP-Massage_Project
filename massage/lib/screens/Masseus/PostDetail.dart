import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:massage/screens/Homes/home_screen.dart';
import 'package:http/http.dart' as http;

class PostDetail extends StatefulWidget {
  const PostDetail({super.key});

  @override
  State<PostDetail> createState() => _PostDetailState();
}

class _PostDetailState extends State<PostDetail> {
  bool isSwitched = false;
  final _formKey = GlobalKey<FormState>();
  final _price = TextEditingController();
  final _detail = TextEditingController();

  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    setState(() {
      _price.text = 'John Doe';
      _detail.text = '123-456-7890';
    });
  }

  Future<void> _EditDetail() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
    }

    try {
      final response = await http.put(
        Uri.parse('http://localhost:3000/post_provider/:id'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'id': '10',
          'detail': _detail.text,
          'price': _price.text,
        }),
      );
      Map<String, dynamic> jsonMap = json.decode(response.body);
      if (jsonMap['status'] == true) {
        print(jsonMap['status']);
        print('Check: ${response.body}');
        // showDialog(
        //   context: context,
        //   builder: (BuildContext context) {
        //     return AlertDialog(
        //       title: Text('Signup Success'),
        //       content: Text('Add Success'),
        //       actions: [
        //         TextButton(
        //           child: Text('OK'),
        //           onPressed: () => Navigator.of(context).pop(),
        //         ),
        //       ],
        //     );
        //   },
        // );
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (BuildContext context) => LoginScreen()));
      } else {
        // print("55555" + jsonMap['status']);
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Signup Failed'),
              content: Text('!!Check Your E-mail'),
              actions: [
                TextButton(
                  child: Text('OK'),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            );
          },
        );
        setState(() {
          print('Login failed: ${response.body}');
          print('Email or password is incorrect');
          _isLoading = false;
        });
      }
    } catch (error) {
      setState(() {
        // _errorMessage = 'Email or password is incorrect';
        _isLoading = false;
      });
      // Something went wrong, show error message
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 2, 102, 74),
          title: Text(
            'PostDetail',
          )),
      backgroundColor: Color.fromARGB(255, 0, 168, 120),
      body: SafeArea(
          child: Form(
        key: _formKey,
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "ป้าศรี",
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      width: 320,
                      height: double.maxFinite,
                      decoration: BoxDecoration(color: Colors.white),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              '   Add course',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          TextFormField(
                            controller: _detail,
                            keyboardType: TextInputType.multiline,
                            maxLines: 4,
                            maxLength: 200,
                            decoration: const InputDecoration(
                                hintText: "คำอธิบายคอร์ส",
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 1, color: Colors.white)),
                                filled: true,
                                fillColor: Colors.white),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextField(
                            controller: _price,
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 3, color: Colors.white),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 3, color: Colors.black),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 3,
                                    color: Color.fromARGB(255, 66, 125, 145)),
                              ),
                              labelText: "Total Price:",
                              filled: true,
                              fillColor: Colors.white,
                              labelStyle: TextStyle(color: Colors.black),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ElevatedButton.icon(
                            onPressed: () {
                              _EditDetail();
                            },
                            style: ElevatedButton.styleFrom(
                              fixedSize: Size(120, 50),
                              backgroundColor: Colors.lightBlue,
                              // กำหนดขนาดของปุ่ม
                              // สามารถกำหนดพาร์ทอื่น ๆ ของปุ่มเพิ่มเติมได้ตามต้องการ
                            ),
                            icon: Icon(
                              Icons.edit,
                              color: Colors.black,
                            ),
                            // ไอคอนที่จะใช้
                            label: Text(
                              'Edit',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ), // ข้อความบนปุ่ม
                          )
                        ],
                      )),
                ]),
          ),
        ),
      )),
    );
  }
}
