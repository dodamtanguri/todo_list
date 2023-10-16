/// 이미지 리소스
/// 작성자 : jtmoon
/// 특이사항 : N/A
/// @copyright 한국선불카드(주)

import 'package:flutter/widgets.dart';

enum PlgImage {
  toolbar(filename: 'image.png'),
  title(filename: 'notice.png', desc: '타이틀 이미지');

  const PlgImage({required this.filename, this.desc = ''});

  final String filename;
  final String? desc;

  static const imageRoot = 'assets/images';

  AssetImage asset() => AssetImage('$imageRoot/$name');
  Image image() => Image.asset('$imageRoot/$name');
  Image resize({double? width, double? height, BoxFit? fit}) => Image.asset(
        '$imageRoot/$name',
        width: width,
        height: height,
        fit: fit,
      );
}
