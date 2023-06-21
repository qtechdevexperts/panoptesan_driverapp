class NotificationModel {
  final int id;
  final int senderId;
  final String type;
  final String receiverId;
  final String body;
  final DateTime createdAt;
  final DateTime updatedAt;

  NotificationModel({
    required this.id,
    required this.senderId,
    required this.type,
    required this.receiverId,
    required this.body,
    required this.createdAt,
    required this.updatedAt,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'] as int,
      senderId: json['sender_id'] as int,
      type: json['type'] as String,
      receiverId: json['receiver_id'] as String,
      body: json['body'] as String,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );
  }
}
