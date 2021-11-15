import 'package:flutter/material.dart';
import 'package:kotszy/providers/space_provider.dart';
// ignore: unused_import
import 'package:kotszy/theme.dart';
import 'package:provider/provider.dart';
import 'pages/spalash_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SpaceProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
      
    );
  }
}
