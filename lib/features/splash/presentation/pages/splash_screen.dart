import 'dart:async';
import 'package:comments_with_clean_architecture/config/widgets/custom_text_widget.dart';
import 'package:comments_with_clean_architecture/core/consts/app_colors.dart';
import 'package:comments_with_clean_architecture/features/comments/presentation/pages/comments_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  late Timer timer;
  _startDelay() {
    timer = Timer(const Duration(seconds: 5), () => _goNext());
  }

  _goNext() => Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const CommentsPage(),
      ));

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/1.png',
            fit: BoxFit.cover,
          ),
          Positioned(
              bottom: 30,
              right: 30,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white54,
                    minimumSize: const Size(100, 20)),
                onPressed: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CommentsPage(),
                    )),
                icon: const Icon(
                  Icons.skip_next_outlined,
                  size: 40,
                  color: AppColors.kBlack,
                ),
                label: const CustomTextWidget(
                    text: 'Skip',
                    color: AppColors.kBlack,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              )),
        ],
      ),
    );
  }
}
