import 'package:flutter/material.dart';

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

abstract class IconWidget {
  static const _path = 'assets/icons';

  static Widget branch({Size size = const Size.square(37)}) {
    return _imageAsset(
      asset: '$_path/branch.png',
      size: size,
    );
  }

  static Widget phone({Size size = const Size.square(37)}) {
    return _imageAsset(
      asset: '$_path/iPhone-X.png',
      size: size,
    );
  }

  static Widget laptop({Size size = const Size.square(37)}) {
    return _imageAsset(
      asset: '$_path/laptop-programming-code.png',
      size: size,
    );
  }

  static Widget bash({Size size = const Size.square(37)}) {
    return _imageAsset(
      asset: '$_path/console.png',
      size: size,
    );
  }
}
