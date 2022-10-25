class PocketRoom {
  double id;
  DateTime created;
  DateTime updated;
  bool gameOver;
  String drawer;
  double maxPlayers;
  String name;
  String nextWord;
  double rounds;

  PocketRoom(
      {required this.id,
      required this.created,
      required this.updated,
      required this.gameOver,
      required this.drawer,
      required this.maxPlayers,
      required this.name,
      required this.nextWord,
      required this.rounds});

  PocketRoom.fromSnapshot(snapshot)
      : id = snapshot.data()['id'],
        created = snapshot.data()['created'],
        updated = snapshot.data()['updated'],
        gameOver = snapshot.data()['gameOver'],
        drawer = snapshot.data()['drawer'],
        maxPlayers = snapshot.data()['maxPlayers'],
        name = snapshot.data()['name'],
        nextWord = snapshot.data()['nextWord'],
        rounds = snapshot.data()['rounds'];

  Map<String, dynamic> toJson() => {
        'gameOver': gameOver,
        'drawer': drawer,
        'maxPlayers': maxPlayers,
        'name': name,
        'nextWord': nextWord,
        'rounds': rounds,
      };
}
