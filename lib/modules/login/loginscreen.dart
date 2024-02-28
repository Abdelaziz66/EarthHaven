import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:xfirebase/network/local/SharedPreferences.dart';
import 'package:xfirebase/shared/constant.dart';
import '../../layout/LayoutScreen.dart';
import '../../shared/component/component.dart';
import '../N_Screen/S1.dart';
import 'Registerscreen.dart';
import 'loginCubit.dart';
import 'loginState.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  var emailcontroller = TextEditingController();
  var passwordcontroller = TextEditingController();
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<login_cubit, login_state>(
      listener: (context, state) {
          // if (state is login_success_state) {
          //
          //   CachHelper.saveData(key: 'uId', value: uId).then((value){
          //     Navigator.pushAndRemoveUntil(
          //         context,
          //         MaterialPageRoute(
          //           builder: (context) => Applayout(),
          //         ),
          //             (route) => false);
          //     Fluttertoast.showToast(
          //         msg: 'login Success',
          //         toastLength: Toast.LENGTH_LONG,
          //         gravity: ToastGravity.BOTTOM,
          //         timeInSecForIosWeb: 3,
          //         backgroundColor: Colors.green,
          //         textColor: Colors.cyanAccent,
          //         fontSize: 16.0);
          //   });
          //
          // }
          // if (state is login_error_state){
          //   Fluttertoast.showToast(
          //       msg: 'can`t login',
          //       toastLength: Toast.LENGTH_LONG,
          //       gravity: ToastGravity.BOTTOM,
          //       timeInSecForIosWeb: 5,
          //       backgroundColor: Colors.red,
          //       textColor: Colors.black,
          //       fontSize: 16.0);
          // }
      },
      builder: (context, state) {
        login_cubit cubit = login_cubit.get(context);
        return Scaffold(
          body:BlurBackGround(Widget:  Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Form(
                  key: formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Login',
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
                        'Login now to browse our hot offers',
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
                          controller: passwordcontroller,
                          keyboardType: TextInputType.text,
                          obscureText: cubit.isvisible ? false : true,
                          style: TextStyle(
                            color: Colors.grey[300],
                          ),

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
                          onFieldSubmitted: (value) {
                            if (formkey.currentState!.validate()) {
                              cubit.login(
                                  email: emailcontroller.text,
                                  password: passwordcontroller.text,
                                  context: context);
                            }
                          },
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
                        condition: state is! login_loading_state,
                        builder: (context) => InkWell(
                          onTap: () {
                            if (formkey.currentState!.validate()) {
                              cubit.login(
                                  email: emailcontroller.text,
                                  password: passwordcontroller.text,
                                  context: context);
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
                                'Login',
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.grey[300],
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                          ),
                        ),
                        fallback: (context) =>
                            Center(child: CircularProgressIndicator()),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Do not have an account ?',
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Registerscreen(),
                                  ));
                            },
                            child: Text(
                              'Register',
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
