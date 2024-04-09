import 'package:flutter/material.dart';
import 'package:vit_connect_plus/utils/constants/colors.dart';
import 'package:vit_connect_plus/utils/constants/sizes.dart';

class RoundedImage extends StatelessWidget {
  const RoundedImage({
    super.key,
    this.width,
    this.height,
    required this.imageUrl,
    this.applyImageRadius = false,
    this.border,
    this.backgroundColor = MyColors.light,
    this.fit,
    this.padding,
    required this.isNetworkImage ,
    this.onPressed,
    this.radius = Sizes.md,
  });
  final double? width, height;
  final String imageUrl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(Sizes.md)),
      child: ClipRRect(
        borderRadius: applyImageRadius
            ? BorderRadius.circular(radius)
            : BorderRadius.zero,
        child: Image(
          width: width,
          height: height,
            //to add border radius to the image we wrap the image widget with another widget cliprrect
            image: isNetworkImage
                ? NetworkImage(imageUrl)
                : AssetImage(imageUrl) as ImageProvider,
            fit: BoxFit.contain),
      ),
    );
  }
}
