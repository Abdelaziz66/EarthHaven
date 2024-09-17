import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:earth_haven/core/functions/custom_snack_bar_message.dart';
import 'package:earth_haven/features/news/domain/entities/post_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/constants/constant.dart';
import '../../domain/use_cases/get_post_usecase.dart';
import '../../domain/use_cases/upload_image_usecase.dart';
import '../../domain/use_cases/upload_post_usecase.dart';
part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit(
      {required this.uploadImageUseCase,
      required this.uploadPostUseCase,
      required this.getPostUseCase})
      : super(NewsInitial());

  static NewsCubit get(context)=>BlocProvider.of(context);

  final GetPostUseCase getPostUseCase;
  final UploadPostUseCase uploadPostUseCase;
  final UploadImageUseCase uploadImageUseCase;

  void getPost() async {
    emit(PostLoadingState());
    var result = await getPostUseCase.call();
    result.fold((failure) {
      emit(PostErrorState(failure.toString()));
    }, (right) {
      // PostSuccessState.set(postEntity: right);
      emit(PostSuccessState());
    });
  }

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
      var result = await uploadImageUseCase.call(postImage);
    result.fold((failure) {}, (right) async {
      PostEntity postEntity = PostEntity(
          userName: loginEntity!.name,
          uId: uId,
          image: right,
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
    });
  }

  var picker = ImagePicker();
  File? postImage;
  Future<void> pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      postImage = File(pickedFile.path);
    }
  }
}
