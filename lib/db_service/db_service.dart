

import 'package:flutter_to_do_app/model/task_model.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper{
  static  Database? _db;
  static final int? _version = 1;
  static final String? _tableName = "task";

static Future<void> initDb()async{
  if(_db !=null){
    return;
  }
  try{
     String? _path = await getDatabasesPath() +"task.db";
     _db= await openDatabase(
      _path,
      version: _version,
      onCreate: (db, version) {
        print('creating a new one');
        return db.execute(
           _tableName!,
        );
        
      },
     );

  }catch(e){
    print(e.toString());
  }
}

static Future<int> insert(TaskModel? task)async{
  print('insert function called');
  return await _db?.insert(_tableName!, task!.toJson())?? 1;
}

static Future<List<Map<String, dynamic>>> query({Database? db}) async{
  print('query function called');
  return await db!.query(_tableName!);
}


}