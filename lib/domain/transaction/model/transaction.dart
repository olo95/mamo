class Transaction {
  final String senderId;
  final String receiverId;
  final double amount;
  final DateTime createdAt;

  Transaction({
    required this.senderId,
    required this.receiverId,
    required this.amount,
    required this.createdAt,
  });
}
