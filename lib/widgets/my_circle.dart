import 'package:flutter/material.dart';

class MyCircleContainer extends StatelessWidget {
  const MyCircleContainer({
    super.key,
    required this.image,
    required this.text,
  });

  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 100, // Increase height to accommodate both image and text
      margin: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              image: DecorationImage(image: NetworkImage(image), fit: BoxFit.cover),
            ),
          ),
          SizedBox(height: 5), // Spacer between image and text
          Text(
            text,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w300,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
