import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../shared/component/component.dart';
import '../../shared/cubit/App_cubit.dart';
import '../../shared/cubit/App_state.dart';

class S1 extends StatelessWidget {
  const S1({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<App_cubit, App_state>(
      listener: (context, state) => {},
      builder: (context, state) {
        App_cubit cubit = App_cubit.get(context);


        return Container(
          child: ConditionalBuilder(
            condition: state is! GetPostData_loading_state && cubit.likemodellist!.length==cubit.postIdlist!.length && cubit.likemodellist!.isNotEmpty ,
            builder: (context) {
              return ListView.separated(
                itemBuilder: (context, index) => Post(
                    postmap: cubit.postlist![index],
                    context: context,
                    postId: cubit.postIdlist?[index],
                    name: cubit.namelist?[index],
                    image: cubit.Pimagelist?[index] ,
                    likenumber:cubit.likemodellist?[index].uIds?.length,
                  likemodel: cubit.likemodellist?[index],
                  index:index,
                ),
                separatorBuilder: (context, index) => Container(
                  height: 15,
                  color: Colors.transparent,
                ),
                itemCount: cubit.postlist!.length,
              );
            },
            fallback: (context) => Center(child: CircularProgressIndicator()),
          ),
        );
      },
    );
  }
}
