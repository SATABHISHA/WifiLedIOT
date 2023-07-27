import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'home/Home.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); //---for mobile
  /*await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyAS5alN0XMgU9ofvrCxEDqtryX4Ghq6OIo", // Your apiKey
      appId: "1:436590148667:web:16a0215d002a334f80701e", // Your appId
      messagingSenderId: "436590148667", // Your messagingSenderId
      projectId: "dailyrecords-85331", // Your projectId
    ),
  );*/ //---for web//

  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
      initialRoute: Home.id,
      routes: {
        // Login.id : (context)=> Login(),

      },
    );
  }
}