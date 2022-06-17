// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'google_map_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$GoogleMapStateTearOff {
  const _$GoogleMapStateTearOff();

  _GoogleMapState call(
      {required GoogleMapController googleMapController,
      List<Shop> shopList = const [],
      double radius = 0,
      LatLng center = const LatLng(35.01, 135.78)}) {
    return _GoogleMapState(
      googleMapController: googleMapController,
      shopList: shopList,
      radius: radius,
      center: center,
    );
  }

  _GoogleMapStateCreating creating() {
    return _GoogleMapStateCreating();
  }

  _GoogleMapStateError error() {
    return _GoogleMapStateError();
  }
}

/// @nodoc
const $GoogleMapState = _$GoogleMapStateTearOff();

/// @nodoc
mixin _$GoogleMapState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(GoogleMapController googleMapController,
            List<Shop> shopList, double radius, LatLng center)
        $default, {
    required TResult Function() creating,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(GoogleMapController googleMapController,
            List<Shop> shopList, double radius, LatLng center)?
        $default, {
    TResult Function()? creating,
    TResult Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(GoogleMapController googleMapController,
            List<Shop> shopList, double radius, LatLng center)?
        $default, {
    TResult Function()? creating,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_GoogleMapState value) $default, {
    required TResult Function(_GoogleMapStateCreating value) creating,
    required TResult Function(_GoogleMapStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_GoogleMapState value)? $default, {
    TResult Function(_GoogleMapStateCreating value)? creating,
    TResult Function(_GoogleMapStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_GoogleMapState value)? $default, {
    TResult Function(_GoogleMapStateCreating value)? creating,
    TResult Function(_GoogleMapStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoogleMapStateCopyWith<$Res> {
  factory $GoogleMapStateCopyWith(
          GoogleMapState value, $Res Function(GoogleMapState) then) =
      _$GoogleMapStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$GoogleMapStateCopyWithImpl<$Res>
    implements $GoogleMapStateCopyWith<$Res> {
  _$GoogleMapStateCopyWithImpl(this._value, this._then);

  final GoogleMapState _value;
  // ignore: unused_field
  final $Res Function(GoogleMapState) _then;
}

/// @nodoc
abstract class _$GoogleMapStateCopyWith<$Res> {
  factory _$GoogleMapStateCopyWith(
          _GoogleMapState value, $Res Function(_GoogleMapState) then) =
      __$GoogleMapStateCopyWithImpl<$Res>;
  $Res call(
      {GoogleMapController googleMapController,
      List<Shop> shopList,
      double radius,
      LatLng center});
}

/// @nodoc
class __$GoogleMapStateCopyWithImpl<$Res>
    extends _$GoogleMapStateCopyWithImpl<$Res>
    implements _$GoogleMapStateCopyWith<$Res> {
  __$GoogleMapStateCopyWithImpl(
      _GoogleMapState _value, $Res Function(_GoogleMapState) _then)
      : super(_value, (v) => _then(v as _GoogleMapState));

  @override
  _GoogleMapState get _value => super._value as _GoogleMapState;

  @override
  $Res call({
    Object? googleMapController = freezed,
    Object? shopList = freezed,
    Object? radius = freezed,
    Object? center = freezed,
  }) {
    return _then(_GoogleMapState(
      googleMapController: googleMapController == freezed
          ? _value.googleMapController
          : googleMapController // ignore: cast_nullable_to_non_nullable
              as GoogleMapController,
      shopList: shopList == freezed
          ? _value.shopList
          : shopList // ignore: cast_nullable_to_non_nullable
              as List<Shop>,
      radius: radius == freezed
          ? _value.radius
          : radius // ignore: cast_nullable_to_non_nullable
              as double,
      center: center == freezed
          ? _value.center
          : center // ignore: cast_nullable_to_non_nullable
              as LatLng,
    ));
  }
}

/// @nodoc

class _$_GoogleMapState
    with DiagnosticableTreeMixin
    implements _GoogleMapState {
  _$_GoogleMapState(
      {required this.googleMapController,
      this.shopList = const [],
      this.radius = 0,
      this.center = const LatLng(35.01, 135.78)});

  @override
  final GoogleMapController googleMapController;
  @JsonKey()
  @override
  final List<Shop> shopList;
  @JsonKey()
  @override
  final double radius;
  @JsonKey()
  @override
  final LatLng center;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GoogleMapState(googleMapController: $googleMapController, shopList: $shopList, radius: $radius, center: $center)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'GoogleMapState'))
      ..add(DiagnosticsProperty('googleMapController', googleMapController))
      ..add(DiagnosticsProperty('shopList', shopList))
      ..add(DiagnosticsProperty('radius', radius))
      ..add(DiagnosticsProperty('center', center));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GoogleMapState &&
            const DeepCollectionEquality()
                .equals(other.googleMapController, googleMapController) &&
            const DeepCollectionEquality().equals(other.shopList, shopList) &&
            const DeepCollectionEquality().equals(other.radius, radius) &&
            const DeepCollectionEquality().equals(other.center, center));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(googleMapController),
      const DeepCollectionEquality().hash(shopList),
      const DeepCollectionEquality().hash(radius),
      const DeepCollectionEquality().hash(center));

  @JsonKey(ignore: true)
  @override
  _$GoogleMapStateCopyWith<_GoogleMapState> get copyWith =>
      __$GoogleMapStateCopyWithImpl<_GoogleMapState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(GoogleMapController googleMapController,
            List<Shop> shopList, double radius, LatLng center)
        $default, {
    required TResult Function() creating,
    required TResult Function() error,
  }) {
    return $default(googleMapController, shopList, radius, center);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(GoogleMapController googleMapController,
            List<Shop> shopList, double radius, LatLng center)?
        $default, {
    TResult Function()? creating,
    TResult Function()? error,
  }) {
    return $default?.call(googleMapController, shopList, radius, center);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(GoogleMapController googleMapController,
            List<Shop> shopList, double radius, LatLng center)?
        $default, {
    TResult Function()? creating,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(googleMapController, shopList, radius, center);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_GoogleMapState value) $default, {
    required TResult Function(_GoogleMapStateCreating value) creating,
    required TResult Function(_GoogleMapStateError value) error,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_GoogleMapState value)? $default, {
    TResult Function(_GoogleMapStateCreating value)? creating,
    TResult Function(_GoogleMapStateError value)? error,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_GoogleMapState value)? $default, {
    TResult Function(_GoogleMapStateCreating value)? creating,
    TResult Function(_GoogleMapStateError value)? error,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _GoogleMapState implements GoogleMapState {
  factory _GoogleMapState(
      {required GoogleMapController googleMapController,
      List<Shop> shopList,
      double radius,
      LatLng center}) = _$_GoogleMapState;

  GoogleMapController get googleMapController;
  List<Shop> get shopList;
  double get radius;
  LatLng get center;
  @JsonKey(ignore: true)
  _$GoogleMapStateCopyWith<_GoogleMapState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$GoogleMapStateCreatingCopyWith<$Res> {
  factory _$GoogleMapStateCreatingCopyWith(_GoogleMapStateCreating value,
          $Res Function(_GoogleMapStateCreating) then) =
      __$GoogleMapStateCreatingCopyWithImpl<$Res>;
}

/// @nodoc
class __$GoogleMapStateCreatingCopyWithImpl<$Res>
    extends _$GoogleMapStateCopyWithImpl<$Res>
    implements _$GoogleMapStateCreatingCopyWith<$Res> {
  __$GoogleMapStateCreatingCopyWithImpl(_GoogleMapStateCreating _value,
      $Res Function(_GoogleMapStateCreating) _then)
      : super(_value, (v) => _then(v as _GoogleMapStateCreating));

  @override
  _GoogleMapStateCreating get _value => super._value as _GoogleMapStateCreating;
}

/// @nodoc

class _$_GoogleMapStateCreating
    with DiagnosticableTreeMixin
    implements _GoogleMapStateCreating {
  _$_GoogleMapStateCreating();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GoogleMapState.creating()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'GoogleMapState.creating'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _GoogleMapStateCreating);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(GoogleMapController googleMapController,
            List<Shop> shopList, double radius, LatLng center)
        $default, {
    required TResult Function() creating,
    required TResult Function() error,
  }) {
    return creating();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(GoogleMapController googleMapController,
            List<Shop> shopList, double radius, LatLng center)?
        $default, {
    TResult Function()? creating,
    TResult Function()? error,
  }) {
    return creating?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(GoogleMapController googleMapController,
            List<Shop> shopList, double radius, LatLng center)?
        $default, {
    TResult Function()? creating,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (creating != null) {
      return creating();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_GoogleMapState value) $default, {
    required TResult Function(_GoogleMapStateCreating value) creating,
    required TResult Function(_GoogleMapStateError value) error,
  }) {
    return creating(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_GoogleMapState value)? $default, {
    TResult Function(_GoogleMapStateCreating value)? creating,
    TResult Function(_GoogleMapStateError value)? error,
  }) {
    return creating?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_GoogleMapState value)? $default, {
    TResult Function(_GoogleMapStateCreating value)? creating,
    TResult Function(_GoogleMapStateError value)? error,
    required TResult orElse(),
  }) {
    if (creating != null) {
      return creating(this);
    }
    return orElse();
  }
}

abstract class _GoogleMapStateCreating implements GoogleMapState {
  factory _GoogleMapStateCreating() = _$_GoogleMapStateCreating;
}

/// @nodoc
abstract class _$GoogleMapStateErrorCopyWith<$Res> {
  factory _$GoogleMapStateErrorCopyWith(_GoogleMapStateError value,
          $Res Function(_GoogleMapStateError) then) =
      __$GoogleMapStateErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$GoogleMapStateErrorCopyWithImpl<$Res>
    extends _$GoogleMapStateCopyWithImpl<$Res>
    implements _$GoogleMapStateErrorCopyWith<$Res> {
  __$GoogleMapStateErrorCopyWithImpl(
      _GoogleMapStateError _value, $Res Function(_GoogleMapStateError) _then)
      : super(_value, (v) => _then(v as _GoogleMapStateError));

  @override
  _GoogleMapStateError get _value => super._value as _GoogleMapStateError;
}

/// @nodoc

class _$_GoogleMapStateError
    with DiagnosticableTreeMixin
    implements _GoogleMapStateError {
  _$_GoogleMapStateError();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'GoogleMapState.error()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'GoogleMapState.error'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _GoogleMapStateError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(GoogleMapController googleMapController,
            List<Shop> shopList, double radius, LatLng center)
        $default, {
    required TResult Function() creating,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(GoogleMapController googleMapController,
            List<Shop> shopList, double radius, LatLng center)?
        $default, {
    TResult Function()? creating,
    TResult Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(GoogleMapController googleMapController,
            List<Shop> shopList, double radius, LatLng center)?
        $default, {
    TResult Function()? creating,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_GoogleMapState value) $default, {
    required TResult Function(_GoogleMapStateCreating value) creating,
    required TResult Function(_GoogleMapStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_GoogleMapState value)? $default, {
    TResult Function(_GoogleMapStateCreating value)? creating,
    TResult Function(_GoogleMapStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_GoogleMapState value)? $default, {
    TResult Function(_GoogleMapStateCreating value)? creating,
    TResult Function(_GoogleMapStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _GoogleMapStateError implements GoogleMapState {
  factory _GoogleMapStateError() = _$_GoogleMapStateError;
}
