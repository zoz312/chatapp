import 'package:chatapp/pages/chatPage.dart';
import 'package:chatapp/pages/loginpage.dart';
import 'package:chatapp/pages/sinupPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const scholarchat());
}

class scholarchat extends StatelessWidget {
  const scholarchat({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        'log': (context) => LoginPage(),
        'sin': (context) => SinUpPage(),
        'chat': (context) => chatPage()
      },
      initialRoute: 'log',
    );
  }
}
