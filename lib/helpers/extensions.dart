import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

extension NumExtension on num{
  EdgeInsets get topPadding {
    return EdgeInsets.only(top: toDouble());
  }

  EdgeInsets get bottomPadding {
    return EdgeInsets.only(bottom: toDouble());
  }

  EdgeInsets get leftPadding {
    return EdgeInsets.only(left: toDouble());
  }

  EdgeInsets get rightPadding {
    return EdgeInsets.only(right: toDouble());
  }

  EdgeInsets get rightAndLeftPadding {
    return EdgeInsets.only(right: toDouble(), left: toDouble());
  }

  EdgeInsets get rightAndTopPadding {
    return EdgeInsets.only(right: toDouble(), top: toDouble());
  }

  EdgeInsets get rightAndBottomPadding {
    return EdgeInsets.only(right: toDouble(), bottom: toDouble());
  }

  EdgeInsets get leftAndTopPadding {
    return EdgeInsets.only(left: toDouble(), top: toDouble());
  }

  EdgeInsets get leftAndBottomPadding {
    return EdgeInsets.only(left: toDouble(), bottom: toDouble());
  }

  EdgeInsets get horizontalPadding {
    return EdgeInsets.symmetric(horizontal: toDouble());
  }

  EdgeInsets get verticalPadding {
    return EdgeInsets.symmetric(vertical: toDouble());
  }

  EdgeInsets get allPadding {
    return EdgeInsets.all(toDouble());
  }

  EdgeInsetsDirectional get startPadding {
    return EdgeInsetsDirectional.only(start: toDouble());
  }

  EdgeInsetsDirectional get endPadding {
    return EdgeInsetsDirectional.only(end: toDouble());
  }

  EdgeInsetsDirectional get topStartPadding {
    return EdgeInsetsDirectional.only(top: toDouble(), start: toDouble());
  }

  EdgeInsetsDirectional get topEndPadding {
    return EdgeInsetsDirectional.only(top: toDouble(), end: toDouble());
  }

  EdgeInsetsDirectional get bottomStartPadding {
    return EdgeInsetsDirectional.only(bottom: toDouble(), start: toDouble());
  }

  EdgeInsetsDirectional get bottomEndPadding {
    return EdgeInsetsDirectional.only(bottom: toDouble(), end: toDouble());
  }

  EdgeInsetsDirectional get startAndEndPadding {
    return EdgeInsetsDirectional.only(start: toDouble(), end: toDouble());
  }

  BorderRadius get allRadius {
    return BorderRadius.circular(toDouble());
  }

  BorderRadius get topLeftRadius {
    return BorderRadius.only(topLeft: Radius.circular(toDouble()));
  }

  BorderRadius get topRightRadius {
    return BorderRadius.only(topRight: Radius.circular(toDouble()));
  }

  BorderRadius get bottomLeftRadius {
    return BorderRadius.only(bottomLeft: Radius.circular(toDouble()));
  }

  BorderRadius get bottomRightRadius {
    return BorderRadius.only(bottomRight: Radius.circular(toDouble()));
  }

  Duration get millisecondsDuration {
    return Duration(milliseconds: toInt());
  }

  Duration get secondsDuration {
    return Duration(seconds: toInt());
  }

  Duration get minutesDuration {
    return Duration(minutes: toInt());
  }

  Duration get hoursDuration {
    return Duration(hours: toInt());
  }

  Duration get daysDuration {
    return Duration(days: toInt());
  }

  Duration get weeksDuration {
    return Duration(days: toInt() * 7);
  }

  Duration get monthsDuration {
    return Duration(days: toInt() * 30);
  }

  Duration get yearsDuration {
    return Duration(days: toInt() * 365);
  }

  SizedBox get heightBox {
    return SizedBox(height: toDouble());
  }

  SizedBox get widthBox {
    return SizedBox(width: toDouble());
  }
}

extension StringExtension on String{
  String get translate{
    return this.tr();
  }
  String translateWithParameters({List<String>? args,Map<String, String>? namedArgs,String? gender,BuildContext? context}){
    return this.tr(
        args: args,
        namedArgs: namedArgs,
        gender: gender,
        context: context
    );
  }
}