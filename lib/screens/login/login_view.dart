import 'package:flutter/material.dart';
import 'package:medicalapp/components/button.dart';
import 'package:medicalapp/screens/home/home.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  //controller
  TextEditingController numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
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
            controller: numberController,
            decoration: const InputDecoration(
              hintText: 'Enter number',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(17.0)),
              ),
              contentPadding: EdgeInsets.all(17.0),
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 40),
          child: MyButton(
            buttonText: 'CONTINUE',
            onpressed: () {
              if (numberController.text != '') {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ));
              } else {}
              // ignore: avoid_print
              print(numberController.text);
            },
          ),
        )
      ],
    ));
  }
}
