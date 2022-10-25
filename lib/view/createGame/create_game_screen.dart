import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:pyfe/controller/app_controller.dart';
import 'package:pyfe/controller/db_controller.dart';
import 'package:pyfe/view/createGame/widgets/filter_widget.dart';
import 'package:pyfe/widgets/background_widget.dart';

class CreateGamePage extends StatelessWidget {
  CreateGamePage({Key? key}) : super(key: key);

  final _nameController = TextEditingController();
  final _personFormKey = GlobalKey<FormState>();
  final db = DBcontroller();

  String? _fieldValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field can\'t be empty';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    double numberOfPlayer = 3;
    double numberOfRounds = 3;

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Create Game')),
      ),
      body: BackGroundWidget(
        imagePath: 'assets/images/image_viewer.png',
        child: Form(
          key: _personFormKey,
          child: Filter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Number of Players'),
                const SizedBox(height: 20),
                RatingBar.builder(
                  initialRating: 3,
                  minRating: 1,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return const Icon(
                      Icons.account_box,
                      color: Colors.amber,
                    );
                  },
                  onRatingUpdate: (double value) {
                    numberOfPlayer = value;
                  },
                ),
                const SizedBox(height: 20),
                const Text('Number of Rounds'),
                const SizedBox(height: 20),
                RatingBar.builder(
                  initialRating: 3,
                  minRating: 1,
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return const Icon(
                      Icons.radar,
                      color: Colors.amber,
                    );
                  },
                  onRatingUpdate: (double value) {
                    numberOfRounds = value;
                  },
                ),
                const SizedBox(height: 20),
                const Text('Name of the Game'),
                SizedBox(
                  width: 300,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20, left: 20),
                    child: TextFormField(
                      controller: _nameController,
                      validator: _fieldValidator,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (_personFormKey.currentState!.validate()) {
                            db.addGame(user, _nameController.text,
                                numberOfPlayer, numberOfRounds);
                            room = _nameController.text;
                            context.go('/mainScribble');
                          }
                        },
                        child: const Text('Create Game'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
