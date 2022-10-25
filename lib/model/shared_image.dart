import 'package:pyfe/controller/db_controller.dart';

class SharedImage {
  Future<void> createImageStream() async {
    bool docExists = await DBcontroller().checkIfDocExists();
    if (!docExists) {}
  }

  // Stream getImageStream() {}
}
