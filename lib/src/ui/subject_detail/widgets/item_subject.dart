import 'package:flutter/material.dart';

class ItemSubject extends StatelessWidget {
  ItemSubject({super.key,this.func});
  VoidCallback? func;

  @override
  Widget build(BuildContext context) {
    return  ExpansionTile(
      textColor: Colors.indigo,
      backgroundColor: Colors.amber,
      collapsedBackgroundColor: Colors.indigo,
      collapsedTextColor: Colors.white,
      collapsedIconColor: Colors.white,
      collapsedShape: Border.all(color: Colors.black, width: 1),
      expansionAnimationStyle: AnimationStyle(
        curve: Easing.emphasizedAccelerate,
        duration: Durations.extralong1,
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("01. Mo bai"),
          Text("12.01 min")
        ],
      ),
      children: [
        ListView.builder(
          shrinkWrap: true,
          primary: false,
          itemCount: 3,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: func,
              child: Container(
                padding: EdgeInsets.all(10),
                color: Colors.white,
                child:  ListTile(
                  leading: Text("1.1"),
                  title: Text("Mo dau chuong"),
                  subtitle: Text("12.44 min"),
                  trailing: Icon(Icons.play_circle_filled_sharp),
                ),
              ),
            );
          },
        ),
    
      ],
    );
  }
}