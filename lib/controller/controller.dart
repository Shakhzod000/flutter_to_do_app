
import 'package:flutter_to_do_app/db_service/db_service.dart';
import 'package:flutter_to_do_app/db_service/hive_service.dart';
import 'package:flutter_to_do_app/model/task_model.dart';
import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';

class TaskController extends GetxController{
  final _hiveServices = HiveServices();
 
 var taskList = <TaskModel>[].obs; 

 @override
 void onReady(){
  getTask();
  super.onReady(); 
 }

 Future<int> addTask({TaskModel? task})async{
  return await DbHelper.insert(task);
 }

void getTask()async{
  List<Map<String, dynamic>> tasks = await DbHelper.query();
  taskList.assignAll(tasks.map((e) => TaskModel.fromJson(e)).toList());
}



}