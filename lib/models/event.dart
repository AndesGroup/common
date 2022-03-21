import 'package:freezed_annotation/freezed_annotation.dart';

part 'event.freezed.dart';


/// dùng để wrap các event muốn sử dụng trong state, các event này sẽ bắt buộc phải khởi tạo qua hàm
/// Event.from(data), trong hàm này sẽ tự động tạo ra 1 trường thời gian = thời gian lúc gọi hàm.
///
/// nên sẽ đảm bảo được event cũ sẽ luôn khác event mới. khi dùng chỉ cần select tới đúng biến event
/// là được.
///
/// nếu chỉ dùng Enum làm event bình thường thì sẽ có 1 hạn chế đó là. nếu muốn gán event 2 lần liên
/// tiếp giống nhau thì khi select nó sẽ chỉ hiểu 1 event đầu, và event thứ 2 sẽ không được gọi.
///
/// Hoặc có trường hợp như sau: ban đầu mình đã gán event rồi. nhưng sau đó mình gán các trường khác
/// event thì nếu không select trường event thì sẽ bị bị xử lý nhầm event cũ.
@freezed
class Event<T> with _$Event<T> {
  const factory Event._({
    required T data,
    required int time,
  }) = _Event<T>;

  /// Cách duy nhất để tạo 1 event mới, nó sẽ tự động gán event [data] với thời gian lúc gọi hàm,
  /// đảm bảo event này luôn khác event cũ kể cả trường hợp [data] là giống nhau
  // ignore: always_specify_types
  factory Event.from(T data) => Event._(data: data, time: DateTime.now().millisecondsSinceEpoch);
}
