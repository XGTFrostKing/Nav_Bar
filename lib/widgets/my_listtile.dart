import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyListTile extends StatelessWidget {
  var subtitle;

MyListTile(
      {super.key,
      required this.image,
      required this.text,
      required this.subtitle,
      required this.onTap});

  final String image;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(image),
      ),
      title: Text(text),
      subtitle: Text(subtitle),
      onTap: onTap,
    );
  }
}
