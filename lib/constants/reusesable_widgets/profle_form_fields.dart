// ignore_for_file: prefer_const_constructors

import 'package:craftsmen/constants/const/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileFormField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String labelText;
  final bool? isPassword;
  final bool? obcureText;
  final bool? isReadOnly;
  final Color? borderColor;
  final TextInputType? keyBoardType;
  final bool? enable;
 final Function(String)? onChanged;
  final String? initialValue;
 final double? width;

  const ProfileFormField(
      {Key? key,
      this.borderColor = kMainColor,
      this.controller,
      this.hintText,
      this.isPassword = false,
      this.obcureText = false,
      this.isReadOnly = false,
      required this.labelText,
      this.keyBoardType,
      this.enable = true,
      this.onChanged,
      this.width = 327,
      this.initialValue})
      : super(key: key);

  @override
  State<ProfileFormField> createState() => _ProfileFormFieldState();
}

class _ProfileFormFieldState extends State<ProfileFormField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: TextFormField(
        initialValue: widget.initialValue,
        onChanged: widget.onChanged,
        controller: widget.controller,
        readOnly: widget.isReadOnly!,
        obscureText: widget.obcureText!,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
          labelText: widget.labelText,
          labelStyle: TextStyle(
              color: Colors.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
