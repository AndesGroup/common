import 'package:andesgroup_common/common.dart';
import 'package:flutter/material.dart';

extension OnTimeOfDay on TimeOfDay {
  Duration get duration {
    return Duration(hours: hour, minutes: minute);
  }
}

extension OnDuration on Duration {
  /// convert [Duration] to [TimeOfDay], only hour and minute will be keep.
  TimeOfDay get timeOfDay {
    return TimeOfDay(hour: inHours % 24, minute: inMinutes % 60);
  }
}

extension OnDateTime on DateTime {
  String get formatDDMMYYYY {
    return DateFormat('dd/MM/yyyy').format(this);
  }
}
