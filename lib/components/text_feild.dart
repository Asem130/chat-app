import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CustomTextFeild extends StatelessWidget {
  Function(String)? onChanged;
  bool  ? obs = false;

  String? hintText;
  CustomTextFeild({this.obs= true,this.onChanged,this.hintText});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obs!,
      validator :
         (data)
      {
        if (data!.isEmpty)
        {
          return 'Faild is Reqiuerd';
        }
      },
      
      onChanged: onChanged,
      
      decoration: InputDecoration(
       
       
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.white,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          )),
    );
  }
}
