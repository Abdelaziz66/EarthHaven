import 'package:earth_haven/features/profile/presentation/manager/profile_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit()
      : super(ProfileInitial());
  static ProfileCubit get(context) => BlocProvider.of(context);


}
