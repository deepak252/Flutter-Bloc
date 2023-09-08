import 'package:bloc_app/blocs/color_bloc/color_bloc.dart';
import 'package:bloc_app/blocs/counter_bloc/counter_bloc.dart';
import 'package:bloc_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterBloc>(create: (_) => CounterBloc(),),
        BlocProvider<ColorBloc>(create: (_) => ColorBloc(),),
      ], 
      child: MaterialApp(
        title: 'Bloc Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
      ),
    );
    // return BlocProvider<CounterBloc>(
    //   create: (context) => CounterBloc(),
    //   child: MaterialApp(
    //     title: 'Bloc Demo',
    //     theme: ThemeData(
    //       primarySwatch: Colors.blue,
    //     ),
    //     home: const HomeScreen(),
    //   ),
    // );
  }
}
