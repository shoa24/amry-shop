import 'package:amaryshop/Home.dart';
import 'package:amaryshop/profile.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'forgotpass.dart';
import 'signup.dart';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class MyLogin extends StatefulWidget {
  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {

  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();
  
  
  String? user_name = '';
  String? pass ='';

  @override
  void initState() {
    // TODO: implement initState
    getShardPref();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 200,
              child: FlareActor(
                "animation/Teddy.flr",
                alignment: Alignment.center,
                animation: 'test',
                fit: BoxFit.fill,
              ),
            ),

           
            TextField(
              controller: userController,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                fillColor: Colors.grey,
                filled: true,
                labelText: 'user name',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                hintText: 'enter your name',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: passController,
              style: TextStyle(color: Colors.black),
              obscureText: true,
              decoration: InputDecoration(
                fillColor: Colors.grey,
                filled: true,
                labelText: 'password',
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                hintText: 'enter your password',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ForgotPass()));
                },
                child: Text('forgot password'),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.center,
              child: TextButton(
                onPressed: () {
                  
                  if (userController.text == user_name &&
                      passController.text == pass) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) =>  Home()));
                        Fluttertoast.showToast(msg: 'SuccessFull',toastLength: Toast.LENGTH_LONG);
                  }else  {
                    Fluttertoast.showToast(msg: 'please enter vailed and password',toastLength: Toast.LENGTH_LONG);
                    }
                  },
                    
                child: Text('Sign Up'),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: TextButton(
                onPressed: () {
                  Navigator.push(context,
                        MaterialPageRoute(builder: (context) => signup()));
                },
                child: Text('Registretion'),
              ),
            )
          ],
        ),
      ),
    );
  }

getShardPref() async{
  final pref = await SharedPreferences.getInstance();

  setState(() {
    user_name =pref.getString('user');
    pass =pref.getString('pass');
  });
 
}
}
