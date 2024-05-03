import 'package:final_project/Cubit/Add_States.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Cubit/App_Cubit.dart';

class DisplayScreen extends StatelessWidget {
  const DisplayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit();

          return BlocBuilder<AppCubit, AddStates>(
  builder: (context, state) {

    cubit = BlocProvider.of<AppCubit>(context);

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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ///DB weather

                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,0,0,15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(

                          children: [
                            Text('Weather',style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
                            Text(cubit.cairo.name,
                              style: TextStyle(
                                  color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),),
                            Text(cubit.cairo.temp.toString() +
                                " C", style: TextStyle(
                                color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold))
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15.0,),


                  const Text(
                    "Personal Information",
                    style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),
                  ),

                  const SizedBox(height: 15,),

                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),

                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey)
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,

                                  children: [
                                    const Icon(Icons.perm_identity,size: 30,color: Colors.pink,),
                                    const SizedBox(width: 20,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            const Text(
                                              "Name",
                                              style: TextStyle(fontSize: 20,color: Colors.grey,fontWeight: FontWeight.bold),
                                            ),

                                          ],
                                        ),
                                        const SizedBox(height: 5,),
                                        Text(
                                            "${cubit.loginpass[0]['name']}",
                                          style: const TextStyle(fontSize: 18,color: Colors.black),
                                        )
                                      ],
                                    )

                                  ],
                                )
                            ),
                          ),

                          const SizedBox(height: 10,),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey)
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Icon(Icons.email,size: 30,color: Colors.pink,),
                                    const SizedBox(width: 20.0,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Email",
                                          style: TextStyle(fontSize: 20,color: Colors.grey,fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(height: 5,),
                                        Text(
                                          "${cubit.loginpass[0]['email']}",
                                          style: const TextStyle(fontSize: 18,color: Colors.black),
                                        )
                                      ],
                                    )

                                  ],
                                )
                            ),
                          ),

                          const SizedBox(height: 10,),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey)
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Icon(Icons.phone,size: 30,color: Colors.pink,),
                                    const SizedBox(width: 20,),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Phone Number",
                                          style: TextStyle(fontSize: 20,color: Colors.grey,fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(height: 5,),
                                        Text(
                                          "${cubit.loginpass[0]['phone']}",
                                          style: const TextStyle(fontSize: 18,color: Colors.black),
                                        )
                                      ],
                                    )

                                  ],
                                )
                            ),
                          ),

                          const SizedBox(height: 10,),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(color: Colors.grey)
                                      ),
                                      child: Row(
                                        children: [
                                          const Icon(Icons.date_range,size: 30,color: Colors.pink,),
                                          const SizedBox(width: 20,),
                                          Column(
                                            children: [
                                              const Text(
                                                "Age",
                                                style: TextStyle(fontSize: 20,color: Colors.grey,fontWeight: FontWeight.bold),
                                              ),
                                              const SizedBox(height: 10,),
                                              Text(
                                                "${cubit.loginpass[0]['age']}",
                                                style: const TextStyle(fontSize: 18,color: Colors.black),
                                              )
                                            ],
                                          )

                                        ],
                                      )
                                  ),
                                ),

                                const SizedBox(width: 5,),

                                Expanded(
                                  child: Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(color: Colors.grey)
                                      ),
                                      child: Row(
                                        children: [
                                          const Icon(Icons.height,size: 30,color: Colors.pink,),
                                          const SizedBox(width: 20,),
                                          Column(
                                            children: [
                                              const Text(
                                                "Height(cm)",
                                                style: TextStyle(fontSize: 20,color: Colors.grey,fontWeight: FontWeight.bold),
                                              ),
                                              const SizedBox(height: 10,),
                                              Text(
                                                "${cubit.loginpass[0]['height']}",
                                                style: const TextStyle(fontSize: 18,color: Colors.black),
                                              )
                                            ],
                                          )

                                        ],
                                      )
                                  ),
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
  },
);

  }
}