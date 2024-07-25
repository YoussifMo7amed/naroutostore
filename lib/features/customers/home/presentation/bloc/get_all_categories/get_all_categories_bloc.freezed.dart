// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_all_categories_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GetAllCategoriesEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() fetchAdminCategories,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? fetchAdminCategories,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? fetchAdminCategories,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(fetchCategoriesEvent value) fetchAdminCategories,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(fetchCategoriesEvent value)? fetchAdminCategories,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(fetchCategoriesEvent value)? fetchAdminCategories,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetAllCategoriesEventCopyWith<$Res> {
  factory $GetAllCategoriesEventCopyWith(GetAllCategoriesEvent value,
          $Res Function(GetAllCategoriesEvent) then) =
      _$GetAllCategoriesEventCopyWithImpl<$Res, GetAllCategoriesEvent>;
}

/// @nodoc
class _$GetAllCategoriesEventCopyWithImpl<$Res,
        $Val extends GetAllCategoriesEvent>
    implements $GetAllCategoriesEventCopyWith<$Res> {
  _$GetAllCategoriesEventCopyWithImpl(this._value, this._then);

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
    extends _$GetAllCategoriesEventCopyWithImpl<$Res, _$StartedImpl>
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
    return 'GetAllCategoriesEvent.started()';
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
    required TResult Function() fetchAdminCategories,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? fetchAdminCategories,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? fetchAdminCategories,
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
    required TResult Function(fetchCategoriesEvent value) fetchAdminCategories,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(fetchCategoriesEvent value)? fetchAdminCategories,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(fetchCategoriesEvent value)? fetchAdminCategories,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements GetAllCategoriesEvent {
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
    extends _$GetAllCategoriesEventCopyWithImpl<$Res,
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
    return 'GetAllCategoriesEvent.fetchAdminCategories()';
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
    required TResult Function() fetchAdminCategories,
  }) {
    return fetchAdminCategories();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? fetchAdminCategories,
  }) {
    return fetchAdminCategories?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? fetchAdminCategories,
    required TResult orElse(),
  }) {
    if (fetchAdminCategories != null) {
      return fetchAdminCategories();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(fetchCategoriesEvent value) fetchAdminCategories,
  }) {
    return fetchAdminCategories(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(fetchCategoriesEvent value)? fetchAdminCategories,
  }) {
    return fetchAdminCategories?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(fetchCategoriesEvent value)? fetchAdminCategories,
    required TResult orElse(),
  }) {
    if (fetchAdminCategories != null) {
      return fetchAdminCategories(this);
    }
    return orElse();
  }
}

abstract class fetchCategoriesEvent implements GetAllCategoriesEvent {
  const factory fetchCategoriesEvent() = _$fetchCategoriesEventImpl;
}

