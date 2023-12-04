import 'dart:convert';

import 'package:camera_platform_interface/src/types/camera_description.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:gpt_pill_03/api/api.dart';
import 'package:gpt_pill_03/authentication/signup_page.dart';
import 'package:gpt_pill_03/home_screen.dart';
import 'package:gpt_pill_03/model/user.dart';
import 'package:gpt_pill_03/user/user_pref.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  final CameraDescription camera; // camera 변수 추가

  const LoginPage({Key? key, required this.camera}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  userLogin() async {
    try {
      var res = await http.post(Uri.parse(API.login), body: {
        'user_email': emailController.text.trim(),
        'user_password': passwordController.text.trim()
      });

      if (res.statusCode == 200) {
        var resLogin = jsonDecode(res.body);
        if (resLogin['success'] == true) {
          Fluttertoast.showToast(msg: '로그인이 성공적으로 되었습니다');
          User userInfo = User.fromJson(resLogin['userData']);

          await RemeberUser.saveRememberUserInfo(userInfo);

          Get.to(HomeScreen(camera: widget.camera));

          setState(() {
            emailController.clear();
            passwordController.clear();
          });
        } else {
          Fluttertoast.showToast(msg: '이메일 또는 비밀번호를 확인해 주세요.');
          setState(() {
            emailController.clear();
            passwordController.clear();
          });
        }
      }
    } catch (e) {
      print(e.toString());
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/pill.png'),
                SizedBox(
                  height: 30,
                ),
                Text(
                  '약올림',
                  style: TextStyle(fontFamily: 'SoyoBold', fontSize: 26.0),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '로그인을 해주세요!',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: TextFormField(
                              controller: emailController,
                              validator: (val) =>
                                  val == "" ? "Email을 입력해 주세요" : null,
                              decoration: InputDecoration(
                                  border: InputBorder.none, hintText: 'Email'),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.grey[200],
                              border: Border.all(color: Colors.white),
                              borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: TextFormField(
                              controller: passwordController,
                              validator: (val) =>
                                  val == "" ? "Password를 입력해 주세요" : null,
                              obscureText: true,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Password'),
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
                GestureDetector(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      userLogin();
                    }
                  },
                  child: Container(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 62, 196, 66),
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                          child: Text(
                            '로그인',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('회원이 아니신가요?'),
                    GestureDetector(
                      onTap: () => Get.to(() => SignupPage()),
                      child: Text(
                        '  지금 가입하고 사용하세요!',
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// import 'dart:convert';

// import 'package:camera_platform_interface/src/types/camera_description.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get.dart';
// import 'package:gpt_pill_03/api/api.dart';
// import 'package:gpt_pill_03/authentication/signup_page.dart';
// import 'package:gpt_pill_03/home_screen.dart';
// import 'package:gpt_pill_03/model/user.dart';
// import 'package:gpt_pill_03/user/user_pref.dart';
// import 'package:http/http.dart' as http;

// class LoginPage extends StatefulWidget {
//   final CameraDescription camera; // camera 변수 추가

//   const LoginPage({Key? key, required this.camera}) : super(key: key);

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   var formKey = GlobalKey<FormState>();
//   var emailController = TextEditingController();
//   var passwordController = TextEditingController();

//   userLogin() async {
//     try {
//       var res = await http.post(Uri.parse(API.login), body: {
//         'user_email': emailController.text.trim(),
//         'user_password': passwordController.text.trim()
//       });

//       if (res.statusCode == 200) {
//         var resLogin = jsonDecode(res.body);
//         if (resLogin['success'] == true) {
//           Fluttertoast.showToast(msg: '로그인이 성공적으로 되었습니다');
//           User userInfo = User.fromJson(resLogin['userData']);

//           await RemeberUser.saveRememberUserInfo(userInfo);

//           Get.to(HomeScreen(camera: widget.camera));

//           setState(() {
//             emailController.clear();
//             passwordController.clear();
//           });
//         } else {
//           Fluttertoast.showToast(msg: '이메일을 확인하여 주세요.');
//         }
//       }
//     } catch (e) {
//       print(e.toString());
//       Fluttertoast.showToast(msg: e.toString());
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Center(
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Image.asset('assets/images/pill.png'),
//                 SizedBox(
//                   height: 30,
//                 ),
//                 Text(
//                   '약올림',
//                   style: TextStyle(fontFamily: 'SoyoBold', fontSize: 26.0),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Text(
//                   '로그인을 해주세요!',
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 50,
//                 ),
//                 Form(
//                   key: formKey,
//                   child: Column(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                         child: Container(
//                           decoration: BoxDecoration(
//                             color: Colors.grey[200],
//                             border: Border.all(color: Colors.white),
//                             borderRadius: BorderRadius.circular(12),
//                           ),
//                           child: Padding(
//                             padding: const EdgeInsets.only(left: 20.0),
//                             child: TextFormField(
//                               controller: emailController,
//                               validator: (val) =>
//                                   val == "" ? "Email을 입력해 주세요" : null,
//                               decoration: InputDecoration(
//                                   border: InputBorder.none, hintText: 'Email'),
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                         child: Container(
//                           decoration: BoxDecoration(
//                               color: Colors.grey[200],
//                               border: Border.all(color: Colors.white),
//                               borderRadius: BorderRadius.circular(12)),
//                           child: Padding(
//                             padding: const EdgeInsets.only(left: 20.0),
//                             child: TextFormField(
//                               controller: passwordController,
//                               validator: (val) =>
//                                   val == "" ? "Password를 입력해 주세요" : null,
//                               obscureText: true,
//                               decoration: InputDecoration(
//                                   border: InputBorder.none,
//                                   hintText: 'Password'),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     if (formKey.currentState!.validate()) {
//                       userLogin();
//                     }
//                   },
//                   child: Container(
//                     child: Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 25.0),
//                       child: Container(
//                         padding: EdgeInsets.all(20),
//                         decoration: BoxDecoration(
//                             color: const Color.fromARGB(255, 62, 196, 66),
//                             borderRadius: BorderRadius.circular(12)),
//                         child: Center(
//                           child: Text(
//                             '로그인',
//                             style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 25,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text('회원이 아니신가요?'),
//                     GestureDetector(
//                       onTap: () => Get.to(() => SignupPage()),
//                       child: Text(
//                         '  지금 가입하고 사용하세요!',
//                         style: TextStyle(
//                             color: Colors.blue, fontWeight: FontWeight.bold),
//                       ),
//                     )
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }