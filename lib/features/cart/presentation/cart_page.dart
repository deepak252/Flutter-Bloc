import 'package:bloc_app/features/cart/cubit/cart_cubit.dart';
import 'package:bloc_app/features/cart/cubit/cart_state.dart';
import 'package:bloc_app/features/cart/presentation/cart_details_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CartCubit, CartState>(
              builder:(context, state){
                return Text(
                  'Cart : ${state.isAdded}',
                  style: const TextStyle(fontSize: 24),
                );
              },
            ),
            const SizedBox(height: 22,),
            ElevatedButton(
              onPressed: (){
                context.read<CartCubit>().addToCart();
              }, 
              child: const Text("+ Add")
            ),
            const SizedBox(height: 12,),
            ElevatedButton(
              onPressed: (){
                context.read<CartCubit>().removeFromCart();
              }, 
              child: const Text("- Remove")
            ),
            const SizedBox(height: 22,),
            ElevatedButton(
              onPressed: (){
                Navigator.of(context).pushNamed(
                  '/cartDetails',
                  arguments: {
                    'title': 'Custom Cart Details'
                  }
                );
                // Navigator.of(context).push(
                //   MaterialPageRoute(builder: (_)=>const CartDetailsPage())
                // );
              }, 
              child: const Text("Show Cart Details"),
              
            )
          ],
        ),
      ),
    );
  }
}