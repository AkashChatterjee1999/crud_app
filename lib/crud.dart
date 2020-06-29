import 'package:cloud_firestore/cloud_firestore.dart';
class CRUD{
    String id;
    final db = Firestore.instance;
    Future<void> addData(Map<String,dynamic> data) async{
      db.collection('crud').add(data).catchError((e){
        print(e);
      });
    }
}