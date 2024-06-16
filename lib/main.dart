import 'package:cosmomarket/screen/login.dart';
import 'package:flutter/material.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {

  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFFE1F1F7),
        appBarTheme: const AppBarTheme(backgroundColor: Color(0xFFE1F1F7)),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: const Color(0xFF22577A),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)
                ),
                textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    wordSpacing: 2.0,
                    letterSpacing: 2.0
                ),
              fixedSize: Size(
                  MediaQuery.of(context).size.width*0.93,
                  MediaQuery.of(context).size.height*0.07
              )
            )
        ),
        scaffoldBackgroundColor: const Color(0xFFE1F1F7),
      ),
      home: const Login()
    );
  }
}



