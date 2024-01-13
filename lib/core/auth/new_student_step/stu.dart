// import 'package:alnour/core/auth/new_student_step/step0.dart';
// import 'package:alnour/core/auth/new_student_step/step1.dart';
// import 'package:alnour/core/auth/new_student_step/step2.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// import '../../../constants/constants/backgroundimage.dart';
// import '../../../constants/constants/circle.dart';
// import '../../../constants/constants/images.dart';
//
// class std extends ConsumerWidget {
//   std({Key? key}) : super(key: key);
//   final GlobalKey _formkey = GlobalKey<FormState>();
//   late PageController _pageController;
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController fathernameController = TextEditingController();
//   final TextEditingController mathernameController = TextEditingController();
//   final TextEditingController lastnameController = TextEditingController();
//   final TextEditingController sexController = TextEditingController();
//   final TextEditingController ageController = TextEditingController();
//
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController chakepasswordController = TextEditingController();
//   final TextEditingController phoneController = TextEditingController();
//   final TextEditingController classController = TextEditingController();
//   final TextEditingController adrissController = TextEditingController();
//   final currentPageIndexProvider = StateProvider<int>((ref) => 0);
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final _pageController = ref.watch(pageControllerProvider);
//     // final _currentPageIndex = 0;
//     List<String> _stepTitles = ['w', 'S', 'p'];
//     final currentPageIndex = ref.watch(currentPageIndexProvider).state;
//
//     void _nextPage(WidgetRef ref) {
//       final currentPageIndex = ref.watch(currentPageIndexProvider);
//       if (currentPageIndex.state < _stepTitles.length - 1) {
//         currentPageIndex.state = currentPageIndex.state + 1;
//         ;
//         _pageController.nextPage(
//             duration: const Duration(milliseconds: 300), curve: Curves.ease);
//       }
//     }
//
//     void _previousPage(WidgetRef ref) {
//       final currentPageIndex = ref.watch(currentPageIndexProvider).state;
//       if (currentPageIndex > 0) {
//         ref.read(currentPageIndexProvider).state = currentPageIndex - 1;
//         _pageController.previousPage(
//             duration: const Duration(milliseconds: 300), curve: Curves.ease);
//       }
//     }
//
//     return SafeArea(
//       child: Scaffold(
//           body: GestureDetector(
//             onTap: () {
//               FocusScope.of(context).requestFocus(FocusNode());
//             },
//             child: Stack(
//               children: [
//                 BackGroundImage(),
//                 Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(10.0),
//                       child: Align(
//                         alignment: Alignment.topCenter,
//                         child: Column(
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Column(
//                                   children: [
//                                     Image.asset(
//                                       ImageAssets.nour,
//                                       width: 80,
//                                     ),
//                                     Image.asset(
//                                       ImageAssets.book,
//                                       width: 80,
//                                     ),
//                                   ],
//                                 ),
//                                 Image.asset(
//                                   ImageAssets.school,
//                                   width: 70,
//                                 ),
//                               ],
//                             ),
//                             SizedBox(
//                               height: 20,
//                             ),
//                             Row(
//                               mainAxisSize: MainAxisSize.min,
//                               children: [
//                                 CircleWithNumber(
//                                     number: 1,
//                                     radius: currentPageIndex >= 0 ? 16 : 20,
//                                     color: currentPageIndex >= 0
//                                         ? Colors.deepPurpleAccent
//                                         : Colors.black12,
//                                     textStyle: TextStyle()),
//                                 SizedBox(
//                                   width: 10,
//                                 ),
//                                 CircleWithNumber(
//                                     number: 2,
//                                     radius: currentPageIndex >= 0 ? 16 : 20,
//                                     color: currentPageIndex >= 1
//                                         ? Colors.deepPurpleAccent
//                                         : Colors.black12,
//                                     textStyle: TextStyle()),
//                                 SizedBox(
//                                   width: 10,
//                                 ),
//                                 CircleWithNumber(
//                                     number: 3,
//                                     radius: currentPageIndex >= 0 ? 16 : 20,
//                                     color: currentPageIndex >= 2
//                                         ? Colors.deepPurpleAccent
//                                         : Colors.black12,
//                                     textStyle: TextStyle()),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     Expanded(
//                       child: SingleChildScrollView(
//                         child: Form(
//                           key: _formkey,
//                           child: Container(
//                             height: MediaQuery.of(context).size.height,
//                             child: PageView(
//                               physics: NeverScrollableScrollPhysics(),
//                               controller: _pageController,
//                               onPageChanged: (index) {
//                                 ref.read(currentPageIndexProvider).state =
//                                     index;
//                               },
//                               children: [
//                                 Center(
//                                     child: Step0(
//                                         nameController: nameController,
//                                         fathernameController:
//                                             fathernameController,
//                                         mathernameController:
//                                             mathernameController,
//                                         sexController: sexController,
//                                         ageController: ageController,
//                                         lastnameController:
//                                             lastnameController)),
//                                 Center(
//                                     child: Step1(
//                                         emailController: emailController,
//                                         passwordController: passwordController,
//                                         chakepasswordController:
//                                             chakepasswordController,
//                                         phoneController: phoneController,
//                                         classController: classController,
//                                         adrissController: adrissController)),
//                                 Center(child: Step2()),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           floatingActionButton: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               currentPageIndex == 0
//                   ? SizedBox()
//                   : Padding(
//                       padding: const EdgeInsets.only(left: 30),
//                       child: FloatingActionButton(
//                         onPressed: () {
//                           _previousPage(ref);
//                         },
//                         child: Icon(Icons.arrow_back_ios),
//                       ),
//                     ),
//               FloatingActionButton(
//                 onPressed: () {
//                   _nextPage(ref);
//                 },
//                 child: Icon(Icons.arrow_forward_ios),
//               ),
//             ],
//           )),
//     );
//   }
// }
