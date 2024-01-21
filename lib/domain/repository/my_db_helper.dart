import 'package:lesson9_bootcamp6/student_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class MyDatabaseHelper {
  static int version = 1;
  static String dbName = 'Example.db';

  Future<Database> _getDb() async {
    return await openDatabase(join(await getDatabasesPath(), dbName),
        version: version,
        singleInstance: true,
        onCreate: (db, version) async => db.execute(
            'CREATE TABLE Student (id INTEGER NOT NULL, name TEXT NOT NULL, age INTEGER NOT NULL, course INTEGER NOT NULL, PRIMARY KEY(id AUTOINCREMENT))'));
  }

  Future<void> addStudent(Student student) async {
    final db = await _getDb();
    db.insert('Student', student.toJson());
  }

  Future<Student?> getStudent(int id) async {
    final db = await _getDb();
    final List<Map> map =
        await db.query('Student', where: 'id = ?', whereArgs: [id]);
    if (map.isNotEmpty) {
      return Student.fromJson(map.first);
    }
    return null;
  }

  void updateStudent(Student student) async {
    final db = await _getDb();
    db.update('Student', student.toJson(),
        where: 'id =?', whereArgs: [student.id]);
  }

  Future<List<Student>> getAllStudent() async {
    final db = await _getDb();
    final map = await db.query('Student');
    return List.generate(map.length, (index) => Student.fromJson(map[index]));
  }
}
