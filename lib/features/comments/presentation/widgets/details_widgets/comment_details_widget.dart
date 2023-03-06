// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:comments_with_clean_architecture/features/comments/presentation/widgets/details_widgets/update_button.dart';
import 'package:flutter/material.dart';
import '../../../../../config/widgets/custom_text_widget.dart';
import '../../../../../core/consts/app_colors.dart';
import '../../../domain/entities/comment.dart';
import 'delete_button.dart';

class CommentDetailsWidget extends StatelessWidget {
  const CommentDetailsWidget({
    Key? key,
    required this.comment,
  }) : super(key: key);
  final Comment comment;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomTextWidget(
                text: comment.name,
                color: AppColors.kBlack,
                fontSize: 18,
                fontWeight: FontWeight.w900),
            const Divider(
                height: 20, thickness: 0.8, color: AppColors.kPrimary),
            CustomTextWidget(
                text: comment.email,
                color: AppColors.kBlack,
                fontSize: 18,
                fontWeight: FontWeight.w600),
            const Divider(
                height: 20, thickness: 0.8, color: AppColors.kPrimary),
            CustomTextWidget(
                text: comment.body,
                color: AppColors.kGray,
                fontSize: 18,
                fontWeight: FontWeight.w400),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                UpdateButtonWidget(comment: comment),
                DeleteButtonWidget(id: comment.id!)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
