import 'package:flutter/material.dart';
import 'package:flutter_to_do_app/db_service/db_service.dart';
import 'package:flutter_to_do_app/db_service/hive_service.dart';
import 'package:flutter_to_do_app/model/task_model.dart';
import 'package:flutter_to_do_app/pages/home/home_page.dart';
import 'package:flutter_to_do_app/services/theme_service/thme_service.dart';
import 'package:flutter_to_do_app/utils/theme.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive/hive.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await  DbHelper.initDb();
  // final hive = HiveServices();
  // Hive.registerAdapter(TaskModelAdapter());
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return 
       GetMaterialApp(
        title: 'To do App',
        debugShowCheckedModeBanner: false,
        theme: Themes.lightTheme,
        darkTheme: Themes.darkTheme,
        themeMode: ThemeService().theme,

        home: const HomePage(),
       );
  }
}
