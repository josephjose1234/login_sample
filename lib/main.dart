import 'package:flutter/material.dart';
import 'package:password_maker/password_maker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _PasswordController = TextEditingController();
  String temp = PassWords().generatePassword(10);
  @override
  void initState() {
    super.initState();
    _PasswordController = TextEditingController(text: temp);
  }

  @override
  void dispose() {
    _PasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ///Logo
            Center(
              child: FlutterLogo(
                size: 200, // specify the desired size of the logo
              ),
            ),

            ///Name
            Container(
              margin: EdgeInsets.fromLTRB(20, 50, 20, 20),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.blue),
              ),
              child: TextField(
                controller: _nameController,
                decoration:
                    InputDecoration(hintText: 'Name',
                    border: InputBorder.none),
              ),
            ),

            ///PassWord
            Container(
              margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.blue),
              ),
              child: TextField(
                controller: _PasswordController,
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ),

            ///SignupButton
          ],
        ),
      ),
    );
  }
}
