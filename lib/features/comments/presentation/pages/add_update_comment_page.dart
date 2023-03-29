import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../config/widgets/custom_loading_widget.dart';
import '../../../../config/widgets/custom_text_widget.dart';
import '../../../../core/consts/app_colors.dart';
import '../../domain/entities/comment.dart';
import '../bloc/add_upd_del_bloc/add_upd_del_bloc.dart';
import '../widgets/add_upd_del_widgets/form_widget.dart';
import '../../../../config/widgets/show_snakebar_widget.dart';
import 'comments_page.dart';

class AddUpdateCommentPage extends StatelessWidget {
  final Comment? comment;
  final bool isUpdate;
  const AddUpdateCommentPage({super.key, this.comment, required this.isUpdate});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: _appBar(),
        body: _body(),
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: CustomTextWidget(
          text: isUpdate ? 'Edit Comment' : 'Add Comment',
          color: AppColors.kWhite,
          fontSize: 25,
          fontWeight: FontWeight.w600),
    );
  }

  Widget _body() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 30.h),
      child: BlocConsumer<AddUpdDelBloc, AddUpdDelState>(
        listener: (context, state) {
          if (state is AddUpdDelSuccessState) {
            ShowSnackBar().showSuccessSnackBar(
                context: context, message: state.successMessage);
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: ((_) => const CommentsPage())),
                (route) => false);
          } else if (state is AddUpdDelFailureState) {
            ShowSnackBar().showErrorSnackBar(
                context: context, message: state.failedMessage);
          }
        },
        builder: (context, state) {
          if (state is AddUpdDelLoadingState) {
            return const LoadingWidget();
          } else {
            return FormWidget(
                isUpdate: isUpdate, comment: isUpdate ? comment : null);
          }
        },
      ),
    );
  }
}
