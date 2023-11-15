void collections() {
  var list_1 =  <int>[1, 2, 3];
  var list_2 = const <int>[4, 5, 6];
  List<int>? list_3;
  var list_4 = [
    ...list_1, ...list_2, ...?list_3,
    if (7 < 0) 7, if (7 > 0) 8,
    for (var i in [1, 2, 3, 4, 5]) i
    ];
  print('list_4: ${list_4}');
  Set<int> set_1 = <int>{1, 2, 3, 3, 2, 1};
  print('set_1: ${set_1}');

  final Map<String, String> map_1 = <String, String>{};
  map_1['first'] = 'second';
  map_1['second'] = 'second';
}