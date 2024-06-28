
class Mail {
  final String sender;
  final String sub;
  final String msg;
  final String date;
  final bool isUnread;

  Mail({
    required this.sender,
    required this.sub,
    required this.msg,
    required this.date,
    required this.isUnread,
  });
}