/// @nodoc
mixin _$GetAllCategoriesState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<GetAllCategoriesModel> categoriesList)
        success,
    required TResult Function() empty,
    required TResult Function(String error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<GetAllCategoriesModel> categoriesList)? success,
    TResult? Function()? empty,
    TResult? Function(String error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<GetAllCategoriesModel> categoriesList)? success,
    TResult Function()? empty,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetAllCategoriesLoadingState value) loading,
    required TResult Function(_GetAllCategoriesSuccessState value) success,
    required TResult Function(_GetAllCategoriesemptyState value) empty,
    required TResult Function(_GetAllCategoriesErrorState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetAllCategoriesLoadingState value)? loading,
    TResult? Function(_GetAllCategoriesSuccessState value)? success,
    TResult? Function(_GetAllCategoriesemptyState value)? empty,
    TResult? Function(_GetAllCategoriesErrorState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetAllCategoriesLoadingState value)? loading,
    TResult Function(_GetAllCategoriesSuccessState value)? success,
    TResult Function(_GetAllCategoriesemptyState value)? empty,
    TResult Function(_GetAllCategoriesErrorState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetAllCategoriesStateCopyWith<$Res> {
  factory $GetAllCategoriesStateCopyWith(GetAllCategoriesState value,
          $Res Function(GetAllCategoriesState) then) =
      _$GetAllCategoriesStateCopyWithImpl<$Res, GetAllCategoriesState>;
}

/// @nodoc
class _$GetAllCategoriesStateCopyWithImpl<$Res,
        $Val extends GetAllCategoriesState>
    implements $GetAllCategoriesStateCopyWith<$Res> {
  _$GetAllCategoriesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$GetAllCategoriesLoadingStateImplCopyWith<$Res> {
  factory _$$GetAllCategoriesLoadingStateImplCopyWith(
          _$GetAllCategoriesLoadingStateImpl value,
          $Res Function(_$GetAllCategoriesLoadingStateImpl) then) =
      __$$GetAllCategoriesLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetAllCategoriesLoadingStateImplCopyWithImpl<$Res>
    extends _$GetAllCategoriesStateCopyWithImpl<$Res,
        _$GetAllCategoriesLoadingStateImpl>
    implements _$$GetAllCategoriesLoadingStateImplCopyWith<$Res> {
  __$$GetAllCategoriesLoadingStateImplCopyWithImpl(
      _$GetAllCategoriesLoadingStateImpl _value,
      $Res Function(_$GetAllCategoriesLoadingStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetAllCategoriesLoadingStateImpl
    implements _GetAllCategoriesLoadingState {
  const _$GetAllCategoriesLoadingStateImpl();

  @override
  String toString() {
    return 'GetAllCategoriesState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetAllCategoriesLoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<GetAllCategoriesModel> categoriesList)
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
    TResult? Function(List<GetAllCategoriesModel> categoriesList)? success,
    TResult? Function()? empty,
    TResult? Function(String error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<GetAllCategoriesModel> categoriesList)? success,
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
    required TResult Function(_GetAllCategoriesLoadingState value) loading,
    required TResult Function(_GetAllCategoriesSuccessState value) success,
    required TResult Function(_GetAllCategoriesemptyState value) empty,
    required TResult Function(_GetAllCategoriesErrorState value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetAllCategoriesLoadingState value)? loading,
    TResult? Function(_GetAllCategoriesSuccessState value)? success,
    TResult? Function(_GetAllCategoriesemptyState value)? empty,
    TResult? Function(_GetAllCategoriesErrorState value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetAllCategoriesLoadingState value)? loading,
    TResult Function(_GetAllCategoriesSuccessState value)? success,
    TResult Function(_GetAllCategoriesemptyState value)? empty,
    TResult Function(_GetAllCategoriesErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _GetAllCategoriesLoadingState implements GetAllCategoriesState {
  const factory _GetAllCategoriesLoadingState() =
      _$GetAllCategoriesLoadingStateImpl;
}

/// @nodoc
abstract class _$$GetAllCategoriesSuccessStateImplCopyWith<$Res> {
  factory _$$GetAllCategoriesSuccessStateImplCopyWith(
          _$GetAllCategoriesSuccessStateImpl value,
          $Res Function(_$GetAllCategoriesSuccessStateImpl) then) =
      __$$GetAllCategoriesSuccessStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<GetAllCategoriesModel> categoriesList});
}

/// @nodoc
class __$$GetAllCategoriesSuccessStateImplCopyWithImpl<$Res>
    extends _$GetAllCategoriesStateCopyWithImpl<$Res,
        _$GetAllCategoriesSuccessStateImpl>
    implements _$$GetAllCategoriesSuccessStateImplCopyWith<$Res> {
  __$$GetAllCategoriesSuccessStateImplCopyWithImpl(
      _$GetAllCategoriesSuccessStateImpl _value,
      $Res Function(_$GetAllCategoriesSuccessStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoriesList = null,
  }) {
    return _then(_$GetAllCategoriesSuccessStateImpl(
      categoriesList: null == categoriesList
          ? _value._categoriesList
          : categoriesList // ignore: cast_nullable_to_non_nullable
              as List<GetAllCategoriesModel>,
    ));
  }
}

/// @nodoc

class _$GetAllCategoriesSuccessStateImpl
    implements _GetAllCategoriesSuccessState {
  const _$GetAllCategoriesSuccessStateImpl(
      {required final List<GetAllCategoriesModel> categoriesList})
      : _categoriesList = categoriesList;

  final List<GetAllCategoriesModel> _categoriesList;
  @override
  List<GetAllCategoriesModel> get categoriesList {
    if (_categoriesList is EqualUnmodifiableListView) return _categoriesList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categoriesList);
  }

  @override
  String toString() {
    return 'GetAllCategoriesState.success(categoriesList: $categoriesList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetAllCategoriesSuccessStateImpl &&
            const DeepCollectionEquality()
                .equals(other._categoriesList, _categoriesList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_categoriesList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetAllCategoriesSuccessStateImplCopyWith<
          _$GetAllCategoriesSuccessStateImpl>
      get copyWith => __$$GetAllCategoriesSuccessStateImplCopyWithImpl<
          _$GetAllCategoriesSuccessStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<GetAllCategoriesModel> categoriesList)
        success,
    required TResult Function() empty,
    required TResult Function(String error) error,
  }) {
    return success(categoriesList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<GetAllCategoriesModel> categoriesList)? success,
    TResult? Function()? empty,
    TResult? Function(String error)? error,
  }) {
    return success?.call(categoriesList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<GetAllCategoriesModel> categoriesList)? success,
    TResult Function()? empty,
    TResult Function(String error)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(categoriesList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetAllCategoriesLoadingState value) loading,
    required TResult Function(_GetAllCategoriesSuccessState value) success,
    required TResult Function(_GetAllCategoriesemptyState value) empty,
    required TResult Function(_GetAllCategoriesErrorState value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetAllCategoriesLoadingState value)? loading,
    TResult? Function(_GetAllCategoriesSuccessState value)? success,
    TResult? Function(_GetAllCategoriesemptyState value)? empty,
    TResult? Function(_GetAllCategoriesErrorState value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetAllCategoriesLoadingState value)? loading,
    TResult Function(_GetAllCategoriesSuccessState value)? success,
    TResult Function(_GetAllCategoriesemptyState value)? empty,
    TResult Function(_GetAllCategoriesErrorState value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _GetAllCategoriesSuccessState implements GetAllCategoriesState {
  const factory _GetAllCategoriesSuccessState(
          {required final List<GetAllCategoriesModel> categoriesList}) =
      _$GetAllCategoriesSuccessStateImpl;

  List<GetAllCategoriesModel> get categoriesList;
  @JsonKey(ignore: true)
  _$$GetAllCategoriesSuccessStateImplCopyWith<
          _$GetAllCategoriesSuccessStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetAllCategoriesemptyStateImplCopyWith<$Res> {
  factory _$$GetAllCategoriesemptyStateImplCopyWith(
          _$GetAllCategoriesemptyStateImpl value,
          $Res Function(_$GetAllCategoriesemptyStateImpl) then) =
      __$$GetAllCategoriesemptyStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetAllCategoriesemptyStateImplCopyWithImpl<$Res>
    extends _$GetAllCategoriesStateCopyWithImpl<$Res,
        _$GetAllCategoriesemptyStateImpl>
    implements _$$GetAllCategoriesemptyStateImplCopyWith<$Res> {
  __$$GetAllCategoriesemptyStateImplCopyWithImpl(
      _$GetAllCategoriesemptyStateImpl _value,
      $Res Function(_$GetAllCategoriesemptyStateImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetAllCategoriesemptyStateImpl implements _GetAllCategoriesemptyState {
  const _$GetAllCategoriesemptyStateImpl();

  @override
  String toString() {
    return 'GetAllCategoriesState.empty()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetAllCategoriesemptyStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<GetAllCategoriesModel> categoriesList)
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
    TResult? Function(List<GetAllCategoriesModel> categoriesList)? success,
    TResult? Function()? empty,
    TResult? Function(String error)? error,
  }) {
    return empty?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<GetAllCategoriesModel> categoriesList)? success,
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
    required TResult Function(_GetAllCategoriesLoadingState value) loading,
    required TResult Function(_GetAllCategoriesSuccessState value) success,
    required TResult Function(_GetAllCategoriesemptyState value) empty,
    required TResult Function(_GetAllCategoriesErrorState value) error,
  }) {
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetAllCategoriesLoadingState value)? loading,
    TResult? Function(_GetAllCategoriesSuccessState value)? success,
    TResult? Function(_GetAllCategoriesemptyState value)? empty,
    TResult? Function(_GetAllCategoriesErrorState value)? error,
  }) {
    return empty?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetAllCategoriesLoadingState value)? loading,
    TResult Function(_GetAllCategoriesSuccessState value)? success,
    TResult Function(_GetAllCategoriesemptyState value)? empty,
    TResult Function(_GetAllCategoriesErrorState value)? error,
    required TResult orElse(),
  }) {
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class _GetAllCategoriesemptyState implements GetAllCategoriesState {
  const factory _GetAllCategoriesemptyState() =
      _$GetAllCategoriesemptyStateImpl;
}

/// @nodoc
abstract class _$$GetAllCategoriesErrorStateImplCopyWith<$Res> {
  factory _$$GetAllCategoriesErrorStateImplCopyWith(
          _$GetAllCategoriesErrorStateImpl value,
          $Res Function(_$GetAllCategoriesErrorStateImpl) then) =
      __$$GetAllCategoriesErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$GetAllCategoriesErrorStateImplCopyWithImpl<$Res>
    extends _$GetAllCategoriesStateCopyWithImpl<$Res,
        _$GetAllCategoriesErrorStateImpl>
    implements _$$GetAllCategoriesErrorStateImplCopyWith<$Res> {
  __$$GetAllCategoriesErrorStateImplCopyWithImpl(
      _$GetAllCategoriesErrorStateImpl _value,
      $Res Function(_$GetAllCategoriesErrorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$GetAllCategoriesErrorStateImpl(
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GetAllCategoriesErrorStateImpl implements _GetAllCategoriesErrorState {
  const _$GetAllCategoriesErrorStateImpl({required this.error});

  @override
  final String error;

  @override
  String toString() {
    return 'GetAllCategoriesState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetAllCategoriesErrorStateImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetAllCategoriesErrorStateImplCopyWith<_$GetAllCategoriesErrorStateImpl>
      get copyWith => __$$GetAllCategoriesErrorStateImplCopyWithImpl<
          _$GetAllCategoriesErrorStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<GetAllCategoriesModel> categoriesList)
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
    TResult? Function(List<GetAllCategoriesModel> categoriesList)? success,
    TResult? Function()? empty,
    TResult? Function(String error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<GetAllCategoriesModel> categoriesList)? success,
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
    required TResult Function(_GetAllCategoriesLoadingState value) loading,
    required TResult Function(_GetAllCategoriesSuccessState value) success,
    required TResult Function(_GetAllCategoriesemptyState value) empty,
    required TResult Function(_GetAllCategoriesErrorState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetAllCategoriesLoadingState value)? loading,
    TResult? Function(_GetAllCategoriesSuccessState value)? success,
    TResult? Function(_GetAllCategoriesemptyState value)? empty,
    TResult? Function(_GetAllCategoriesErrorState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetAllCategoriesLoadingState value)? loading,
    TResult Function(_GetAllCategoriesSuccessState value)? success,
    TResult Function(_GetAllCategoriesemptyState value)? empty,
    TResult Function(_GetAllCategoriesErrorState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _GetAllCategoriesErrorState implements GetAllCategoriesState {
  const factory _GetAllCategoriesErrorState({required final String error}) =
      _$GetAllCategoriesErrorStateImpl;

  String get error;
  @JsonKey(ignore: true)
  _$$GetAllCategoriesErrorStateImplCopyWith<_$GetAllCategoriesErrorStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
