// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'input_bottom_sheet_widget.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TodoInputResult {
  String get description => throw _privateConstructorUsedError;
  bool get isCreate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TodoInputResultCopyWith<TodoInputResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodoInputResultCopyWith<$Res> {
  factory $TodoInputResultCopyWith(
          TodoInputResult value, $Res Function(TodoInputResult) then) =
      _$TodoInputResultCopyWithImpl<$Res, TodoInputResult>;
  @useResult
  $Res call({String description, bool isCreate});
}

/// @nodoc
class _$TodoInputResultCopyWithImpl<$Res, $Val extends TodoInputResult>
    implements $TodoInputResultCopyWith<$Res> {
  _$TodoInputResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? isCreate = null,
  }) {
    return _then(_value.copyWith(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      isCreate: null == isCreate
          ? _value.isCreate
          : isCreate // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TodoInputResultImplCopyWith<$Res>
    implements $TodoInputResultCopyWith<$Res> {
  factory _$$TodoInputResultImplCopyWith(_$TodoInputResultImpl value,
          $Res Function(_$TodoInputResultImpl) then) =
      __$$TodoInputResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String description, bool isCreate});
}

/// @nodoc
class __$$TodoInputResultImplCopyWithImpl<$Res>
    extends _$TodoInputResultCopyWithImpl<$Res, _$TodoInputResultImpl>
    implements _$$TodoInputResultImplCopyWith<$Res> {
  __$$TodoInputResultImplCopyWithImpl(
      _$TodoInputResultImpl _value, $Res Function(_$TodoInputResultImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? description = null,
    Object? isCreate = null,
  }) {
    return _then(_$TodoInputResultImpl(
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      isCreate: null == isCreate
          ? _value.isCreate
          : isCreate // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$TodoInputResultImpl implements _TodoInputResult {
  const _$TodoInputResultImpl(
      {required this.description, required this.isCreate});

  @override
  final String description;
  @override
  final bool isCreate;

  @override
  String toString() {
    return 'TodoInputResult(description: $description, isCreate: $isCreate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodoInputResultImpl &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.isCreate, isCreate) ||
                other.isCreate == isCreate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, description, isCreate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TodoInputResultImplCopyWith<_$TodoInputResultImpl> get copyWith =>
      __$$TodoInputResultImplCopyWithImpl<_$TodoInputResultImpl>(
          this, _$identity);
}

abstract class _TodoInputResult implements TodoInputResult {
  const factory _TodoInputResult(
      {required final String description,
      required final bool isCreate}) = _$TodoInputResultImpl;

  @override
  String get description;
  @override
  bool get isCreate;
  @override
  @JsonKey(ignore: true)
  _$$TodoInputResultImplCopyWith<_$TodoInputResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
