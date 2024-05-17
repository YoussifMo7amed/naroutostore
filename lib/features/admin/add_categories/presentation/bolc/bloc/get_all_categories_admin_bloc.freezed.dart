// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_all_categories_admin_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GetAllCategoriesAdminEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getAllAdminCategories,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getAllAdminCategories,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getAllAdminCategories,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(fetchCategoriesEvent value) getAllAdminCategories,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(fetchCategoriesEvent value)? getAllAdminCategories,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(fetchCategoriesEvent value)? getAllAdminCategories,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetAllCategoriesAdminEventCopyWith<$Res> {
  factory $GetAllCategoriesAdminEventCopyWith(GetAllCategoriesAdminEvent value,
          $Res Function(GetAllCategoriesAdminEvent) then) =
      _$GetAllCategoriesAdminEventCopyWithImpl<$Res,
          GetAllCategoriesAdminEvent>;
}

/// @nodoc
class _$GetAllCategoriesAdminEventCopyWithImpl<$Res,
        $Val extends GetAllCategoriesAdminEvent>
    implements $GetAllCategoriesAdminEventCopyWith<$Res> {
  _$GetAllCategoriesAdminEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$GetAllCategoriesAdminEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'GetAllCategoriesAdminEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getAllAdminCategories,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getAllAdminCategories,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getAllAdminCategories,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(fetchCategoriesEvent value) getAllAdminCategories,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(fetchCategoriesEvent value)? getAllAdminCategories,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(fetchCategoriesEvent value)? getAllAdminCategories,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements GetAllCategoriesAdminEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$fetchCategoriesEventImplCopyWith<$Res> {
  factory _$$fetchCategoriesEventImplCopyWith(_$fetchCategoriesEventImpl value,
          $Res Function(_$fetchCategoriesEventImpl) then) =
      __$$fetchCategoriesEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$fetchCategoriesEventImplCopyWithImpl<$Res>
    extends _$GetAllCategoriesAdminEventCopyWithImpl<$Res,
        _$fetchCategoriesEventImpl>
    implements _$$fetchCategoriesEventImplCopyWith<$Res> {
  __$$fetchCategoriesEventImplCopyWithImpl(_$fetchCategoriesEventImpl _value,
      $Res Function(_$fetchCategoriesEventImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$fetchCategoriesEventImpl implements fetchCategoriesEvent {
  const _$fetchCategoriesEventImpl();

  @override
  String toString() {
    return 'GetAllCategoriesAdminEvent.getAllAdminCategories()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$fetchCategoriesEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getAllAdminCategories,
  }) {
    return getAllAdminCategories();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getAllAdminCategories,
  }) {
    return getAllAdminCategories?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getAllAdminCategories,
    required TResult orElse(),
  }) {
    if (getAllAdminCategories != null) {
      return getAllAdminCategories();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(fetchCategoriesEvent value) getAllAdminCategories,
  }) {
    return getAllAdminCategories(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(fetchCategoriesEvent value)? getAllAdminCategories,
  }) {
    return getAllAdminCategories?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(fetchCategoriesEvent value)? getAllAdminCategories,
    required TResult orElse(),
  }) {
    if (getAllAdminCategories != null) {
      return getAllAdminCategories(this);
    }
    return orElse();
  }
}

abstract class fetchCategoriesEvent implements GetAllCategoriesAdminEvent {
  const factory fetchCategoriesEvent() = _$fetchCategoriesEventImpl;
}

