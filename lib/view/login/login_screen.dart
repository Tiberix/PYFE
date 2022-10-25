import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pyfe/controller/app_controller.dart';
import 'package:pyfe/view/login/widgets/login_filter.dart';
import 'package:pyfe/widgets/background_widget.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final _nameController = TextEditingController();
  final _personFormKey = GlobalKey<FormState>();

  String? _fieldValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field can\'t be empty';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'PYFE',
            style: textTheme.headline4!,
          ),
        ),
      ),
      body: BackGroundWidget(
        imagePath: 'assets/images/character_drawing.png',
        child: Form(
          key: _personFormKey,
          child: LoginFilter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Your Name',
                  style: textTheme.headline5!.apply(color: Colors.black87),
                ),
                SizedBox(
                  width: 300,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20, left: 20),
                    child: TextFormField(
                      controller: _nameController,
                      validator: _fieldValidator,
                      style: textTheme.bodyText1!.apply(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            if (_personFormKey.currentState!.validate()) {
                              user = _nameController.text;

                              context.go('/joinGame');
                            }
                          },
                          child: Text(
                            'Join Game',
                            style: textTheme.button!,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: ElevatedButton(
                            onPressed: () {
                              if (_personFormKey.currentState!.validate()) {
                                user = _nameController.text;
                                context.go('/createGame');
                              }
                            },
                            child: Text(
                              'Create Game',
                              style: textTheme.button!,
                            ),
                          ),
                        ),
                      ],
                    ),
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
