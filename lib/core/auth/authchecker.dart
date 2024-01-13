// import 'package:alnour/core/auth/errorscreen.dart';
// import 'package:alnour/core/auth/loadingscreen.dart';
// import 'package:alnour/core/auth/login.dart';
// import 'package:alnour/providers/authprovider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
//
// import '../settings_page/abute_us.dart';
//
// class AuthChacker extends ConsumerWidget {
//   const AuthChacker({Key? key}): super(key: key);
//
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final _authState=ref.watch(authStateProvider);
//     return _authState.when(data:
//         (data){
//           if(data!=null)return AbuteUs();
//           return LogInScreen();
//         },
//         error: (e,trace)=>ErrorScreen(e: e,trace: trace,),
//         loading:()=>LoadingScreen());
//   }
// }
