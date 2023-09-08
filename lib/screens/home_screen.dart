import 'dart:developer';

import 'package:bloc_app/blocs/counter_bloc/counter_bloc.dart';
import 'package:bloc_app/blocs/counter_bloc/counter_event.dart';
import 'package:bloc_app/blocs/counter_bloc/counter_state.dart';
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
            BlocSelector<CounterBloc, CounterState, int>(
              selector: (state){
                return state.count*2;
              }, 
              builder:(context, state){
                return Text(
                  '$state',
                  style: textStyle,
                );
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
                    context.read<CounterBloc>().add(CounterDecrementEvent());
                  }, 
                  child: Text(
                    '-',
                    style: textStyle,
                  )
                ),
                FloatingActionButton(
                  onPressed: (){
                    context.read<CounterBloc>().add(CounterIncrementEvent());
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