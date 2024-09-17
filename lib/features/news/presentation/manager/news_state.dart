part of 'news_cubit.dart';

sealed class NewsState {}

final class NewsInitial extends NewsState {}
class PostLoadingState extends NewsState {}
class PostSuccessState extends NewsState {
  static List<PostEntity?> postEntity=[];

  static set({required List<PostEntity?> postEntity}) {
    PostSuccessState.postEntity = postEntity;
  }
}
class PostErrorState extends NewsState {
  final String errMessage;
  PostErrorState(this.errMessage);
}

class UploadPostLoadingState extends NewsState {}
class UploadPostSuccessState extends NewsState {
}
class UploadPostErrorState extends NewsState {
  final String errMessage;
  UploadPostErrorState(this.errMessage);
}


class UploadImageLoadingState extends NewsState {}
class UploadImageSuccessState extends NewsState {
}
class UploadImageErrorState extends NewsState {
  final String errMessage;
  UploadImageErrorState(this.errMessage);
}
