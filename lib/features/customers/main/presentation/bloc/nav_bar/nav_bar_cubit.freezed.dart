// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nav_bar_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$NavBarState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(NavBarEnum navBar) navBarChange,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(NavBarEnum navBar)? navBarChange,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(NavBarEnum navBar)? navBarChange,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(BottomNavBarState value) navBarChange,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(BottomNavBarState value)? navBarChange,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(BottomNavBarState value)? navBarChange,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NavBarStateCopyWith<$Res> {
  factory $NavBarStateCopyWith(
          NavBarState value, $Res Function(NavBarState) then) =
      _$NavBarStateCopyWithImpl<$Res, NavBarState>;
}

/// @nodoc
class _$NavBarStateCopyWithImpl<$Res, $Val extends NavBarState>
    implements $NavBarStateCopyWith<$Res> {
  _$NavBarStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$NavBarStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'NavBarState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(NavBarEnum navBar) navBarChange,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(NavBarEnum navBar)? navBarChange,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(NavBarEnum navBar)? navBarChange,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(BottomNavBarState value) navBarChange,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(BottomNavBarState value)? navBarChange,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(BottomNavBarState value)? navBarChange,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements NavBarState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$BottomNavBarStateImplCopyWith<$Res> {
  factory _$$BottomNavBarStateImplCopyWith(_$BottomNavBarStateImpl value,
          $Res Function(_$BottomNavBarStateImpl) then) =
      __$$BottomNavBarStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({NavBarEnum navBar});
}

/// @nodoc
class __$$BottomNavBarStateImplCopyWithImpl<$Res>
    extends _$NavBarStateCopyWithImpl<$Res, _$BottomNavBarStateImpl>
    implements _$$BottomNavBarStateImplCopyWith<$Res> {
  __$$BottomNavBarStateImplCopyWithImpl(_$BottomNavBarStateImpl _value,
      $Res Function(_$BottomNavBarStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? navBar = null,
  }) {
    return _then(_$BottomNavBarStateImpl(
      navBar: null == navBar
          ? _value.navBar
          : navBar // ignore: cast_nullable_to_non_nullable
              as NavBarEnum,
    ));
  }
}

/// @nodoc

class _$BottomNavBarStateImpl implements BottomNavBarState {
  const _$BottomNavBarStateImpl({required this.navBar});

  @override
  final NavBarEnum navBar;

  @override
  String toString() {
    return 'NavBarState.navBarChange(navBar: $navBar)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BottomNavBarStateImpl &&
            (identical(other.navBar, navBar) || other.navBar == navBar));
  }

  @override
  int get hashCode => Object.hash(runtimeType, navBar);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BottomNavBarStateImplCopyWith<_$BottomNavBarStateImpl> get copyWith =>
      __$$BottomNavBarStateImplCopyWithImpl<_$BottomNavBarStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(NavBarEnum navBar) navBarChange,
  }) {
    return navBarChange(navBar);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(NavBarEnum navBar)? navBarChange,
  }) {
    return navBarChange?.call(navBar);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(NavBarEnum navBar)? navBarChange,
    required TResult orElse(),
  }) {
    if (navBarChange != null) {
      return navBarChange(navBar);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(BottomNavBarState value) navBarChange,
  }) {
    return navBarChange(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(BottomNavBarState value)? navBarChange,
  }) {
    return navBarChange?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(BottomNavBarState value)? navBarChange,
    required TResult orElse(),
  }) {
    if (navBarChange != null) {
      return navBarChange(this);
    }
    return orElse();
  }
}

abstract class BottomNavBarState implements NavBarState {
  const factory BottomNavBarState({required final NavBarEnum navBar}) =
      _$BottomNavBarStateImpl;

  NavBarEnum get navBar;
  @JsonKey(ignore: true)
  _$$BottomNavBarStateImplCopyWith<_$BottomNavBarStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
