
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:final_project/Cubit/Add_States.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import '../pages/Weather.dart';

class AppCubit extends Cubit<AddStates>{
  AppCubit(): super(InitialState());
  //Attributes
  bool isSignIn = true , isSecurePassword = true;
  bool checkemail =false , checkpass =false;


  List years = ['8','9','10','11','12','13','14','15','16','17','18','19','20','21'
    ,'22','23','24','25','26','27','28','29','30','31','32','33','34','35','36','37','38'
    ,'39','40','41','42','43','44','45','46','47','48','49','50','51','52','53','54','55'
    ,'56','57','58','59','60','61','62','63','64','65','66','67','68','69','70','71','72'
    ,'73','74','75','76','77','78','79','80'
  ];
  String? age ;

  List heights = ['110','111','112','113','114','115','116','117','118','119','120','121'
    ,'122','123','124','125','126','127','128','129','130','131','132','133','134','135','136','137','138'
    ,'139','140','141','142','143','144','145','146','147','148','149','150','151','152','153','154','155'
    ,'156','157','158','159','160','161','162','163','164','165','166','167','168','169','170','171','172'
    ,'173','174','175','176','177','178','179','180','181','182','183','184','185','186','187','188','189'
    ,'190','192','193','194','195','196','197','198','199','200','201','202','203','204','205','206','207'
    ,'208','209','210','211','212','213','214','215','216','217','218','219','220'
  ];
  String? height;

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var logemailController = TextEditingController();
  var logpasswordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var phoneNumberController = TextEditingController();

  //Methods
  void changeRegistrationTyp(bool value){
    isSignIn = value;
    emit(ChangeRegistrationTypeState());

  }

  void changeRegistrationType(bool value){
    isSignIn = value;
    emit(ChangeRegistrationTypeState());
  }
  void changeAge(var value){
    age = value;
    emit(ChangeAgeState());
  }
  void changeHeight(var value){
    height = value;
    emit(ChangeHeightState());
  }
  void changeSecurePassword(){
    isSecurePassword = !isSecurePassword;
    emit(ChangeSecurePasswordState());
  }
  Widget togglePassword() {
    return IconButton(onPressed: () {
      changeSecurePassword();
    },
      icon: isSecurePassword ? const Icon(Icons.visibility) : const Icon(
          Icons.visibility_off)
      , color: Colors.pink,);
  }

  //API weather,,,,,,,,

  //Attributes
  final dio =Dio();
  CairoTemp cairo =CairoTemp("Region", 0);
  bool isloading =false;

  //Methods
  getWeather()async{
    isloading=true;
    emit(GetDataLoadingState());
    Response response = await dio.get("http://api.weatherapi.com/v1/current.json?key=e3a6705d6d6d42f2907225815233008&q=Egypt&aqi=no");
    print(response);
    String name =(response.data['location']["name"]);
    double temp = (response.data["current"]["temp_c"]);
    print(name);
    print(temp);
    cairo = CairoTemp(name, temp);
    isloading=false;
    emit(GetDataSuccessState());
    }


//Data Base,,,,,,,,,

//Attributes
late Database database;
  List<Map> info =[];
//Methods
  //
void createDataBase(){
  openDatabase(
    'app_cubit.db',
    version: 1,
    onCreate: (db,version){
      db.execute('Create Table info(id INTEGER PRIMARY KEY,name TEXT,email TEXT,pass TEXT,confirmpass TEXT,age TEXT,height TEXT,phone TEXT)').then((value) {
            print('Table Created');
      }).catchError((e){
        print(e);
      });
    },
    onOpen: (db){
      print('Data Base Opened');
      getDataBase(db);
  }
  ).then((value) {
  database=value;
  emit(CreateDataBase());
  }).catchError((e){
    print(e);
  });
}

//SignUp
  void insertDatasignup({
    required String email,required String pass,required String confirmpass,required String name,required String phone,required String age,required String height
  })async{

 await database.rawInsert('Insert Into info(name,email,pass,confirmpass,phone,age,height) VALUES("${name}","${email}","${pass}","${confirmpass}","${phone}","${age}","${height}")').then((value) {
      print('Data Inserted');
      getDataBase(database);
      emit(InsertDataSignUp());

    }).catchError((e){
      print(e);
    });


  }
  //
  void getDataBase(Database database){
    database.rawQuery('Select * From info').then((value) {
     info = value;
     emit(GetData());
     print(info);
    }).catchError((e){
      print(e);
    });

  }
 List<Map> loginpass=[];
  void getLoginData(Database database,String email){
    database.rawQuery("Select * From info WHERE email =?",[email]).then((value){
     loginpass=value;
     emit(GetLogInData());
     print(loginpass);
     print(email);


    });
  }
}
