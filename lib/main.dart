
import 'package:amaryshop/login.dart';
import 'package:flutter/material.dart';
void main(List<String> args) {
  runApp(amaryShop());
}
class amaryShop extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    home: MyLogin(),
    );
  }
}