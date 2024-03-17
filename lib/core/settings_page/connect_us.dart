import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constants/constants/backgroundimage.dart';
import '../../constants/constants/images.dart';

class ConnectUs extends StatefulWidget {
  const ConnectUs({Key? key}) : super(key: key);

  @override
  State<ConnectUs> createState() => _ConnectUsState();
}

class _ConnectUsState extends State<ConnectUs> {
  String phoneNumber = "+932982307298";
  String WhatsappNumber = "+963932068147";
  String instagramUrl = "https://www.instagram.com/ALNOURschool";
  String email = "ALNOURschool@gmail.com";

  void sendEmail() async {
    String url = "mailto:$email";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "Unable to send email";
    }
  }

  void openInstagramPage() async {
    if (await canLaunch(instagramUrl)) {
      await launch(instagramUrl);
    } else {
      throw "Unable to open Instagram";
    }
  }

  void callNumber() async {
    if (await canLaunch("tel:$phoneNumber")) {
      await launch("tel:$phoneNumber");
    } else {
      throw "Unable to launch phone app";
    }
  }

  void openWhatsApp() async {
    String url = "https://wa.me/$WhatsappNumber";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw "Unable to open WhatsApp";
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          BackGroundImage(),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Align(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Image.asset(
                            ImageAssets.nour,
                            width: 80,
                          ),
                          Image.asset(
                            ImageAssets.book,
                            width: 80,
                          ),
                        ],
                      ),
                      Image.asset(
                        ImageAssets.school,
                        width: 70,
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 50),
                    child: const DefaultTextStyle(
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'boutros',
                      ),
                      child: Text('تواصل معنا'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 45),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: ElevatedButton(
                              onPressed: openWhatsApp,
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor: Colors
                                    .transparent, // Set the background color to transparent
                                foregroundColor: Colors.white,
                              ),
                              child: Row(
                                children: [
                                  Image.asset(
                                    ImageAssets.whatsapp,
                                    width: 40,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    WhatsappNumber,
                                    style: TextStyle(
                                        fontSize: 25, fontFamily: 'omnes'),
                                  ),
                                ],
                              ),
                            )),
                        SizedBox(
                          height: 15,
                        ),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: ElevatedButton(
                              onPressed: callNumber,
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor: Colors
                                    .transparent, // Set the background color to transparent
                                foregroundColor: Colors.white,
                              ),
                              child: Row(
                                children: [
                                  Image.asset(
                                    ImageAssets.phone,
                                    width: 40,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    phoneNumber,
                                    style: TextStyle(
                                        fontSize: 25, fontFamily: 'omnes'),
                                  ),
                                ],
                              ),
                            )),
                        SizedBox(
                          height: 15,
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: ElevatedButton(
                            onPressed: openInstagramPage,
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              elevation: 0,
                              backgroundColor: Colors.transparent,
                            ),
                            child: Row(
                              children: [
                                Image.asset(
                                  ImageAssets.insta,
                                  width: 40,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'ALNOURschool',
                                  style: TextStyle(
                                      fontSize: 25, fontFamily: 'omnes'),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: ElevatedButton(
                              onPressed: sendEmail,
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor: Colors
                                    .transparent, // Set the background color to transparent
                                foregroundColor: Colors.white,
                              ),
                              child: Row(
                                children: [
                                  Image.asset(
                                    ImageAssets.gmail,
                                    width: 40,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    email,
                                    style: TextStyle(
                                        fontSize: 16, fontFamily: 'omnes'),
                                  ),
                                ],
                              ),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
