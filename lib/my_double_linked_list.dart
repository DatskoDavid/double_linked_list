import 'node.dart';

class MyDoubleLinkedList<E> {
  Node<E>? head;
  Node<E>? tail;
  bool get isEmpty => head == null;
  int length = 0;

  MyDoubleLinkedList();

  void push(E value) {
    head = Node(value: value, next: head);
    head?.next?.previous = head;
    tail ??= head;
    length += 1;
  }

  // Adds a value at the end of the list.
  void append(E value) {
    if (isEmpty) {
      push(value);
      return;
    }

    tail!.next = Node(value: value, previous: tail);
    tail = tail!.next;
    length += 1;
  }

  // Looking for node from start.
  Node<E>? startNodeAt(int index) {
    var currentNode = head;
    var currentIndex = 0;

    while (currentNode != null && currentIndex < index) {
      currentNode = currentNode.next;
      currentIndex += 1;
    }

    return currentNode;
  }

  // Looking for node from end.
  Node<E>? endNodeAt(int index) {
    var currentNode = tail;
    var currentIndex = 0;

    while (currentNode != null && currentIndex < index) {
      currentNode = currentNode.previous;
      currentIndex += 1;
    }

    return currentNode;
  }

  void insertAfter(Node node, E value) {
    if (tail == node) {
      append(value);
      return;
    }
    final newNode = Node(value: value, next: node.next, previous: node);
    node.next = newNode;
    newNode.next?.previous = newNode;
    length += 1;
  }

  void insertBefore(Node node, E value) {
    if (head == node) {
      push(value);
      return;
    }

    var newNode = Node(value: value, next: node, previous: node.previous);
    node.previous = newNode;
    newNode.previous?.next = newNode;
    length += 1;
  }

  // Removes first element.
  void pop() {
    head = head?.next;
    head?.previous = null;

    if (isEmpty) tail = null;
    length -= 1;
  }

  void removeLast() {
    tail = tail?.previous;
    tail?.next = null;

    if (isEmpty) head = null;
    length -= 1;
  }

  void removeAfter(Node<E> node) {
    if (node.next == tail) {
      tail = node;
    }

    var nextAfterRemoveItem = node.next?.next;
    node.next = nextAfterRemoveItem;
    nextAfterRemoveItem?.previous = node;
    length -= 1;
  }

  void removeBefore(Node<E> node) {
    if (node.previous == head) {
      head = node;
    }

    var prevBeforeRemoveItem = node.previous?.previous;
    prevBeforeRemoveItem?.next = node;
    node.previous = prevBeforeRemoveItem;
    length -= 1;
  }

  void updateAt(Node<E> node, E newValue) {
    var nextItem = node.next;
    var previousItem = node.previous;

    node = Node(value: newValue, next: nextItem, previous: previousItem);

    nextItem?.previous = node;
    previousItem?.next = node;
  }

  @override
  String toString() {
    if (isEmpty) return 'Empty list';
    return head.toString();
  }
}
