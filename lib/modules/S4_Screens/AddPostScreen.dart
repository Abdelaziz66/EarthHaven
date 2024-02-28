import 'dart:io';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../shared/component/component.dart';
import '../../shared/cubit/App_cubit.dart';
import '../../shared/cubit/App_state.dart';

class AddPostScreen extends StatelessWidget {
  AddPostScreen({super.key});
  var chatcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<App_cubit, App_state>(
      listener: (context, state) => {},
      builder: (context, state) {
        App_cubit cubit = App_cubit.get(context);
        File? Postimage= cubit.postimage;
        var textcontroller = TextEditingController();
        var tagcontroller = TextEditingController();

        return Scaffold(
          body: BlurBackGround(
            Widget: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
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
                        GlassBox(
                            widget: InkWell(
                              onTap: () {
                                cubit
                                  .addpost_function(
                                  text: textcontroller.text,
                                  tag: tagcontroller.text,)
                                  .then((value) {Navigator.pop(context);});
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(
                                  'Post',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                    color: Colors.greenAccent[400],
                                  ),
                                ),
                              ),
                            ),
                            color: Colors.transparent,
                            borderRadius: 15,
                            x: 40,
                            y: 40),
                      ],
                    ),
                  ),
                  ConditionalBuilder(
                    condition: state is  addpost_loading_state == true,
                    builder: (context) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: LinearProgressIndicator(),
                    ),
                    fallback: (context) => SizedBox(),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('What is in your mind ?', style: TextStyle(
                                  fontSize: 20,
                                  color:
                                  Colors.grey[200],
                                  fontWeight: FontWeight.bold,
                                ),),
                              ),
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

                          SizedBox(height: 20,),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: GlassBox(
                                widget: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: Colors.white.withOpacity(.8),style: BorderStyle.solid,width: 1.5)
                                        
                                  ),

                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      children: [

                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  height: 30,
                                                  child: TextFormField(
                                                    controller: textcontroller,
                                                    keyboardType: TextInputType.name,
                                                    style: TextStyle(
                                                      color: Colors.grey[300],
                                                    ),
                                                    decoration: InputDecoration(
                                                      suffixText:'Description' ,
                                                      suffixStyle: TextStyle( color: Colors.grey[300],),
                                                      border: InputBorder.none,
                                                      label: Text(
                                                        '',
                                                        style: TextStyle(
                                                          color: Colors.grey[300],
                                                        ),
                                                      ),

                                                      prefixIcon:  FaIcon(
                                                        FontAwesomeIcons
                                                            .keyboard,
                                                        size: 25,
                                                        color: Colors.grey[200],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),


                                      ],
                                    ),
                                  ),
                                ),
                                color: Colors.blueGrey.withOpacity(.3),
                                borderRadius: 20,
                                x: 50,
                                y: 50
                            ),
                          ),
                          SizedBox(height: 20,),
                          Padding(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 10.0),
                            child: GlassBox(
                                widget: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(color: Colors.white.withOpacity(.8),style: BorderStyle.solid,width: 1.5)

                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      children: [


                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  height: 30,
                                                  child: TextFormField(
                                                    controller: tagcontroller,
                                                    keyboardType: TextInputType.name,
                                                    style: TextStyle(
                                                      color: Colors.grey[300],
                                                    ),

                                                    decoration: InputDecoration(
                                                      suffixText:'Hashtags' ,
                                                      suffixStyle: TextStyle( color: Colors.grey[300],),
                                                      label: Text(
                                                        '',
                                                        style: TextStyle(
                                                          color: Colors.grey[300],
                                                        ),
                                                      ),
                                                      prefixIcon:FaIcon(
                                                        FontAwesomeIcons
                                                            .hashtag,
                                                        size: 25,
                                                        color: Colors.grey[200],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),


                                      ],
                                    ),
                                  ),
                                ),
                                color: Colors.blueGrey.withOpacity(.3),
                                borderRadius: 20,
                                x: 50,
                                y: 50
                            ),
                          ),
                          SizedBox(height: 20,),
                          ConditionalBuilder(
                            condition: state is uploadpostimage_loading_state,
                            builder: (context) => Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: LinearProgressIndicator(),
                            ),
                            fallback: (context) => SizedBox(),
                          ),
                          Padding(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 10.0),
                            child: GlassBox(
                                widget: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(color: Colors.white.withOpacity(.8),style: BorderStyle.solid,width: 1.5)

                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(0.0),
                                    child: Stack(
                                      alignment: Alignment.bottomRight,
                                      children: [
                                        ConditionalBuilder(
                                          condition: Postimage == null,
                                          builder: (context) => Container(
                                            width: double.infinity,
                                            height: 200,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(20),
                                              color: Colors.blueGrey,
                                            ),

                                          ),
                                          fallback: (context) => Container(
                                            width: double.infinity,
                                            height: 200,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(20),
                                              color: Colors.blueGrey,
                                              image: DecorationImage(
                                                image: FileImage(Postimage!),
                                                fit: BoxFit.cover,
                                              ),
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
                                                    cubit.Get_postimage_Function();
                                                  },
                                                  icon: Icon(
                                                    Icons.camera_alt,
                                                    color: Colors.grey[300],
                                                  ))),
                                        ),

                                      ],
                                    ),
                                  ),
                                ),
                                color: Colors.blueGrey.withOpacity(.3),
                                borderRadius: 20,
                                x: 50,
                                y: 50
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
