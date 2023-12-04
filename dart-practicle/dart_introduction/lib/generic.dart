void doIt<T extends Object>(T ts) {
  print(ts);
}

class DoWhat {
  DoWhat() {
    print('constructor');
  }

  toPrint() {
    print('toPrint');
  }
}

void generic() {
  doIt<String>('generic do it');
  var list = <DoWhat>[DoWhat(), DoWhat()];
  list[0].toPrint();
}
