import 'dart:convert';

class TodoItemModel {
  String title;
  String done;
  TodoItemModel({
    this.title = '',
    this.done = '',
  });

  TodoItemModel copyWith({
    String? title,
    String? done,
  }) {
    return TodoItemModel(
      title: title ?? this.title,
      done: done ?? this.done,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'done': done,
    };
  }

  factory TodoItemModel.fromMap(Map<String, dynamic> map) {
    return TodoItemModel(
      title: map['title'] ?? '',
      done: map['done'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory TodoItemModel.fromJson(String source) =>
      TodoItemModel.fromMap(json.decode(source));

  @override
  String toString() => 'TodoItemModel(title: $title, done: $done)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TodoItemModel && other.title == title && other.done == done;
  }

  @override
  int get hashCode => title.hashCode ^ done.hashCode;
}
