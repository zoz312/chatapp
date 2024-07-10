import 'package:chatapp/constants.dart';
import 'package:chatapp/model/massagemodel.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../widget/Chat_bubble.dart';

class chatPage extends StatelessWidget {
  chatPage({super.key});
  CollectionReference massages =
      FirebaseFirestore.instance.collection(kMessagesCollections);
  TextEditingController controller = TextEditingController();
  final _cont = ScrollController();
  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
      stream: massages.orderBy(kCreatedAt, descending: true).snapshots(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          List<model> modelmassage = [];
          for (var i = 0; i < snapshot.data!.docs.length; i++) {
            modelmassage.add(model.fromjson(snapshot.data!.docs[i]));
          }

          return Scaffold(
            appBar: AppBar(
              backgroundColor: kPrimaryColor,
              automaticallyImplyLeading: false,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    kLogo,
                    height: 50,
                  ),
                  Text('Scholar Chat')
                ],
              ),
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    reverse: true,
                    controller: _cont,
                    itemCount: modelmassage.length,
                    itemBuilder: (BuildContext context, int index) {
                      return modelmassage[index].id == email
                          ? chatbubble(
                              massage: modelmassage[index],
                            )
                          : chatbubble2(
                              massage: modelmassage[index],
                            );
                    },
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: controller,
                      onSubmitted: (value) {
                        massages.add({
                          kMessage: value,
                          kCreatedAt: DateTime.now(),
                          "id": email
                        });
                        controller.clear();
                        _cont.animateTo(0,
                            duration: Duration(milliseconds: 7),
                            curve: Curves.bounceIn);
                      },
                      decoration: InputDecoration(
                          hintText: 'Send Message',
                          suffixIcon: Icon(  Icons.send,
                            color: kPrimaryColor,),
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: BorderSide(
                                color: kPrimaryColor,
                                width: 1,
                              )),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(18),
                              borderSide: BorderSide(
                                color: kPrimaryColor,
                                width: 1,
                              ))),
                    ),
                  ),
                )
              ],
            ),
          );
        } else {
          return Scaffold(
            body: Center(
                child: CircularProgressIndicator(
              color: kPrimaryColor,
            )),
          );
        }
      },
    );
  }
}
