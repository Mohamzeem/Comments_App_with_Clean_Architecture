import 'package:comments_with_clean_architecture/features/splash/presentation/pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'config/themes/app_theme.dart';
import 'features/comments/presentation/bloc/add_upd_del_bloc/add_upd_del_bloc.dart';
import 'features/comments/presentation/bloc/comments_bloc/comments_bloc.dart';
import 'features/comments/presentation/pages/comments_page.dart';
import 'injection_container.dart' as di;

class AppPage extends StatelessWidget {
  const AppPage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                di.sl<CommentsBloc>()..add(GetAllCommentsEvent())),
        BlocProvider(create: (context) => di.sl<AddUpdDelBloc>()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(392.72727272727275, 781.0909090909091),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: ((context, child) => MaterialApp(
            title: 'Posts App',
            debugShowCheckedModeBanner: true,
            theme: MyThemes.orangeTheme,
            home: const SplashScreen())),
      ),
    );
  }
}
