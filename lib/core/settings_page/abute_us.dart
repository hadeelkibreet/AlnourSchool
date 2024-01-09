import 'package:flutter/material.dart';
import '../../constants/constants/images.dart';
import '../../constants/constants/backgroundimage.dart';

class AbuteUs extends StatefulWidget {
  const AbuteUs({Key? key}) : super(key: key);

  @override
  State<AbuteUs> createState() => _AbuteUsState();
}

class _AbuteUsState extends State<AbuteUs> {
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Stack(
        children: [
          BackGroundImage(),
          Padding(
            padding: const EdgeInsets.all(10.0),
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
                     // height: 80,
                      width: 80,
                      // Adjust width and height if needed
                    ),
                  ],
                ),
                 Padding(
                   padding: const EdgeInsets.symmetric(vertical: 55),
                   child: const DefaultTextStyle(
                     style: TextStyle(
                         color: Colors.white,
                         fontSize: 50,
                         fontWeight: FontWeight.w900,
                         fontFamily: 'boutros',

                     ),
                     child: Text('من نحن؟'),),
                 ),
                const DefaultTextStyle(
                  textAlign: TextAlign.end,
                  overflow:  TextOverflow.ellipsis,
                  maxLines: 9,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w200,
                    fontFamily: 'boutros',

                  ),
                  child: Text('مدرستنا الثانوية هي ملتقي للتعليم والتفوق, حيث يتقاطع العلم والفن والرياضة.'
                      ' بفخرها كمؤسسة تعليمية, بتني جواً محفزاً يمزج بين الأكاديمية والثقافة والروحانية. تظهر الأروقة النابضة بالحياة وتنوع الأفكار والطموحات, بينما يتألق الطلاب بالإبداع والإلهام.'
                      ' إنها مدرسة تقوم على تنمية الشخصية وتحفيز الاكتشاف, حيث يحظى الطلاب بفرصة لتحقيق طموحاتهم وتطوير امكانياتهم الكامنة'),
                ),
                SizedBox(
                  height: 50,
                ),
                const DefaultTextStyle(

                  textAlign: TextAlign.end,
                  overflow:  TextOverflow.ellipsis,
                  maxLines: 3,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'boutros',

                  ),
                  child: Text('تدرس النور الصف العاشر والحادي عشر والبكلوريا بفرعيهم العلمي والأدبي'),),
              ],
            ),
          )
        ],
      ),
    );
  }
}