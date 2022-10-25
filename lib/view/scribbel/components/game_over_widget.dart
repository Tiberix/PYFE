import 'package:flutter/material.dart';
import 'package:pyfe/model/room.dart';

class GameOverPage extends StatelessWidget {
  const GameOverPage({Key? key, required this.room}) : super(key: key);

  final Room room;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 40.0),
            child: Text('Words solved by :'),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 120),
            child: SizedBox(
              height: 300,
              child: ListView.builder(
                  itemCount: room.solvedBy.length,
                  itemBuilder: (context, index) {
                    return Text(' ${room.solvedBy[index]}');
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
