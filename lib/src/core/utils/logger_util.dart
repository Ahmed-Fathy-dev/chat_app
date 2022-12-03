import 'package:logger/logger.dart';

final logger = Logger();
extension Log on Object {
  void logD(String desc) => logger.d(toString(),desc);
  void logE(String desc) => logger.e(toString(),desc);
  void logI(String desc) => logger.i(toString(),desc);
  void logW(String desc) => logger.w(toString(),desc);
  void logV(String desc) => logger.v(toString(),desc);
  void logWtf(String desc) => logger.wtf(toString(),desc);
}