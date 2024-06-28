import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:interactive_widget_tour/controller/mail_page_controller.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../model/model_mail.dart';

class MailPage extends StatefulWidget {
  final MailPageController mailPageController = Get.put(MailPageController());

  MailPage({Key? key}) : super(key: key);

  @override
  State<MailPage> createState() => _MailPageState();
}

class _MailPageState extends State<MailPage> {
  final scrollController = ScrollController();

  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      ShowCaseWidget.of(context).startShowCase(
          [widget.mailPageController.one, widget.mailPageController.two]);
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(left: 15.w, right: 10.w),
                        child: Container(
                          padding: EdgeInsets.all(8.h),
                          decoration: BoxDecoration(
                            color: Color(0xffF9F9F9),
                            border: Border.all(
                              color: Color(0xffF3F3F3),
                              width: 2.w,
                            ),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Showcase(
                                      titleTextStyle: TextStyle(
                                          fontSize: 30.sp,
                                          fontWeight: FontWeight.w900),
                                      key: widget.mailPageController.one,
                                      title: 'This is a menu button',
                                      description: 'Tap to see menu options',
                                      descTextStyle: TextStyle(
                                          fontSize: 25.sp,
                                          fontWeight: FontWeight.w500),
                                      scrollLoadingWidget: Icon(
                                        Icons.abc,
                                        size: 60.sp,
                                      ),
                                      onBarrierClick: () =>
                                          debugPrint('Barrier clicked'),
                                      child: GestureDetector(
                                        onTap: () =>
                                            debugPrint('menu button clicked'),
                                        child: Icon(Icons.menu,
                                            size: 45.sp,
                                            color: Color(0xffEE5366)),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Text(
                                      'Search email',
                                      style: TextStyle(
                                        color: Colors.black45,
                                        fontSize: 35.sp,
                                      ),
                                    ),
                                    Spacer(),
                                    Icon(
                                      Icons.search,
                                      size: 45.sp,
                                      color: Color(0xffADADAD),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Showcase(
                      targetPadding: const EdgeInsets.all(5),
                      key: widget.mailPageController.two,
                      title: 'Profile',
                      description:
                          "Tap to see profile which contains user's name, profile picture, mobile number and country",
                      tooltipBackgroundColor: Colors.blue,
                      textColor: Colors.white,
                      targetShapeBorder: CircleBorder(),
                      child: Container(
                        padding: EdgeInsets.all(5.r),
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.asset(
                          'assets/icon.png',
                          color: Colors.black38,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 12.w,
                    )
                  ],
                ),
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 5.h)),
            Expanded(
              child: ListView.builder(
                controller: scrollController,
                physics: BouncingScrollPhysics(),
                itemCount: widget.mailPageController.mails.length,
                itemBuilder: (context, index) {
                  final mail = widget.mailPageController.mails[index];
                  return widget.mailPageController.showcaseMailTile(
                    GlobalKey(),
                    true,
                    context,
                    mail,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
