// ignore_for_file: prefer_const_constructors

import 'package:craftsmen/constants/const/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final IconData? prefixIcon;
  final IconButton? sufixIcon;
  final bool isPassword;
  final bool obcureText;
  final bool isReadOnly;
  final Color borderColor;
  final TextInputType? keyBoardType;
  final String? Function(String?)? validator;
  void Function(String)? onChanged;
  final bool enable;
  final FocusNode? focus;

  MyTextField({
    Key? key,
    this.borderColor = kMainColor,
    this.controller,
    this.hintText,
    this.focus,
    required this.isPassword,
    required this.obcureText,
    required this.isReadOnly,
    required this.labelText,
    this.prefixIcon,
    this.sufixIcon,
    this.keyBoardType,
    this.validator,
    this.enable = true,
    this.onChanged,
  }) : super(key: key);

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 327.w,
      child: TextFormField(
        focusNode:widget.focus,
        onChanged: widget.onChanged,
        keyboardType: widget.keyBoardType,
        controller: widget.controller,
        readOnly: widget.isReadOnly,
        obscureText: widget.obcureText,
        decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
          focusedBorder: widget.enable
              ? OutlineInputBorder(
                  borderSide: BorderSide(color: kMainColor, width: 2.0.w),
                )
              : OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: widget.borderColor, width: 1.0.w),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.pink, width: 1.0.w),
          ),
          hintText: widget.hintText,
          hintStyle: TextStyle(color: Colors.black, fontSize: 16.sp),
          labelText: widget.labelText,
          labelStyle: TextStyle(color: Colors.black54, fontSize: 16.sp),
          // prefixIcon: Icon(widget.prefixIcon),
          suffixIcon: widget.sufixIcon,
        ),
        validator: widget.validator,
      ),
    );
  }
}
