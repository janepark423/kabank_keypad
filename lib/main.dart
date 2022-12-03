import 'package:flutter/material.dart';
import 'package:mykeypad_flutter/CustomKeyboard.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: CustomKeyboard(),);
  }
}

//https://youtu.be/dfaFK561PAo?t=921
