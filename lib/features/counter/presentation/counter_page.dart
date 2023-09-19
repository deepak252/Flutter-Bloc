import 'dart:developer';

import 'package:bloc_app/features/counter/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {

    log("CounterPage : ${context.read<CounterCubit>().hashCode}");
    // log("CounterPage Count: ${context.select((CounterCubit cubit) => cubit.state)}"); // Once
    log("CounterPage Count % 5 == 0: ${context.select((CounterCubit cubit) => cubit.state%5==0)}"); // On cubit.state%5 value change

    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterCubit, int>(
              builder:(context, state){
                return Text(
                  '$state',
                  style: const TextStyle(fontSize: 24),
                );
              },
            ),
            
            const SizedBox(height: 18,),
            FloatingActionButton(
              onPressed: (){
                context.read<CounterCubit>().increment();
                // BlocProvider.of<CounterCubit>(context).increment();
                // context.select<CounterCubit>().increment();
              },
              heroTag: 1, 
              child:const Text("+"),
            ),
            const SizedBox(height: 12,),
            FloatingActionButton(
              heroTag: 2,
              onPressed: (){
                context.read<CounterCubit>().decrement();
              }, 
              child: const Text("-")
            )
          ],
        ),
      ),
    );
  }
}