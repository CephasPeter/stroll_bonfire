import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stroll_bonfire/helpers/extensions.dart';

class AppIconButton extends StatelessWidget {
  const AppIconButton({
    super.key, this.asset, this.icon, this.width, this.height, this.onPressed, this.radius, this.padding, this.borderColor, this.backgroundColor, this.iconColor, this.assetWidth, this.assetHeight, this.iconSize,
  });
  final String? asset;
  final IconData? icon;
  final double? width;
  final double? height;
  final double? assetWidth;
  final double? assetHeight;
  final double? iconSize;
  final Function()? onPressed;
  final double? radius;
  final double? padding;
  final Color? borderColor;
  final Color? backgroundColor;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    if(asset == null && icon == null){
      throw Exception('You must provide either an asset or an icon');
    }
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor ?? context.colorScheme.primary,
        borderRadius: BorderRadius.circular(radius ?? 360),
        border: Border.all(
          color: borderColor ?? context.colorScheme.primary,
          width: 2
        ),
      ),
      child: Padding(
        padding: padding?.allPadding ?? 0.0.allPadding,
        child: IconButton(
          icon: Builder(
            builder: (context) {
              if(asset == null){
                return Icon(icon, color: iconColor ?? context.colorScheme.onPrimary,size: iconSize ?? 24);
              }
              return SvgPicture.asset(
                asset!,
                colorFilter: iconColor != null ? ColorFilter.mode(iconColor!, BlendMode.srcIn) : null,
                width: assetWidth,
                height: assetHeight,
              );
            }
          ),
          onPressed: () {
            onPressed?.call();
          },
        ),
      ),
    );
  }
}