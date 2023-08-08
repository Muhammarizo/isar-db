import 'package:dio/dio.dart';
import 'package:isar_db/core/constants.dart';
import 'package:isar_db/models/comments_model.dart';

class CommentService {
  Future<dynamic> getComment() async {
    try {
      Response response = await Dio().get(Constants.url);
      if (response.statusCode == 200) {
        return (response.data as List).map((e) => CommentModel.fromJson(e)).toList();
      } else {
        return response.statusMessage.toString();
      }
    } on DioError catch (e) {
      return e.message.toString();
    }
  }
}
