import 'package:flutter/material.dart';
import 'package:pyfe/model/room.dart';
import 'package:pyfe/view/scribbel/components/chat_widget.dart';
import 'package:pyfe/view/scribbel/components/scribbel_widget.dart';

class ScribbelPage extends StatelessWidget {
  const ScribbelPage({Key? key, required this.room}) : super(key: key);

  final Room room;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
          child: Chip(
        avatar: const CircleAvatar(
          child: Icon(Icons.palette),
        ),
        label: Text(' ${room.nextWord}'),
      )),
      const Expanded(flex: 6, child: ScribbleWidget()),
      const SizedBox(height: 160, child: NewChat()),
    ]);
  }
}
