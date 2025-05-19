void main() {
  for (int i = 0; i < 10; i++) {
    print("$i");
  }

  int i = 0;
  while (i < 7) {
    print("loop ke $i");
    i++;
  }

  do {
    print("do while $i");
    i++;
  } while (i < 16);

  List<int> listInt = [1, 2, 3, 4, 5];

  for (int num in listInt) {
    print(num);
  }

  listInt.forEach((element) {
    print(element);
  });

  print("${listInt.map((e) => print(e.toString()))}");
}
