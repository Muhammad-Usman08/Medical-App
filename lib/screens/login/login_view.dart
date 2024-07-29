import 'package:flutter/material.dart';
import 'package:medicalapp/components/button.dart';
import 'package:medicalapp/screens/home/home.dart';

// ignore: must_be_immutable
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //controller
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
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
                fontWeight: FontWeight.w700),
          ),
          Container(
              margin: const EdgeInsets.only(top: 80, bottom: 50),
              child: Text(
                'Please Enter your Mobile Number to \nLogin/Sign Up',
                style: TextStyle(color: Colors.grey[500]),
              )),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 40),
            child: TextField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: 'Enter email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(17.0)),
                ),
                contentPadding: EdgeInsets.all(17.0),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                hintText: 'Enter password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(17.0)),
                ),
                contentPadding: EdgeInsets.all(17.0),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: MyButton(
              buttonText: 'CONTINUE',
              onpressed: () {
                if (emailController.text != '' &&
                    passwordController.text != '') {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeScreen(),
                      ));
                } else {
                  print('object');
                }
              },
            ),
          )
        ],
      ),
    ));
  }
}
