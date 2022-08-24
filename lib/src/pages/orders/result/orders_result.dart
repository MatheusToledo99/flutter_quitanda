import 'package:freezed_annotation/freezed_annotation.dart';

part 'orders_result.freezed.dart';

@freezed
class OrdersResult<T> with _$OrdersResult<T> {
  factory OrdersResult.success(T data) = success;
  factory OrdersResult.error(String message) = error;
}
