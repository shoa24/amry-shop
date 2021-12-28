import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login.dart';

class signup extends StatelessWidget {
  TextEditingController userController =TextEditingController();
  TextEditingController passController =TextEditingController();
  TextEditingController genderController =TextEditingController();
  TextEditingController addressController =TextEditingController();
   TextEditingController date_of_birth_Controller =TextEditingController();


  String user = 'mobile';
  String pass = '1234';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 10,),

              Center(
                child: Text(
                  'signup', style:
                   TextStyle(
                     fontSize: 40,
                     color: Colors.black),
                     
                
                ),
              ),
              
              Padding(
                padding:const EdgeInsets.all(8.0),
                child: TextField(
                  controller: userController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'user name',
                    hintText: "Enter your name"
                  ),
                ),),
                 Padding(
                padding:const EdgeInsets.all(8.0),
                child: TextField(
                  controller: passController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'passWord',
                    hintText: "Enter your password"
                  ),
                ),),
                 Padding(
                padding:const EdgeInsets.all(8.0),
                child: TextField(
                  controller: genderController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'gender',
                    hintText: " male / female "
                  ),
                ),),
                 Padding(
                padding:const EdgeInsets.all(8.0),
                child: TextField(
                  controller: addressController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'address',
                    hintText: "Enter your address "
                  ),
                ),),
                 Padding(
                padding:const EdgeInsets.all(8.0),
                child: TextField(
                  controller: date_of_birth_Controller,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'date of birth',
                    hintText: "Enter your date of birth DD-MM-YYYY "
                  ),
                ),),


Container(
            alignment:Alignment.center,
           child:TextButton(
             onPressed:() {
               setShardPref();
               
               Navigator.push(context, MaterialPageRoute(builder: (context)=>MyLogin()));
             },
              child: Text('Submit'),),
            )

            ],
          ),
        ),
      ),
    );
  }
  setShardPref()async{
    final pref =await SharedPreferences.getInstance();
    pref.setString('user', userController.text);
    pref.setString('pass', passController.text);
  }
}