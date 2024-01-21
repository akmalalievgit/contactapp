class ContactData {
  String id;
  String name;
  String phone;

  ContactData({
    required this.name,
    required this.id,
    required this.phone,
  });

  String toCustomString() => '$name,$phone';

  // Custom deserialization
  static ContactData fromCustomString(String str) {
    var parts = str.split(',');
    return ContactData(id:"",name: parts[0], phone: parts[1]);
  }
  factory ContactData.fromJson(Map<String, dynamic> json, String id) {
    return ContactData(
      id: json['id'] as String,
      name: json['name'] as String,
      phone: json['phone'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
    };
  }
}
