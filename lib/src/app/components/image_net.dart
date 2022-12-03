import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageNet extends StatelessWidget {
  const ImageNet(
    this.url, {
    Key? key,
    this.height,
    this.width,
    this.fit,
    this.errorWidget,
  }) : super(key: key);
  final String url;
  final double? height, width;
  final BoxFit? fit;
  final Widget? errorWidget;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width,
      height: height,
      imageUrl: url,
      fit: fit ?? BoxFit.cover,
      errorWidget: (
        BuildContext context,
        String url,
        dynamic error,
      ) =>errorWidget??
          Image.network(
        'https://fratellidiamanti.com/ar/wp-content/themes/fratelli/img/notfound.png',
      ),
    );
  }
}
