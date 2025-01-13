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
            body: SafeArea(
              top: true,
              child: SizedBox(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          10.heightBox,
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "app_name".translate,
                                style: TextStyle(
                                  color: context.colorScheme.primaryContainer,
                                  fontSize: 34,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              8.widthBox,
                              Padding(
                                padding: 5.topPadding,
                                child: SvgPicture.asset(
                                  'assets/images/arrow_down.svg',
                                  width: 10,
                                  height: 10,
                                ),
                              )
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              TextWidgetWithIcon(
                                asset: "assets/images/time.svg",
                                content: "22h 00m",
                              ),
                              10.widthBox,
                              TextWidgetWithIcon(
                                asset: "assets/images/user_2.svg",
                                content: "103",
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    //Profile Content
                    Padding(
                      padding: AppDimensions.margin.startAndEndPadding,
                      child: SizedBox(
                        height: context.height * 0.12,
                        child: Stack(
                          children: [
                            //Profile Image & Profile Name,
                            Container(
                              width: context.width,
                              margin: 5.startPadding,
                              child: Stack(
                                children: [
                                  //Name and Age
                                  Positioned(
                                    left: context.width * 0.1,
                                    top: 10,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: context.colorScheme.scrim,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            color: context.colorScheme.scrim.withValues(alpha: 0.5),
                                            blurRadius: 10,
                                            offset: Offset(0, 5),
                                          ),
                                        ],
                                        border: Border.all(
                                          color: context.colorScheme.scrim,
                                          width: 2,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: 30.startPadding.copyWith(
                                          end: 10
                                        ),
                                        child: Text(
                                          "Angelina, 28",
                                          style: TextStyle(
                                            color: context.colorScheme.onSurface,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                          )
                                        ),
                                      ),
                                    ),
                                  ),
                                  //Image
                                  AppAvatar(
                                    asset: 'assets/images/joey.png',
                                    height: context.width * 0.17,
                                    width: context.width * 0.17,
                                  ),
                                ],
                              ),
                            ),
                            //Profile Title
                            Positioned(
                              left: context.width * 0.2,
                              top: 35,
                              child: Text(
                                "profile_title".translate,
                                style: TextStyle(
                                  color: context.colorScheme.onSurface,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    //Profile Subtitle
                    Text(
                      "profile_subtitle".translate,
                      style: TextStyle(
                        color: context.colorScheme.secondaryFixed.withValues(alpha: 0.7),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    2.heightBox,
                    //Grid Content
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

