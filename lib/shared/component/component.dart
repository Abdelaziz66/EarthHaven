import 'dart:ui';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:xfirebase/models/user/create%20user.dart';
import 'package:xfirebase/models/user/createpost.dart';

import '../../models/user/Post_model.dart';
import '../../models/user/likemodel.dart';
import '../../modules/S4_Screens/ChatScreen.dart';
import '../cubit/App_cubit.dart';

Widget Post({required index,required like_model? likemodel,required Postinfo_model postmap,required String? postId,required int? likenumber,context,required String? name,required String? image}) {
  TextEditingController? comment_controller=TextEditingController();

  return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: GlassBox(
          widget: Container(
            width: double.infinity,

            // decoration: BoxDecoration(

            //

            //   borderRadius: BorderRadius.circular(25),

            //

            //   color: Colors.blueGrey.withOpacity(.3),

            //

            // ),

            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Row(
                      children: [
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
                            radius: 25,
                            backgroundImage: NetworkImage(
                                '${image}'),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text(
                                  '${name}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 18,
                                    color: Colors.grey[200],
                                  ),
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Icon(
                                  Icons.verified,
                                  size: 18,
                                  color: Colors.blue,
                                ),
                              ],
                            ),
                            Text(
                              '${postmap.date}',
                              style: TextStyle(
                                // fontWeight: FontWeight.w800,

                                fontSize: 13,

                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        IconButton(
                            onPressed: () {},
                            icon: FaIcon(
                              FontAwesomeIcons.ellipsisVertical,
                              color: Colors.grey[300],
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    color: Colors.blueGrey,
                    width: double.infinity,
                    height: .3,
                  ),
                  SizedBox(
                    height: 15,
                  ),


                  ConditionalBuilder(
                      condition: postmap.text!='',
                      builder: (context) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                // 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s.',
                                '${postmap.text}',maxLines: 4,overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                  color: Colors.grey[300],
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                      fallback: (context) => SizedBox(height: 0,)),
                  ConditionalBuilder(
                      condition: postmap.tag!='',
                      builder: (context) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Row(
                          children: [
                            MaterialButton(
                              onPressed: () {},
                              minWidth: 1,
                              padding: EdgeInsets.zero,
                              child: Text(
                                '#${postmap.tag}',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      fallback: (context) => SizedBox(height: 10,)),
                  ConditionalBuilder(
                      condition: postmap.image!='',
                      builder: (context) => Padding(
                        padding: const EdgeInsets.only(left:0,right: 0.0,top: 5),
                        child: Container(
                          width: double.infinity,
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: NetworkImage(
                                '${postmap.image}',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      fallback: (context) => SizedBox(height: 0,)),



                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            if(likemodel.uIds!.contains('${postmap.uid}')){
                              App_cubit.get(context).unlikepost_Function(postId: postId, index: index);
                            }else{
                              App_cubit.get(context).likepost_Function(postId: postId, index: index);
                            }




                          },
                          icon:  FaIcon(
                            FontAwesomeIcons.heart,
                            size: 25,
                            // color: App_cubit.get(context).likeId_list!.contains(App_cubit.get(context).model?.uid) ?Colors.greenAccent:Colors.grey[200],
                            color:likemodel!.uIds!.contains('${postmap.uid}')?Colors.greenAccent:Colors.grey[200],
                          ),

                        ),
                        Text('${likemodel.uIds!.length}',style: TextStyle(
                          color: Colors.grey[300],
                        ),),

                        SizedBox(
                          width: 20,
                        ),
                        FaIcon(
                          FontAwesomeIcons.comment,
                          size: 25,
                          color: Colors.grey[200],
                        ),

                        SizedBox(
                          width: 15,
                        ),

                        FaIcon(
                          FontAwesomeIcons.angleUp,
                          size: 25,
                          color: Colors.grey[200],
                        ),

                        // Text('60',style: TextStyle(

                        //   color: Colors.white,

                        // ),),

                        Spacer(),

                        FaIcon(
                          FontAwesomeIcons.bookmark,
                          size: 25,
                          color: Colors.grey[200],
                        ),

                        SizedBox(
                          width: 15,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blueGrey[900],
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white,
                            blurRadius: 1,
                            spreadRadius: .1,
                          ),
                        ]),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white,
                                    blurRadius: 1,
                                    spreadRadius: .1,
                                  ),
                                ]),
                            child: CircleAvatar(
                              radius: 18,
                              backgroundImage: NetworkImage(
                                '${App_cubit.get(context).model?.image}',
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 150,
                          height: 30,
                          child: TextFormField(
                            controller: comment_controller,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              label: Text(
                                'Add Comment Here ..',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey[300],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Spacer(),
                        Text(
                          'comment',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              // App_cubit.get(context).commentpost_Function(postId: postId, index: index, comment: comment_controller!.text);
                            },
                            icon: FaIcon(
                              FontAwesomeIcons.commentDots,
                              size: 25,
                              color: Colors.grey[200],
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          color: Colors.blueGrey.withOpacity(.3),
          borderRadius: 25,
          x: 50,
          y: 50),
    );}

Widget Chat({context,required user_model? card_chat_list }) => Padding(
  padding: const EdgeInsets.only(top: 7.5,bottom: 7.5),
  child:   GlassBox(

      widget: InkWell(

        onTap: () {

          Navigator.push(

              context,

              MaterialPageRoute(

                builder: (context) => ChatScreen(card_chat_list: card_chat_list,),

              ));

          App_cubit.get(context).GetChat_Function(reciverid: card_chat_list?.uid);

        },

        child: Padding(

          padding: const EdgeInsets.all(10.0),

          child: Row(

            children: [

              Container(

                decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [

                  BoxShadow(

                    color: Colors.greenAccent,

                    blurRadius: 2,

                    spreadRadius: 2,

                  ),

                ]),

                child: CircleAvatar(

                  radius: 25,

                  backgroundImage: NetworkImage(

                      '${card_chat_list?.image}'),

                ),

              ),

              SizedBox(

                width: 15,

              ),

              Column(

                crossAxisAlignment: CrossAxisAlignment.start,

                mainAxisAlignment: MainAxisAlignment.center,

                children: [

                  Row(

                    children: [

                      Text(

                        '${card_chat_list?.name}',

                        style: TextStyle(

                          fontWeight: FontWeight.w900,

                          fontSize: 18,

                          color: Colors.grey[200],

                        ),

                      ),

                      SizedBox(

                        width: 4,

                      ),

                      Icon(

                        Icons.verified,

                        size: 18,

                        color: Colors.blue,

                      ),

                    ],

                  ),

                  Text(

                    'april 21,2021 at 3:25 PM  ',

                    style: TextStyle(

                      // fontWeight: FontWeight.w800,



                      fontSize: 13,



                      color: Colors.grey,

                    ),

                  ),

                ],

              ),

              Spacer(),

              IconButton(

                  onPressed: () {},

                  icon: FaIcon(

                    FontAwesomeIcons.ellipsisVertical,

                    color: Colors.grey[300],

                  )),

            ],

          ),

        ),

      ),

      color: Colors.blueGrey.withOpacity(.3),

      borderRadius: 30,

      x: 50,

      y: 50),
);

Widget ChatHeader() => Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(
        radius: 40,
        backgroundImage: NetworkImage(
            'https://cdn.pixabay.com/photo/2017/08/01/08/29/woman-2563491_640.jpg'),
      ),
    );

Widget BackGround1() => Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.greenAccent,
            ),
          ),
          Spacer(),
          Container(
            width: double.infinity,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.blueGrey,
            ),
          ),

// Row(
//   children: [
//     Container(
//       width: 200,
//       height: 200,
//       decoration: BoxDecoration(
//         color: Color(0xFFFCB0AA),
//       ),
//     ),
//     Container(
//       width: 200,
//       height: 200,
//       decoration: BoxDecoration(
//         shape: BoxShape.circle,
//         color: Color(0xFFA39792),
//       ),
//     ),
//   ],
// ),
// Row(
//   children: [
//     Container(
//       alignment: Alignment.topLeft,
//       child: Container(
//         width: 150,
//         height: 180,
//         decoration: BoxDecoration(
//           color: Color(0xFFFCB0AA),
//         ),
//       ),
//     ),
//     Container(
//       width: 180,
//       height: 180,
//       decoration: BoxDecoration(
//         shape: BoxShape.circle,
//         color: Color(0xFFFAE8DF),
//       ),
//     ),
//   ],
// ),
// Spacer(),
// Container(
//   alignment: Alignment.bottomLeft,
//   child: Container(
//     width: 330,
//     height: 380,
//     decoration: BoxDecoration(
//       color: Color(0xFFF2D0A3),
//     ),
//   ),
// ),
        ],
      ),
    );

