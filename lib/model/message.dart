class Message {
  final DateTime createdAt;
  final String message;
  final String room;
  final String user;

  Message(this.createdAt, this.message, this.room, this.user);

  Message.fromSnapshot(snapshot)
      : createdAt = snapshot.data()['createdAt'],
        message = snapshot.data()['message'],
        room = snapshot.data()['room'],
        user = snapshot.data()['user'];

  Map<String, dynamic> toJson() => {
        'createdAt': createdAt,
        'message': message,
        'room': room,
        'user': user,
      };
}
