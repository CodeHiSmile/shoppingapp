import 'package:flutter/material.dart';

class BaseButton extends StatelessWidget {
  final Function onTap;
  final String title;
  final double? spacingBottom;

  const BaseButton({
    Key? key,
    required this.onTap,
    required this.title,
    this.spacingBottom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        margin: EdgeInsets.only(left: 57, right: 58, bottom: spacingBottom ?? 0.0),
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.black,
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
