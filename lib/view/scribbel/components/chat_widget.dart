import 'package:flutter/material.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:pyfe/controller/app_controller.dart';
import 'package:pyfe/controller/db_controller.dart';
import 'package:pyfe/model/next_word.dart';

class NewChat extends StatelessWidget {
  const NewChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: DBcontroller().getChatMessages(room),
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            List<String> msgs =
                List.from(snapshot.data!.docs.map((e) => e['message']));
            List<String> userList =
                List.from(snapshot.data!.docs.map((e) => e['user']));
            return Column(
              children: [
                SizedBox(
                  height: 80,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: msgs.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                userList[msgs.length - index - 1],
                                style: const TextStyle(
                                    color: Color(0xFF1B97F3), fontSize: 12),
                              ),
                              BubbleNormal(
                                text: msgs[msgs.length - index - 1],
                                isSender: false,
                                color: const Color(0xFF1B97F3),
                                tail: true,
                                textStyle: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
                SizedBox(
                  height: 80,
                  child: MessageBar(
                    onSend: (_) {
                      DBcontroller().saveMSG(_, room, user);
                      NextWord().checkNextWord(_);
                    },
                  ),
                ),
              ],
            );
          }
        });
  }
}
