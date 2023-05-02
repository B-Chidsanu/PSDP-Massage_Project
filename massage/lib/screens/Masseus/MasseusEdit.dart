import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:massage/screens/BookingScreen.dart';
import 'package:massage/screens/Homes/home_screen.dart';
import 'package:massage/screens/NotificationScreen.dart';
import 'package:massage/screens/UserScreen.dart';

class MasseusEdit extends StatefulWidget {
  const MasseusEdit({super.key});

  @override
  State<MasseusEdit> createState() => _MasseusEditState();
}

class _MasseusEditState extends State<MasseusEdit> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DETAIL'),
      ),
      // backgroundColor: Color.fromARGB(255, 0, 168, 120),
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  // padding: EdgeInsetsDirectional.fromSTEB(15, 60, 0, 0),
                  height: 200,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        'https://images.everydayhealth.com/images/what-to-know-before-getting-a-massage-with-ankylosing-spondylitis-1440x810.jpg',
                      ),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Container(
                  width: 200,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            "OFFLINE",
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      Switch(
                        value: isSwitched,
                        onChanged: (value) {
                          setState(() {
                            isSwitched = value;
                            print(isSwitched);
                          });
                        },
                        activeTrackColor: Colors.lightGreenAccent,
                        activeColor: Colors.green,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            "ONLINE",
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text('นางสาว Test', style: TextStyle(fontSize: 25)),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Icon(Icons.star, color: Colors.yellow),
                    Icon(Icons.star, color: Colors.yellow),
                    Icon(Icons.star, color: Colors.yellow),
                    Icon(Icons.star, color: Colors.grey),
                    Icon(Icons.star, color: Colors.grey),
                    Text('4.0', style: TextStyle(fontSize: 16)),
                  ],
                ),
                Container(
                  width: 400,
                  child: ListTile(
                    title: Text('รายละเอียด'),
                    subtitle: Text(
                        'แนะนำร้านสปาสุดหรูกันไปหลายที่แล้ว ขอแนะนำร้านนวดสุดปังราคา มิตรภาพกันบ้าง กับ One More Thai Massage ร้านนวดติดรถไฟฟ้าสุดฮิต ของชาวจีนและชาวต่างชาติ เดินทางง่าย อยู่ใจกลางกรุง เพียงลง BTS  สถานีชิดลม ทางออก 3 ก็เจอเลย'),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.blue),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      child: Text('POST',
                          style: TextStyle(fontSize: 18, color: Colors.blue)),
                    ),
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.green),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      child: Text('EDIT',
                          style: TextStyle(fontSize: 18, color: Colors.green)),
                    )
                  ],
                )
              ]),
        ),
      )),
    );
  }
}
