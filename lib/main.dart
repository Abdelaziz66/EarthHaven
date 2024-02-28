import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:xfirebase/shared/bloc_observed.dart';
import 'package:xfirebase/shared/constant.dart';
import 'package:xfirebase/shared/cubit/App_cubit.dart';
import 'package:xfirebase/shared/cubit/App_state.dart';
import 'package:xfirebase/shared/style/App_Style.dart';
import 'firebase_options.dart';
import 'layout/LayoutScreen.dart';
import 'layout/Web_LayoutScreen.dart';
import 'modules/login/loginCubit.dart';
import 'modules/login/loginscreen.dart';
import 'modules/login/registercubit.dart';
import 'network/local/SharedPreferences.dart';
//3bdelazizelsayed123@gmail.com
Future<void>firebaseMessagingBackgroundHandler(RemoteMessage message)async{
  print('on background message');
  print(message.data.toString());
  Fluttertoast.showToast(
      msg: 'on background message',
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 3,
      backgroundColor: Colors.green,
      textColor: Colors.cyanAccent,
      fontSize: 16.0);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = MyBlocObserver();
  await CachHelper.init();
  uId = CachHelper.getData(key: 'uId');

  // var token = await FirebaseMessaging.instance.getToken();
  // print('--------------------token-----------------------');
  // print(token);
  // print('----------------------token---------------------');

  // FirebaseMessaging.onMessage.listen((event) {
  //   print('-------------------------------------------');
  //   print(event.data.toString());
  //   print('-------------------------------------------');
  //   Fluttertoast.showToast(
  //       msg: 'on message',
  //       toastLength: Toast.LENGTH_LONG,
  //       gravity: ToastGravity.BOTTOM,
  //       timeInSecForIosWeb: 3,
  //       backgroundColor: Colors.green,
  //       textColor: Colors.cyanAccent,
  //       fontSize: 16.0);
  // });
  // FirebaseMessaging.onMessageOpenedApp.listen((event) {
  //   print('-------------------------------------------');
  //   print(event.data.toString());
  //   print('-------------------------------------------');
  //   Fluttertoast.showToast(
  //       msg: 'on  message open app',
  //       toastLength: Toast.LENGTH_LONG,
  //       gravity: ToastGravity.BOTTOM,
  //       timeInSecForIosWeb: 3,
  //       backgroundColor: Colors.green,
  //       textColor: Colors.cyanAccent,
  //       fontSize: 16.0);
  // });
  // FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  // FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8080);


  if (uId == null) {
    StaWidIndex=1;
    StartWidget = LoginScreen();
  }
  else{
    StaWidIndex=2;
    StartWidget=Applayout();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(

          create: (context) => login_cubit(),

        ),
        BlocProvider(

          create: (context) => register_cubit(),

        ),
        BlocProvider(

          create: (context) => App_cubit()..Get_User_Data_Function()..Get_PostData_Function(),

        ),
      ],
      child: BlocConsumer<App_cubit, App_state>(
          listener: (context, state) => () {},
          builder: (context, state) {
            App_cubit cubit = App_cubit.get(context);
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: Light_Theme,
              darkTheme: Dark_Theme,
              themeMode: ThemeMode.light,

              // home:StartWidget,
              home: LayoutBuilder(builder: (BuildContext context,BoxConstraints constraints) {
                print(constraints.minWidth.toInt());
                if(constraints.minWidth.toInt()>=750 && StaWidIndex==2 ) {
                  return  Weplayout();
                }
                else if(constraints.minWidth.toInt()>=750 && StaWidIndex==1){
                  return  LoginScreen();
                }
                else {
                  return StartWidget!;
                }

                },),
            );
          }),
    );

  }
}
