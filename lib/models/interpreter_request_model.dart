class InterpreterRequestModel {
  final String id;
  final String name;
  final String phone;
  final String email;
  final String city;
  final String age;
  final String gender;
  final String createdAt;

  InterpreterRequestModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.city,
    required this.age,
    required this.gender,
    required this.createdAt,
  });

  factory InterpreterRequestModel.fromJson(Map<String, dynamic> json) {
    return InterpreterRequestModel(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
      email: json['email'],
      city: json['city'],
      age: json['age'],
      gender: json['gender'],
      createdAt: json['created_at'],
    );
  }
}
