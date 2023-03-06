import 'package:flutter/material.dart';
import '../../config/widgets/custom_text_widget.dart';
import '../consts/app_colors.dart';

class ShowSnackBar {
  void showSuccessSnackBar(
      {required BuildContext context, required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Center(
          child: CustomTextWidget(
              text: message,
              color: AppColors.kBlack,
              fontSize: 18,
              fontWeight: FontWeight.w400),
        ),
        backgroundColor: AppColors.kGreen,
      ),
    );
  }

  void showErrorSnackBar(
      {required BuildContext context, required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Center(
          child: CustomTextWidget(
              text: message,
              color: AppColors.kBlack,
              fontSize: 18,
              fontWeight: FontWeight.w400),
        ),
        backgroundColor: AppColors.kRed,
      ),
    );
  }
}
