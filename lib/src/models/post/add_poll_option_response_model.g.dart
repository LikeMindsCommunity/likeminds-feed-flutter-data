// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_poll_option_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddPollOptionResponseEntity _$AddPollOptionResponseEntityFromJson(
        Map<String, dynamic> json) =>
    AddPollOptionResponseEntity(
      widget: json['widget'] == null
          ? null
          : WidgetModelEntity.fromJson(json['widget'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddPollOptionResponseEntityToJson(
        AddPollOptionResponseEntity instance) =>
    <String, dynamic>{
      'widget': instance.widget,
    };
