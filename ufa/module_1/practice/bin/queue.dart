import 'dart:collection';
import 'dart:core';

void main(List<String> args) {
  Queue<int> a = new Queue.from([1, 2, 3, 4]);
  Queue<String> text = new Queue.from(['1', '2', '3', '4']);
  Queue<int> z = new Queue();

  print(a);
  print(text);
  print(z);
  var elen;
  while (!a.isEmpty) {
    elen = a.removeLast();
    print(elen);
    z.addFirst(elen);
  }
  print(a);
  print(z);

  text.clear();
  print(text);
  Queue<int> x = Queue.from([5, 6, 7, 8]);

  x.addAll(z);
  print(x);
}
