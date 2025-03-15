class OpinionsModel {
  String? name;
  String? opinion;

  OpinionsModel({this.name, this.opinion});

  OpinionsModel.fromJson(Map<String, dynamic> json) {
    name = json['user_name'];
    opinion = json['user_feedback'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_name'] = name;
    data['user_feedback'] = opinion;
    return data;
  }

  @override
  String toString() {
    return 'InterpreterModel{name: $name, opinion: $opinion}';
  }
}
