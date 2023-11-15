// records работают с версии dart 3.0 и выше
// records - immutable

(int, int) swap((int, int) rec) {
  var (a, b) = rec;
  return (b, a);
} 

final json = <String, Object> {
  'a': 123,
  'b': 'str',
  'c': true
}; // Так объявляется Map

({int a, String b}) readJson(Map<String, Object> json) {
  return (a: json['a'] as int, b: json['b'] as String);
}

void recorder() {
  var rec_1 = (123, a: true, 'last');
  print('rec_1: ${rec_1.$1} ${rec_1.a} ${rec_1.$2}');
  print('swap 1, 2: ${swap((1, 2))}');
  (String, int, String) rec_2 = ('first', 123, 'last');
  print('rec_2 ${rec_2}');
  ({int a, int b}) rec_3;
  rec_3 = (a: 20, b: 30);

  // record type annotation
  (int a, int b) rec_4 = (1, 2);
  (int c, int d) rec_5 = (1, 2);
  assert(rec_4 == rec_5);
  rec_4 = rec_5;

  // record type annotation named fields
  ({int a, int b}) rec_6 = (a: 1, b: 2);
  ({int a, int b}) rec_7 = (a: 10, b: 20);
  rec_6 = rec_7;

  final readedJson = readJson(json);
  print('readedJson ${readedJson}');
}