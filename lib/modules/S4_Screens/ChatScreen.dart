import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../models/user/create user.dart';
import '../../shared/component/component.dart';
import '../../shared/cubit/App_cubit.dart';
import '../../shared/cubit/App_state.dart';

class ChatScreen extends StatelessWidget {
  user_model? card_chat_list;
  ChatScreen({context, required user_model? card_chat_list}) {
    this.card_chat_list = card_chat_list;
  }
  var chatcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<App_cubit, App_state>(
      listener: (context, state) => {},
      builder: (context, state) {
        App_cubit cubit = App_cubit.get(context);

        return Scaffold(
          backgroundColor: Colors.black,
          body: BlurBackGround(
            Widget: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        // IconButton(
                        //     onPressed: () {
                        //       Navigator.pop(context);
                        //     },
                        //     icon: Icon(
                        //       Icons.arrow_back_ios_new_outlined,
                        //       color: Colors.white,
                        //     )),
                        // SizedBox(width: 5,),
                        Container(
                          decoration:
                              BoxDecoration(shape: BoxShape.circle, boxShadow: [
                            BoxShadow(
                              color: Colors.cyanAccent,
                              blurRadius: 2,
                              spreadRadius: 2,
                            ),
                          ]),
                          child: CircleAvatar(
                            radius: 25,
                            backgroundImage:
                                NetworkImage('${card_chat_list?.image}'),
                          ),
                        ),
                        SizedBox(
                          width: 18,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    '${card_chat_list?.name}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 20,
                                      color: Colors.grey[200],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  FaIcon(
                                    FontAwesomeIcons.robot,
                                    size: 18,
                                    color: Colors.grey[300],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              ConditionalBuilder(
                                condition: true,
                                builder: (context) => LinearProgressIndicator(),
                                fallback: (context) => Container(),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.phone,
                              color: Colors.white,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.settings,
                              color: Colors.white,
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 1.5,
                      width: double.infinity,
                      color: Colors.blueGrey.withOpacity(.8),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Expanded(
                        child: ListView.separated(
                            itemBuilder: (context, index) => cubit
                                        .chat_model_list![index].senderid ==
                                    cubit.model?.uid
                                ? Senderchat(
                                    text: cubit.chat_model_list![index].text)
                                : Reciverchat(
                                    text: cubit.chat_model_list![index].text),
                            separatorBuilder: (context, index) => SizedBox(
                                  height: 10,
                                ),
                            itemCount: cubit.chat_model_list!.length)),
                    SizedBox(
                      height: 15,
                    ),
                    GlassBox(
                        widget: TextFormField(
                          controller: chatcontroller,
                          keyboardType: TextInputType.text,
                          style: TextStyle(
                            color: Colors.grey[300],
                            fontSize: 23,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            suffixIcon: GlassBox(
                                widget: IconButton(
                                    onPressed: () {
                                      App_cubit.get(context).SendChat_Function(reciverid: card_chat_list?.uid, text: chatcontroller.text,datetime: DateTime.now().toString());
                                    },
                                    icon: Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.white,
                                    )),
                                color: Colors.greenAccent,
                                borderRadius: 30,
                                x: 40,
                                y: 40),
                            prefixIcon: Icon(
                              Icons.keyboard_alt_outlined,
                              color: Colors.grey[400],
                            ),
                          ),
                        ),
                        color: Colors.blueGrey.withOpacity(.5),
                        borderRadius: 30,
                        x: 40,
                        y: 40),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
