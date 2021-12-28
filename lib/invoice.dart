import 'dart:math';

import 'package:amaryshop/productListmodel.dart';
import 'package:flutter/material.dart';

import 'modelClass/productListmodel.dart';

class Invoice extends StatelessWidget {

  final productListModel proDetails;
  int orderNo;

  Invoice(this.proDetails, this.orderNo);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [

            Center(child: Text('Invoice no : 1000')),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Column(
                  children: [

                    Text('Name : product 1'),
                    Text('Mobile : 019...'),
                    Text('Address : Sherpur'),
                    

                  ],
                ),
              ),
            ),

            ListTile(
              leading: Image.network('${proDetails.imageUrl}'),
              title: Column(
                children: [
                  Text('${proDetails.title}'),
                  Text('Number of order : ${orderNo}'),
                  Text('Net bill: ${proDetails.price * orderNo
                  }')
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}