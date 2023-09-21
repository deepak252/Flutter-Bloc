import 'package:bloc_app/app_router.dart';
import 'package:bloc_app/features/cart/cubit/cart_cubit.dart';
import 'package:bloc_app/features/counter/cubit/counter_cubit.dart';
import 'package:bloc_app/features/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_)=>CounterCubit()),
        BlocProvider(create: (_)=>CartCubit()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: const HomePage(),
        onGenerateRoute: _appRouter.onGenerateRoute,
        initialRoute: '/',
      )
    );
    // return MaterialApp(
    //   title: 'Flutter Demo',
    //   theme: ThemeData(
    //     primarySwatch: Colors.blue,
    //   ),
    //   home: const HomePage(),
    // );
  }
}

