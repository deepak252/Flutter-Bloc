import 'dart:async';
import 'package:bloc_app/screens/blocs/network_bloc/network_event.dart';
import 'package:bloc_app/screens/blocs/network_bloc/network_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';


class NetworkBloc extends Bloc<NetworkEvent, NetworkState>{
  final Connectivity _connectivity = Connectivity();
  StreamSubscription? _connectivitySubscription;
  // NetworkBloc(super.initialState);
  NetworkBloc(): super (NetworkInitialState()){
    on<NetworkLostEvent>((event,emit)=>emit(NetworkLostState()));
    on<NetworkConnectedEvent>((event,emit)=>emit(NetworkConnectedState()));

    _connectivitySubscription = _connectivity.onConnectivityChanged.listen((result) {
      if(result == ConnectivityResult.mobile || result==ConnectivityResult.wifi){
        add(NetworkConnectedEvent());
      }else{
        add(NetworkLostEvent());
      }
    });
  }

  @override
  Future<void> close(){
    _connectivitySubscription?.cancel();
    return super.close();
  }
}