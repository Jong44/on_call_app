import 'package:flutter/material.dart';

class ItemGrup extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  const ItemGrup(
      {super.key,
      required this.image,
      required this.title,
      required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 25,
        backgroundImage: AssetImage(
          image,
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: Text(
        subtitle,
        style: const TextStyle(
          fontSize: 13,
          color: Colors.grey,
        ),
      ),
    );
  }
}
