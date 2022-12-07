import 'package:flutter/material.dart';

import 'widgets/bottom_nav_bar.dart';

class AnimatedNavbarApp extends StatelessWidget {
  const AnimatedNavbarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.light(),
      child: const Scaffold(
        body: Center(child: Text('Hi')),
        bottomNavigationBar: BottomNavBar(),
      ),
    );
  }
}
