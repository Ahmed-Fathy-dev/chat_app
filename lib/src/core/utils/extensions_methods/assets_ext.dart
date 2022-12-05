import '../../enum/assets_enums.dart';

extension GetImagesPath on AppImages {
  String get fullPathPng => 'assets/images/$name.png';
  String get fullPathjpg => 'assets/images/$name.jpg';
}

extension GetLottiesPath on AppLotties {
  String get fullPathjson => 'assets/lotties/$name.json';
}
