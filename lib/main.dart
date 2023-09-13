import 'package:bloc_app/features/number_trivia/presentation/bloc/number_trivia_bloc.dart';
import 'package:bloc_app/features/number_trivia/presentation/pages/number_trivia_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:bloc_app/di.dart' as di;

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  await Hive.initFlutter();
  await Hive.openBox('numberTrivia');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_)=> di.sl<NumberTriviaBloc>(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Number Trivia',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: NumberTriviaPage(),
      ),
    );
  }
}

