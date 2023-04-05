import 'package:first_try/screen/splashscreen.dart';
import 'package:flutter/material.dart';


const SAVE_KEY_NAME = 'UserLoggedIn';
const userName = 'Athul';
const passWord = '0000';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'First',
      theme: ThemeData(
        primarySwatch: Colors.green,
        
      ),
      home: ScreenSplash(),
    );
  }
}
