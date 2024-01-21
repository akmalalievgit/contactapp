class Student{
  int? id;
  String name;
  int course;
  int age;

  Student(this.id, this.name, this.course, this.age);

  Map<String,dynamic> toJson() => {
    'id':id,
    'name':name,
    'course': course,
    'age':age
  };

  factory Student.fromJson(Map<dynamic,dynamic> json) {
    return Student(json['id'], json['name'], json['course'], json['age']);
  }
}