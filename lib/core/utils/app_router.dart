import 'package:earth_haven/features/onboarding/presentation/pages/login_or_register.dart';
import 'package:go_router/go_router.dart';

import '../../features/chat/domain/entities/chat_card_entity.dart';
import '../../features/chat/presentation/pages/chat_ui.dart';
import '../../features/layout/presentation/pages/layout.dart';
import '../../features/login/presentation/pages/login.dart';
import '../../features/news/presentation/pages/add_post.dart';
import '../../features/onboarding/presentation/pages/onboarding.dart';
import '../../features/register/presentation/pages/register.dart';
import '../../features/scan/data/models/plant_model.dart';
import '../../features/scan/domain/entities/plant_entity.dart';
import '../../features/scan/presentation/pages/plant_details.dart';
import '../constants/constant.dart';

abstract class AppRouter {
  static const kLayout = '/Layout';
  static const kLogin = '/Login';
  static const kRegister = '/Register';
  static const kOnboarding = '/Onboarding';
  static const kLoginOrRegister = '/LoginOrRegister';
  static const kAddPostScreen = '/AddPostScreen';
  static const kChatPage = '/ChatPage';
  static const kPlantDetails = '/PlantDetails';

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => isLogin!
            ? const Layout()
            : isOnboarding!
                ? const LoginOrRegister()
                : const Onboarding(),
      ),
      GoRoute(
        path: kLayout,
        builder: (context, state) => const Layout(),
      ),
      GoRoute(
        path: kLogin,
        builder: (context, state) => const Login(),
      ),
      GoRoute(
        path: kRegister,
        builder: (context, state) => const Register(),
      ),
      GoRoute(
        path: kOnboarding,
        builder: (context, state) => const Onboarding(),
      ),
      GoRoute(
        path: kLoginOrRegister,
        builder: (context, state) => const LoginOrRegister(),
      ),
      GoRoute(
        path: kAddPostScreen,
        builder: (context, state) => const AddPostScreen(),
      ),
      GoRoute(
        path: kChatPage,
        builder: (context, state) => ChatPage(
          chatCardEntity: state.extra as ChatCardEntity, // Cast the extra parameter to the correct type
        ),
      ),
      GoRoute(
        path: kPlantDetails,
        builder: (context, state) => PlantDetails(
          plantInfoEntity: state.extra as PlantInfoEntity, // Cast the extra parameter to the correct type
        ),
      ),
    ],
  );
}
