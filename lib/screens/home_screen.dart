import 'dart:developer';

import 'package:bloc_app/blocs/color_bloc/color_bloc.dart';
import 'package:bloc_app/blocs/color_bloc/color_event.dart';
import 'package:bloc_app/blocs/color_bloc/color_state.dart';
import 'package:bloc_app/blocs/counter_bloc/counter_bloc.dart';
import 'package:bloc_app/blocs/counter_bloc/counter_event.dart';
import 'package:bloc_app/blocs/counter_bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final textStyle = const TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold
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
                log(state.count.toString());
                return state.count*2;
              }, 
              builder:(context, count){
                return BlocBuilder<ColorBloc, ColorState>(
                  builder:(context, colorState) => Text(
                    '$count',
                    style: textStyle.copyWith(
                      color: colorState.color
                    ),
                  ),
                );
              },
            ),

            // BlocSelector<CounterBloc, CounterState, int>(
            //   selector: (state){
            //     return state.count*2;
            //   }, 
            //   builder:(context, state){
            //     return Text(
            //       '$state',
            //       style: textStyle,
            //     );
            //   },
              
            // ),

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
                    context.read<ColorBloc>().add(ColorDecrementEvent());
                  }, 
                  child: Text(
                    '-',
                    style: textStyle,
                  )
                ),
                FloatingActionButton(
                  onPressed: (){
                    context.read<CounterBloc>().add(CounterIncrementEvent());
                    context.read<ColorBloc>().add(ColorIncrementEvent());
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