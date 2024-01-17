import 'package:alnour/constants/constants/backgroundimage.dart';
import 'package:alnour/constants/constants/images.dart';
import 'package:alnour/core/auth/login.dart';
import 'package:alnour/core/settings_page/abute_us.dart';
import 'package:alnour/core/settings_page/connect_us.dart';
import 'package:alnour/core/settings_page/location.dart';
import 'package:alnour/services/authservies.dart';
import 'package:flutter/material.dart';

class StudentProfile extends StatefulWidget {
  const StudentProfile({Key? key}) : super(key: key);

  @override
  State<StudentProfile> createState() => _StudentProfileState();
}

class _StudentProfileState extends State<StudentProfile> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    int requst = 1;
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: const Color(0x7E41007F)),
                accountName: Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text(
                      "هديل كبريت",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'boutros',
                      ),
                    ),
                  ),
                ),
                accountEmail: Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Text(
                      "hadil@gmail.com",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'boutros',
                      ),
                    ),
                  ),
                ),
                currentAccountPicture: Image.asset(
                  ImageAssets.fulllogo,
                  height: height * 0.8,
                  width: width * 0.9,
                ),
              ),
              ListTile(
                trailing: Icon(
                  Icons.contact_support_outlined,
                ),
                title: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    'من نحن ',
                    style: TextStyle(
                      fontFamily: 'boutros',
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AbuteUs()),
                  );
                },
              ),
              ListTile(
                trailing: Icon(
                  Icons.location_on,
                ),
                title: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'موقعنا',
                      style: TextStyle(
                        fontFamily: 'boutros',
                      ),
                    )),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LocationScreen()),
                  );
                },
              ),
              ListTile(
                trailing: Icon(
                  Icons.phone,
                ),
                title: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'تواصل معنا',
                      style: TextStyle(
                        fontFamily: 'boutros',
                      ),
                    )),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ConnectUs()),
                  );
                },
              ),
              ListTile(
                trailing: Icon(
                  Icons.power_settings_new,
                  color: Colors.red,
                ),
                title: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'تسجيل خروج',
                      style: TextStyle(
                        fontFamily: 'boutros',
                      ),
                    )),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Column(
                          children: [
                            Icon(
                              Icons.power_settings_new,
                              color: Colors.red,
                              size: 50,
                            ),
                            Text(
                              'هل فعلا تريد تسجيل الخروج؟',
                              style: TextStyle(
                                color: Colors.red,
                                fontSize: 20,
                                fontFamily: 'boutros',
                              ),
                            ),
                          ],
                        ),
                        actions: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('لا'),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  signOutInApp();
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LogInScreen()),
                                    (route) => false,
                                  );
                                },
                                child: Text('نعم'),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          backgroundColor: Color(0xFF092D71),
          actions: [
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Column(
                children: [
                  Image.asset(
                    width: MediaQuery.of(context).size.width * 0.18,
                    ImageAssets.nour,
                    // width: 80,
                  ),
                  Image.asset(
                    width: MediaQuery.of(context).size.width * 0.19,
                    ImageAssets.book,
                    //  width: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
        body: Stack(
          children: [
            BackGroundImage(),
            Align(
              alignment: Alignment.topCenter,
              child: Card(
                elevation: 80,
                shadowColor: Color(0xFCAB73E0),
                color: Colors.white54,
                child: SizedBox(
                  width: width * 0.9,
                  height: height * 0.3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        (() {
                          switch (requst) {
                            case 0:
                              return 'لقد تم رفض طلبك ';
                            case 1:
                              return 'طلب التسجيل قيد المعالجة';
                            case 2:
                              return 'لقد تم قبولك';
                            default:
                              return 'يوجد خطأ الرجاء التواصل معنا هاتفياً';
                          }
                        })(),
                        style: TextStyle(
                          fontFamily: 'boutros',
                          color: Color(0xF441007F),
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                        ),
                      ),
                      // Text(
                      //   'طلب التسجيل قيد المعالجة',
                      //   style: TextStyle(
                      //     fontFamily: 'boutros',
                      //     color: Color(0xF441007F),
                      //     fontWeight: FontWeight.w900,
                      //     fontSize: 20,
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
