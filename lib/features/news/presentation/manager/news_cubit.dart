import 'dart:io';

import 'package:earth_haven/features/news/domain/entities/post_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/constants/constant.dart';
import '../../domain/use_cases/add_like.dart';
import '../../domain/use_cases/get_post_usecase.dart';
import '../../domain/use_cases/remove_like.dart';
import '../../domain/use_cases/upload_image_usecase.dart';
import '../../domain/use_cases/upload_post_usecase.dart';
part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit(
      {required this.uploadImageUseCase,
      required this.uploadPostUseCase,
      required this.getPostUseCase,
        required   this.removeLikeUseCase,
        required   this.addLikeUseCase,
      })
      : super(NewsInitial());

  static NewsCubit get(context)=>BlocProvider.of(context);

  final GetPostUseCase getPostUseCase;
  final UploadPostUseCase uploadPostUseCase;
  final UploadImageUseCase uploadImageUseCase;
  final RemoveLikeUseCase removeLikeUseCase;
  final AddLikeUseCase addLikeUseCase;

  void getPost() async {
    emit(PostLoadingState());
    var result = await getPostUseCase.call();
    result.fold((failure) {
      emit(PostErrorState(failure.toString()));
    }, (right) {
      PostSuccessState.set(postEntity: right);
      emit(PostSuccessState());
    });
  }

  // Future<Stream<List<PostEntity>>> getPostStream() async {
  //   emit(PostLoadingState());
  //   Stream<List<PostEntity>>? x;
  //   var result = await getPostUseCase.call();
  //   result.fold((failure) {
  //     emit(PostErrorState(failure.toString()));
  //   }, (right) {
  //     // PostSuccessState.set(postEntity: right);
  //     print(right);
  //     print(right.length);
  //     print(right.length);
  //     print(right.length);
  //     print(right.length);
  //     print(right.length);
  //     return right;
  //     emit(PostSuccessState());
  //   });
  //   return x!;
  //
  // }

  void uploadPost({required String caption,String? tag}) async {
    emit(UploadPostLoadingState());
    if (postImage != null) {
      await uploadPostWithImage(caption, tag);
    } else {
        await uploadPostWithoutImage(caption, tag);
    }
  }

  Future<void> uploadPostWithoutImage(String caption, String? tag) async {
     PostEntity postEntity = PostEntity(
      userName: loginEntity!.name,
      uId: uId,
      image: '',
      caption: caption,
      tag: tag??'',
      postId: '',
      userProfileImage: loginEntity!.profileImage,
      date:  DateTime.now().toString(),);
    var uploadPostResult = await uploadPostUseCase.call(postEntity);
    uploadPostResult.fold((failure) {
      emit(UploadPostErrorState(failure.toString()));
    }, (right) {
      emit(UploadPostSuccessState());
    });
  }

  Future<void> uploadPostWithImage(String caption, String? tag) async {
    emit(UploadImageLoadingState());

    var result = await uploadImageUseCase.call(postImage);
    result.fold((failure) {
    }, (right) async {
      PostEntity postEntity = PostEntity(
          userName: loginEntity!.name,
          uId: uId,
          image: right,
          caption: caption,
          tag: tag??'',
          postId: '',
          userProfileImage: loginEntity!.profileImage,
          date:  DateTime.now().toString(),);
      emit(UploadPostLoadingState());
      var uploadPostResult = await uploadPostUseCase.call(postEntity);
      uploadPostResult.fold((failure) {
        emit(UploadPostErrorState(failure.toString()));
      }, (right) {
        emit(UploadPostSuccessState());
      });
    });
  }

  void addLike({required String postId}) async {
    for (int i = 0; i < PostSuccessState.postEntity.length; i++) {
      if (PostSuccessState.postEntity[i]?.postId == postId) {
        if (PostSuccessState.postEntity[i]!.like) {
          break;
        }
        PostSuccessState.postEntity[i]?.like = true;
        PostSuccessState.postEntity[i]?.numberOfLike++;
        emit(ChangeLikeSuccessState());
        break;
      }
    }

    await addLikeCloud(postId: postId);
  }

  void removeLike({required String postId}) async {
    for (int i = 0; i < PostSuccessState.postEntity.length; i++) {
      if (PostSuccessState.postEntity[i]?.postId == postId) {
        if (PostSuccessState.postEntity[i]!.like==false) {
          break;
        }
        PostSuccessState.postEntity[i]?.like = false;
        PostSuccessState.postEntity[i]?.numberOfLike--;
        emit(ChangeLikeSuccessState());
        break;
      }
    }
    await removeLikeCloud(postId: postId);
  }

  Future<void> removeLikeCloud({required String postId}) async {
    if (uId != null) {
      var result = await removeLikeUseCase.call(postId);
      result.fold((failure) {
        emit(RemoveLikeErrorState(failure.message));
      }, (r) {
        emit(RemoveLikeSuccessState());
      });
    }
  }

  Future<void> addLikeCloud({required String postId}) async {
      var result = await addLikeUseCase.call(postId);

      result.fold((failure) {
        emit(AddLikeErrorState(failure.message));
      }, (r) {
        emit(AddLikeSuccessState());
      });

  }

  var picker = ImagePicker();
  File? postImage;
  Future<void> pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      postImage = File(pickedFile.path);
      emit(ImagePickedSuccessState(postImage:postImage));
    }
  }
}
