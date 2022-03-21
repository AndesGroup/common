// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$EventTearOff {
  const _$EventTearOff();

  _Event<T> _<T>({required T data, required int time}) {
    return _Event<T>(
      data: data,
      time: time,
    );
  }
}

/// @nodoc
const $Event = _$EventTearOff();

/// @nodoc
mixin _$Event<T> {
  T get data => throw _privateConstructorUsedError;
  int get time => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EventCopyWith<T, Event<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventCopyWith<T, $Res> {
  factory $EventCopyWith(Event<T> value, $Res Function(Event<T>) then) =
      _$EventCopyWithImpl<T, $Res>;
  $Res call({T data, int time});
}

/// @nodoc
class _$EventCopyWithImpl<T, $Res> implements $EventCopyWith<T, $Res> {
  _$EventCopyWithImpl(this._value, this._then);

  final Event<T> _value;
  // ignore: unused_field
  final $Res Function(Event<T>) _then;

  @override
  $Res call({
    Object? data = freezed,
    Object? time = freezed,
  }) {
    return _then(_value.copyWith(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$EventCopyWith<T, $Res> implements $EventCopyWith<T, $Res> {
  factory _$EventCopyWith(_Event<T> value, $Res Function(_Event<T>) then) =
      __$EventCopyWithImpl<T, $Res>;
  @override
  $Res call({T data, int time});
}

/// @nodoc
class __$EventCopyWithImpl<T, $Res> extends _$EventCopyWithImpl<T, $Res>
    implements _$EventCopyWith<T, $Res> {
  __$EventCopyWithImpl(_Event<T> _value, $Res Function(_Event<T>) _then)
      : super(_value, (v) => _then(v as _Event<T>));

  @override
  _Event<T> get _value => super._value as _Event<T>;

  @override
  $Res call({
    Object? data = freezed,
    Object? time = freezed,
  }) {
    return _then(_Event<T>(
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
      time: time == freezed
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Event<T> implements _Event<T> {
  const _$_Event({required this.data, required this.time});

  @override
  final T data;
  @override
  final int time;

  @override
  String toString() {
    return 'Event<$T>._(data: $data, time: $time)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Event<T> &&
            const DeepCollectionEquality().equals(other.data, data) &&
            const DeepCollectionEquality().equals(other.time, time));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(data),
      const DeepCollectionEquality().hash(time));

  @JsonKey(ignore: true)
  @override
  _$EventCopyWith<T, _Event<T>> get copyWith =>
      __$EventCopyWithImpl<T, _Event<T>>(this, _$identity);
}

abstract class _Event<T> implements Event<T> {
  const factory _Event({required T data, required int time}) = _$_Event<T>;

  @override
  T get data;
  @override
  int get time;
  @override
  @JsonKey(ignore: true)
  _$EventCopyWith<T, _Event<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
