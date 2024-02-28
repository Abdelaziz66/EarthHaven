import 'dart:io';
// import 'dart:js_interop';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:xfirebase/models/user/chatmodel.dart';
import 'package:xfirebase/models/user/createpost.dart';

import '../../models/user/Post_model.dart';
import '../../models/user/create user.dart';
import '../../models/user/likemodel.dart';
import '../../modules/N_Screen/S1.dart';
import '../../modules/N_Screen/S2.dart';
import '../../modules/N_Screen/S3.dart';
import '../../modules/N_Screen/S4.dart';
import '../constant.dart';
import 'App_state.dart';

class App_cubit extends Cubit<App_state> {
  App_cubit() : super(App_ini_state());
  static App_cubit get(context) => BlocProvider.of(context);

// Navigation bar >>>>>>>>>>>>>>>>>>>>>>>>>>>>
  List<Widget> NavBar = [S1(), S2(), S3(), S4()];
  int NavBar_index = 0;
  void NavBar_M({required index}) {
    if (index == 1) {
      NavBar_index = index;
      emit(NavBar_state());
      getchatuser_Function();
    } else if (index == 0) {
      // if(NavBar_index==index){
      //   NavBar_index = index;
      //   emit(NavBar_state());
      //   Get_PostData_Function();
      //
      // }else{
      //   NavBar_index = index;
      //   emit(NavBar_state());
      //   Get_PostData_Function();
      // }
      // x3();
      NavBar_index = index;
      emit(NavBar_state());
    } else if (index == 2) {
      NavBar_index = index;
      emit(NavBar_state());
    } else {
      NavBar_index = index;
      emit(NavBar_state());
    }
  }

// Verfiy Function >>>>>>>>>>>>>>>>>>>>>>>>>>>>
  void verfiy_Function() {
    emit(verfiy_state());
  }

  // Current user Function >>>>>>>>>>>>>>>>>>>>>>>>>>>>

  user_model? model;
  Future<void> Get_User_Data_Function() async {
    emit(GetData_loading_state());
    await FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .get()
        .then((value) {
      // print(value.data());
      model = user_model.fromjson(value.data());

      emit(GetData_success_state());
    }).catchError((error) {
      print(error.toString());
      emit(GetData_error_state(error.toString()));
    });
  }

