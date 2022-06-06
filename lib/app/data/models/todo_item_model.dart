class TodoItemModel {
  String? title;
  String? done;

  TodoItemModel({this.title, this.done});

  TodoItemModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    done = json['done'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['title'] = title;
    data['done'] = done;
    return data;
  }
}
