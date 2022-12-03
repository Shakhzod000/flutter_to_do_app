
import 'package:flutter/material.dart';
import 'package:flutter_to_do_app/utils/theme.dart';

class MyButton extends StatelessWidget {
  final String? label;
  final Function ()? ontap;
  const MyButton({super.key,
  required this.label,
  required this.ontap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap!,
      child: Container(
        width: 100,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: primarClr
        ),
        child: Center(
          child: Text(
            label!,
            textAlign: TextAlign.center,
            style:const  TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}