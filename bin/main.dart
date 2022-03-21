import 'package:linked_list/my_double_linked_list.dart';


void main() {
  final list = MyDoubleLinkedList();

  list.push(5);
  list.push('sun');
  list.push(3);
  list.push(2.5);
  list.push(1);

  print('\tInsert after');
  print('Before: $list');
  var node = list.startNodeAt(1);
  list.insertAfter(list.startNodeAt(1)!, 'world');
  print('After:  $list\n');

  print('\tInsert before');
  print('Before: $list');
  node = list.endNodeAt(3);
  list.insertBefore(node!, 'hello');
  print('After:  $list\n');

  print('\tRemove after');
  print('Before: $list');
  node = list.endNodeAt(2);
  list.removeAfter(node!);
  print('After:  $list\n');

  print('\tRemove before');
  print('Before: $list');
  node = list.startNodeAt(1);
  list.removeBefore(node!);
  print('After:  $list\n');

  print('\tUpdate at');
  print('Before: $list');
  node = list.endNodeAt(1);
  list.updateAt(node!, '3.2');
  print('After:  $list\n');

  print('List length: ${list.length}');
}
