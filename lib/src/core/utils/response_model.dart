import 'package:equatable/equatable.dart';

class ResponseModel extends Equatable {
  const ResponseModel({this.message, this.success});
  final String? message;
  final bool? success;

  @override
  List<Object?> get props => [
        message,
        success,
      ];
}