  var picker = ImagePicker();
  File? image;
  Future<void> Get_image_Function() async {
    final pickedfile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedfile != null) {
      image = File(pickedfile.path);
      emit(Getimage_success_state());
    } else {
      print('no image selected');
      emit(Getimage_error_state());
    }
  }

  FirebaseStorage storage = FirebaseStorage.instance;
  String? imageURL = '';
  Future<void> uploadprofileimage_Function() async {
    emit(uploadimage_loading_state());
    await storage
        .ref()
        .child('users/${Uri.file(image!.path).pathSegments.last}')
        .putFile(image!)
        .then((value) async {
      print(value);
      await value.ref.getDownloadURL().then((value) {
        imageURL = value;
        emit(uploadimage_success_state());
      }).catchError((error) {
        print(error);
        emit(uploadimage_error_state());
      });
    }).catchError((error) {
      print(error);
      emit(uploadimage_error_state());
    });
  }

  Future<void> updateuser_function(
      {required String? name,
      required String? bio,
      required String? phone}) async {
    if (image != null) {
      await uploadprofileimage_Function().then((value) async {
        user_model model2 = user_model(
          bio: bio,
          isemailV: false,
          name: name,
          phone: phone,
          image: imageURL,
          email: model?.email,
          uid: model?.uid,
        );
        await FirebaseFirestore.instance
            .collection('users')
            .doc(model!.uid)
            .update(model2.tomap())
            .then((value) {
          emit(updateprofile_success_state());
          Get_User_Data_Function();
        }).catchError((error) {
          emit(updateprofile_error_state());
        });
      });
    } else {
      user_model model2 = user_model(
        bio: bio,
        isemailV: false,
        name: name,
        phone: phone,
        image: model?.image,
        email: model?.email,
        uid: model?.uid,
      );
      await FirebaseFirestore.instance
          .collection('users')
          .doc(model!.uid)
          .update(model2.tomap())
          .then((value) {
        emit(updateprofile_success_state());
        Get_User_Data_Function();
      }).catchError((error) {
        emit(updateprofile_error_state());
      });
    }
  }

  // Chat Function Here >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  List<user_model>? card_chat_list = [];
  void getchatuser_Function() async {
    emit(Getchatuser_loading_state());

    card_chat_list = [];
    await FirebaseFirestore.instance.collection('users').get().then((value) {
      for (var element in value.docs) {
        card_chat_list?.add(user_model.fromjson(element.data()));
      }
      emit(Getchatuser_success_state());
    }).catchError((error) {
      emit(Getchatuser_error_state());
    });
  }

  List<Chat_model>? chat_model_list = [];
  void SendChat_Function(
      {required String? reciverid,
      required String? text,
      required String? datetime}) {
    emit(SendChat_loading_state());
    Chat_model? chatmodelformap = Chat_model(
      text: text,
      date: datetime,
      reciverid: reciverid,
      senderid: model?.uid,
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(model?.uid)
        .collection('chats')
        .doc(reciverid)
        .collection('messages')
        .add(chatmodelformap.tomap())
        .then((value) {
      // value.docs.forEach((element) {
      //   card_chat_list?.add(user_model.fromjson(element.data()));
      // });
      emit(SendChat_success_state());
    }).catchError((error) {});
    FirebaseFirestore.instance
        .collection('users')
        .doc(reciverid)
        .collection('chats')
        .doc(model?.uid)
        .collection('messages')
        .add(chatmodelformap.tomap())
        .then((value) {
      // value.docs.forEach((element) {
      //   card_chat_list?.add(user_model.fromjson(element.data()));
      // });
      emit(SendChat_success_state());
    }).catchError((error) {
      emit(SendChat_error_state());
    });
  }

  void GetChat_Function({required String? reciverid}) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(model?.uid)
        .collection('chats')
        .doc(reciverid)
        .collection('messages')
        .orderBy('date')
        .snapshots()
        .listen((event) {
      chat_model_list = [];
      for (var element in event.docs) {
        chat_model_list?.add(Chat_model.fromjson(element.data()));
      }
      emit(getChat_success_state());
    });
  }

