import 'dart:math';

Iterable<num> numToPow(num startOfRng, num endOfRng, num step, num exp) sync* {
  if (startOfRng <= endOfRng && 0 < step) {
    for (num i = startOfRng; i <= endOfRng; i += step) {
      yield pow(i, exp);
    }
  } else {
    yield -1;
  }
}

Iterable<num> numToPowRecursive(
    num startOfRng, num endOfRng, num step, num exp) sync* {
  if (startOfRng <= endOfRng && 0 < step) {
    yield pow(startOfRng, exp);
    yield* numToPowRecursive(startOfRng + step, endOfRng, step, exp);
  }
  // if (startOfRng > endOfRng || step <= 0) {
  // yield -1;
  //}
}

void main() {
  for (var item in numToPow(7, 15, 1, 2)) {
    print(item);
  }
  numToPowRecursive(7, 15, 1, 2).forEach(print);
}
