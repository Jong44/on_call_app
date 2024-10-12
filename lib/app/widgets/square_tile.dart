import 'package:flutter/material.dart';

class SquareTile extends StatelessWidget {
  final String imagePath;
  const SquareTile({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffd8dadc)),
        borderRadius: BorderRadius.circular(50),
        color: Colors.white,
      ),
      child: Image.asset(
        imagePath,
        height: 20,
      ),
    );
  }
}
