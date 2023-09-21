import 'package:bloc_app/features/cart/cubit/cart_cubit.dart';
import 'package:bloc_app/features/cart/cubit/cart_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartDetailsPage extends StatelessWidget {
  final String title;
  const CartDetailsPage({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CartCubit, CartState>(
              builder:(context, state){
                return Text(
                  'Is Product In Cart: ${state.isAdded}',
                  style: const TextStyle(fontSize: 24),
                );
              },
            ),
            
          ],
        ),
      ),
    );
  }
}