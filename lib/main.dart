import 'package:app_mobile/views/home.view.dart';
import 'package:app_mobile/views/login.view.dart';
import 'package:app_mobile/views/signup.view.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginView(),
      routes: {
        'loginView': (context) => LoginView(),
        'signupView': (context) => SignupView(),
        'homeView': (context) => HomeView()
      },
    );
  }
}
