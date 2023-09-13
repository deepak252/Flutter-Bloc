import 'dart:developer';

import 'package:bloc_app/features/number_trivia/presentation/bloc/number_trivia_bloc.dart';
import 'package:bloc_app/features/number_trivia/presentation/bloc/number_trivia_event.dart';
import 'package:bloc_app/features/number_trivia/presentation/bloc/number_trivia_state.dart';
import 'package:bloc_app/features/number_trivia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NumberTriviaPage extends StatelessWidget {
  NumberTriviaPage({super.key});

  final inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    log('Render Trivia Page');
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Number Trivia'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 12,
              ),
              Expanded(
                child: BlocConsumer<NumberTriviaBloc, NumberTriviaState>(
                  listener: (context, state){
                    if (state is NumberTriviaError) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.message,style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16
                          ),),
                          margin: const EdgeInsets.all(12),
                          backgroundColor: Colors.red.shade400,
                          behavior: SnackBarBehavior.floating,
                        )
                      );
                    }else{
                      inputController.clear();
                    }
                  },
                  builder: (context, state) {
                    if (state is NumberTriviaLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (state is NumberTriviaLoaded) {
                      return TriviaDisplay(trivia: state.trivia);
                    }
                    
                    return const Text('Search Trivia');
                }),
              ),
              const SizedBox(
                height: 12,
              ),
              TextField(
                controller: inputController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    hintText: 'Enter number',
                    enabledBorder: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => dispatchConcrete(context),
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(14),
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white),
                      child: const Text('Search'),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => dispatchRandom(context),
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(14),
                          backgroundColor: Colors.grey.shade300,
                          foregroundColor: Colors.black),
                      child: const Text('Get Random'),
                    ),
                  ),
                ],
              ),
              const Spacer(
                flex: 1,
              )
            ],
          ),
        ),
      ),
    );
  }

  void dispatchConcrete(BuildContext context) {
    context
        .read<NumberTriviaBloc>()
        .add(FetchConcreteNumberTrivia(inputController.text));
  }

  void dispatchRandom(BuildContext context) {
    context.read<NumberTriviaBloc>().add(const FetchRandomNumberTrivia());
  }
}
