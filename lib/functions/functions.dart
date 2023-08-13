import 'package:flutter/cupertino.dart';

class CountLikes {
  List<int> likesCount = [0];

  likesIncrement() {
    int last = likesCount.last;
    likesCount.add(last + 1);
  }

  void decrement() {
    int last = likesCount.last;
    if (last > 0) {
      likesCount.remove(last);
    } else if (last == 0) {
      Text("No likes");
    }
  }
}
