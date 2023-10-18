// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_plan.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ToDoPlan _$ToDoPlanFromJson(Map<String, dynamic> json) {
  return _ToDoPlan.fromJson(json);
}

/// @nodoc
mixin _$ToDoPlan {
  DateTime? get selectedDate => throw _privateConstructorUsedError;
  DateTime get today => throw _privateConstructorUsedError;
  List<Todo>? get list => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ToDoPlanCopyWith<ToDoPlan> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ToDoPlanCopyWith<$Res> {
  factory $ToDoPlanCopyWith(ToDoPlan value, $Res Function(ToDoPlan) then) =
      _$ToDoPlanCopyWithImpl<$Res, ToDoPlan>;
  @useResult
  $Res call({DateTime? selectedDate, DateTime today, List<Todo>? list});
}

/// @nodoc
class _$ToDoPlanCopyWithImpl<$Res, $Val extends ToDoPlan>
    implements $ToDoPlanCopyWith<$Res> {
  _$ToDoPlanCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedDate = freezed,
    Object? today = null,
    Object? list = freezed,
  }) {
    return _then(_value.copyWith(
      selectedDate: freezed == selectedDate
          ? _value.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      today: null == today
          ? _value.today
          : today // ignore: cast_nullable_to_non_nullable
              as DateTime,
      list: freezed == list
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as List<Todo>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ToDoPlanImplCopyWith<$Res>
    implements $ToDoPlanCopyWith<$Res> {
  factory _$$ToDoPlanImplCopyWith(
          _$ToDoPlanImpl value, $Res Function(_$ToDoPlanImpl) then) =
      __$$ToDoPlanImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime? selectedDate, DateTime today, List<Todo>? list});
}

/// @nodoc
class __$$ToDoPlanImplCopyWithImpl<$Res>
    extends _$ToDoPlanCopyWithImpl<$Res, _$ToDoPlanImpl>
    implements _$$ToDoPlanImplCopyWith<$Res> {
  __$$ToDoPlanImplCopyWithImpl(
      _$ToDoPlanImpl _value, $Res Function(_$ToDoPlanImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedDate = freezed,
    Object? today = null,
    Object? list = freezed,
  }) {
    return _then(_$ToDoPlanImpl(
      selectedDate: freezed == selectedDate
          ? _value.selectedDate
          : selectedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      today: null == today
          ? _value.today
          : today // ignore: cast_nullable_to_non_nullable
              as DateTime,
      list: freezed == list
          ? _value._list
          : list // ignore: cast_nullable_to_non_nullable
              as List<Todo>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ToDoPlanImpl implements _ToDoPlan {
  const _$ToDoPlanImpl(
      {required this.selectedDate, required this.today, final List<Todo>? list})
      : _list = list;

  factory _$ToDoPlanImpl.fromJson(Map<String, dynamic> json) =>
      _$$ToDoPlanImplFromJson(json);

  @override
  final DateTime? selectedDate;
  @override
  final DateTime today;
  final List<Todo>? _list;
  @override
  List<Todo>? get list {
    final value = _list;
    if (value == null) return null;
    if (_list is EqualUnmodifiableListView) return _list;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ToDoPlan(selectedDate: $selectedDate, today: $today, list: $list)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ToDoPlanImpl &&
            (identical(other.selectedDate, selectedDate) ||
                other.selectedDate == selectedDate) &&
            (identical(other.today, today) || other.today == today) &&
            const DeepCollectionEquality().equals(other._list, _list));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, selectedDate, today,
      const DeepCollectionEquality().hash(_list));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ToDoPlanImplCopyWith<_$ToDoPlanImpl> get copyWith =>
      __$$ToDoPlanImplCopyWithImpl<_$ToDoPlanImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ToDoPlanImplToJson(
      this,
    );
  }
}

abstract class _ToDoPlan implements ToDoPlan {
  const factory _ToDoPlan(
      {required final DateTime? selectedDate,
      required final DateTime today,
      final List<Todo>? list}) = _$ToDoPlanImpl;

  factory _ToDoPlan.fromJson(Map<String, dynamic> json) =
      _$ToDoPlanImpl.fromJson;

  @override
  DateTime? get selectedDate;
  @override
  DateTime get today;
  @override
  List<Todo>? get list;
  @override
  @JsonKey(ignore: true)
  _$$ToDoPlanImplCopyWith<_$ToDoPlanImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
