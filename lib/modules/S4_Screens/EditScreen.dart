import 'dart:io';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/user/create user.dart';
import '../../shared/component/component.dart';
import '../../shared/cubit/App_cubit.dart';
import '../../shared/cubit/App_state.dart';
import '../N_Screen/S4.dart';

class editscreen extends StatelessWidget {
  editscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<App_cubit, App_state>(
      listener: (context, state) => {},
      builder: (context, state) {
        App_cubit cubit = App_cubit.get(context);
        File? profileimage = cubit.image;
        var namecontroller =
            TextEditingController(text: '${cubit.model?.name}');
        var biocontroller = TextEditingController(text: '${cubit.model?.bio}');
        var phonecontroller =
            TextEditingController(text: '${cubit.model?.phone}');
        return Scaffold(
          body: BlurBackGround(
            Widget: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back_ios_new_outlined,
                              color: Colors.white,
                            )),
                        Spacer(),
                        GlassBox(widget: InkWell(
                          onTap: (){cubit
                              .updateuser_function(
                              name: namecontroller.text,
                              bio: biocontroller.text,
                              phone: phonecontroller.text)
                              .then((value) {Navigator.pop(context);});
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Text('Update',style: TextStyle(fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Colors.greenAccent[400],),),
                          ),
                        ),
                            color: Colors.transparent,
                            borderRadius: 15,
                            x: 40,
                            y: 40),
                      ],
                    ),
                    Expanded(
                      child: SingleChildScrollView(

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ConditionalBuilder(
                                condition: state is uploadimage_loading_state,
                                builder: (context) => LinearProgressIndicator(),
                                fallback: (context) => SizedBox(),
                              ),
                            ),
                            SizedBox(height: 10,),
                            Center(
                              child: Stack(
                                alignment: Alignment.bottomRight,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.greenAccent,
                                            blurRadius: 2,
                                            spreadRadius: 2,
                                          ),
                                        ]),
                                    child: ConditionalBuilder(
                                      condition: profileimage == null,
                                      builder: (context) => CircleAvatar(
                                        radius: 90,
                                        backgroundImage:
                                            NetworkImage('${cubit.model?.image}'),
                                      ),
                                      fallback: (context) => CircleAvatar(
                                        radius: 90,
                                        backgroundImage: FileImage(profileimage!),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.greenAccent[400],
                                        ),
                                        child: IconButton(
                                            onPressed: () {
                                              cubit.Get_image_Function();
                                            },
                                            icon: Icon(
                                              Icons.camera_alt,
                                              color: Colors.grey[300],
                                            ))),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            GlassBox(
                                widget: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        'Change Name',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                          color: Colors.grey[300],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        width: double.infinity,
                                        height: 58,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          color: Colors.blueGrey.withOpacity(.3),
                                        ),
                                        child: TextFormField(
                                          controller: namecontroller,
                                          keyboardType: TextInputType.name,
                                          style: TextStyle(
                                            color: Colors.grey[300],
                                          ),
                                          decoration: InputDecoration(
                                            label: Text(
                                              'Name',
                                              style: TextStyle(
                                                color: Colors.grey[300],
                                              ),
                                            ),
                                            border: InputBorder.none,
                                            suffixIcon: Icon(
                                              Icons.edit,
                                              color: Colors.greenAccent[400],
                                            ),
                                            prefixIcon: Icon(
                                              Icons.person,
                                              color: Colors.greenAccent[400],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                color: Colors.blueGrey.withOpacity(.3),
                                borderRadius: 20,
                                x: 40,
                                y: 40),
                            SizedBox(
                              height: 20,
                            ),
                            GlassBox(
                                widget: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        'Change Bio',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                          color: Colors.grey[300],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        width: double.infinity,
                                        height: 58,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          color: Colors.blueGrey.withOpacity(.3),
                                        ),
                                        child: TextFormField(
                                          controller: biocontroller,
                                          keyboardType: TextInputType.text,
                                          style: TextStyle(
                                            color: Colors.grey[300],
                                          ),
                                          decoration: InputDecoration(
                                            label: Text(
                                              'Bio',
                                              style: TextStyle(
                                                color: Colors.grey[300],
                                              ),
                                            ),
                                            border: InputBorder.none,
                                            suffixIcon: Icon(
                                              Icons.edit,
                                              color: Colors.greenAccent[400],
                                            ),
                                            prefixIcon: Icon(
                                              Icons.lightbulb,
                                              color: Colors.greenAccent[400],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                color: Colors.blueGrey.withOpacity(.3),
                                borderRadius: 20,
                                x: 40,
                                y: 40),
                            SizedBox(
                              height: 20,
                            ),
                            GlassBox(
                                widget: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        'Change phone',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16,
                                          color: Colors.grey[300],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        width: double.infinity,
                                        height: 58,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          color: Colors.blueGrey.withOpacity(.3),
                                        ),
                                        child: TextFormField(
                                          controller: phonecontroller,
                                          keyboardType: TextInputType.phone,
                                          style: TextStyle(
                                            color: Colors.grey[300],
                                          ),
                                          decoration: InputDecoration(
                                            label: Text(
                                              'Phone',
                                              style: TextStyle(
                                                color: Colors.grey[300],
                                              ),
                                            ),
                                            border: InputBorder.none,
                                            suffixIcon: Icon(
                                              Icons.edit,
                                              color: Colors.greenAccent[400],
                                            ),
                                            prefixIcon: Icon(
                                              Icons.phone,
                                              color: Colors.greenAccent[400],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                color: Colors.blueGrey.withOpacity(.3),
                                borderRadius: 20,
                                x: 40,
                                y: 40),
                          ],
                        ),
                      ),
                    ),
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
