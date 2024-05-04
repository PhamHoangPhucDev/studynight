import 'package:flutter/material.dart';

import '../widgets/avatar_edit.dart';

class UserInforScreen extends StatefulWidget {
  const UserInforScreen({super.key});

  @override
  State<UserInforScreen> createState() => _UserInforScreenState();
}

class _UserInforScreenState extends State<UserInforScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(child: AvatarEdit()),
          Text("Basic Information"),
          TextFormField(
            decoration: InputDecoration(
    icon: Icon(Icons.email_outlined),
    label: Text(
      "label",
      style: TextStyle(color: Colors.green, fontSize: 18),
    ),
    // labelText: "Email",
    // labelStyle: TextStyle(color: Colors.green,fontSize: 18),
    floatingLabelStyle: TextStyle(color: Colors.red), // ?
    // isCollapsed: true,
    // hintText: "Hint Text",
    // errorText: "Error Text",
    // 에러 발생시 helperText 를 대처한다.
    // isDense: true
    contentPadding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
    // prefixIcon: Icon(Icons.alternate_email_outlined),
    // prefixText: "prefixText",
    // suffixIcon: Icon(Icons.check),
    // suffixText: "suffixText",
    // counter: Icon(Icons.build),
    // counterText: "counterText",
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      gapPadding: 10, // label 양쪽의 padding 값
    ),
  ),
  textCapitalization: TextCapitalization.characters, // 대문자
  // readOnly: true, // 타이핑 불가
  obscureText: false, // 비밀번호 같은 중요한 텍스트를 가린다.
  obscuringCharacter: '*', 
          )
        ],
      ),
    );
  }
}