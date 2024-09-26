import 'package:earth_haven/features/profile/presentation/manager/profile_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/use_cases/get_profile_usecase.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({required this.getUserPostUseCase})
      : super(ProfileInitial());
  static ProfileCubit get(context) => BlocProvider.of(context);




  final GetUserPostUseCase getUserPostUseCase;


  void getUserPost() async {
    emit(PostLoadingState());
    var result = await getUserPostUseCase.call();
    result.fold((failure) {
      emit(PostErrorState(failure.toString()));
    }, (right) {
      PostSuccessState.set(postEntity: right);
      emit(PostSuccessState());
    });
  }

}
