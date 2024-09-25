
import '../../../news/domain/entities/post_entity.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}
class PostLoadingState extends ProfileState {}
class PostSuccessState extends ProfileState {
  static List<PostEntity?> postEntity=[];

  static set({required List<PostEntity?> postEntity}) {
    PostSuccessState.postEntity = postEntity;
  }
}
class PostErrorState extends ProfileState {
  final String errMessage;
  PostErrorState(this.errMessage);
}
