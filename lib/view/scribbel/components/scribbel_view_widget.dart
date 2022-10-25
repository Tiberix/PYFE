import 'package:flutter/material.dart';
import 'package:pyfe/controller/db_controller.dart';

class ScribbleView extends StatelessWidget {
  const ScribbleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: DBcontroller().getRef(),
      builder: (context, AsyncSnapshot snapshot) {
        return !snapshot.hasData
            ? const Center(child: CircularProgressIndicator())
            : FutureBuilder(
                future: DBcontroller().getUrl(snapshot.data!['imageURL']),
                builder: (context, AsyncSnapshot snap) {
                  return !snap.hasData
                      ? const Center(child: CircularProgressIndicator())
                      : Image.network(snap.data);
                },
              );
      },
    );
  }
}