/// @nodoc
mixin _$GetAllCategoriesAdminState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(GetAllCategoriesResponce getAllCategoriesResponce)
        success,
    required TResult Function() empty,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(GetAllCategoriesResponce getAllCategoriesResponce)?
        success,
    TResult? Function()? empty,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(GetAllCategoriesResponce getAllCategoriesResponce)?
        success,
    TResult Function()? empty,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetAllCategoriesAdminLoading value) loading,
    required TResult Function(_GetAllCategoriesAdminSuccess value) success,
    required TResult Function(_GetAllCategoriesAdminempty value) empty,
    required TResult Function(_GetAllCategoriesAdminError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetAllCategoriesAdminLoading value)? loading,
    TResult? Function(_GetAllCategoriesAdminSuccess value)? success,
    TResult? Function(_GetAllCategoriesAdminempty value)? empty,
    TResult? Function(_GetAllCategoriesAdminError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetAllCategoriesAdminLoading value)? loading,
    TResult Function(_GetAllCategoriesAdminSuccess value)? success,
    TResult Function(_GetAllCategoriesAdminempty value)? empty,
    TResult Function(_GetAllCategoriesAdminError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetAllCategoriesAdminStateCopyWith<$Res> {
  factory $GetAllCategoriesAdminStateCopyWith(GetAllCategoriesAdminState value,
          $Res Function(GetAllCategoriesAdminState) then) =
      _$GetAllCategoriesAdminStateCopyWithImpl<$Res,
          GetAllCategoriesAdminState>;
}

/// @nodoc
class _$GetAllCategoriesAdminStateCopyWithImpl<$Res,
        $Val extends GetAllCategoriesAdminState>
    implements $GetAllCategoriesAdminStateCopyWith<$Res> {
  _$GetAllCategoriesAdminStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetAllCategoriesAdminLoadingImplCopyWith<$Res> {
  factory _$$GetAllCategoriesAdminLoadingImplCopyWith(
          _$GetAllCategoriesAdminLoadingImpl value,
          $Res Function(_$GetAllCategoriesAdminLoadingImpl) then) =
      __$$GetAllCategoriesAdminLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetAllCategoriesAdminLoadingImplCopyWithImpl<$Res>
    extends _$GetAllCategoriesAdminStateCopyWithImpl<$Res,
        _$GetAllCategoriesAdminLoadingImpl>
    implements _$$GetAllCategoriesAdminLoadingImplCopyWith<$Res> {
  __$$GetAllCategoriesAdminLoadingImplCopyWithImpl(
      _$GetAllCategoriesAdminLoadingImpl _value,
      $Res Function(_$GetAllCategoriesAdminLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetAllCategoriesAdminLoadingImpl
    implements _GetAllCategoriesAdminLoading {
  const _$GetAllCategoriesAdminLoadingImpl();

  @override
  String toString() {
    return 'GetAllCategoriesAdminState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetAllCategoriesAdminLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(GetAllCategoriesResponce getAllCategoriesResponce)
        success,
    required TResult Function() empty,
    required TResult Function(String error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(GetAllCategoriesResponce getAllCategoriesResponce)?
        success,
    TResult? Function()? empty,
    TResult? Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(GetAllCategoriesResponce getAllCategoriesResponce)?
        success,
    TResult Function()? empty,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetAllCategoriesAdminLoading value) loading,
    required TResult Function(_GetAllCategoriesAdminSuccess value) success,
    required TResult Function(_GetAllCategoriesAdminempty value) empty,
    required TResult Function(_GetAllCategoriesAdminError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetAllCategoriesAdminLoading value)? loading,
    TResult? Function(_GetAllCategoriesAdminSuccess value)? success,
    TResult? Function(_GetAllCategoriesAdminempty value)? empty,
    TResult? Function(_GetAllCategoriesAdminError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetAllCategoriesAdminLoading value)? loading,
    TResult Function(_GetAllCategoriesAdminSuccess value)? success,
    TResult Function(_GetAllCategoriesAdminempty value)? empty,
    TResult Function(_GetAllCategoriesAdminError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _GetAllCategoriesAdminLoading
    implements GetAllCategoriesAdminState {
  const factory _GetAllCategoriesAdminLoading() =
      _$GetAllCategoriesAdminLoadingImpl;
}

/// @nodoc
abstract class _$$GetAllCategoriesAdminSuccessImplCopyWith<$Res> {
  factory _$$GetAllCategoriesAdminSuccessImplCopyWith(
          _$GetAllCategoriesAdminSuccessImpl value,
          $Res Function(_$GetAllCategoriesAdminSuccessImpl) then) =
      __$$GetAllCategoriesAdminSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({GetAllCategoriesResponce getAllCategoriesResponce});
}

/// @nodoc
class __$$GetAllCategoriesAdminSuccessImplCopyWithImpl<$Res>
    extends _$GetAllCategoriesAdminStateCopyWithImpl<$Res,
        _$GetAllCategoriesAdminSuccessImpl>
    implements _$$GetAllCategoriesAdminSuccessImplCopyWith<$Res> {
  __$$GetAllCategoriesAdminSuccessImplCopyWithImpl(
      _$GetAllCategoriesAdminSuccessImpl _value,
      $Res Function(_$GetAllCategoriesAdminSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? getAllCategoriesResponce = null,
  }) {
    return _then(_$GetAllCategoriesAdminSuccessImpl(
      getAllCategoriesResponce: null == getAllCategoriesResponce
          ? _value.getAllCategoriesResponce
          : getAllCategoriesResponce // ignore: cast_nullable_to_non_nullable
              as GetAllCategoriesResponce,
    ));
  }
}

/// @nodoc

class _$GetAllCategoriesAdminSuccessImpl
    implements _GetAllCategoriesAdminSuccess {
  const _$GetAllCategoriesAdminSuccessImpl(
      {required this.getAllCategoriesResponce});

  @override
  final GetAllCategoriesResponce getAllCategoriesResponce;

  @override
  String toString() {
    return 'GetAllCategoriesAdminState.success(getAllCategoriesResponce: $getAllCategoriesResponce)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetAllCategoriesAdminSuccessImpl &&
            (identical(
                    other.getAllCategoriesResponce, getAllCategoriesResponce) ||
                other.getAllCategoriesResponce == getAllCategoriesResponce));
  }

  @override
  int get hashCode => Object.hash(runtimeType, getAllCategoriesResponce);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetAllCategoriesAdminSuccessImplCopyWith<
          _$GetAllCategoriesAdminSuccessImpl>
      get copyWith => __$$GetAllCategoriesAdminSuccessImplCopyWithImpl<
          _$GetAllCategoriesAdminSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(GetAllCategoriesResponce getAllCategoriesResponce)
        success,
    required TResult Function() empty,
    required TResult Function(String error) error,
  }) {
    return success(getAllCategoriesResponce);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(GetAllCategoriesResponce getAllCategoriesResponce)?
        success,
    TResult? Function()? empty,
    TResult? Function(String error)? error,
  }) {
    return success?.call(getAllCategoriesResponce);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(GetAllCategoriesResponce getAllCategoriesResponce)?
        success,
    TResult Function()? empty,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(getAllCategoriesResponce);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetAllCategoriesAdminLoading value) loading,
    required TResult Function(_GetAllCategoriesAdminSuccess value) success,
    required TResult Function(_GetAllCategoriesAdminempty value) empty,
    required TResult Function(_GetAllCategoriesAdminError value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetAllCategoriesAdminLoading value)? loading,
    TResult? Function(_GetAllCategoriesAdminSuccess value)? success,
    TResult? Function(_GetAllCategoriesAdminempty value)? empty,
    TResult? Function(_GetAllCategoriesAdminError value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetAllCategoriesAdminLoading value)? loading,
    TResult Function(_GetAllCategoriesAdminSuccess value)? success,
    TResult Function(_GetAllCategoriesAdminempty value)? empty,
    TResult Function(_GetAllCategoriesAdminError value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _GetAllCategoriesAdminSuccess
    implements GetAllCategoriesAdminState {
  const factory _GetAllCategoriesAdminSuccess(
          {required final GetAllCategoriesResponce getAllCategoriesResponce}) =
      _$GetAllCategoriesAdminSuccessImpl;

  GetAllCategoriesResponce get getAllCategoriesResponce;
  @JsonKey(ignore: true)
  _$$GetAllCategoriesAdminSuccessImplCopyWith<
          _$GetAllCategoriesAdminSuccessImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetAllCategoriesAdminemptyImplCopyWith<$Res> {
  factory _$$GetAllCategoriesAdminemptyImplCopyWith(
          _$GetAllCategoriesAdminemptyImpl value,
          $Res Function(_$GetAllCategoriesAdminemptyImpl) then) =
      __$$GetAllCategoriesAdminemptyImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetAllCategoriesAdminemptyImplCopyWithImpl<$Res>
    extends _$GetAllCategoriesAdminStateCopyWithImpl<$Res,
        _$GetAllCategoriesAdminemptyImpl>
    implements _$$GetAllCategoriesAdminemptyImplCopyWith<$Res> {
  __$$GetAllCategoriesAdminemptyImplCopyWithImpl(
      _$GetAllCategoriesAdminemptyImpl _value,
      $Res Function(_$GetAllCategoriesAdminemptyImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetAllCategoriesAdminemptyImpl implements _GetAllCategoriesAdminempty {
  const _$GetAllCategoriesAdminemptyImpl();

  @override
  String toString() {
    return 'GetAllCategoriesAdminState.empty()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetAllCategoriesAdminemptyImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(GetAllCategoriesResponce getAllCategoriesResponce)
        success,
    required TResult Function() empty,
    required TResult Function(String error) error,
  }) {
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(GetAllCategoriesResponce getAllCategoriesResponce)?
        success,
    TResult? Function()? empty,
    TResult? Function(String error)? error,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(GetAllCategoriesResponce getAllCategoriesResponce)?
        success,
    TResult Function()? empty,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetAllCategoriesAdminLoading value) loading,
    required TResult Function(_GetAllCategoriesAdminSuccess value) success,
    required TResult Function(_GetAllCategoriesAdminempty value) empty,
    required TResult Function(_GetAllCategoriesAdminError value) error,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetAllCategoriesAdminLoading value)? loading,
    TResult? Function(_GetAllCategoriesAdminSuccess value)? success,
    TResult? Function(_GetAllCategoriesAdminempty value)? empty,
    TResult? Function(_GetAllCategoriesAdminError value)? error,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetAllCategoriesAdminLoading value)? loading,
    TResult Function(_GetAllCategoriesAdminSuccess value)? success,
    TResult Function(_GetAllCategoriesAdminempty value)? empty,
    TResult Function(_GetAllCategoriesAdminError value)? error,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class _GetAllCategoriesAdminempty
    implements GetAllCategoriesAdminState {
  const factory _GetAllCategoriesAdminempty() =
      _$GetAllCategoriesAdminemptyImpl;
}

/// @nodoc
abstract class _$$GetAllCategoriesAdminErrorImplCopyWith<$Res> {
  factory _$$GetAllCategoriesAdminErrorImplCopyWith(
          _$GetAllCategoriesAdminErrorImpl value,
          $Res Function(_$GetAllCategoriesAdminErrorImpl) then) =
      __$$GetAllCategoriesAdminErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$GetAllCategoriesAdminErrorImplCopyWithImpl<$Res>
    extends _$GetAllCategoriesAdminStateCopyWithImpl<$Res,
        _$GetAllCategoriesAdminErrorImpl>
    implements _$$GetAllCategoriesAdminErrorImplCopyWith<$Res> {
  __$$GetAllCategoriesAdminErrorImplCopyWithImpl(
      _$GetAllCategoriesAdminErrorImpl _value,
      $Res Function(_$GetAllCategoriesAdminErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$GetAllCategoriesAdminErrorImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetAllCategoriesAdminErrorImpl implements _GetAllCategoriesAdminError {
  const _$GetAllCategoriesAdminErrorImpl({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'GetAllCategoriesAdminState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetAllCategoriesAdminErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetAllCategoriesAdminErrorImplCopyWith<_$GetAllCategoriesAdminErrorImpl>
      get copyWith => __$$GetAllCategoriesAdminErrorImplCopyWithImpl<
          _$GetAllCategoriesAdminErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(GetAllCategoriesResponce getAllCategoriesResponce)
        success,
    required TResult Function() empty,
    required TResult Function(String error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(GetAllCategoriesResponce getAllCategoriesResponce)?
        success,
    TResult? Function()? empty,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(GetAllCategoriesResponce getAllCategoriesResponce)?
        success,
    TResult Function()? empty,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetAllCategoriesAdminLoading value) loading,
    required TResult Function(_GetAllCategoriesAdminSuccess value) success,
    required TResult Function(_GetAllCategoriesAdminempty value) empty,
    required TResult Function(_GetAllCategoriesAdminError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetAllCategoriesAdminLoading value)? loading,
    TResult? Function(_GetAllCategoriesAdminSuccess value)? success,
    TResult? Function(_GetAllCategoriesAdminempty value)? empty,
    TResult? Function(_GetAllCategoriesAdminError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetAllCategoriesAdminLoading value)? loading,
    TResult Function(_GetAllCategoriesAdminSuccess value)? success,
    TResult Function(_GetAllCategoriesAdminempty value)? empty,
    TResult Function(_GetAllCategoriesAdminError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _GetAllCategoriesAdminError
    implements GetAllCategoriesAdminState {
  const factory _GetAllCategoriesAdminError({required final String error}) =
      _$GetAllCategoriesAdminErrorImpl;

  String get error;
  @JsonKey(ignore: true)
  _$$GetAllCategoriesAdminErrorImplCopyWith<_$GetAllCategoriesAdminErrorImpl>
      get copyWith => throw _privateConstructorUsedError;
}
