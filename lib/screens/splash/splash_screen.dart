import 'dart:async';

import 'package:flutter/material.dart';
import 'package:medicalapp/screens/login/login_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 1), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff4157FF),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                  ),
                ],
              ),
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.white,
                child: Image.asset(
                  'assets/icons/plus-icon.png',
                  color: Colors.blue,
                  width: 55,
                ),
              ),
            ),
            const Text(
              'Quick Medical',
              style: TextStyle(
                  fontSize: 27,
                  fontStyle: FontStyle.italic,
                  color: Colors.white,
                  fontWeight: FontWeight.w300),
            ),
          ],
        ),
      ),
    );
  }
}
