import 'dart:developer';

import 'package:bloc_app/cubits/counter_cubit/counter_cubit.dart';
import 'package:bloc_app/cubits/counter_cubit/couter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final textStyle = const TextStyle(
    fontSize: 30
  );
  @override
  Widget build(BuildContext context) {
    log("Home Screen Rebuild");
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocConsumer<CounterCubit, CounterState>(
              builder:(context, state){
                return Text(
                  '${state.count}',
                  style: textStyle,
                );
              },
              listener:(context, state){
                if(state.count>=10){
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Maximim value reached"))
                  );
                }
              },
            ),

            // BlocConsumer<CounterBloc, CounterState>(
            //   builder:(context, state){
            //     return Text(
            //       '${state.count}',
            //       style: textStyle,
            //     );
            //   },
            //   listener:(context, state){
            //     if(state.count>=10){
            //       ScaffoldMessenger.of(context).showSnackBar(
            //         const SnackBar(content: Text("Maximim value reached"))
            //       );
            //     }
            //   },
            // ),
            // BlocListener<CounterBloc, CounterState>(
            //   listenWhen:(previous, current){
            //     return current.count>=10;
            //   },
            //   listener:(context, state){
            //     if(state.count>=10){
            //       ScaffoldMessenger.of(context).showSnackBar(
            //         const SnackBar(content: Text("Maximim value reached"))
            //       );
            //     }
            //   },
            //   child: const Text("Counter App"),
            // ),
            // BlocBuilder<CounterBloc, CounterState>(
            //   buildWhen:(previous, current){
            //     log("previous : ${previous.count}, current : ${current.count}");
            //     return current.count<10;
            //   },
            //   builder:(context, state){
            //     return Text(
            //       '${state.count}',
            //       style: textStyle,
            //     );
            //   },
            // ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FloatingActionButton(
                  onPressed: (){
                    context.read<CounterCubit>().decrement();
                  }, 
                  child: Text(
                    '-',
                    style: textStyle,
                  )
                ),
                FloatingActionButton(
                  onPressed: (){
                    context.read<CounterCubit>().increment();
                  }, 
                  child: Text(
                    '+',
                    style: textStyle,
                  )
                )
              ],
            )
          ],
        )
      )
    );
  }
}