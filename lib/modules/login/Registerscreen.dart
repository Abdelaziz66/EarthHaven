import 'dart:ui';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:xfirebase/modules/login/registercubit.dart';
import 'package:xfirebase/modules/login/registerstate.dart';
import 'package:xfirebase/shared/component/component.dart';

import 'loginscreen.dart';


class Registerscreen extends StatelessWidget {
  Registerscreen({super.key});
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  var namecontroller = TextEditingController();
  var phonecontroller = TextEditingController();
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<register_cubit, register_state>(
      listener: (context, state) {
        if (state is register_success_state) {
          Fluttertoast.showToast(
              msg: 'Register Success',
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 3,
              backgroundColor: Colors.greenAccent[400],
              textColor: Colors.grey[300],
              fontSize: 16.0);
        }
        if (state is register_error_state){
          Fluttertoast.showToast(
              msg: 'Register Failed',
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 5,
              backgroundColor: Colors.red,
              textColor: Colors.grey[300],
              fontSize: 16.0);
        }
      },
      builder: (context, state) {
        register_cubit cubit = register_cubit.get(context);
        return Scaffold(
          body: BlurBackGround(Widget: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Form(
                  key: formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'register',
                        style: TextStyle(
                          fontSize: 35,
                          fontWeight: FontWeight.w800,
                          color: Colors.grey[300],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'register now to browse our hot offers',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey[400],
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
                          controller: emailcontroller,
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(
                            color: Colors.grey[300],
                          ),
                          decoration: InputDecoration(
                            label: Text('email',style: TextStyle(color: Colors.grey[300],),),
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.greenAccent[400],
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'email can not be empity';
                            }
                            return null;
                          },
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
                            label: Text('name',style: TextStyle(color: Colors.grey[300],),),
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.greenAccent[400],
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'name can not be empity';
                            }
                            return null;
                          },
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
                            label: Text('phone',style: TextStyle(color: Colors.grey[300],),),
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.phone,
                              color: Colors.greenAccent[400],
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'phone can not be empity';
                            }
                            return null;
                          },
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
                          controller: passwordcontroller,
                          keyboardType: TextInputType.text,
                          style: TextStyle(
                            color: Colors.grey[300],
                          ),
                          obscureText: cubit.isvisible ? false : true,
                          decoration: InputDecoration(
                            label: Text('password',style: TextStyle(color: Colors.grey[300],),),
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.greenAccent[400],
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                cubit.isvisible
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: Colors.greenAccent[400],
                              ),
                              onPressed: () {
                                cubit.changevisible();
                              },
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'password can not be empity';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ConditionalBuilder(
                        condition: state is register_loading_state,
                        builder: (context) => Center(child: CircularProgressIndicator()),
                        fallback: (context) =>InkWell(
                          onTap: () {
                            if (formkey.currentState!.validate()) {
                              cubit.register(
                                email: emailcontroller.text,
                                password: passwordcontroller.text,
                                name: namecontroller.text,
                                phone: phonecontroller.text,
                              );

                            }
                          },
                          child: Container(
                            width: double.infinity,
                            height: 55,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.greenAccent[400],
                            ),
                            child: Center(
                              child: Text(
                                'register',
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.grey[300],
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          ),
                        ),

                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            ' have an account ?',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.grey[300],
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()),
                                      (route) => false);
                            },
                            child: Text(
                              'Log in',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.greenAccent[400],
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),),
        );
      },
    );
  }
}
