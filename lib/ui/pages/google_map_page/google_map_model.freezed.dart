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

  _GoogleMapState call({GoogleMapController? googleMapController}) {
    return _GoogleMapState(
      googleMapController: googleMapController,
    );
  }

  _GoogleMapStateCreating creating() {
    return _GoogleMapStateCreating();
  }
}

/// @nodoc
const $GoogleMapState = _$GoogleMapStateTearOff();

/// @nodoc
mixin _$GoogleMapState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(GoogleMapController? googleMapController) $default, {
    required TResult Function() creating,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(GoogleMapController? googleMapController)? $default, {
    TResult Function()? creating,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(GoogleMapController? googleMapController)? $default, {
    TResult Function()? creating,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_GoogleMapState value) $default, {
    required TResult Function(_GoogleMapStateCreating value) creating,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_GoogleMapState value)? $default, {
    TResult Function(_GoogleMapStateCreating value)? creating,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_GoogleMapState value)? $default, {
    TResult Function(_GoogleMapStateCreating value)? creating,
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
  $Res call({GoogleMapController? googleMapController});
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
  }) {
    return _then(_GoogleMapState(
      googleMapController: googleMapController == freezed
          ? _value.googleMapController
          : googleMapController // ignore: cast_nullable_to_non_nullable
              as GoogleMapController?,
    ));
  }
}

/// @nodoc

class _$_GoogleMapState implements _GoogleMapState {
  _$_GoogleMapState({this.googleMapController});

  @override
  final GoogleMapController? googleMapController;

  @override
  String toString() {
    return 'GoogleMapState(googleMapController: $googleMapController)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GoogleMapState &&
            const DeepCollectionEquality()
                .equals(other.googleMapController, googleMapController));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(googleMapController));

  @JsonKey(ignore: true)
  @override
  _$GoogleMapStateCopyWith<_GoogleMapState> get copyWith =>
      __$GoogleMapStateCopyWithImpl<_GoogleMapState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(GoogleMapController? googleMapController) $default, {
    required TResult Function() creating,
  }) {
    return $default(googleMapController);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(GoogleMapController? googleMapController)? $default, {
    TResult Function()? creating,
  }) {
    return $default?.call(googleMapController);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(GoogleMapController? googleMapController)? $default, {
    TResult Function()? creating,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(googleMapController);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_GoogleMapState value) $default, {
    required TResult Function(_GoogleMapStateCreating value) creating,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_GoogleMapState value)? $default, {
    TResult Function(_GoogleMapStateCreating value)? creating,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_GoogleMapState value)? $default, {
    TResult Function(_GoogleMapStateCreating value)? creating,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }
}

abstract class _GoogleMapState implements GoogleMapState {
  factory _GoogleMapState({GoogleMapController? googleMapController}) =
      _$_GoogleMapState;

  GoogleMapController? get googleMapController;
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

class _$_GoogleMapStateCreating implements _GoogleMapStateCreating {
  _$_GoogleMapStateCreating();

  @override
  String toString() {
    return 'GoogleMapState.creating()';
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
    TResult Function(GoogleMapController? googleMapController) $default, {
    required TResult Function() creating,
  }) {
    return creating();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult Function(GoogleMapController? googleMapController)? $default, {
    TResult Function()? creating,
  }) {
    return creating?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(GoogleMapController? googleMapController)? $default, {
    TResult Function()? creating,
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
  }) {
    return creating(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult Function(_GoogleMapState value)? $default, {
    TResult Function(_GoogleMapStateCreating value)? creating,
  }) {
    return creating?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_GoogleMapState value)? $default, {
    TResult Function(_GoogleMapStateCreating value)? creating,
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
