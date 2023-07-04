import 'package:flutter/material.dart';
import 'package:password_maker/password_maker.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
void main() {
  runApp(
    ChangeNotifierProvider<ThemeProvider>(
      create: (_) => ThemeProvider(),
      builder: (context, _) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    // Set system overlay style based on the selected theme
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness:
            themeProvider.isDarkMode ? Brightness.light : Brightness.dark,
      ),
    );
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
        theme: ThemeData.light().copyWith(
          colorScheme: ThemeData.light().colorScheme.copyWith(
                background: Colors.white, // Set light mode background color
              ),
        ),
        darkTheme: ThemeData.dark().copyWith(
          colorScheme: ThemeData.dark().colorScheme.copyWith(
                background: Colors.black, // Set dark mode background color
              ),
        ),
        home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //here intialising Controllers
  TextEditingController _nameController = TextEditingController();
  TextEditingController _PasswordController = TextEditingController();
  // assigning the generated password to a temporary variable
  //here 10 is the length of passwords
  String temp = PassWords().generatePassword(10);
  //this is the method generating password=PassWords().generatePassword(10);
  @override
  void initState() {
    super.initState();
    //assigning the temp to the Password controller
    _PasswordController = TextEditingController(text: temp);
  }

//disposing the controllers
  @override
  void dispose() {
    _PasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    // Set system overlay style based on the selected theme
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness:
            themeProvider.isDarkMode ? Brightness.light : Brightness.dark,
      ),
    );
    return Scaffold(
      backgroundColor: themeProvider.isDarkMode
          ? Colors.black
          : Color.fromRGBO(248, 234, 221, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ///Signup
              Container(
                margin: EdgeInsets.all(20),
                child: Text('Welcome to Flutter',
                    style:
                        TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
              ),

              ///Logo
              Center(
                child: Container(
                  // margin: EdgeInsets.all(5),
                  //   padding: EdgeInsets.all(10),
                  //   decoration: BoxDecoration(
                  //    // color:themeProvider._isDarkMode?Color.fromRGBO(26, 18, 11,1):Colors.white,
                  //     borderRadius: BorderRadius.circular(5),
                  //     border: Border.all(color: Colors.blue,
                  //     width: 2,
                  //     )
                  //   ),
                  //color: Colors.blueGrey,
                  child: FlutterLogo(
                    size: 200,
                    // specify the desired size of the logo
                  ),
                ),
              ),

              ///Name
              Container(
                margin: EdgeInsets.fromLTRB(20, 50, 20, 20),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: themeProvider._isDarkMode
                      ? Color.fromRGBO(26, 18, 11, 1)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  // border: Border.all(
                  //   color: Colors.blue,
                  //   width: 2,
                  // ),
                ),
                child: TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                      hintText: 'Name',
                      hintStyle: TextStyle(
                        color: themeProvider.isDarkMode
                            ? Colors.white
                            : Colors.black,
                      ),
                      border: InputBorder.none),
                ),
              ),

              ///PassWord
              Container(
                margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: themeProvider._isDarkMode
                      ? Color.fromRGBO(26, 18, 11, 1)
                      : Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  // border: Border.all(
                  //   color: Colors.blue,
                  //   width: 2,
                  // ),
                ),
                child: TextField(
                  controller: _PasswordController,
                  decoration: InputDecoration(border: InputBorder.none),
                ),
              ),
              Container(
                child: Text('terms and conditions apply'),
              ),

              ///SignupButton
              GestureDetector(
                onTap: () {},
                child: Container(
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: themeProvider._isDarkMode
                            ? Color.fromRGBO(26, 18, 11, 1)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.blue,
                          width: 2,
                        ),
                        ),
                    child: Text('SIGNUP')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ThemeProvider with ChangeNotifier {
  bool _isDarkMode = false;

  ThemeProvider() {
    // Detect system brightness mode and set the initial theme accordingly
    final brightness = WidgetsBinding.instance.window.platformBrightness;
    _isDarkMode = brightness == Brightness.dark;
  }

  bool get isDarkMode => _isDarkMode;

  ThemeData getThemeData() {
    return _isDarkMode
        ? ThemeData.dark().copyWith(
            scaffoldBackgroundColor:
                Colors.black, // Set dark mode background color
          )
        : ThemeData.light().copyWith(
            scaffoldBackgroundColor:
                Colors.white, // Set light mode background color
          );
  }

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}
