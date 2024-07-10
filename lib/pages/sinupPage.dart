import 'package:chatapp/constants.dart';
import 'package:chatapp/pages/loginpage.dart';
import 'package:chatapp/widget/coustmTextfield.dart';
import 'package:chatapp/widget/custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../helper/Show_snac_bar.dart';

class SinUpPage extends StatefulWidget {
  const SinUpPage({super.key});

  @override
  State<SinUpPage> createState() => _SinUpPageState();
}

class _SinUpPageState extends State<SinUpPage> {
  String? email;
  String? password;
  GlobalKey<FormState> fromkey = GlobalKey();
  bool isloading = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: kPrimaryColor,
            elevation: 0,
          ),
          backgroundColor: kPrimaryColor,
          body: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Form(
              key: fromkey,
              child: ListView(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Column(
                    children: [
                      Image.asset(kLogo),
                      Center(
                          child: Text(
                        'Scholar Chat',
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )),
                    ],
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  Text(
                    'Sin Up',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  customTextFeild(
                    text: "Email",
                    onchange: (p0) {
                      email = p0;
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  customTextFeild(
                    onjtyy: true,
                    text: "Password",
                    onchange: (p0) {
                      password = p0;
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  CustomButton(
                      text: "Sin Up",
                      onPressed: () async {
                        if (fromkey.currentState!.validate()) {
                          isloading = true;
                          setState(() {});
                          try {
                            await sinupuser();
                            Navigator.pushNamed(context, "chat");
                          } on FirebaseAuthException catch (ex) {
                            if (ex.code == 'weak-password') {
                              showScakba(context, 'weak-password');
                            } else if (ex.code == 'email-already-in-use') {
                              showScakba(context, 'email-already-in-use');
                            }
                          } catch (e) {
                            showScakba(context, 'there wasan error');
                          }
                          isloading = false;
                          showScakba(context, ' Success ');
                        } else {}
                      }),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "you have account ",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            "Login ",
                            style: TextStyle(
                                color: Color(0xffC7EDE6), fontSize: 15),
                          ))
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }

  Future<void> sinupuser() async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
  }
}