Widget BackGround2() => Positioned.fill(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 150, sigmaY: 150),
        child: SizedBox(),
      ),
    );

Widget BlurBackGround({required Widget Widget}) => Stack(
      children: [
        Container(
          color: Colors.black,
        ),
        BackGround1(),
        BackGround2(),
        Widget,
      ],
    );

Widget GlassBox({
  required Widget? widget,
  required Color? color,
  required double? borderRadius,
  required double? x,
  required double? y,
}) =>
    ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius!),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaY: y!,
          sigmaX: x!,
          tileMode: TileMode.clamp,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: color,
          ),
          child: widget,
        ),
      ),
    );

Widget GlassBoxForChat({
  required Widget? widget,
  required Color? color,
  required int borderRadius,
  required double? x,
  required double? y,
}) =>
    ClipRRect(
      borderRadius: BorderRadius.only(bottomLeft:borderRadius ==1? Radius.zero:Radius.circular(15),bottomRight:borderRadius ==2? Radius.zero:Radius.circular(15) ,topLeft:Radius.circular(15) ,topRight: Radius.circular(15),),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaY: y!,
          sigmaX: x!,
          tileMode: TileMode.clamp,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: color,
          ),
          child: widget,
        ),
      ),
    );



Widget Reciverchat({required String? text})=>   Align(
  alignment: Alignment.centerLeft,
  child:   GlassBoxForChat(widget: Padding(

    padding: const EdgeInsets.all(12.0),

    child: Text('${text}',style: TextStyle(

      fontSize: 18,

      fontWeight: FontWeight.w500,

      color: Colors.grey[300],

    ),),

  ), color: Colors.blueGrey.withOpacity(.4), borderRadius: 1, x: 40, y: 40),
);

Widget Senderchat({required String? text})=>   Align(
  alignment: Alignment.centerRight,
  child:   GlassBoxForChat(widget: Padding(

    padding: const EdgeInsets.all(12.0),

    child: Text('${text}',style: TextStyle(

      fontSize: 18,

      fontWeight: FontWeight.w500,

      color: Colors.grey[300],

    ),),

  ), color: Colors.greenAccent.withOpacity(.3), borderRadius: 2, x: 40, y: 40),
);


































