import 'package:amanportfolio/screens/view_project_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'Controller/Initail_binding_controller.dart';
import 'screens/Home_Screen.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: 'https://lsvafppcyrukxjuddhhb.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImxzdmFmcHBjeXJ1a3hqdWRkaGhiIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzUwMjMyNzksImV4cCI6MjA1MDU5OTI3OX0.87NXrVZwGAZxq9otRxvBKNd02AjdoT_H8cs4zklEgJ0',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: InitialBindings(),
      home: HomeScreen(),
    );
  }
}