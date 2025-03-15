class ChatModel {
  final String id;
  final List<MessageModel>? messages;
  final String createdAt;
  final bool userClose;
  final bool interpreterClose;
  final bool doneExplanation;
  final String userName;
  final String interpreterName;
  final String ro2yaName;
  ChatModel(
      {required this.id,
      this.messages,
      required this.createdAt,
      required this.userClose,
      required this.interpreterClose,
      required this.userName,
      required this.interpreterName,
      required this.ro2yaName,
      required this.doneExplanation});

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
        id: json['id'],
        messages: json['chats'] == null
            ? []
            : List<MessageModel>.from(
                json['chats'].map((x) => MessageModel.fromJson(x))),
        createdAt: json['created_at'],
        userClose: json['user_colse'],
        interpreterClose: json['interpreter_close'],
        userName: json['user_name'],
        interpreterName: json['interpreter_name'],
        ro2yaName: json['ro2ya_title'],
        doneExplanation: json['done_explanation']);
  }
  @override
  String toString() {
    return 'ChatModel{id: $id, messages: $messages, createdAt: $createdAt, userClose: $userClose, interpreterClose: $interpreterClose}';
  }
}

class MessageModel {
  final String id;
  final String message;

  MessageModel({required this.id, required this.message});

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      id: json['id'],
      message: json['message'],
    );
  }
  @override
  String toString() {
    return 'MessageModel{id: $id, message: $message}';
  }
}
