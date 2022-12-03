

import 'package:flutter/foundation.dart';
import 'package:flutter_to_do_app/model/task_model.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

abstract class HiveRepository{
Box? get box;

Future<void> saveDataHive<T> ({required TaskModel? tasks, required T? data});
Future<T?> loadDataHive<T>({required TaskModel? tasks});
Future<void> updateDataHive<T>({required TaskModel? tasks});
Future<void> deleteDataHive<T>({required TaskModel? tasks});
}

class HiveServices extends HiveRepository{
Box? _box;

Box? get box => _box;

HiveServices._init(){
  init();
}

init()async{
  try{
    final directoryDB = await getApplicationDocumentsDirectory();
    Hive.init(directoryDB.path);
    _box = await Hive.openBox('data_db');
    if(kDebugMode){
      print('HIVE INITED.....');
    }
  }catch(e){
    if(kDebugMode){
      print(e);
    }
  }
}

static final _instance = HiveServices._init();
factory HiveServices() => _instance;


@override
 Future<void> deleteDataHive<T>({required TaskModel? tasks}) async{
  try{
    return _box!.delete(tasks!);
  }catch(e){
    if(kDebugMode){
      print(e);
    }
  }
 }

 @override
 Future<T?> loadDataHive<T>({required TaskModel? tasks})async{
  try{
   return Future.value(_box!.get(tasks!));
  }catch(e){
    if(kDebugMode){
      print(e);
    }
  }
  return null;
 }


@override
Future<void> saveDataHive<T>({required TaskModel? tasks, required T? data})async{
  try{
    await _box!.put(tasks, data);
  }catch(e){
    if(kDebugMode){
      print(e);
    }
  }
}

  @override
  Future<void> updateDataHive<T>({required TaskModel? tasks}) {
    // TODO: implement updateDataHive
    throw UnimplementedError();
  }


}