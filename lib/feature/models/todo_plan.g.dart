// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_plan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ToDoPlanImpl _$$ToDoPlanImplFromJson(Map<String, dynamic> json) =>
    _$ToDoPlanImpl(
      selectedDate: json['selectedDate'] == null
          ? null
          : DateTime.parse(json['selectedDate'] as String),
      list: (json['list'] as List<dynamic>?)
              ?.map((e) => Todo.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ToDoPlanImplToJson(_$ToDoPlanImpl instance) =>
    <String, dynamic>{
      'selectedDate': instance.selectedDate?.toIso8601String(),
      'list': instance.list,
    };
