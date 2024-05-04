import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:studynight/src/utils/sizer_custom/sizer.dart';

class SubjectContentScreen extends StatefulWidget {
  const SubjectContentScreen({super.key});

  @override
  State<SubjectContentScreen> createState() => _SubjectContentScreenState();
}

class _SubjectContentScreenState extends State<SubjectContentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Mở bài"),
        leading: IconButton(icon: Icon(Icons.arrow_back_ios_new_outlined),onPressed: ()=>Navigator.pop(context),),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 25.h,
            child: FlutterLogo(size: 200,)
          ),
          Divider(
            color: Colors.black,
            thickness: 1,
            height: 1,
          ),
          Expanded(
            child: Container(
              color: Colors.grey,
              width: 100.w,
              child: Column(
                children: [
                  
                ],
              ),
            ),
          ),
          SizedBox(
            width: 50.w,
            child: TextButton(
              onPressed: (){},
              style: TextButton.styleFrom(
                side: BorderSide(color: Colors.red, width: 1),
              ),
              child: Text("Test question")
            ),
          )
        ],
      ),
    );
  }
}