import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movie_app/src/helpers/constant/app_colors.dart';
import 'package:movie_app/src/helpers/constant/app_themes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const title = "MovieApp";
    const showDebugBanner = false;
    final platformIsIos = Platform.isIOS;
    final app = platformIsIos
        ? Theme(
            data: AppThemes.mainTheme,
            child: const CupertinoApp(
              title: title,
              debugShowCheckedModeBanner: showDebugBanner,
              color: AppColors.primaryColor,
              home: Scaffold(),
            ),
          )
        : const MaterialApp(
            title: title,
            debugShowCheckedModeBanner: showDebugBanner,
            color: AppColors.primaryColor,
            home: Scaffold(),
          );
    return ProviderScope(child: app);
  }
}
