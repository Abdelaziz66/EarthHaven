
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:earth_haven/features/news/presentation/manager/news_cubit.dart';
import '../../../../core/constants/constant.dart';
import '../../../news/data/models/post_model.dart';
import '../../../news/domain/entities/post_entity.dart';


abstract class ProfileRemoteDataSource {
  Future<List<PostEntity>> getUserPost();

}

class ProfileRemoteDataSourceImpl extends ProfileRemoteDataSource {


  @override
  Future<List<PostEntity>> getUserPost() async {
    List<PostEntity> postEntity = [];
    return FirebaseFirestore.instance
        .collection('users').doc(uId).collection('posts')
        .orderBy('date', descending: true)
        .get()
        .then((value) {
      postEntity = _getPostList(value);
      return postEntity;
    });
  }


  List<PostEntity> _getPostList(QuerySnapshot<Map<String, dynamic>> value) {
    List<PostEntity> postEntity = [];
    for (int i = 0; i < value.docs.length; i++) {
      postEntity.add(PostModel.fromJson(value.docs[i].data()));
    }
    return postEntity;
  }

}
