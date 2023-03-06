// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import '../../core/consts/app_colors.dart';
import '../../core/widgets/custom_text_widget.dart';

class CustomElevatedBtnWidget extends StatelessWidget {
  const CustomElevatedBtnWidget({
    Key? key,
    required this.onPressed,
    required this.isupdate,
  }) : super(key: key);

  final VoidCallback onPressed;
  final bool isupdate;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.kPrimary, elevation: 10),
      icon: Icon(isupdate ? Icons.edit : Icons.add),
      label: CustomTextWidget(
          text: isupdate ? 'EDIT' : 'ADD',
          color: AppColors.kWhite,
          fontSize: 16,
          fontWeight: FontWeight.w600),
    );
  }
}
