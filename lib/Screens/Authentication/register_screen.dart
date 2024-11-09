import 'dart:convert';

import 'package:book_and_author/Services/preferences.dart';
import 'package:book_and_author/Widgets/Buttons/custom_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import '../../Constants/alerts.dart';
import '../../Style/app_style.dart';
import '../../Widgets/TextFields/custom_text_field.dart';
import '../../main.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  FocusNode userNameFocus = FocusNode();
  FocusNode passwordFocus = FocusNode();
  FocusNode cpFocus = FocusNode();
  bool securePassword = true;
  bool secureConfirmPassword = true;


//Register user and save token
  Future<void> register() async {
   try{
     var url = Uri.parse("https://assessment.eltglobal.in/api/auth/register");
     var response = await http.post(url, body: {
       "username": userNameController.text,
       "password": passwordController.text
     });
       final data = jsonDecode(response.body);
       await Preferences.saveJWT(data['result']['access_token']);
       context.go('/');
   } catch(e) {
     showDialog(context: context, builder: (context) {
       return AlertDialog(
         title: const Text('Username already taken'),
         content: const Text('This username has already taken try logging in or use another username'),
         actions: [
           TextButton(onPressed: (){
             Navigator.pop(context);
           }, child: const Text('Cancel')),
           TextButton(onPressed: (){
             Navigator.pop(context);
             context.go('/login');
           }, child: const Text('Login')),
         ],
       );
     },);
   }
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: mq.height * 0.2,
            ),
            Image.asset('images/logo.png'),
            SizedBox(
              height: mq.height * 0.1,
            ),
            Form(
                key: formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18.0, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Username',
                            style: TextStyle(
                                color: userNameFocus.hasFocus
                                    ? AppStyle.mainColor
                                    : Colors.grey[700],
                                fontSize: 14),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          CustomTextField(
                            focusNode: userNameFocus,
                            controller: userNameController,
                            type: 'Username',
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18.0, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Password',
                            style: TextStyle(
                                color: passwordFocus.hasFocus
                                    ? AppStyle.mainColor
                                    : Colors.grey[700],
                                fontSize: 14),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          CustomTextField(
                            focusNode: passwordFocus,
                            controller: passwordController,
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  securePassword = !securePassword;
                                });
                              },
                              child: securePassword
                                  ? Image.asset('images/eye-off.png')
                                  : const Icon(Icons.visibility),
                            ),
                            hideText: securePassword,
                            type: 'Password',
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18.0, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Confirm Password',
                            style: TextStyle(
                                color: cpFocus.hasFocus
                                    ? AppStyle.mainColor
                                    : Colors.grey[700],
                                fontSize: 14),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          CustomTextField(
                            focusNode: cpFocus,
                            controller: confirmPasswordController,
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  secureConfirmPassword =
                                      !secureConfirmPassword;
                                });
                              },
                              child: secureConfirmPassword
                                  ? Image.asset('images/eye-off.png')
                                  : const Icon(Icons.visibility),
                            ),
                            hideText: secureConfirmPassword,
                            type: 'Confirm Password',
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10),
              child: CustomButton(
                onTap: () async {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    if (passwordController.text ==
                            confirmPasswordController.text &&
                        passwordController.text.length >= 4) {
                      await register();
                    } else if (passwordController.text.length < 4) {
                      showAlert(
                          context: context,
                          title: 'Weak Password',
                          content:
                              'Password should be at least 4 characters long!');
                    } else {
                      showAlert(
                          context: context,
                          title: 'Password does not match',
                          content:
                              'Password and Confirm Password must be same!');
                    }
                  }
                },
                child: const Text(
                  "Register",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: mq.height * 0.2,
            ),
          ],
        ),
      ),
    );
  }
}
