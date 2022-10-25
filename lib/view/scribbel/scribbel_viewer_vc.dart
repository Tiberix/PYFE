import 'package:flutter/material.dart';
import 'package:pyfe/model/room.dart';
import 'package:pyfe/view/scribbel/components/chat_widget.dart';
import 'package:pyfe/view/scribbel/components/scribbel_view_widget.dart';

class ScribbelViewPage extends StatelessWidget {
  const ScribbelViewPage({
    Key? key,
    required this.room,
  }) : super(key: key);

  final Room room;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
        child: Chip(
          avatar: const CircleAvatar(child: Icon(Icons.lock_clock)),
          label: Text(' ${room.rounds}'),
        ),
      ),
      const Expanded(flex: 6, child: ScribbleView()),
      const SizedBox(height: 160, child: NewChat()),
    ]);
  }
}
