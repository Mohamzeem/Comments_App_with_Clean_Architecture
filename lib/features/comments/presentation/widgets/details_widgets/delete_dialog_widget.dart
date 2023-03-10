// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../config/widgets/custom_text_widget.dart';
import '../../../../../core/consts/app_colors.dart';
import '../../bloc/add_upd_del_bloc/add_upd_del_bloc.dart';

class DeleteDialogWidget extends StatelessWidget {
  final int id;
  const DeleteDialogWidget({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: [
        TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('No')),
        TextButton(
            onPressed: () => BlocProvider.of<AddUpdDelBloc>(context)
                .add(DeleteCommentEvent(id: id)),
            child: const Text('Yes')),
      ],
      title: const CustomTextWidget(
          text: 'Are You Sure?',
          color: AppColors.kBlack,
          fontSize: 20,
          fontWeight: FontWeight.w300),
    );
  }
}
