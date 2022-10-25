import 'package:flutter/material.dart';
import 'package:pyfe/controller/app_controller.dart';
import 'package:pyfe/controller/db_controller.dart';
import 'package:pyfe/model/room.dart';
import 'package:pyfe/view/scribbel/components/game_over_widget.dart';
import 'package:pyfe/view/scribbel/scribbel_painter_vc.dart';
import 'package:pyfe/view/scribbel/scribbel_viewer_vc.dart';

class ScribbelMainPage extends StatelessWidget {
  const ScribbelMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('PYFE', style: Theme.of(context).textTheme.headline4!),
        ),
      ),
      body: StreamBuilder(
          stream: DBcontroller().getRoom(),
          builder: (_, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              Room room = Room.fromSnapshot(snapshot.data);
              return !room.gameOver
                  ? room.drawer == user
                      ? ScribbelPage(room: room)
                      : ScribbelViewPage(room: room)
                  : GameOverPage(room: room);
            }
          }),
    );
  }
}
