import 'package:email_validator/email_validator.dart';
import 'package:final_project/Cubit/Add_States.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Cubit/App_Cubit.dart';
import 'Display_Screen.dart';
import 'SignUP_Screen.dart';

class SignIn extends StatelessWidget {
   SignIn({super.key});


  var formkey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit();

  return BlocBuilder<AppCubit,AddStates>(
        builder: (BuildContext context , dynamic state){
          AppCubit cubit = BlocProvider.of<AppCubit>(context);

          return Scaffold(
resizeToAvoidBottomInset: false,

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

              child:  Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: formkey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      const Text(
                        "Welcome",
                        style: TextStyle(fontSize: 35,color: Colors.white,fontWeight: FontWeight.bold),
                      ),

                      const SizedBox(height: 15,),

                      const Text(
                        "Have a account? Sign In",
                        style: TextStyle(fontSize: 25,color: Colors.white),
                      ),

                      const SizedBox(height: 15,),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)
                          ),

                          child: Column(

                            children: [

                              Padding(
                                padding: const EdgeInsets.only(left: 20 , right: 20),
                                child: Row(
                                  children: [

                                    Expanded(
                                      child: GestureDetector(
                                        onTap: (){
                                          cubit.changeRegistrationType(true);
                                        },
                                        child: Container(
                                          height: 60,
                                          decoration: const BoxDecoration(
                                            gradient: LinearGradient(
                                                begin: Alignment.bottomCenter,
                                                end: Alignment.center,
                                                colors: [
                                                  Colors.pink,
                                                  Colors.white,
                                                  Colors.white,
                                                  Colors.white,
                                                  Colors.white,

                                                ]
                                            ),
                                          ),

                                          child:const Center(
                                            child:  Text(
                                              "Sign In",
                                              style: TextStyle(color: Colors.black , fontSize: 25),
                                            ),
                                          ),
                                        ),
                                      ),

                                    ),

                                    Expanded(
                                      child: GestureDetector(
                                        onTap: (){
                                          cubit.changeRegistrationType(false);
                                          cubit.getDataBase(cubit.database);
                                          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>  SignUp()));
                                        },
                                        child: Container(
                                          height: 60,
                                          decoration: const BoxDecoration(
                                              color: Colors.white
                                          ) ,
                                          child:const Center(
                                            child:  Text(
                                              "Sign Up",
                                              style: TextStyle(color: Colors.black , fontSize: 25),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                              ),

                              const SizedBox(height: 10,),

                              Padding(
                                padding: const EdgeInsets.fromLTRB(8.0,0,8,0),
                                child: TextFormField(
                                  controller: cubit.logemailController,
                                  validator: (value) {
                                    cubit.getDataBase(cubit.database);

                                    if (value!.isEmpty) {
                                      return 'Email Must Not Be Empty';
                                    }
                                    else if(value!.isNotEmpty)
                                    {
                                      for (int i = 0; i < cubit.info.length; i++) {
                                        if ("${cubit.info[i]['email']}" == "${cubit.logemailController.text}") {
                                          return null;
                                        }
                                      }
                                    }
                                    else if(!EmailValidator.validate(cubit.logemailController.text)){
                                      return 'Please insert an email';
                                    }

                                    return 'Incorrect Email';
                                  },
                                  decoration: const InputDecoration(

                                      border: OutlineInputBorder(),
                                      labelText: "Email",
                                      prefixIcon: Icon(Icons.email,color: Colors.pink,)
                                  ),
                                ),
                              ),

                              const SizedBox(height: 10,),

                              Padding(
                                padding: const EdgeInsets.fromLTRB(8.0,0,8,0),
                                child: TextFormField(
                                  obscureText: cubit.isSecurePassword,
                                  controller: cubit.logpasswordController,
                                  validator: (value) {
                                    cubit.getLoginData(cubit.database,"${cubit.logemailController.text}");
                                    if (value!.isEmpty) {
                                      return 'Password Must Not Be Empty';
                                    }
                                    else if ("${cubit.loginpass[0]['pass']}" == "${cubit.logpasswordController.text}") {
                                          return null;
                                        }
                                        print(cubit.logpasswordController.text);
                                        return 'Incorrect Password';
                                  },
                                  decoration: InputDecoration(
                                    border: const OutlineInputBorder(),
                                    labelText: "Password",
                                    prefixIcon: const Icon(Icons.password,color: Colors.pink,),
                                    suffixIcon: cubit.togglePassword(),
                                  ),
                                ),
                              ),

                              const SizedBox(height: 146,),

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Expanded(
                                  child: GestureDetector(
                                    onTap: (){
                                      cubit.getDataBase(cubit.database);
                                        if (formkey.currentState!.validate()) {
                                          cubit.getWeather();
                                          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context)=>  DisplayScreen()));
                                        }

                                    },

                                      child: Container(
                                        height: 60,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          gradient: const LinearGradient(
                                            begin: Alignment.centerLeft,
                                            end: Alignment.centerRight,
                                            colors: [
                                              Colors.purple,
                                              Colors.pinkAccent,
                                            ],
                                          ),

                                        ),
                                        child: const Center(
                                          child: Text(
                                            "Sign In",
                                            style: TextStyle(color: Colors.white,fontSize: 25),
                                          ),
                                        ),

                                      ),

                                  ),

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
            ),
          );

          },
        );

    }
}