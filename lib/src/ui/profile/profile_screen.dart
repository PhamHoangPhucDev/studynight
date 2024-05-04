import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:studynight/src/utils/sizer_custom/sizer.dart';

import 'pages/user_infor_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 15.h,
            child: Center(
              child: ListTile(
                leading: CircleAvatar(),
                title: Text("Nguyễn Văn A"),
                subtitle: Text("admin@gmail.com"),
                trailing: IconButton(onPressed: (){},icon: Icon(Icons.logout_outlined),),
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ListTile(
                  leading: Icon(
                    CupertinoIcons.bell,
                  ),
                  title: Text(
                    'Notifications',
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                  ),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => UserInforScreen()),);
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}