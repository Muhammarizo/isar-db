import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar_db/repository/comment_db_service.dart';

import '../models/comments_model.dart';

part 'comment_state.dart';

class CommentCubit extends Cubit<CommentState> {
  CommentCubit() : super(CommentInitial()) {
    getComment();
  }

  CommentDBService commentDBService = CommentDBService();

  Future<dynamic> getComment() async {
    emit(const CommentLoading());
    dynamic response = await commentDBService.getComment();
    if (response is List<CommentModel>) {
      emit(CommentComplete(response));
    } else {
      emit(CommentError(response));
    }
  }
}
