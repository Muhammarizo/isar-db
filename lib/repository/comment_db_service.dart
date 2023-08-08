import 'dart:io';

import 'package:isar/isar.dart';
import 'package:isar_db/service/comment_service.dart';
import 'package:path_provider/path_provider.dart';

import '../models/comments_model.dart';

class CommentDBService {
  late Isar db;

  CommentService commentService = CommentService();

  Future<dynamic> getComment() async {
    dynamic response = await commentService.getComment();
    if (response is List<CommentModel>) {
      await openDB();
      await writeToDB(response);
      return db.commentModels.where().findAll();
    } else {
      return response;
    }
  }

  Future<void> openDB() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();

    /// Isar.instanceNames.isEmpty agar oldin box ochilgan bolsa eskisini oladi yoki yangi yaratadi
    if (Isar.instanceNames.isEmpty) {
      db = await Isar.open([CommentModelSchema], directory: appDocDir.path);
    } else {
      db = await Future.value(Isar.getInstance());
    }
  }

  Future<void> writeToDB(List<CommentModel> data) async {
    db.writeTxn(() async {
      await db.commentModels.clear();
      await db.commentModels.putAll(data);
    });
  }
}
