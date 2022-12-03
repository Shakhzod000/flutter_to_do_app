
import 'package:hive/hive.dart';
part 'task_model.g.dart';

@HiveType(typeId: 0)
class TaskModel extends HiveObject{
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? note;
  @HiveField(2)
  String? title;
  @HiveField(3)
  String? date;
  @HiveField(4)
  int? isCompleted;
  @HiveField(5)
  String? starTime;
  @HiveField(6)
  String? endTime;
  @HiveField(7)
  int? color;
  @HiveField(8)
  int? remind;
  @HiveField(9)
  String? repeat;

  TaskModel({
    this.color,
    this.date,
    this.endTime,
    this.id,
    this.isCompleted,
    this.note,
    this.remind,
    this.repeat,
    this.starTime,
    this.title
  });

  TaskModel.fromJson(Map<String,dynamic>json){
    id=json['id'];
    title = json['title'];
    color = json ['color'];
    endTime = json['endTime'];
    starTime = json['starTime'];
    note = json['note'];
    date = json['date'];
    remind = json['remind'];
    repeat = json['repeat'];
    isCompleted = json['isComleted'];
  }
  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['note'] = this.note;
    data['isCompleted'] = this.isCompleted;
    data['color'] = this.color;
    data['starTime'] = this.starTime;
    data['endTime'] = this.endTime;
    data['remind'] = this.remind;
    data['repeat'] = this.repeat;
    data['date'] = this.date;
    return data;
  }
}