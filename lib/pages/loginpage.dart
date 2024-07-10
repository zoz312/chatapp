
import 'package:chatapp/widget/coustmTextfield.dart';
import 'package:chatapp/widget/custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../constants.dart';
import '../helper/Show_snac_bar.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? email;

  String? password;

  GlobalKey<FormState> fromkey = GlobalKey();

  bool isloading = false;
 
   
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Form(
        key: fromkey,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: kPrimaryColor,
              elevation: 0,
            ),
            backgroundColor: kPrimaryColor,
            body: Padding(
              padding: const EdgeInsets.all(5.0),
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
                    'Log in ',
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
                    text: "Login",
                    onPressed: () async {
                      if (fromkey.currentState!.validate()) {
                        isloading = true;
                        setState(() {});
                        try {
                          await loginuser();
                            Navigator.pushNamed(context, "chat",arguments: email);
                        } on FirebaseAuthException catch (ex) {
                          if (ex.code == 'user-not-found') {
                            showScakba(context, 'No user found for that email.');
                          } else if (ex.code == 'wrong-password') {
                            showScakba(context, 'Wrong password provided for that user.');
                          }
                        } catch (e) {
                          showScakba(context, 'there wasan error');
                        }
                        isloading = false;
                        showScakba(context, ' Success ');
                      } else {}
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "don't have on account ",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, 'sin');
                          },
                          child: Text(
                            "Sin Up ",
                            style:
                                TextStyle(color: Color(0xffC7EDE6), fontSize: 15),
                          ))
                    ],
                  )
                ],
              ),
            )),
      ),
    );
  }

  Future<void> loginuser() async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }
}
