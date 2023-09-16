
import 'package:hive_flutter/hive_flutter.dart';

abstract class NewsBox{
  static const name = 'news'; 
  static const articlesKey = 'articles'; 
  static const categoriesKey = 'categories'; 
  static final instance = Hive.lazyBox(name);

  static bool get isOpen => instance.isOpen;
  
  static Future initLazy()async{
    await Hive.openLazyBox(name);
  }
}