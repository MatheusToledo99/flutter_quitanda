// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'orders_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$OrdersResult<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(success<T> value) success,
    required TResult Function(error<T> value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(success<T> value)? success,
    TResult Function(error<T> value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(success<T> value)? success,
    TResult Function(error<T> value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrdersResultCopyWith<T, $Res> {
  factory $OrdersResultCopyWith(
          OrdersResult<T> value, $Res Function(OrdersResult<T>) then) =
      _$OrdersResultCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$OrdersResultCopyWithImpl<T, $Res>
    implements $OrdersResultCopyWith<T, $Res> {
  _$OrdersResultCopyWithImpl(this._value, this._then);

  final OrdersResult<T> _value;
  // ignore: unused_field
  final $Res Function(OrdersResult<T>) _then;
}

/// @nodoc
abstract class _$$successCopyWith<T, $Res> {
  factory _$$successCopyWith(
          _$success<T> value, $Res Function(_$success<T>) then) =
      __$$successCopyWithImpl<T, $Res>;
  $Res call({T data});
}

/// @nodoc
class __$$successCopyWithImpl<T, $Res>
    extends _$OrdersResultCopyWithImpl<T, $Res>
    implements _$$successCopyWith<T, $Res> {
  __$$successCopyWithImpl(
      _$success<T> _value, $Res Function(_$success<T>) _then)
      : super(_value, (v) => _then(v as _$success<T>));

  @override
  _$success<T> get _value => super._value as _$success<T>;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$success<T>(
      data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$success<T> implements success<T> {
  _$success(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'OrdersResult<$T>.success(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$success<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  _$$successCopyWith<T, _$success<T>> get copyWith =>
      __$$successCopyWithImpl<T, _$success<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(String message) error,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(String message)? error,
  }) {
    return success?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(success<T> value) success,
    required TResult Function(error<T> value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(success<T> value)? success,
    TResult Function(error<T> value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(success<T> value)? success,
    TResult Function(error<T> value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class success<T> implements OrdersResult<T> {
  factory success(final T data) = _$success<T>;

  T get data;
  @JsonKey(ignore: true)
  _$$successCopyWith<T, _$success<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$errorCopyWith<T, $Res> {
  factory _$$errorCopyWith(_$error<T> value, $Res Function(_$error<T>) then) =
      __$$errorCopyWithImpl<T, $Res>;
  $Res call({String message});
}

/// @nodoc
class __$$errorCopyWithImpl<T, $Res> extends _$OrdersResultCopyWithImpl<T, $Res>
    implements _$$errorCopyWith<T, $Res> {
  __$$errorCopyWithImpl(_$error<T> _value, $Res Function(_$error<T>) _then)
      : super(_value, (v) => _then(v as _$error<T>));

  @override
  _$error<T> get _value => super._value as _$error<T>;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$error<T>(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$error<T> implements error<T> {
  _$error(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'OrdersResult<$T>.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$error<T> &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  _$$errorCopyWith<T, _$error<T>> get copyWith =>
      __$$errorCopyWithImpl<T, _$error<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(success<T> value) success,
    required TResult Function(error<T> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(success<T> value)? success,
    TResult Function(error<T> value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(success<T> value)? success,
    TResult Function(error<T> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class error<T> implements OrdersResult<T> {
  factory error(final String message) = _$error<T>;

  String get message;
  @JsonKey(ignore: true)
  _$$errorCopyWith<T, _$error<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
