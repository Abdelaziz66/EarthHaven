import 'package:earth_haven/features/chat/presentation/pages/chat.dart';
import 'package:earth_haven/features/dashboard/presentation/pages/dashboard.dart';
import 'package:earth_haven/features/news/presentation/pages/news.dart';
import 'package:earth_haven/features/scan/presentation/pages/scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../profile/presentation/pages/profile.dart';
part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutInitial());
  static LayoutCubit get(context) => BlocProvider.of(context);

  int currentNavigationBarIndex = 0;
  List<Widget> navigationBarScreens = [
    const Dashboard(),
    const News(),
    const Scan(),
    const Chat(),
    const Profile(),
  ];
  void onTapNavigationBar(index) {
    currentNavigationBarIndex = index;
    emit(NavigationBarState());
  }
}
