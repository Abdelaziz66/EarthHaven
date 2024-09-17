import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/register_model.dart';
import '../../../domain/use_cases/register_usecase.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit({required this.registerUseCase}) : super(RegisterInitial());
  static RegisterCubit get(context) => BlocProvider.of(context);

  final RegisterUseCase registerUseCase;

  bool isVisible = false;
  void changeEye() {
    isVisible = !isVisible;
    emit(ChangeEyeState());
  }

  void register({required RegisterModel registerModel}) async {
    emit(RegisterLoadingState());
    var result = await registerUseCase.call(registerModel);
    result.fold((failure) {
      emit(RegisterErrorState(failure.message));
    }, (right) {
      emit(RegisterSuccessState());
    });
  }
}
