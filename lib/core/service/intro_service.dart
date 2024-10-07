import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doen/core/connections/endpoint.dart';
import 'package:doen/core/connections/connection.dart';
import 'package:doen/core/models/intro.dart';
import 'package:doen/core/service/base_service.dart';

class IntroService implements BaseService<Intro> {
  CollectionReference collectionReference;
  List<Intro> datas;

  IntroService() {
    this.collectionReference =
        FirebaseConnection.databaseReference.collection(Endpoint.intro);
  }

  @override
  Future<void> create(Intro entity) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<void> delete(String id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<void> deleteAll() {
    // TODO: implement deleteAll
    throw UnimplementedError();
  }

  @override
  Future<Intro> read(String id) {
    // TODO: implement read
    throw UnimplementedError();
  }

  @override
  Future<List<Intro>> readAll() async {
    try {
      var result = await collectionReference.get();
      datas = result.docs
          .map((data) => Intro.fromJson(data.data(), data.id))
          .toList();
    } catch (e) {}
    return Future.value(datas);
  }

  @override
  Stream<List<Intro>> streamAll() {
    // TODO: implement streamAll
    throw UnimplementedError();
  }

  @override
  Future<void> update(Intro entity, String id) {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  Stream<Intro> stream(String id) {
    // TODO: implement stream
    throw UnimplementedError();
  }
}
