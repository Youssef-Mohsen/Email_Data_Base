import 'package:final_project/Cubit/Add_States.dart';
import 'package:final_project/Cubit/App_Cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'LogIn_Screen.dart';

class Loading1 extends StatefulWidget {
   const Loading1({super.key});

  @override
  State<Loading1> createState() => _LoadingState();

 
}
AppCubit cubit =AppCubit();

void loadingscreen(BuildContext context) async {
  await Future.delayed(const Duration(seconds: 2));
  Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>  SignIn()));

}

class _LoadingState extends State<Loading1> {
  @override
  void initState() {
    super.initState();
    loadingscreen(context);
  }

  Widget build(BuildContext context) {

    return BlocBuilder<AppCubit, AddStates>(
      builder: (context,dynamic state) {


        return Scaffold(

            body: Container(
            decoration: const BoxDecoration(
            gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
            Colors.purple,
            Colors.pinkAccent,
            ],
        ),
        ),
          child: Center(
            child: SpinKitFadingCube(color: Colors.white, size: 80.0,),
          ),
            )
        );
      },
    );
  }
}
