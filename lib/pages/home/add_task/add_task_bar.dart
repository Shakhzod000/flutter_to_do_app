import 'package:flutter/material.dart';
import 'package:flutter_to_do_app/controller/controller.dart';
import 'package:flutter_to_do_app/model/task_model.dart';
import 'package:flutter_to_do_app/pages/home/add_task/custom_textfield/custom_textfield.dart';
import 'package:flutter_to_do_app/pages/home/mybutton/mybutton.dart';
import 'package:flutter_to_do_app/utils/theme.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final TaskController _taskController = Get.put(TaskController());
  final TextEditingController? titleController = TextEditingController();
  final TextEditingController? noneController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  String _endTime = "9:30";
  String? _startTime = DateFormat('hh:mm a').format(DateTime.now()).toString();
  int? _selectdRemind = 5;
  List<int> remindList = [
    5,10,15,20,25
  ]; 
  String? _selectedRepeat = "None";
  List<String> repeatList = [
    "None",
    "Daily",
    "Weekly",
    "Monthly",
  ]; 
  
  int _selectedColor = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: _appBar(context),
      body: Container(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Add Task',
                style: subTexStyleTheme,
              ),
              MyInputTextfield(hint: "Enter your title", title: "Title",controller: titleController,),
              MyInputTextfield(hint: "Enter your note", title: "Note",controller: noneController,),
              MyInputTextfield(
                hint: DateFormat.yMd().format(_selectedDate),
                title: "Date",
                widget: IconButton(
                    color: Colors.grey,
                    onPressed: () {
                      _getDateFormatUser();
                    },
                    icon: const Icon(Icons.calendar_month_rounded)),
              ),
              Row(
                children: [
                  Expanded(
                    child: MyInputTextfield(
                      hint: _startTime,
                      title: "Start Date",
                      widget: IconButton(
                        onPressed: () {
                          _getTimeFromUser(isStarted: true);
                        },
                        icon: const Icon(
                          Icons.access_time_rounded,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: MyInputTextfield(
                      hint: _endTime,
                      title: "End Date",
                      widget: IconButton(
                        onPressed: () {
                          _getTimeFromUser(isStarted: false);
                        },
                        icon: const Icon(
                          Icons.access_time_rounded,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              MyInputTextfield(hint: "$_selectdRemind minutes early ", title: "Remind",
              widget: DropdownButton<String>(
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.grey,
                ),
                iconSize: 32,
                elevation: 4,
                style: subTexStyleTheme,
                underline: Container(height: 0),
                onChanged: (String? newValue){
                  setState(() {
                    _selectdRemind = int.parse(newValue!);
                  });
                },
                items: remindList.map<DropdownMenuItem<String>>((int value) {
                  return DropdownMenuItem<String>(
                    value: value.toString(),
                    child: Text(value.toString(),
                    style: const TextStyle(
                      fontSize: 15,
                    color: Colors.grey
                    ),
                    )
                    
                    );
                } ).toList(),
              ),
              ),
              MyInputTextfield(hint: "$_selectedRepeat", title: "Repeat",
              widget: DropdownButton(
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.grey,
                ),
                iconSize: 32,
                elevation: 4,
                style: subTexStyleTheme,
                underline: Container(height: 0),
                onChanged: (String? newValue){
                  setState(() {
                    _selectedRepeat = newValue!;
                  });
                },
                items: repeatList.map<DropdownMenuItem<String>>((String? value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value!, 
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 16
                    ),
                    )
                    
                    );
                } ).toList(),
              ),
              ),
              const SizedBox(height: 18,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Color",
                      style: titleStyle,
                      ),
                      const SizedBox(height: 15,),
                      Wrap(
                        children: List<Widget>.generate(
                          3,
                          (int index) {
                            return  GestureDetector(
                              onTap: (){
                                _selectedColor = index;
                                setState(() {
                                  
                                });
                              },
                              child: Padding(
                                padding: const  EdgeInsets.only(right: 8.0),
                                child: CircleAvatar(
                                  radius: 14,
                                  backgroundColor: index==0?primarClr:index==1?pinkClr:yellowClr,
                                  child: _selectedColor==index?const Icon(
                                    Icons.done,
                                    color: Colors.white,
                                    size: 17,
                                  ):Container(),
                                ),
                              ),
                            );
                          }),
                      ),
                    ],
                  ),
                  MyButton(label: "Create Task", ontap: () => _validatedate())
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

 _validatedate(){
   if(titleController!.text.isNotEmpty && noneController!.text.isNotEmpty) {
   _addTaskToDb();
   Get.back();
   }else if(titleController!.text.isEmpty || noneController!.text.isEmpty){
    Get.snackbar("Required", "All field are requared",
    colorText: Colors.red,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.white,
    icon:const  Icon(Icons.warning_amber_rounded)
    );

   }
 }

_addTaskToDb()async{
 var value =await _taskController.addTask(
   task:TaskModel(
    note: noneController!.text,
    title: titleController!.text,
    date: DateFormat.yMd().format(_selectedDate),
    starTime: _startTime,
    endTime: _endTime,
    remind: _selectdRemind,
    repeat: _selectedRepeat,
    color: _selectedColor,
    isCompleted: 0,
  )
 );
 print('My id is $value');
}
  _getDateFormatUser() async {
    DateTime? _pickerDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015),
        lastDate: DateTime(2222));
    if (_pickerDate != null) {
      setState(() {
        _selectedDate = _pickerDate;
        print(_selectedDate);
      });
    } else {
      print('Null data');
    }
  }

  _getTimeFromUser({required bool? isStarted}) async {
    var pickerTime = await _showTimePicker();
    String? _formatedTime = pickerTime.format(context);
    if (pickerTime == null) {
      print('Time canceled');
    } else if (isStarted == true) {
      setState(() {
        _startTime = _formatedTime;
      });
    } else if (isStarted == false) {
      setState(() {
        _endTime = _formatedTime!;
      });
    }
  }

  _showTimePicker() {
    return showTimePicker(
        initialEntryMode: TimePickerEntryMode.input,
        context: context,
        initialTime: TimeOfDay(
            hour: int.parse(_startTime!.split(":")[0]),
            minute: int.parse(_startTime!.split(":")[1].split("")[0])));
  }

  _appBar(BuildContext context) {
    return AppBar(
      elevation: .0,
      backgroundColor: context.theme.backgroundColor,
      leading: GestureDetector(
        onTap: () {
          Get.back();
        },
        child: Icon(
          Icons.arrow_back_ios,
          size: 20,
          color: Get.isDarkMode ? Colors.white : Colors.black,
        ),
      ),
      actions: const [
        CircleAvatar(
          backgroundImage: AssetImage('assets/userImage.webp'),
        )
      ],
    );
  }
}
