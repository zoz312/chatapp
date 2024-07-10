import 'package:chatapp/model/massagemodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class chatbubble extends StatelessWidget {
   chatbubble({
    super.key,required this.massage
  });
  final model massage;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
              bottomRight: Radius.circular(32)),
          color: kPrimaryColor,
        ),
        child: Text(
          massage.message!,
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
      ),
    );
  }
}


class chatbubble2 extends StatelessWidget {
   chatbubble2({
    super.key,required this.massage
  });
  final model massage;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
              bottomLeft: Radius.circular(32)),
          color: Color(0xff006D84),
        ),
        child: Text(
          massage.message!,
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
      ),
    );
  }
}
