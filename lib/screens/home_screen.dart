import 'package:bloc_app/screens/blocs/network_bloc/network_bloc.dart';
import 'package:bloc_app/screens/blocs/network_bloc/network_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocConsumer<NetworkBloc, NetworkState>(
          listener: (context, state){
            if(state is NetworkLostState){
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Not Connected"))
              );
            }else if(state is NetworkConnectedState){
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Connected"))
              );
            }else{
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Loading..."))
              );
            }
          },
          builder: (context, state){
            if(state is NetworkLostState){
              return const Text("Not Connected");
            }else if(state is NetworkConnectedState){
              return const Text("Connected");
            }else{
              return const Text("Loading...");
            }
          }
        ),
        // child: BlocListener<NetworkBloc, NetworkState>(
        //   listener: (context, state){
        //     if(state is NetworkLostState){
        //       ScaffoldMessenger.of(context).showSnackBar(
        //         const SnackBar(content: Text("Not Connected"))
        //       );
        //     }else if(state is NetworkConnectedState){
        //       ScaffoldMessenger.of(context).showSnackBar(
        //         const SnackBar(content: Text("Connected"))
        //       );
        //     }else{
        //       ScaffoldMessenger.of(context).showSnackBar(
        //         const SnackBar(content: Text("Loading..."))
        //       );
        //     }
        //   }
        // ),
        // child: BlocBuilder<NetworkBloc, NetworkState>(
        //   builder: (context, state){
        //     if(state is NetworkLostState){
        //       return const Text("Not Connected");
        //     }else if(state is NetworkConnectedState){
        //       return const Text("Connected");
        //     }else{
        //       return const Text("Loading...");
        //     }
        //   }
        // ),
      )
    );
  }
}