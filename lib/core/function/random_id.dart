import 'dart:math';

String generateDocumentId() {
  final random = Random();
  final now = DateTime.now().millisecondsSinceEpoch;
  return 'Order $now - Number ${random.nextInt(99999)}';
}
