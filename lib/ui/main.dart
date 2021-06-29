import 'package:flexible_flutter_client/services/authentication_service.dart';
import 'package:flexible_flutter_client/ui/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'DraggableSheetScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,

        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DraggableSheetScreen(),
    );
  }
}
