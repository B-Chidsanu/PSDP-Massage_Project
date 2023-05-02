import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:massage/screens/BookingScreen.dart';
import 'package:massage/screens/Homes/home_screen.dart';
import 'package:massage/screens/NotificationScreen.dart';
import 'package:massage/screens/UserScreen.dart';

class MasseusDetail extends StatefulWidget {
  const MasseusDetail({super.key});

  @override
  State<MasseusDetail> createState() => _MasseusDetailState();
}

class _MasseusDetailState extends State<MasseusDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ABOUT US'),
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
                ListTile(
                  title: Text('รายละเอียด'),
                  subtitle: Text(
                      'แนะนำร้านสปาสุดหรูกันไปหลายที่แล้ว ขอแนะนำร้านนวดสุดปังราคา มิตรภาพกันบ้าง กับ One More Thai Massage ร้านนวดติดรถไฟฟ้าสุดฮิต ของชาวจีนและชาวต่างชาติ เดินทางง่าย อยู่ใจกลางกรุง เพียงลง BTS  สถานีชิดลม ทางออก 3 ก็เจอเลย'),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 60.0,
                      ),
                      SizedBox(height: 10.0),
                      Column(children: <Widget>[
                        Text('คนรีวิว 1',
                            style:
                                TextStyle(fontSize: 18, color: Colors.white)),
                        Row(children: <Widget>[
                          Icon(Icons.star, color: Colors.yellow, size: 20.0),
                          Icon(Icons.star, color: Colors.yellow, size: 20.0),
                          Icon(Icons.star, color: Colors.yellow, size: 20.0),
                          Icon(Icons.star, color: Colors.yellow, size: 20.0),
                          Icon(Icons.star, color: Colors.grey, size: 20.0),
                        ]),
                        Text('ลายละเอียดรีวิว',
                            style:
                                TextStyle(fontSize: 14, color: Colors.white)),
                      ]),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    padding:
                        EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
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
                      child: Text('RESERVE',
                          style: TextStyle(fontSize: 18, color: Colors.blue)),
                    ),
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.red),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      ),
                      child: Text('CANCEL',
                          style: TextStyle(fontSize: 18, color: Colors.red)),
                    )
                  ],
                )
              ]),
        ),
      )),
    );
  }
}
