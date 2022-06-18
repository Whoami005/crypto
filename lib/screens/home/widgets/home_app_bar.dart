import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double? height;

  const HomeAppBar({
    Key? key,
    this.height = kToolbarHeight,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(height!);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Cryptocurrencies'),
      backgroundColor: Colors.amber,
      centerTitle: true,
    );
  }
}
