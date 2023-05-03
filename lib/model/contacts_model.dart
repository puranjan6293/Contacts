// class Contact {
//   final String id;
//   final String name;
//   final String phone;

//   Contact({required this.id, required this.name, required this.phone});

//   factory Contact.fromJson(Map<String, dynamic> json) {
//     return Contact(
//       id: json['id'],
//       name: json['name'],
//       phone: json['phone'],
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'name': name,
//       'phone': phone,
//     };
//   }
// }

class Contact {
  final String id;
  final String name;
  final String phone;
  final String userId;

  Contact({
    required this.id,
    required this.name,
    required this.phone,
    required this.userId,
  });

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      id: json['id'],
      name: json['name'],
      phone: json['phone'],
      userId: json['userId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'userId': userId,
    };
  }
}
