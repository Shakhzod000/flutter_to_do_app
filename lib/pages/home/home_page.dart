
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_to_do_app/controller/controller.dart';
import 'package:flutter_to_do_app/db_service/hive_service.dart';
import 'package:flutter_to_do_app/model/task_model.dart';
import 'package:flutter_to_do_app/pages/home/add_task/add_task_bar.dart';
import 'package:flutter_to_do_app/pages/home/mybutton/mybutton.dart';
import 'package:flutter_to_do_app/services/theme_service/thme_service.dart';
import 'package:flutter_to_do_app/utils/theme.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _hiveService = HiveServices();
 final  _taskController = Get.put(TaskController());
  DateTime _selecteddate = DateTime.now();
// var notifierHelper;

// @override
//   void initState(){
//     super.initState();
//     notifierHelper = NotifierHelper();
//     notifierHelper.initializeNotification();
//     notifierHelper.requestAndroidPermission();
//   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        backgroundColor: context.theme.backgroundColor,
        elevation: .0,
        leading: IconButton(
          onPressed: (){
            ThemeService().switchTheme();
          },
           icon: Icon(
            Get.isDarkMode? Icons.sunny:Icons.nightlight_round,
            size: 20,
            color: Get.isDarkMode? Colors.white: Colors.black,
           )),
      actions: const [
        CircleAvatar(
          backgroundImage:AssetImage(
            'assets/userImage.webp'
            )
        )
      ],
      ),
      body: Column(
        children:[
         _addTaskBar(),
        _addDateBar(),
        _showTasks(),
        ],
      ),
    );
  }
  

  _showTasks(){
    return Expanded(
    child: Obx((){
      return ListView.builder(
        itemCount: _taskController.taskList.length,
        itemBuilder: (_,context){
          return Container(
            height: 100,
            width: 100,
            color: Colors.green,
          );
        });
        }
    ),
    );
  }


 _addDateBar(){
  return Container(
           margin: const EdgeInsets.only(left: 20,top: 20),
          child: DatePicker(
            DateTime.now(),
            height: 100,
            width: 80,
            initialSelectedDate: DateTime.now(),
            selectionColor: primarClr,
            dateTextStyle: GoogleFonts.lato(
              textStyle:TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Get.isDarkMode? Colors.white: Colors.black
              )
            ),
            monthTextStyle: GoogleFonts.lato(
              textStyle:  TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Get.isDarkMode? Colors.grey[400]:Colors.grey[600]
              ),
            ),
            dayTextStyle: GoogleFonts.lato(
              textStyle: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Get.isDarkMode? Colors.grey[400]:Colors.grey[600]
              )
            ),
            onDateChange: (date){
              _selecteddate = date;
            },
          ),
         );
}

_addTaskBar(){
  return   Container(
            margin: const EdgeInsets.only( right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(DateFormat.yMMMMd().format(DateTime.now()),
                      style: texStyleTheme,),
                      Text('Today',
                      style: subTexStyleTheme,
                      ),
                    ],
                  ),
                ),
                MyButton(
                  label: "+ Add Task",
                   ontap: ()async{
                    await Get.to(const  AddTask());
                      _taskController.getTask();
                     })
              ],
            ),
          );
}
}