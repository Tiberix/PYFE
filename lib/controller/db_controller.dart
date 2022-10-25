import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:pyfe/controller/app_controller.dart';
import 'package:pyfe/model/message.dart';
import 'package:pyfe/model/next_word.dart';
import 'package:pyfe/model/room.dart';

class DBcontroller {
  FirebaseFirestore firebase = FirebaseFirestore.instance;

  void endGame(String word) {
    List solvedBy = ['$word solved by: $user'];
    firebase.collection('rooms').doc(room).update({
      'solvedBy': FieldValue.arrayUnion(solvedBy),
    });
    firebase.collection('rooms').doc(room).update({'gameOver': true});
  }

  Future<Room> checkRoom() async {
    return Room.fromSnapshot(
        await firebase.collection('rooms').doc(room).get());
  }

  void setNextWord(String word, String prevWord, double rounds) {
    List solvedBy = ['$prevWord solved by: $user'];
    firebase.collection('rooms').doc(room).update({
      'nextWord': word,
      'rounds': rounds - 1,
      'solvedBy': FieldValue.arrayUnion(solvedBy),
    });
  }

  Stream getChatMessages(String roomname) {
    return firebase
        .collection('messages')
        .where('room', isEqualTo: roomname)
        .orderBy('createdAt')
        .limit(15)
        .snapshots();
  }

  Future<void> saveMSG(String text, String roomname, String user) async {
    final data = Message(DateTime.now(), text, roomname, user).toJson();
    try {
      firebase.collection('messages').add(data);
    } catch (e) {
      rethrow;
    }
  }

  Future<List> getRoomNames() async {
    var result = await firebase
        .collection('rooms')
        .where('gameOver', isEqualTo: false)
        .get();

    final rooms = List.from(result.docs.map((e) => e['name']));

    return rooms;
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> getRoom() {
    return firebase.collection('rooms').doc(room).snapshots();
  }

  Future saveImageDB(ByteData image) async {
    final name = DateTime.now().toString();
    final path = 'images/$name';
    final storageRef = FirebaseStorage.instance.ref().child(path);

    storageRef
        .putData(image.buffer.asUint8List(),
            SettableMetadata(contentType: "image/png"))
        .then((p0) => FirebaseFirestore.instance
            .collection('images')
            .doc(room)
            .set({'imageURL': name, 'updatedAt': DateTime.now()}));
  }

  Future addGame(
      String drawer, String name, double players, double rounds) async {
    final data = Room(
        gameOver: false,
        drawer: drawer,
        maxPlayers: players,
        name: name,
        nextWord: NextWord().getNextWord(),
        rounds: rounds,
        solvedBy: []).toJson();

    firebase.collection('rooms').doc(name).set(data);
  }

  Future<String> getUrl(String name) async {
    final path = 'images/$name';
    final storageRef = FirebaseStorage.instance.ref().child(path);
    String url = await storageRef.getDownloadURL();
    return url;
  }

  Stream getRef() {
    //ar result = await firebase.collection('images').doc(room).get();
    //if (result.exists)
    return firebase.collection('images').doc(room).snapshots();
  }

  Future<bool> checkIfDocExists() async {
    try {
      // Get reference to Firestore collection
      var collectionRef = firebase.collection('image');

      var doc = await collectionRef.doc(room).get();
      return doc.exists;
    } catch (e) {
      rethrow;
    }
  }
  //Future createImagePath()async{
  //  firebase.collection('images')
  //          .doc(room)
  //          .set({'imageURL': name, 'updatedAt': DateTime.now()});
  //}
}
