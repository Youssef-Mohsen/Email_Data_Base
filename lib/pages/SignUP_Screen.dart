import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:final_project/Cubit/App_Cubit.dart';
import 'package:final_project/Cubit/Add_States.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'LogIn_Screen.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});

  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit();

    return BlocBuilder<AppCubit, AddStates>(
      builder: (context, state) {
        cubit = BlocProvider.of<AppCubit>(context);
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
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Welcome",
                      style: TextStyle(
                          fontSize: 35,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "New here? Sign Up",
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        cubit.changeRegistrationType(true);

                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        SignIn()));
                                      },
                                      child: Container(
                                        decoration: const BoxDecoration(
                                            color: Colors.white),
                                        child: const Center(
                                          child: Text(
                                            "Sign In",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 25),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        cubit.changeRegistrationType(false);
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        SignUp()));
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
                                              ]),
                                        ),
                                        child: const Center(
                                          child: Text(
                                            "Sign Up",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 25),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 0),
                              child: TextFormField(
                                controller: cubit.nameController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Name Must Not Be Empty';
                                  } else if ("${cubit.nameController.text}"
                                          .length <
                                      4) {
                                    return 'Name Must be At Least 4 Character';
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: "Name",
                                    prefixIcon: Icon(
                                      Icons.perm_identity,
                                      color: Colors.pink,
                                    )),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 0),
                              child: TextFormField(
                                controller: cubit.emailController,
                                validator: (value) {
                                  print(cubit.info.length);
                                  if (value!.isEmpty) {
                                    return 'Email Must Not Be Empty';
                                  } else if (value!.isNotEmpty) {
                                    for (int i = 0;
                                        i < cubit.info.length;
                                        i++) {
                                      if ("${cubit.info[i]['email']}" ==
                                          cubit.emailController.text) {
                                        print('found');
                                        return 'This account Was Created Before';
                                      }
                                    }
                                  } else if (!EmailValidator.validate(
                                      cubit.emailController.text)) {
                                    return 'Please insert an email';
                                  }

                                  return null;
                                },
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: "Email",
                                    prefixIcon: Icon(
                                      Icons.email,
                                      color: Colors.pink,
                                    )),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 0),
                              child: TextFormField(
                                obscureText: cubit.isSecurePassword,
                                controller: cubit.passwordController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Password Must Not Be Empty';
                                  } else if ("${cubit.passwordController.text}"
                                          .length <
                                      4) {
                                    return 'Password Must be At Least 4 Character';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  labelText: "Password",
                                  prefixIcon: const Icon(
                                    Icons.password,
                                    color: Colors.pink,
                                  ),
                                  suffixIcon: cubit.togglePassword(),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 0),
                              child: TextFormField(
                                obscureText: cubit.isSecurePassword,
                                controller: cubit.confirmPasswordController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Confirm Password Must Not Be Empty';
                                  } else if ("${cubit.confirmPasswordController.text}" !=
                                      "${cubit.passwordController.text}") {
                                    return 'Incorrect Conifrm Password';
                                  } else if ("${cubit.confirmPasswordController.text}"
                                          .length <
                                      4) {
                                    return 'Confirm Password Must be At Least 4 Character';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  labelText: "Confirm Password",
                                  prefixIcon: const Icon(
                                    Icons.password,
                                    color: Colors.pink,
                                  ),
                                  suffixIcon: cubit.togglePassword(),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 0),
                              child: IntlPhoneField(
                                controller: cubit.phoneNumberController,
                                validator: (value) {
                                  if (value?.completeNumber == null) {
                                    return 'Phone Must Not Be Empty';
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    labelText: "Phone Number",
                                    prefixIcon: Icon(
                                      Icons.phone,
                                      color: Colors.pink,
                                    )),
                                languageCode: 'en',
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10.0, 0, 0, 0),
                                  child: SizedBox(
                                    height: 70,
                                    width: 340,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Center(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                  color: Colors.grey,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: DropdownButton(
                                                hint: Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          10.0, 0, 0, 0),
                                                  child: Row(
                                                    children: [
                                                      const Text(
                                                        "Age",
                                                        style: TextStyle(
                                                            fontSize: 20),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                icon: const Icon(
                                                  Icons.arrow_drop_down,
                                                  color: Colors.pink,
                                                ),
                                                isExpanded: true,
                                                value: cubit.age,
                                                onChanged: (newValue) {
                                                  cubit.changeAge(newValue);
                                                },
                                                items: cubit.years
                                                    .map((valueItem) {
                                                  return DropdownMenuItem(
                                                    value: valueItem,
                                                    child: Row(
                                                      children: [
                                                        Text(valueItem),
                                                        SizedBox(
                                                          width: 5.0,
                                                        ),
                                                        Text('years'),
                                                      ],
                                                    ),
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Expanded(
                                          child: Center(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      0, 0, 10.0, 0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: Colors.grey,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: DropdownButton(
                                                  isExpanded: true,
                                                  hint: Padding(
                                                    padding: const EdgeInsets
                                                            .fromLTRB(
                                                        10.0, 0, 0, 0),
                                                    child: Row(
                                                      children: [
                                                        const Text(
                                                          "Height(cm)",
                                                          style: TextStyle(
                                                              fontSize: 20),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  icon: const Icon(
                                                    Icons.arrow_drop_down,
                                                    color: Colors.pink,
                                                  ),
                                                  value: cubit.height,
                                                  onChanged: (newValue) {
                                                    cubit
                                                        .changeHeight(newValue);
                                                  },
                                                  items: cubit.heights
                                                      .map((valueItem) {
                                                    return DropdownMenuItem(
                                                      value: valueItem,
                                                      child: Row(
                                                        children: [
                                                          Text(valueItem),
                                                          SizedBox(width: 5),
                                                          Text('cm'),
                                                        ],
                                                      ),
                                                    );
                                                  }).toList(),
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
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Expanded(
                                child: GestureDetector(
                                  onTap: () async {
                                    if (formkey.currentState!.validate()) {
                                      cubit.insertDatasignup(
                                          name: cubit.nameController.text,
                                          email: cubit.emailController.text,
                                          pass: cubit.passwordController.text,
                                          confirmpass: cubit
                                              .confirmPasswordController.text,
                                          phone:
                                              cubit.phoneNumberController.text,
                                          age: cubit.age.toString(),
                                          height: cubit.height.toString());
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                        content: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text("The Account Created"),
                                          ],
                                        ),
                                      ));
                                    }
                                    await Future.delayed(
                                        const Duration(seconds: 4));
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
                                        "Sign Up",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 25),
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
    /* },
),
);*/
  }
}
