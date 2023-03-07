// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import '../../../../config/widgets/custom_text_widget.dart';
import '../../../../core/consts/app_colors.dart';
import '../../domain/entities/comment.dart';
import '../widgets/details_widgets/comment_details_widget.dart';

class CommentDetailsPage extends StatelessWidget {
  final Comment comment;
  const CommentDetailsPage({
    Key? key,
    required this.comment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: const CustomTextWidget(
          text: 'Comment Details',
          color: AppColors.kWhite,
          fontSize: 25,
          fontWeight: FontWeight.w600),
    );
  }

  Widget _body() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: CommentDetailsWidget(comment: comment),
    );
  }
}
