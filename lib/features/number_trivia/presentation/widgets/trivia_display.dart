import 'package:bloc_app/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:bloc_app/features/number_trivia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class TriviaDisplay extends StatelessWidget {
  final NumberTrivia trivia;
  const TriviaDisplay({required this.trivia, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NumberDisplay(number: trivia.number),
        const SizedBox(height: 12,),
        Expanded(
          child: SingleChildScrollView(
            child: MessageDisplay(
              message: trivia.text
            )
          ),
        )
      ],
    );
  }
}