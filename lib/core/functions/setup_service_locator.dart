import 'package:earth_haven/features/chat/data/repositories/chat_card_repo_impl.dart';
import 'package:get_it/get_it.dart';

import '../../features/chat/data/data_sources/chat_remote_data_source.dart';
import '../../features/chat/domain/use_cases/get_chat_card_usecase.dart';
import '../../features/login/data/data_sources/login_remote_data_source.dart';
import '../../features/login/data/repositories/login_repo_impl.dart';
import '../../features/news/data/data_sources/post_remote_data_source.dart';
import '../../features/news/data/repositories/post_repo_impl.dart';
import '../../features/register/data/data_sources/register_remote_data_source.dart';
import '../../features/register/data/repositories/register_repo_impl.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {

  getIt.registerSingleton<LoginRepoImpl>(
    LoginRepoImpl(loginRemoteDataSource: LoginRemoteDataSourceImpl()),
  );
  getIt.registerSingleton<PostRepoImpl>(
      PostRepoImpl(postRemoteDataSource: PostRemoteDataSourceImpl())  );

  getIt.registerSingleton<RegisterRepoImpl>(
      RegisterRepoImpl(registerRemoteDataSource: RegisterRemoteDataSourceImpl(), )  );

  getIt.registerSingleton<ChatCardRepoImpl>(
 ChatCardRepoImpl(chatCardRemoteDataSource: ChatCardRemoteDataSourceImpl()) );


}
