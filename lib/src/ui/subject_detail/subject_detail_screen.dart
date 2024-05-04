import 'package:flutter/material.dart';
import 'package:studynight/src/utils/sizer_custom/sizer.dart';

import '../subject_content/subject_content_screen.dart';
import 'widgets/item_subject.dart';

class SubjectDetailScreen extends StatefulWidget {
  const SubjectDetailScreen({super.key});

  @override
  State<SubjectDetailScreen> createState() => _SubjectDetailScreenState();
}

class _SubjectDetailScreenState extends State<SubjectDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Môn Toán 12"),
        leading: IconButton(icon: Icon(Icons.arrow_back_ios_new_outlined),onPressed: ()=>Navigator.pop(context),),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 25.h,
            child: FlutterLogo(size: 200,)
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Section"),
                  Expanded(
                    child: ListView.separated(
                      itemCount: 5,
                      itemBuilder: (context, index) => ItemSubject(
                        func: ()=>Navigator.push(context, MaterialPageRoute(builder: (context) =>SubjectContentScreen()),),
                      ),
                      separatorBuilder: (context, index){
                        return Divider(
                          color: Colors.white,
                          thickness: 5,
                          height: 5,
                        );
                      },
                    ),
                  ),
                 ],
              ),
            ),
          ),
        
          SizedBox(
            width: 100.w,
            height: 10.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: (){},
                  style: IconButton.styleFrom(
                      side: BorderSide(color: Colors.red, width: 1),
                    ),
                  icon: Icon(Icons.favorite_border)
                ),
                SizedBox(
                  width: 50.w,
                  child: TextButton(
                    onPressed: (){},
                    style: TextButton.styleFrom(
                      side: BorderSide(color: Colors.red, width: 1),
                    ),
                    child: Text("Play")),
                ),
              
              ],
            ),
          ),
        ],
      ),
    );
  }
}