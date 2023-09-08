import 'package:flutter/material.dart';

abstract class ColorState{
  Color color;
  ColorState({required this.color});
}

class ColorInitialState extends ColorState{
  ColorInitialState(Color initColor): super(color: initColor);
}

class ColorIncrementState extends ColorState{
  ColorIncrementState(Color incrColor): super(color: incrColor);
}

class ColorDecrementState extends ColorState{
  ColorDecrementState(Color decrColor): super(color: decrColor);
}