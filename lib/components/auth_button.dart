import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key,
    required this.size,
    required this.text,
    this.onTap,
  });

  final double size;
  final String text;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        child: Center(
            child: Text(
          text,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
              fontSize: 15),
        )),
        height: size / 12,
        width: size / 1.9,
        decoration: BoxDecoration(
            color: Color(0xff246BFD), borderRadius: BorderRadius.circular(25)),
      ),
    );
  }
}
