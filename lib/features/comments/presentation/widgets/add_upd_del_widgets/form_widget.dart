// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../config/widgets/custom_elevated_button.dart';
import '../../../../../config/widgets/custom_text_from_field.dart';
import '../../../domain/entities/comment.dart';
import '../../bloc/add_upd_del_bloc/add_upd_del_bloc.dart';

class FormWidget extends StatefulWidget {
  const FormWidget({
    Key? key,
    this.comment,
    required this.isUpdate,
  }) : super(key: key);
  final Comment? comment;
  final bool isUpdate;

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final formkey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    if (widget.isUpdate) {
      nameController.text = widget.comment!.name;
      bodyController.text = widget.comment!.body;
      emailController.text = widget.comment!.email;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formkey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: CustomTextFormField(
                    controller: nameController,
                    height: 55,
                    width: double.infinity,
                    maxLines: 1,
                    hintText: 'Name'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: CustomTextFormField(
                    controller: emailController,
                    height: 55,
                    width: double.infinity,
                    maxLines: 1,
                    hintText: 'Email'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: CustomTextFormField(
                    controller: bodyController,
                    height: 240,
                    width: double.infinity,
                    maxLines: 10,
                    hintText: 'Content'),
              ),
              CustomElevatedBtnWidget(
                  onPressed: validateAddOrUpdate, isupdate: widget.isUpdate)
            ],
          ),
        ),
      ),
    );
  }

  void validateAddOrUpdate() {
    final isValid = formkey.currentState!.validate();
    if (isValid) {
      final comment = Comment(
          id: widget.isUpdate ? widget.comment!.id : null,
          name: nameController.text,
          body: bodyController.text,
          email:
              widget.isUpdate ? widget.comment!.email : emailController.text);
      if (widget.isUpdate) {
        BlocProvider.of<AddUpdDelBloc>(context)
            .add(UpdateCommentEvent(comment: comment));
      } else {
        BlocProvider.of<AddUpdDelBloc>(context)
            .add(AddCommentEvent(comment: comment));
      }
    }
  }
}
