import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'di.dart' as di;
void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  await Hive.initFlutter();
  await Hive.openLazyBox('numberTrivia');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Scaffold(body: Text("Flutter App"),),
    );
  }
}

