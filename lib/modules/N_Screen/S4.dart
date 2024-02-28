import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:xfirebase/network/local/SharedPreferences.dart';

import '../../shared/component/component.dart';
import '../../shared/constant.dart';
import '../../shared/cubit/App_cubit.dart';
import '../../shared/cubit/App_state.dart';
import '../S4_Screens/EditScreen.dart';
import '../login/loginscreen.dart';

class S4 extends StatelessWidget {
  const S4({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<App_cubit, App_state>(
      listener: (context, state) => {},
      builder: (context, state) {
        App_cubit cubit = App_cubit.get(context);
        return ConditionalBuilder(
          condition: cubit.model?.image != null,
          builder: (context) => Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        decoration:
                            BoxDecoration(shape: BoxShape.circle, boxShadow: [
                          BoxShadow(
                            color: Colors.greenAccent,
                            blurRadius: 2,
                            spreadRadius: 2,
                          ),
                        ]),
                        child: CircleAvatar(
                          radius: 45,
                          backgroundImage:
                              NetworkImage('${cubit.model?.image}',),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '21',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 18,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Text(
                                      'Posts',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        color: Colors.grey[300],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '289',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 18,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Text(
                                      'Followers',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        color: Colors.grey[300],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '371',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 18,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 7,
                                    ),
                                    Text(
                                      'Following',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 16,
                                        color: Colors.grey[300],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Container(
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${cubit.model?.name}',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.grey[300],
                          ),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          '${cubit.model?.bio}',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.grey[300],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            cubit.image=null;
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => editscreen(),
                                ));

                          },
                          child: GlassBox(
                              widget: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Edit Profile',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color: Colors.grey[300],
                                    ),
                                  ),
                                ),
                              ),
                              color: Colors.blueGrey.withOpacity(.3),
                              borderRadius: 10,
                              x: 40,
                              y: 40),
                        ),
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Expanded(
                        child: GlassBox(
                            widget: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => LoginScreen(),
                                      ),
                                      (route) => false);
                                  CachHelper.removedata(key: 'uId');
                                  cubit.NavBar_index = 0;
                                  cubit.card_chat_list=[];
                                  cubit.model=null;

                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Log Out',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color: Colors.grey[300],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            color: Colors.blueGrey.withOpacity(.3),
                            borderRadius: 10,
                            x: 40,
                            y: 40),
                      ),
                    ],
                  ),
                ),
                ConditionalBuilder(
                    condition:
                        FirebaseAuth.instance.currentUser?.emailVerified ==
                            false,
                    builder: (context) => Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: GlassBox(
                                  widget: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.info_outline,
                                          color: Colors.orange,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'Verfiy your account',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16,
                                            color: Colors.grey[300],
                                          ),
                                        ),
                                        Spacer(),
                                        TextButton(
                                            onPressed: () {
                                              FirebaseAuth.instance.currentUser
                                                  ?.sendEmailVerification()
                                                  .then((value) {
                                                Fluttertoast.showToast(
                                                    msg: 'Check your email',
                                                    toastLength:
                                                        Toast.LENGTH_LONG,
                                                    gravity:
                                                        ToastGravity.BOTTOM,
                                                    timeInSecForIosWeb: 3,
                                                    backgroundColor:
                                                        Colors.green,
                                                    textColor: Colors.white,
                                                    fontSize: 16.0);
                                              }).catchError((error) {});
                                            },
                                            child: Text(
                                              'Send',
                                              style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 16,
                                                color: Colors.greenAccent[400],
                                              ),
                                            )),
                                        IconButton(
                                            onPressed: () {
                                              cubit.verfiy_Function();
                                              print(FirebaseAuth.instance
                                                  .currentUser?.emailVerified);
                                            },
                                            icon: Icon(
                                              Icons.restart_alt,
                                              color: Colors.white,
                                            )),
                                      ],
                                    ),
                                  ),
                                  color: Colors.blueGrey.withOpacity(.2),
                                  borderRadius: 20,
                                  x: 40,
                                  y: 40),
                            ),
                          ],
                        ),
                    fallback: (context) => SizedBox(
                          height: 0,
                        ))
              ],
            ),
          ),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
