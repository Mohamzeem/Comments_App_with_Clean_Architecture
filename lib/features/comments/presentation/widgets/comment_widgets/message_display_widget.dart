// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import '../../../../../config/widgets/custom_text_widget.dart';
import '../../../../../core/consts/app_colors.dart';

class MessageDisplayWidget extends StatelessWidget {
  final String message;
  const MessageDisplayWidget({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 3,
      child: Center(
        child: SingleChildScrollView(
            child: CustomTextWidget(
                text: message,
                color: AppColors.kPrimary,
                fontSize: 30,
                fontWeight: FontWeight.w400)),
      ),
    );
  }
}
