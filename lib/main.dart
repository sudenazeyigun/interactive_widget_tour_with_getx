import 'dart:developer';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:interactive_widget_tour/view/mail_page_view.dart';
import 'package:showcaseview/showcaseview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(932, 430),
      child: MaterialApp(
        title: 'Flutter ShowCase',
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text('Flutter ShowCase'),
            centerTitle: true,
            backgroundColor: Color(0xffEE5366),
          ),
          body: ShowCaseWidget(
            blurValue: 1,
            builder: (context) => MailPage(),
          ),
        ),
      ),
    );
  }
}
