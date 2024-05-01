import 'package:bank_app/screens/tab/tab_box.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

import '../widget/auth_text_field.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>
    with SingleTickerProviderStateMixin {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameCtrl = TextEditingController();

  bool check = false;
  late AnimationController animationController;
  late Animation colorAnimation;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    colorAnimation =
        ColorTween(begin: Colors.white, end: Colors.white.withOpacity(.01))
            .animate(animationController)
          ..addListener(() {
            setState(() {});
          });

    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: Form(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              SvgPicture.asset(
                "assets/icons/bank.svg",
                width: 200,
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "Login",
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 50,
              ),
              UniversalTextField(
                controller: emailController,
                hinText: "Email",
                svgPath: "assets/icons/email.svg",
                width: 8,
              ),
              const SizedBox(
                height: 32,
              ),
              UniversalTextField(
                controller: passwordController,
                hinText: "Password",
                svgPath: "assets/icons/email.svg",
                width: 8,
                isPassword: true,
              ),
              const SizedBox(
                height: 15,
              ),
              const SizedBox(
                height: 30,
              ),
              TextButton(
                style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 90, vertical: 17),
                    backgroundColor: const Color(0xff1317DD)),
                onPressed: () async {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => const TabScreen()));
                },
                child: Text(
                  animationController.isAnimating ? "Logging" : "Login",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                    color: colorAnimation.value,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "OR",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 22),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Log in with",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 16),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: () {},
                      child: SvgPicture.asset(
                        "assets/icons/google.svg",
                        width: 38,
                      )),
                  GestureDetector(
                      onTap: () {},
                      child: SvgPicture.asset(
                        "assets/icons/apple.svg",
                        width: 40,
                      )),
                  GestureDetector(
                      onTap: () {},
                      child: SvgPicture.asset(
                        "assets/icons/facebook.svg",
                        width: 18,
                      )),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Register Now",
                      style: TextStyle(
                        color: Color(0xff1317DD),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
