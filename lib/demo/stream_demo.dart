import 'dart:async';

const oneSec = Duration(seconds: 1);
const fiveSec = Duration(seconds: 5);

Stream<int> counterStream()async*{
  for(int count=1;count<10;count++){
     await Future.delayed(oneSec);
    yield count;
  }
}
void main(List<String> args)async{
  Stream<int> stream = counterStream();
  stream.listen((count) {
    print(count);
  });

  // StreamSubscription<int> streamSubscription = counterStreamSubscription();
  // await Future.delayed(fiveSec);
  // streamSubscription.cancel(); // Cancel stream after 5 sec

  print("END");
}

StreamSubscription<int> counterStreamSubscription(){
  return counterStream().listen((count) {
    print(count);
  });
}