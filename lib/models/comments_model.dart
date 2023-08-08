
import 'dart:convert';
import 'package:isar/isar.dart';

part "comments_model.g.dart";

@collection
class CommentModel {
  Id isarId = Isar.autoIncrement;
  final int? postId;
  final int? id;
  final String? name;
  final String? email;
  final String? body;


  CommentModel({
    this.postId,
    this.id,
    this.name,
    this.email,
    this.body,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) => CommentModel(
    postId: json["postId"],
    id: json["id"],
    name: json["name"],
    email: json["email"],
    body: json["body"],
  );

  Map<String, dynamic> toJson() => {
    "postId": postId,
    "id": id,
    "name": name,
    "email": email,
    "body": body,
  };
}
