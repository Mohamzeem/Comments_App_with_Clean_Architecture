// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import '../../../../../config/widgets/custom_text_widget.dart';
import '../../../../../core/consts/app_colors.dart';
import '../../../domain/entities/comment.dart';
import '../../pages/details_page.dart';

class CommentsListWidget extends StatelessWidget {
  final List<Comment> comments;
  const CommentsListWidget({
    Key? key,
    required this.comments,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: ListView.separated(
        itemCount: comments.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          CommentDetailsPage(comment: comments[index])));
            },
            child: Column(children: [
              CustomTextWidget(
                  text: comments[index].name,
                  color: AppColors.kBlack,
                  fontSize: 18,
                  fontWeight: FontWeight.w900),
              CustomTextWidget(
                  text: comments[index].email,
                  color: AppColors.kBlack,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
              CustomTextWidget(
                  text: comments[index].body,
                  color: AppColors.kGray,
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
            ]),
          );
        },
        separatorBuilder: (context, index) => const Divider(
          height: 10,
          color: AppColors.kPrimary,
          thickness: 1,
        ),
      ),
    );
  }
}
