class Node<T> {
  final T value;
  Node<T>? next;
  Node<T>? previous;

  Node({
    required this.value,
    this.next,
    this.previous,
  });

  @override
  String toString() {
    if (next == null) return '$value';
    return '$value -> ${next.toString()}';
  }
}
