// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../core/consts/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    required this.controller,
    required this.height,
    required this.width,
    required this.maxLines,
    required this.hintText,
  }) : super(key: key);
  final TextEditingController controller;
  final double height;
  final double width;
  final int maxLines;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.h,
      width: width.w,
      child: TextFormField(
        validator: (value) =>
            value!.isEmpty ? '$hintText Field is Empty' : null,
        controller: controller,
        keyboardType: TextInputType.text,
        maxLines: maxLines,
        style: TextStyle(
          fontSize: 17.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.kBlack,
        ),
        cursorColor: AppColors.kPrimary,
        decoration: InputDecoration(
          fillColor: Colors.grey.shade100,
          filled: true,
          hintText: hintText,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0),
            borderSide: BorderSide(
              color: AppColors.kGray,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0),
            borderSide: BorderSide(
              color: AppColors.kGray,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0),
            borderSide: BorderSide(
              color: AppColors.kGray,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0),
            borderSide: BorderSide(
              color: AppColors.kGray,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0),
            borderSide: BorderSide(
              color: AppColors.kGray,
            ),
          ),
        ),
      ),
    );
  }
}
