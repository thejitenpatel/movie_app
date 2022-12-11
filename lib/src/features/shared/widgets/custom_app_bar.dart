import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Move App"),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
        ),
      ],
      bottom: const TabBar(
        tabs: [
          Tab(
            text: "Movies",
          ),
          Tab(
            text: "TV Shows",
          ),
          Tab(
            text: "People",
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 85);
}
