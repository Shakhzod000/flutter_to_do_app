
import 'package:flutter/material.dart';
import 'package:flutter_to_do_app/utils/theme.dart';
import 'package:get/get.dart';

class MyInputTextfield extends StatelessWidget {
  final String? title;
  final String? hint;
  final TextEditingController? controller;
 final Widget? widget;

  const MyInputTextfield({super.key,
  required this.hint,
  required this.title,
  this.controller,
  this.widget
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title!,
          style: titleStyle,),
          Container(
            padding: const EdgeInsets.only(left: 15),
            height: 52,
            margin:const  EdgeInsets.only(top: 8.0),
            decoration: BoxDecoration(
              border: Border.all(width: 1.0,color: Colors.grey),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    readOnly: widget == null?false:true,
                  autofocus: false,
                  cursorColor: Get.isDarkMode?Colors.grey[100]:Colors.grey[600],
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: hint!,
                    hintStyle: subtitleStyle,
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: context.theme.backgroundColor,
                        width: 0,
                      ),
                    ),
                    enabledBorder:  UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: context.theme.backgroundColor,
                        width: 0,
                      ),
                    )
                  ),
                  ),
                
                ),
                widget == null?
                 Container()
                 :Container(
                  child: widget,
                 )
              ],
            ) ,
          )
        ],
      ),
    );
  }
}