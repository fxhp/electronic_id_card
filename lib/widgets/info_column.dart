import 'package:flutter/material.dart';

class InfoColumn extends StatelessWidget {
  final String title;
  final String info;
  final bool isAlignEnd;

  const InfoColumn({super.key, required this.title, required this.info, this.isAlignEnd = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: isAlignEnd ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 12.0,
            color: Colors.black,
          ),
        ),
        Text(
          info,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
