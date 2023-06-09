import 'package:firebase_test_1/home/login_screen.dart';
import 'package:firebase_test_1/home/phone%20number/sigup_with_phonenumber.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Firebase/firebse_auth.dart';
import '../../components/custome_button.dart';
import '../../controller/auth_concroller.dart';

class SignInWithPhoneNumber extends StatelessWidget {
  const SignInWithPhoneNumber({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final con = Get.put(AuthController());
    final auth = FirebaseAuthentication();
    const primaryColor = Color(0xff4338CA);
    const secondaryColor = Color(0xff6D28D9);
    const accentColor = Color(0xffffffff);
    const errorColor = Color(0xffEF4444);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Container(
                height: 50,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                      offset: const Offset(12, 26),
                      blurRadius: 50,
                      spreadRadius: 0,
                      color: Colors.grey.withOpacity(.1)),
                ]),
                child: TextFormField(
                  controller: con.phonenumber,
                  onChanged: (value) {
                    //Do something wi
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter phone number';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(fontSize: 14, color: Colors.black),
                  decoration: InputDecoration(
                    // prefixIcon: Icon(Icons.email),
                    filled: true,
                    fillColor: accentColor,
                    hintText: 'Enter your phone number',
                    hintStyle: TextStyle(color: Colors.grey.withOpacity(.75)),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 0.0, horizontal: 20.0),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: primaryColor, width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: secondaryColor, width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    errorBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: errorColor, width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: primaryColor, width: 1.0),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomBotton(
                    title: 'Rigester',
                    onTap: () {
                      Get.to(const SignUpWithPhoneNumber());
                    },
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  CustomBotton(
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        await auth.verifyPhoneNumber(
                            phonenumber: con.phonenumber.text);
                        // if (login == true) {
                        //   Get.to(const HomeScreen());
                        // }
                      }
                    },
                    title: 'Send Code',
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                  onTap: () {
                    Get.offAll(const LoginScreen());
                  },
                  child: const Text('Login with Email')),
            ],
          ),
        ),
      ),
    );
  }
}
