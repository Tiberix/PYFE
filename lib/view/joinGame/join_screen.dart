import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pyfe/controller/app_controller.dart';
import 'package:pyfe/controller/db_controller.dart';
import 'package:pyfe/widgets/background_widget.dart';

class JoinPage extends StatelessWidget {
  JoinPage({Key? key}) : super(key: key);
  //final double? height = 600;
  final db = DBcontroller();

  @override
  Widget build(BuildContext context) {
    var getRooms = db.getRoomNames();
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Join Game')),
      ),
      body: BackGroundWidget(
        imagePath: 'assets/images/welcoming.png',
        child: FutureBuilder(
          future: getRooms,
          builder: (context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              List<String> rooms = List.from(snapshot.data.map((e) => e));

              return Padding(
                padding: const EdgeInsets.only(top: 40),
                child: ListView.builder(
                  itemCount: rooms.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(80, 20, 80, 20),
                      child: ElevatedButton(
                          onPressed: () {
                            room = rooms[index];
                            context.go('/mainScribble');
                          },
                          child: Text('Join : ${rooms[index]}')),
                    );
                  },
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
