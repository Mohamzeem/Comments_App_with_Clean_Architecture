// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../config/widgets/custom_text_widget.dart';
import '../../../../../core/consts/app_colors.dart';
import '../../../domain/entities/comment.dart';
import '../../pages/add_update_comment_page.dart';

class UpdateButtonWidget extends StatelessWidget {
  const UpdateButtonWidget({
    Key? key,
    required this.comment,
  }) : super(key: key);

  final Comment comment;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => AddUpdateCommentPage(
              isUpdate: true,
              comment: comment,
            ),
          )),
      style: ElevatedButton.styleFrom(
          minimumSize: Size(105.w, 35.h),
          backgroundColor: AppColors.kGreen,
          elevation: 10),
      icon: const Icon(Icons.edit),
      label: const CustomTextWidget(
          text: 'Edit',
          color: AppColors.kWhite,
          fontSize: 16,
          fontWeight: FontWeight.w600),
    );
  }
}
