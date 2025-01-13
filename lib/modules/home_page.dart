import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stroll_bonfire/helpers/app_dimensions.dart';
import 'package:stroll_bonfire/helpers/extensions.dart';

import '../helpers/app_widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ValueNotifier selectedGridPosition = ValueNotifier<int>(0);

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
            body: SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: AppDimensions.margin.startAndEndPadding,
                    child: ValueListenableBuilder(
                      valueListenable: selectedGridPosition,
                      builder: (_,value,___) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GridContent(
                                  identifier: "A",
                                  content: "grid_option_1".translate,
                                  width: context.width * 0.45,
                                  isSelected: value == 0,
                                  onTap: () {
                                    selectedGridPosition.value = 0;
                                  },
                                ),
                                GridContent(
                                  identifier: "B",
                                  content: "grid_option_2".translate,
                                  width: context.width * 0.45,
                                  isSelected: value == 1,
                                  onTap: () {
                                    selectedGridPosition.value = 1;
                                  },
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GridContent(
                                  identifier: "C",
                                  content: "grid_option_3".translate,
                                  width: context.width * 0.45,
                                  isSelected: value == 2,
                                  onTap: () {
                                    selectedGridPosition.value = 2;
                                  },
                                ),
                                GridContent(
                                  identifier: "D",
                                  content: "grid_option_4".translate,
                                  width: context.width * 0.45,
                                  isSelected: value == 3,
                                  onTap: () {
                                    selectedGridPosition.value = 3;
                                  },
                                ),
                              ],
                            ),
                          ],
                        );
                      }
                    ),
                  ),
                  //Footer
                  Padding(
                    padding: AppDimensions.margin.allPadding,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'pick_option_text'.translate,
                          style: TextStyle(
                            color: context.colorScheme.onSurface,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Spacer(),
                        AppIconButton(
                          asset: 'assets/images/mic.svg',
                          width: 55,
                          height: 55,
                          iconColor: context.colorScheme.primary,
                          backgroundColor: context.colorScheme.surface,
                          borderColor: context.colorScheme.primary,
                        ),
                        10.widthBox,
                        AppIconButton(
                          icon: Icons.arrow_forward,
                          width: 55,
                          height: 55,
                          iconColor: context.colorScheme.onPrimary,
                          iconSize: 30,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
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
                      padding: 3.topPadding,
                      child: Badge(
                        backgroundColor: context.colorScheme.surfaceTint,
                        label: SizedBox(
                          width: 16,
                          height: 13,
                        ),
                        child: SvgPicture.asset(
                          'assets/images/bonfire.svg',
                        ),
                      ),
                    ),
                    label: ""
                ),
                BottomNavigationBarItem(
                    icon: Padding(
                      padding: 5.topPadding,
                      child: Badge(
                        backgroundColor: context.colorScheme.surfaceTint,
                        label: SizedBox(
                          width: 16,
                          height: 13,
                          child: Center(
                            child: Text(
                              '10',
                              style: TextStyle(
                                color: context.colorScheme.surface,
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          )
                        ),
                        child: SvgPicture.asset(
                          'assets/images/chat.svg',
                        ),
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

