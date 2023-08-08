part of 'comment_cubit.dart';

abstract class CommentState extends Equatable {
  const CommentState();

  @override
  List<Object> get props => [];
}

class CommentInitial extends CommentState {
  @override
  List<Object> get props => [];
}

class CommentLoading extends CommentState {
  const CommentLoading();

  @override
  List<Object> get props => [];
}

class CommentComplete extends CommentState {
  final List<CommentModel> data;

  const CommentComplete(this.data);

  @override
  List<Object> get props => [data];
}

class CommentError extends CommentState {
  final String error;

  const CommentError(this.error);

  @override
  List<Object> get props => [error];
}
