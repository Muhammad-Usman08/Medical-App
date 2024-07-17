import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String buttonText;
  final void Function()? onpressed;
  const MyButton({super.key, required this.buttonText,this.onpressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 45,
      child: ElevatedButton(
          onPressed: onpressed,
          style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Color(0xff4157FF))),
          child: Text(
            buttonText,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500),
          )),
    );
  }
}
