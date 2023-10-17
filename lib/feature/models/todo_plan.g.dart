// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_plan.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ToDoPlanImpl _$$ToDoPlanImplFromJson(Map<String, dynamic> json) =>
    _$ToDoPlanImpl(
      dateSelected: DateTime.parse(json['dateSelected'] as String),
      today: DateTime.parse(json['today'] as String),
      list: (json['list'] as List<dynamic>?)
          ?.map((e) => Todo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ToDoPlanImplToJson(_$ToDoPlanImpl instance) =>
    <String, dynamic>{
      'dateSelected': instance.dateSelected.toIso8601String(),
      'today': instance.today.toIso8601String(),
      'list': instance.list,
    };
