import 'package:flutter/material.dart';
import 'package:movie_app/src/features/shared/widgets/custom_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      drawer: Drawer(),
    );
  }
}
