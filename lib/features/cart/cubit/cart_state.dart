abstract class CartState{
  bool isAdded;

  CartState(this.isAdded);
}

class CartInitial extends CartState{
  CartInitial(bool initialState): super(initialState);
}

class CartAdded extends CartState{
  CartAdded():super(true);
}

class CartRemoved extends CartState{
  CartRemoved():super(false);
}
