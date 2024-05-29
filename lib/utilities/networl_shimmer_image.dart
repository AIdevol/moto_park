import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:moto_park/constants/images.dart';
import 'package:moto_park/utilities/const_string.dart';

import 'helper_widget.dart';

class CustomCacheNetworkImage extends StatelessWidget {
  String imageurl;
  bool? withBaseUrl = false;
  double? height;
  double? width;
  double? radiusAll;
  BoxFit? boxFit;
  BoxFit? assetImageFitType;
  double? topRight;
  double? topLeft;
  double? bottomLeft;
  double? bottomRight;
  Color? color;
  Color? borderColor;
  int? memCacheHeight;
  int? memCacheWidth;
  double? borderWidth = 0.0;
  String? defaultImage;
  CustomCacheNetworkImage(
      this.imageurl, {
        Key? key,
        this.withBaseUrl,
        this.height,
        this.width,
        this.radiusAll,
        this.boxFit,
        this.borderColor,
        this.assetImageFitType,
        this.topRight,
        this.topLeft,
        this.bottomLeft,
        this.bottomRight,
        this.color,
        this.memCacheHeight,
        this.memCacheWidth,
        this.borderWidth,
        this.defaultImage,
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: radiusAll == null
          ? BorderRadius.only(
          topRight: Radius.circular(topRight ?? 0.0),
          topLeft: Radius.circular(topLeft ?? 0.0),
          bottomLeft: Radius.circular(bottomLeft ?? 0.0),
          bottomRight: Radius.circular(bottomRight ?? 0.0))
          : BorderRadius.circular(radiusAll ?? 0.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: radiusAll == null
              ? BorderRadius.only(
              topRight: Radius.circular(topRight ?? 0.0),
              topLeft: Radius.circular(topLeft ?? 0.0),
              bottomLeft: Radius.circular(bottomLeft ?? 0.0),
              bottomRight: Radius.circular(bottomRight ?? 0.0))
              : BorderRadius.circular(radiusAll ?? 0.0),
          border: borderWidth != 0.0
              ? Border.all(
              width: borderWidth ?? 0.0,
              color: borderColor ?? Colors.transparent)
              : null,
        ),
        child: CachedNetworkImage(
          fit: boxFit ?? BoxFit.contain ,

          width: width,
          height: height,
          memCacheHeight: memCacheHeight ?? 500,
          memCacheWidth: memCacheWidth ?? 500,
          placeholder: (_, __) {
            return shimmerEffectWidget(
              showShimmer: true,
              child: Container(
                  width: double.infinity,
                  height: height,
                  alignment: Alignment.center,
                  child: Image.asset(
                    defaultImage ?? Logo2x,
                    height: width,
                    width: height,
                    color: color,
                    fit: (assetImageFitType ?? boxFit) == null
                        ? BoxFit.cover
                        : (assetImageFitType ?? boxFit),
                  )),
            );
          },
          errorWidget: (context, exception, stackTrace) {
            return Container(
                width: width,
                height: height,
                alignment: Alignment.center,
                child: Image.asset(
                  defaultImage ?? appIcon,
                  width: width,
                  height: height,
                  color: color,
                  fit: (assetImageFitType ?? boxFit) == null
                      ? BoxFit.cover
                      : (assetImageFitType ?? boxFit),
                ));
          },
          imageUrl: imageurl,
        ),
      ),
    );
  }
}