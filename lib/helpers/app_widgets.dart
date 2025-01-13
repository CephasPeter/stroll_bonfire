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

class GridContent extends StatelessWidget {
  const GridContent({
    super.key, this.height, this.width, this.identifier, this.content, this.isSelected, this.onTap,
  });
  final double? height;
  final double? width;
  final String? identifier;
  final String? content;
  final bool? isSelected;
  final Function? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceBright,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isSelected! ? context.colorScheme.primary : Colors.transparent,
          width: 2,
        ),
      ),
      margin: 10.topPadding,
      width: width,
      height: height,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: (){
            onTap?.call();
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                5.widthBox,
                Container(
                  decoration: BoxDecoration(
                    color: isSelected ?? false ? context.colorScheme.primary : Colors.transparent,
                    borderRadius: BorderRadius.circular(360),
                    border: Border.all(
                      color: isSelected ?? false ? context.colorScheme.primary : context.colorScheme.onSurfaceVariant,
                      width: 1.5,
                    ),
                  ),
                  width: 25,
                  height: 25,
                  child: Center(
                    child: Padding(
                      padding: 1.topPadding,
                      child: Text(
                        identifier ?? "",
                        style: TextStyle(
                          color: context.colorScheme.onSurfaceVariant,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
                10.widthBox,
                Expanded(
                  child: Text(
                    content!,
                    style: TextStyle(
                      color: context.colorScheme.onSurfaceVariant,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class AppAvatar extends StatelessWidget {
  const AppAvatar({
    super.key, this.asset, this.width, this.height, this.radius, this.borderColor, this.backgroundColor, this.assetWidth, this.assetHeight,
  });
  final String? asset;
  final double? width;
  final double? height;
  final double? assetWidth;
  final double? assetHeight;
  final double? radius;
  final Color? borderColor;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor ?? context.colorScheme.scrim,
        borderRadius: BorderRadius.circular(radius ?? 360),
        boxShadow: [
          BoxShadow(
            color: context.colorScheme.scrim.withValues(alpha: 0.5),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
        border: Border.all(
          color: borderColor ?? context.colorScheme.scrim,
          width: 2
        ),
      ),
      child: Padding(
        padding: 5.allPadding,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(radius ?? 360),
          child: Image.asset(
            asset!,
            width: assetWidth,
            height: assetHeight,
          ),
        ),
      ),
    );
  }
}

class TextWidgetWithIcon extends StatelessWidget {
  const TextWidgetWithIcon({
    super.key, required this.asset, required this.content,
  });
  final String asset;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: 2.bottomPadding,
          child: SvgPicture.asset(
            asset,
            width: 12,
            height: 12,
          ),
        ),
        2.widthBox,
        Text(
          content,
          style: TextStyle(
            color: context.colorScheme.onSurface,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}