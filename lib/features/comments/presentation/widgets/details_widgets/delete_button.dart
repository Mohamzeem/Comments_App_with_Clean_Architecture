// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../config/widgets/custom_loading_widget.dart';
import '../../../../../config/widgets/custom_text_widget.dart';
import '../../../../../core/consts/app_colors.dart';
import '../../../../../core/widgets/show_snakebar_widget.dart';
import '../../bloc/add_upd_del_bloc/add_upd_del_bloc.dart';
import '../../pages/comments_page.dart';
import 'delete_dialog_widget.dart';

class DeleteButtonWidget extends StatelessWidget {
  final int id;
  const DeleteButtonWidget({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () => deleteDialog(context, id),
      style: ElevatedButton.styleFrom(
          minimumSize: Size(105.w, 35.h),
          backgroundColor: AppColors.kRed,
          elevation: 10),
      icon: const Icon(Icons.delete),
      label: const CustomTextWidget(
          text: 'Delete',
          color: AppColors.kWhite,
          fontSize: 16,
          fontWeight: FontWeight.w600),
    );
  }

  void deleteDialog(BuildContext context, int id) {
    showDialog(
        context: context,
        builder: (context) {
          return BlocConsumer<AddUpdDelBloc, AddUpdDelState>(
            listener: (context, state) {
              if (state is AddUpdDelSuccessState) {
                ShowSnackBar().showSuccessSnackBar(
                    context: context, message: state.successMessage);
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (_) => const CommentsPage(),
                    ),
                    (route) => false);
              } else if (state is AddUpdDelFailureState) {
                Navigator.of(context).pop();
                ShowSnackBar().showErrorSnackBar(
                    context: context, message: state.failedMessage);
              }
            },
            builder: (context, state) {
              if (state is AddUpdDelLoadingState) {
                return const AlertDialog(
                  title: LoadingWidget(),
                );
              }
              return DeleteDialogWidget(id: id);
            },
          );
        });
  }
}
