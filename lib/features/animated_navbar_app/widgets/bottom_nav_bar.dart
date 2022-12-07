import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../nav_bar_clipper.dart';
import 'nav_button.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations(DeviceOrientation.values);
    super.dispose();
  }

  /// Currently selected tab index.
  int _currentIndex = 2;

  static const _duration = Duration(milliseconds: 200);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width: screenWidth,
      height: kToolbarHeight + 20,
      child: TweenAnimationBuilder(
        duration: _duration,
        curve: Curves.easeInOut,
        tween: Tween<double>(begin: 0, end: screenWidth / 5 * _currentIndex),
        builder: (context, value, child) {
          return ClipPath(
            clipper: NavBarClipper(value + 36),
            child: child,
          );
        },
        child: ColoredBox(
          color: Colors.black,
          child: Stack(
            children: [
              AnimatedPositioned(
                duration: _duration,
                curve: Curves.easeInOut,
                top: 2,
                left: (screenWidth / 5) * _currentIndex,
                child: SizedBox.square(
                  dimension: screenWidth / 5,
                  child: const Center(
                    child: SizedBox.square(
                      dimension: kToolbarHeight,
                      child: ClipOval(
                        child: ColoredBox(color: Colors.teal),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  for (int i = 0; i < 5; i++)
                    NavButton(
                      index: i,
                      isSelected: i == _currentIndex,
                      onTap: (value) => setState(() => _currentIndex = value),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
