import 'package:flutter/material.dart';
import 'package:movie_app/src/features/home/screens/movie_screen.dart';
import 'package:movie_app/src/features/shared/widgets/custom_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: CustomAppBar(),
        drawer: Drawer(),
        body: TabBarView(
          children: [
            MovieScreen(),
            Scaffold(),
            Scaffold(),
          ],
        ),
      ),
    );
  }
}
