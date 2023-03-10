import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 30.h,
        width: 30.w,
        child: const CircularProgressIndicator(
          // color: AppColors.kPrimary,
          semanticsLabel: 'Loading..',
        ),
      ),
    );
  }
}
