import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/src/features/home/screens/home_screen.dart';
import 'package:movie_app/src/helpers/constant/app_colors.dart';
import 'package:movie_app/src/helpers/constant/app_themes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const title = "MovieApp";
    const showDebugBanner = false;
    // final platformIsIos = Platform.isIOS;
    final app = MaterialApp(
      title: title,
      debugShowCheckedModeBanner: showDebugBanner,
      color: AppColors.primaryColor,
      theme: AppThemes.mainTheme,
      home: const HomeScreen(),
    );
    // final app = platformIsIos
    //     ? Theme(
    //         data: AppThemes.mainTheme,
    //         child: const CupertinoApp(
    //           title: title,
    //           debugShowCheckedModeBanner: showDebugBanner,
    //           color: AppColors.primaryColor,
    //           home: HomeScreen(),
    //         ),
    //       )
    //     : MaterialApp(
    //         title: title,
    //         debugShowCheckedModeBanner: showDebugBanner,
    //         color: AppColors.primaryColor,
    //         theme: AppThemes.mainTheme,
    //         home: const HomeScreen(),
    //       );
    return ProviderScope(child: app);
  }
}
