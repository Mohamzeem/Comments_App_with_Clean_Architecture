// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../config/widgets/custom_text_widget.dart';
import '../../../../../core/consts/app_colors.dart';

class AddUpdButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isupdate;
  const AddUpdButton({
    Key? key,
    required this.onPressed,
    required this.isupdate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          minimumSize: Size(105.w, 35.h),
          backgroundColor: AppColors.kPrimary,
          elevation: 10),
      icon: Icon(isupdate ? Icons.edit : Icons.add),
      label: CustomTextWidget(
          text: isupdate ? 'EDIT' : 'ADD',
          color: AppColors.kWhite,
          fontSize: 16,
          fontWeight: FontWeight.w600),
    );
  }
}
