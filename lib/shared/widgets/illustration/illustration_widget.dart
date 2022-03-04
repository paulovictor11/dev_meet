import 'package:flutter/cupertino.dart';

_imageAsset({
  Key? key,
  required String asset,
  Size? size,
  bool provider = false,
}) {
  return provider
      ? AssetImage(asset)
      : Image.asset(
          asset,
          height: size?.height,
          width: size?.width,
          key: key,
        );
}

abstract class IllustrationWidget {
  static const _path = 'assets/illustrations';

  static Widget person({Size size = const Size.square(512)}) {
    return _imageAsset(
      asset: '$_path/person.png',
      size: size,
    );
  }
}
