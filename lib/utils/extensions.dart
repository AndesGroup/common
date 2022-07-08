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
