import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stroll_bonfire/helpers/extensions.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
      ),
      child: Stack(
        children: [
          //Background Image
          Image.asset(
            'assets/images/background_image.png',
            fit: BoxFit.cover,
            height: context.height * 0.7,
            width: double.infinity,
          ),
          //Bottom Gradient
          Container(
            height: context.height * 0.7,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Color(0xFF000000).withValues(alpha: 0.28),
                  Color(0xFF000000).withValues(alpha: 0.64),
                  Color(0xFF000000).withValues(alpha: 0.8),
                  Colors.black,
                ],
              ),
            ),
          ),
          //Page Content
          Scaffold(
            backgroundColor: Colors.transparent,
            bottomNavigationBar: BottomNavigationBar(
              backgroundColor: context.colorScheme.surface,
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: 1.topPadding,
                    child: SvgPicture.asset(
                      'assets/images/poker_cards.svg',
                    ),
                  ),
                  label: ""
                ),
                BottomNavigationBarItem(
                    icon: Padding(
                      padding: 1.topPadding,
                      child: SvgPicture.asset(
                        'assets/images/bonfire.svg',
                      ),
                    ),
                    label: ""
                ),
                BottomNavigationBarItem(
                    icon: Padding(
                      padding: 1.topPadding,
                      child: SvgPicture.asset(
                        'assets/images/chat.svg',
                      ),
                    ),
                    label: ""
                ),
                BottomNavigationBarItem(
                    icon: Padding(
                      padding: 1.topPadding,
                      child: SvgPicture.asset(
                        'assets/images/user.svg',
                      ),
                    ),
                    label: ""
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}