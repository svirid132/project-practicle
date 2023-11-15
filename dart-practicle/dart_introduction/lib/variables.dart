late int num_4;

void varibles() {
  var name_1 = 'Sasha'; // хранит ссылку на String 
  Object name_2 = 'Sasha'; // динамический тип (альтернатива Object - dynamic)
  String name_3 = 'Sasha';
  int? num_1 = 1; // переменная всегда должна быть проинцилизирована, если не она null-able 
  print('num.abs: ${num_1.abs()}');
  num_1 = null;
  print('num: ${num_1}');
  int? num_2;
  assert(num_2 == null); // если true, то ошибки не будет
  // lazy init
  int num_3;
  num_3 = 5;
  print('num_3: ${num_3}');
  num_4 = 10;
  print('num_4: ${num_4}');
  late int num_5 = fun_num_5(); // если переменная не используется late не запускает функцию
  var num_6 = const []; // делает const array
  final num_7 = [];
  num_7.add(1);
  print('num_7: ${num_7}');
}

int fun_num_5() {
  int num_5 = 50;
  print('num_5: ${num_5}');
  return num_5;
}