import 'package:equatable/equatable.dart';

class ApiResponse<T> extends Equatable {
  T? error;
  T? data;
  ApiResponse({this.error, this.data});

  bool get hasData => data != null;
  bool get hasError => error != null;
  bool get isInitial => !hasData && !hasError;
  @override
  //TODO: implement props
  List<Object?> get props => [data, error];
}
