import 'dart:ui';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../modules/S4_Screens/AddPostScreen.dart';
import '../shared/component/component.dart';
import '../shared/cubit/App_cubit.dart';
import '../shared/cubit/App_state.dart';

class Applayout extends StatelessWidget {
  const Applayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<App_cubit, App_state>(
      listener: (context, state) => {},
      builder: (context, state) {
        App_cubit cubit = App_cubit.get(context);
        return Scaffold(
          body:BlurBackGround(Widget:

          Stack(
            children: [
              Column(
                children: [
                  AppBar(
                    title: Text('EarthHaven'),
                    actions: [
                      IconButton(
                        onPressed: () {

                          cubit.postimage=null;
                          Navigator.push(context, MaterialPageRoute(builder: (context) => AddPostScreen(),));
                        },
                        icon: Icon(Icons.post_add),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.notifications),
                      )
                    ],
                  ),
                  Expanded(child:cubit.NavBar[cubit.NavBar_index], ),

                ],
              ),

              Column(
                children: [
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GlassBox(widget: BottomNavigationBar(
                      items: [
                        BottomNavigationBarItem(
                            icon: FaIcon(FontAwesomeIcons.seedling), label: 'Home'),
                        BottomNavigationBarItem(
                            icon: FaIcon(FontAwesomeIcons.comments), label: 'Chat'),
                        BottomNavigationBarItem(
                            icon: FaIcon(FontAwesomeIcons.magnifyingGlass),
                            label: 'Search'),
                        BottomNavigationBarItem(
                            icon: FaIcon(FontAwesomeIcons.user), label: 'Profile'),
                      ],
                      currentIndex: cubit.NavBar_index,
                      onTap: (index) {
                        cubit.NavBar_M(index: index);
                      },

                    ),color: Colors.black.withOpacity(.8),borderRadius: 25,y:60 ,x: 60),
                  )
                ],
              ),
            ],
          ),
          ),
        );
      },
    );
  }
}
