import 'package:flutter/material.dart';
import 'package:studynight/src/utils/sizer_custom/sizer.dart';

import '../../blocs/app_bloc.dart';
import '../../blocs/theme/theme_event.dart';
import '../../themes/app_colors.dart';
import '../../themes/font_family.dart';
import '../../themes/theme_service.dart';
import '../subject_detail/subject_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  // final List<String> _results = [];

  // void _handleSearch(String input) {
  //   _results.clear();
  //   for (var str in myCoolStrings) {
  //     if (str.toLowerCase().contains(input.toLowerCase())) {
  //       setState(() {
  //         _results.add(str);
  //       });
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (FocusScope.of(context).hasFocus) {
          FocusScope.of(context).unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
           systemOverlayStyle: ThemeService.systemBrightness,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              // AppBloc.themeBloc.add(
              //   OnChangeTheme(
              //     themeMode: ThemeService.currentTheme == ThemeMode.dark
              //         ? ThemeMode.light
              //         : ThemeMode.dark,
              //   ),
              // );
            },
            icon: Icon(
              ThemeService.currentTheme == ThemeMode.dark
                  ? Icons.wb_sunny_outlined
                  : Icons.brightness_3,
              size: 22.sp,
              color: Colors.blue,
            ),
          ),
          title: RichText(
              text: TextSpan(
            children: [
              TextSpan(
                text: 'Study',
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w700,
                  fontFamily: FontFamily.dancing,
                  color: colorPrimary,
                ),
              ),
              TextSpan(
                text: 'night',
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w600,
                  fontFamily: FontFamily.dancing,
                  color: Theme.of(context).textTheme.bodyLarge!.color,
                ),
              ),
            ],
          )),
          actions: [
            CircleAvatar(),
            SizedBox(width: 5.w,)
          ],
        ),
        body: Container(
          height: 100.h,
          width: 100.w,
          color: Theme.of(context).scaffoldBackgroundColor,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 2.5.sp),
                  Divider(
                    height: .25,
                    thickness: .25,
                  ),
                  Text(
                    'Hey Join'
                  ),
                  Text(
                    'subtitle Join'
                  ),
                  SizedBox(
                    height: 7.h,
                    width: 100.w,
                    child: TextField(
                      onChanged: (v){},
                      style: TextStyle(
                        color: const Color(0xff020202),
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.5,
                      ),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xfff1f1f1),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none,
                        ),
                        hintText: "Search for Items",
                        hintStyle: TextStyle(
                            color: const Color(0xffb2b2b2),
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.5,
                            decorationThickness: 6),
                        prefixIcon: const Icon(Icons.search),
                        prefixIconColor: Colors.black,
                      ),
                    ),
                  ),
                
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Category'),
                      InkWell(
                        onTap: (){},
                        child: Text('See all'),
                      )
                    ],
                  ),
                
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        InkWell(
                          onTap: (){},
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 5),
                            decoration: BoxDecoration(
                              color: colorActive,
                              borderRadius: BorderRadius.all(
                                Radius.circular(15)
                              )
                            ),
                            child: Text('Lớp 1'),
                          ),
                        ),
                        
                      ],
                    ),
                  ),
            
                  Expanded(
                    child: GridView.builder(
                      shrinkWrap: false,
                      itemCount: 3,
                      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: MediaQuery.of(context).size.width /
                            (MediaQuery.of(context).size.height / 3),
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => SubjectDetailScreen()),);
                          },
                          child: Card(
                            child: Container(
                              height: 30.h,
                              width: 40.w,
                              child: Center(
                                child: Text(
                                  '$index',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}