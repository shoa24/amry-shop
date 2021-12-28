import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class profile extends StatefulWidget {

  @override
  _profileState createState() => _profileState();
}

class _profileState extends State<profile> {
  String? user_name= '';
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
      body: SafeArea(
        child: Column(
          children: [
            Text('User Name : $user_name'),
            Text('pass: $pass'),

          ],
        )),
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