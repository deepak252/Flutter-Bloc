import 'dart:developer';

import 'package:bloc_app/features/cart/presentation/cart_details_page.dart';
import 'package:bloc_app/features/cart/presentation/cart_page.dart';
import 'package:bloc_app/features/counter/presentation/counter_page.dart';
import 'package:bloc_app/features/home_page.dart';
import 'package:flutter/material.dart';

class AppRouter{
  Route? onGenerateRoute(RouteSettings routeSettings){
    log("Route Generated");
    Map<String,dynamic> arguments = (routeSettings.arguments as Map<String,dynamic>?)??{};
    switch(routeSettings.name){
      case '/': return MaterialPageRoute(builder: (_)=>const HomePage());
      case '/counter': return MaterialPageRoute(builder: (_)=>const CounterPage());
      case '/cart': return MaterialPageRoute(builder: (_)=>const CartPage());
      case '/cartDetails': 
        final title = arguments['title'];
        return MaterialPageRoute(builder: (_)=> CartDetailsPage(title: title,));
      default: return null;
    }
  }
}