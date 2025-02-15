import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:studentenrollment/views/login_screen.dart';
import 'package:studentenrollment/views/register_screen.dart';
import 'firebase_options.dart';  
void main() async {
  WidgetsFlutterBinding.ensureInitialized();  
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,  
  );
  runApp(MyApp()); 
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student Enrollment',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login',  
      routes: {
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),

      },
    );
  }
}
