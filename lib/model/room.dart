class Room {
  bool gameOver;
  String drawer;
  double maxPlayers;
  String name;
  String nextWord;
  double rounds;
  List solvedBy;

  Room(
      {required this.gameOver,
      required this.drawer,
      required this.maxPlayers,
      required this.name,
      required this.nextWord,
      required this.rounds,
      required this.solvedBy});

  Room.fromSnapshot(snapshot)
      : gameOver = snapshot.data()['gameOver'],
        drawer = snapshot.data()['drawer'],
        maxPlayers = snapshot.data()['maxPlayers'],
        name = snapshot.data()['name'],
        nextWord = snapshot.data()['nextWord'],
        rounds = snapshot.data()['rounds'],
        solvedBy = snapshot.data()['solvedBy'];

  Map<String, dynamic> toJson() => {
        'gameOver': gameOver,
        'drawer': drawer,
        'maxPlayers': maxPlayers,
        'name': name,
        'nextWord': nextWord,
        'rounds': rounds,
      };
}