// Post Function Here >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  Future<void> likepost_Function({required String? postId,required index}) async {

    likemodellist![index].uIds!.add(model!.uid!);
    emit(addlikepost_loading_state());
    await FirebaseFirestore.instance
        .collection('posts')
        .doc(postId)
        .collection('like')
        .doc(model?.uid)
        .set({'like': true}).then((value) {
         emit(addlikepost_success_state());
    }).catchError((error) {
      emit(addlikepost_error_state());
    });
  }

  Future<void> unlikepost_Function({required String? postId,required index}) async {

    likemodellist![index].uIds!.remove(model!.uid!);
    emit(remove_likepost_loading_state());
    await FirebaseFirestore.instance
        .collection('posts')
        .doc(postId)
        .collection('like')
        .doc(model?.uid).delete()
        .then((value) {
      emit(remove_likepost_success_state());
    }).catchError((error) {
      emit(remove_likepost_error_state());
    });
  }

  Future<void> addpost_function(
      {required String? text, required String? tag}) async {
    if (postimage != null) {
      await uploadpostimage_Function().then((value) async {
        emit(addpost_loading_state());
        AddPost_model postmodel = AddPost_model(
          text: text,
          tag: tag,
          name: model?.name,
          image: postimageURL,
          uid: model?.uid,
          postId: '',
          profileimage: model?.image,
          date: DateTime.now().toString(),
        );
        await FirebaseFirestore.instance
            .collection('posts')
            .add(postmodel.tomap())
            .then((value) {
          emit(addpost_success_state());
          postimageURL='';
          postimage=null;

        }).catchError((error) {
          emit(addpost_error_state());
        });
      });
    } else {
      emit(addpost_loading_state());
      AddPost_model postmodel = AddPost_model(
        text: text,
        tag: tag,
        name: model?.name,
        image: postimageURL,
        uid: model?.uid,
        postId: '',
        profileimage: model?.image,
        date: DateTime.now().toString(),
      );
      await FirebaseFirestore.instance
          .collection('posts')
          .add(postmodel.tomap())
          .then((value) {
        emit(addpost_success_state());
      }).catchError((error) {
        emit(addpost_error_state());
      });
    }
  }

  File? postimage;
  Future<void> Get_postimage_Function() async {
    final pickedfile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedfile != null) {
      postimage = File(pickedfile.path);
      emit(Getpostimage_success_state());
    } else {
      print('no image selected');
      emit(Getpostimage_error_state());
    }
  }

  String? postimageURL = '';
  Future<void> uploadpostimage_Function() async {
    emit(uploadpostimage_loading_state());
    await storage
        .ref()
        .child('posts/${Uri.file(postimage!.path).pathSegments.last}')
        .putFile(postimage!)
        .then((value) async {
      print(value);
      await value.ref.getDownloadURL().then((value) {
        postimageURL = value;
        emit(uploadpostimage_success_state());
      }).catchError((error) {
        print(error);
        emit(uploadpostimage_error_state());
      });
    }).catchError((error) {
      print(error);
      emit(uploadpostimage_error_state());
    });
  }

  List<Postinfo_model>? postlist = [];
  List<String>? postIdlist = [];
  List<String>? namelist = [];
  List<String>? Pimagelist = [];
  Map<String, dynamic>? M;
  List<like_model>? likemodellist = [];


  Future<void> Get_PostData_Function() async {
    emit(GetPostData_loading_state(true));
    await FirebaseFirestore.instance
        .collection('posts')
        .orderBy('date', descending: true)
        .snapshots()
        .listen((event) async {
      postlist = [];
      postIdlist = [];
      namelist = [];
      Pimagelist = [];
      likemodellist = [];

      await x1(event: event);
      await x2();
      await x3();
      // emit(GetPostData_success_state());
    });
  }

  Future<void> x1({required event}) async {
    event.docs.forEach((e1) async {
      postlist?.add(Postinfo_model.fromjson(await e1.data()));
      postIdlist?.add(await e1.id);
    });
  }

  Future<void> x2() async {
    // print('length of post list = ${postlist?.length}');
    // print(likemodellist);
    postlist?.forEach((e2) async {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(e2.uid)
          .get()
          .then((value) async {
        M = value.data();
        namelist?.add(await M?['name']);
        Pimagelist?.add(await M?['image']);
      }).catchError((onError) {
        print(onError);
      });
    });
  }

  Future<void> x3() async {
    for (int i = 0; i < postIdlist!.length; i++) {
      await FirebaseFirestore.instance
          .collection('posts')
          .doc(postIdlist?[i])
          .collection('like')
          .get()
          .then((event) {
            List<String>? uIds=[];
            String? pIds=postIdlist![i];
            int count=0;
            if(event.docs.isEmpty){
              // print('element is empty');
              like_model? lm=like_model();
              lm.uIds=uIds;
              lm.pId=pIds;
              likemodellist?.add(lm);
              uIds=[];
            }
            event.docs.forEach((element) {

              // likeId_list?.add(element.id);
              // likemodellist![i].pId=postIdlist![i];
              // likemodellist![i].uIds?.add(element.id);
              uIds?.add(element.id);
              count=count+1;
              if(event.docs.length==count){
                like_model? lm=like_model();
                lm.uIds=uIds;
                lm.pId=pIds;
                likemodellist?.add(lm);
                uIds=[];
              }




            });

            // print(
            //     '--------------------------------------------------------------------------------------------');
            // post_like_number_list?.add(event.docs.length);
            // print(event.data());

            // print('length of like list = ${post_like_number_list?.length}');
            // print('length of postID list = ${postIdlist?.length}');

            if (postIdlist!.length==likemodellist!.length) {
              // print('element postID list = $postIdlist');
              // print(
              //     '--------------------------------------------------------------------------------------------');
              // // print('length of event list = ${event.docs.length}');
              // print('length of postID list = ${postIdlist?.length}');
              // print('length of like list = ${post_like_number_list?.length}');
              // print('length of name list = ${namelist?.length}');
              // print('length of image list = ${Pimagelist?.length}');
              //
              // print('element like list = $post_like_number_list');
              // print('element post text list = ');postlist?.forEach((element) {print(element.text);});
              // print('element postID list = $postIdlist');
              // print(
              //     '--------------------------------------------------------------------------------------------');
              // likemodellist?.forEach((element) {
              //   print(
              //       '-----------------------');
              //   print('pId = ${element.pId}');
              //   print('uId = ${element.uIds}');
              //   print(
              //       '-----------------------');
              // });
              emit(GetPostData_success_state());
            }
          });
    }
  }

  List<comment_model>? comment_model_list = [];
  //
  // Future<void> x4() async {
  //   comment_model_list=[];
  //   for (int i = 0; i < postIdlist!.length; i++) {
  //     await FirebaseFirestore.instance
  //         .collection('posts')
  //         .doc(postIdlist?[i])
  //         .collection('comment')
  //         .get()
  //         .then((e) {
  //       List<String>? uIds=[];
  //       List<Map<String, dynamic>?>? MforC=[];
  //       String? pIds=postIdlist![i];
  //       int count=0;
  //       if(e.docs.isEmpty){
  //         print('element is empty');
  //         comment_model? cm=comment_model();
  //         cm.pId=pIds;
  //         comment_model_list?.add(cm);
  //         uIds=[];
  //       }
  //       else{
  //         e.docs.forEach((element) {
  //         uIds?.add(element.id);
  //         count=count+1;
  //         MforC.add(element.data());
  //         print(MforC);
  //         print(count);
  //         print(e.docs.length);
  //         if(e.docs.length==count){
  //           print(MforC);
  //           comment_model? cm=comment_model();
  //           commentdata_model cm1=commentdata_model();
  //           commentdata2_model cm2=commentdata2_model();
  //           for(int ii=0;ii<uIds!.length;ii++){
  //             cm2.text=MforC[ii]!['text'];
  //             cm2.uId=uIds[ii];
  //             cm1.uIds!.add(cm2);
  //             cm.Data!.add(cm1);
  //           }
  //           cm.pId=pIds;
  //           comment_model_list?.add(cm);
  //         }
  //       });
  //       }
  //
  //       // print(
  //       //     '--------------------------------------------------------------------------------------------');
  //       // post_like_number_list?.add(event.docs.length);
  //       // print(event.data());
  //
  //       // print('length of like list = ${post_like_number_list?.length}');
  //       // print('length of postID list = ${postIdlist?.length}');
  //     });
  //   }
  //   print(comment_model_list);
  // }
  //
  // Future<void> commentpost_Function({required String? postId,required index,required String? comment}) async {
  //
  //   // comment_model_list![index].Data![index].uIds![index].text!='welcome';
  //   // comment_model_list![index].Data![index].uIds![index].uId!=model!.uid;
  //   emit(addcomment_loading_state());
  //   await FirebaseFirestore.instance
  //       .collection('posts')
  //       .doc(postId)
  //       .collection('comment')
  //       .doc(model?.uid)
  //       .set({'text': comment}).then((value) async {
  //        await x4();
  //     emit(addcomment_success_state());
  //   }).catchError((error) {
  //     emit(addcomment_error_state());
  //   });
  // }
  //
  // Future<void> uncommentpost_Function({required String? postId,required index}) async {
  //
  //   emit(remove_comment_loading_state());
  //   await FirebaseFirestore.instance
  //       .collection('posts')
  //       .doc(postId)
  //       .collection('comment')
  //       .doc(model?.uid)
  //       .delete().then((value) {
  //     emit(remove_comment_success_state());
  //   }).catchError((error) {
  //     emit(remove_comment_error_state());
  //   });
  // }
}
