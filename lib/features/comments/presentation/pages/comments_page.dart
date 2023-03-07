import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/widgets/custom_loading_widget.dart';
import '../../../../config/widgets/custom_text_widget.dart';
import '../../../../core/consts/app_colors.dart';
import '../bloc/comments_bloc/comments_bloc.dart';
import '../widgets/comment_widgets/comments_widget.dart';
import '../widgets/comment_widgets/message_display_widget.dart';
import 'add_update_comment_page.dart';

class CommentsPage extends StatelessWidget {
  const CommentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      floatingActionButton: _floatingActionBtn(context),
      body: _body(),
    );
  }
}

AppBar _appBar() => AppBar(
    title: const CustomTextWidget(
        text: 'Comments',
        color: AppColors.kBlack,
        fontSize: 25,
        fontWeight: FontWeight.w600));

FloatingActionButton _floatingActionBtn(BuildContext context) =>
    FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => const AddUpdateCommentPage(isUpdate: false)));
        },
        child: const Icon(
          Icons.add,
          size: 30,
        ));

Widget _body() =>
    BlocBuilder<CommentsBloc, CommentsState>(builder: (context, state) {
      if (state is CommentsLoadingState) {
        return const LoadingWidget();
      } else if (state is CommentsSuccessState) {
        return RefreshIndicator(
            onRefresh: () => _onRefresh(context),
            child: CommentsListWidget(comments: state.comment));
      } else if (state is CommentsFailureState) {
        return MessageDisplayWidget(message: state.message);
      }
      return const LoadingWidget();
    });

Future<void> _onRefresh(BuildContext context) async =>
    BlocProvider.of<CommentsBloc>(context).add(RefreshCommentsEvent());
