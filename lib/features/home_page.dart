import 'dart:developer';
import 'package:bloc_app/features/cart/cubit/cart_cubit.dart';
import 'package:bloc_app/features/cart/cubit/cart_state.dart';
import 'package:bloc_app/features/cart/presentation/cart_page.dart';
import 'package:bloc_app/features/counter/cubit/counter_cubit.dart';
import 'package:bloc_app/features/counter/presentation/counter_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    log("HomePage : ${context.read<CounterCubit>().hashCode}");
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {
        if (state is CartAdded) {
          context.read<CounterCubit>().increment();
        } else if (state is CartRemoved) {
          context.read<CounterCubit>().decrement();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Home"),
        ),
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocConsumer<CounterCubit, int>(
                listener: (context, state) {
                  if (state == 5) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Count = 5")));
                  }
                },
                builder: (context, state) {
                  return Text(
                    'Counter: $state',
                    style: const TextStyle(fontSize: 24),
                  );
                },
              ),
              const SizedBox(
                height: 22,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/counter');

                  // Navigator.of(context).push(
                  //   MaterialPageRoute(builder: (_)=>const CounterPage())
                  // );

                  // Navigator.of(context).pushReplacement(
                  //   MaterialPageRoute(builder: (_)=>const CounterPage())
                  // );

                  // Navigator.of(context).pushAndRemoveUntil(
                  //   MaterialPageRoute(builder: (_)=>const CounterPage()),
                  //   (route)=>false
                  // );

                  // Navigator.of(context).push(
                  //   MaterialPageRoute(builder: (_)=>
                  //     BlocProvider.value(
                  //       value: BlocProvider.of<CounterCubit>(context),
                  //       child: const CounterPage(),
                  //     ),
                  //   )
                  // );
                },
                child: const Text("Counter Page"),
              ),
              const SizedBox(
                height: 12,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/cart');
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(builder: (_)=>const CartPage())
                    // );
                  },
                  child: const Text("Cart Page")),
            ],
          ),
        ),
      ),
    );
  }
}
