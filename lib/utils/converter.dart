import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class TimeOfDayConverter implements JsonConverter<TimeOfDay?, String?> {
  const TimeOfDayConverter();

  @override
  TimeOfDay? fromJson(String? json) {
    if (json == null || !json.contains(':')) {
      return null;
    }
    final vars = json.split(':');
    int? hour = int.tryParse(vars[0]);
    int? minute = int.tryParse(vars[1]);
    if (hour == null || minute == null) {
      return null;
    }
    return TimeOfDay(hour: hour, minute: minute);
  }

  @override
  String? toJson(TimeOfDay? json) =>
      json == null ? null : '${json.hour}:${json.minute}';
}

class TimeOfDayConverterNotNull implements JsonConverter<TimeOfDay, String> {
  const TimeOfDayConverterNotNull();

  @override
  TimeOfDay fromJson(String json) {
    if (!json.contains(':')) {
      return const TimeOfDay(hour: 0, minute: 0);
    }
    final vars = json.split(':');
    int? hour = int.tryParse(vars[0]);
    int? minute = int.tryParse(vars[1]);
    if (hour == null || minute == null) {
      return const TimeOfDay(hour: 0, minute: 0);
    }
    return TimeOfDay(hour: hour, minute: minute);
  }

  @override
  String toJson(TimeOfDay json) => '${json.hour}:${json.minute}';
}
