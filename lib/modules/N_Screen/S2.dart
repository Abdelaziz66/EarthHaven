import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../shared/component/component.dart';
import '../../shared/cubit/App_cubit.dart';
import '../../shared/cubit/App_state.dart';
import '../S4_Screens/ChatScreen.dart';

class S2 extends StatelessWidget {
  S2({super.key});
  var chatcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<App_cubit, App_state>(
      listener: (context, state) => {},
      builder: (context, state) {
        App_cubit cubit = App_cubit.get(context);
        return ConditionalBuilder(condition: state is! Getchatuser_loading_state,
          builder: (context) => Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [


            // GlassBox(
            //     widget: InkWell(
            //       onTap: () {
            //         Navigator.push(
            //             context,
            //             MaterialPageRoute(
            //               builder: (context) => ChatScreen(context: context,card_chat_list: cubit.card_chat_list?[0]),
            //             ));
            //       },
            //       child: Padding(
            //         padding: const EdgeInsets.all(15.0),
            //         child: Row(
            //           children: [
            //             Container(
            //               decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
            //                 BoxShadow(
            //                   color: Colors.cyanAccent,
            //                   blurRadius: 2,
            //                   spreadRadius: 2,
            //                 ),
            //               ]),
            //               child: CircleAvatar(
            //                 radius: 40,
            //                 backgroundImage: NetworkImage(
            //                     'https://images.pexels.com/photos/8566472/pexels-photo-8566472.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
            //               ),
            //             ),
            //             SizedBox(
            //               width: 15,
            //             ),
            //             Column(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               mainAxisAlignment: MainAxisAlignment.center,
            //               children: [
            //                 Row(
            //                   children: [
            //                     Text(
            //                       'Chat-GPT ',
            //                       style: TextStyle(
            //                         fontWeight: FontWeight.w900,
            //                         fontSize: 20,
            //                         color: Colors.grey[200],
            //                       ),
            //                     ),
            //                     SizedBox(
            //                       width: 4,
            //                     ),
            //                     FaIcon(
            //                       FontAwesomeIcons.robot,
            //                       size: 15,
            //                       color: Colors.grey[300],
            //                     ),
            //                   ],
            //                 ),
            //                 SizedBox(height: 2,),
            //                 Text(
            //                   'Ask Chat GPT any thing  ',
            //                   style: TextStyle(
            //                     // fontWeight: FontWeight.w800,
            //
            //                     fontSize: 14,
            //
            //                     color: Colors.grey[400],
            //                   ),
            //                 ),
            //                 SizedBox(height: 2,),
            //                 Text(
            //                   'Get Start Now  ',
            //                   style: TextStyle(
            //                     // fontWeight: FontWeight.w800,
            //
            //                     fontSize: 14,
            //
            //                     color: Colors.grey[400],
            //                   ),
            //                 ),
            //               ],
            //             ),
            //             Spacer(),
            //             IconButton(
            //                 onPressed: () {},
            //                 icon: FaIcon(
            //                   FontAwesomeIcons.seedling,
            //                   color: Colors.grey[300],
            //                 )),
            //           ],
            //         ),
            //       ),
            //     ),
            //     color: Colors.blueGrey.withOpacity(.3),
            //     borderRadius: 30,
            //     x: 50,
            //     y: 50),

            Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.separated(
                    itemBuilder: (context, index) =>cubit.card_chat_list?[index].uid==cubit.model?.uid? SizedBox(height: 0,):Chat(context: context,card_chat_list:cubit.card_chat_list?[index]),
                    separatorBuilder: (context, index) => SizedBox(
                      height: 0,
                    ),
                    itemCount: cubit.card_chat_list!.length,
                  ),
                )),
          ],
        ),
          fallback: (context) => Center(child: CircularProgressIndicator(),),);
      },
    );
  }
}
