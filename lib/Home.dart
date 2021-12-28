
import 'dart:js';

import 'package:amaryshop/DetailsView.dart';
import 'package:amaryshop/productListmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';

class Home extends StatelessWidget {


  final List<String> imaglist = [
    'https://cdn.pixabay.com/photo/2016/03/02/20/13/grocery-1232944__480.jpg',
    'https://cdn.pixabay.com/photo/2016/03/23/19/38/shopping-carts-1275480__340.jpg',
    'https://cdn.pixabay.com/photo/2016/11/02/16/49/grapefruits-1792233__340.jpg',
    'https://cdn.pixabay.com/photo/2017/08/10/07/20/grocery-store-2619380__340.jpg',
    'https://cdn.pixabay.com/photo/2018/01/25/08/14/aisle-3105629__340.jpg',
    'https://cdn.pixabay.com/photo/2019/03/13/11/07/supermarket-4052658__480.jpg'
    ];

    /*All product list */
  final List<productListModel> productlist = [
    productListModel(1, "Product 1", "Product 1 desc", 5, 2, 20, 100, 5, "6", 'https://cdn.pixabay.com/photo/2019/03/12/09/18/tomatoes-4050245__340.jpg'),
    productListModel(2, "Product 2", "Product 2 desc", 5, 2, 20, 100, 5, "6", 'https://cdn.pixabay.com/photo/2019/03/12/09/18/tomatoes-4050245__340.jpg'),
    productListModel(3, "Product 3", "Product 3 desc", 5, 2, 20, 100, 5, "6", 'https://cdn.pixabay.com/photo/2019/03/12/09/18/tomatoes-4050245__340.jpg'),
    productListModel(4, "Product 4", "Product 4 desc", 5, 2, 20, 100, 5, "6", 'https://cdn.pixabay.com/photo/2019/03/12/09/18/tomatoes-4050245__340.jpg'),
    productListModel(5, "Product 5", "Product 5 desc", 5, 2, 20, 100, 5, "6",'https://cdn.pixabay.com/photo/2019/03/12/09/18/tomatoes-4050245__340.jpg'),
    productListModel(4, "Product 4", "Product 4 desc", 5, 2, 20, 100, 5, "6",'https://cdn.pixabay.com/photo/2019/03/12/09/18/tomatoes-4050245__340.jpg'),
    productListModel(5, "Product 5", "Product 5 desc", 5, 2, 20, 100, 5, "6",'https://cdn.pixabay.com/photo/2019/03/12/09/18/tomatoes-4050245__340.jpg'),
    
    
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.orange ,
      ),
      drawer:   Drawer(
        
      ),
   body:SafeArea(
          child:(
          ListView(
            children: [
            Container(
              height: 150,
              child: CarouselSlider.builder(
                  slideBuilder: (index){
                    return Container(
                      child: Image.network(imaglist[index], fit: BoxFit.fill,),
                    );
                  },
                  slideTransform: CubeTransform(),
                  slideIndicator: CircularSlideIndicator(
                    padding: EdgeInsets.only(bottom: 8)
                  ),
                  autoSliderDelay: Duration(seconds: 5),
                  enableAutoSlider: true,
                  unlimitedMode: true,
                  itemCount: imaglist.length
              ),
            ),


            Padding(
              padding: const EdgeInsets.all(12),
              child: GridView.builder(
                controller: new ScrollController(keepScrollOffset: false),
                shrinkWrap: true,
                itemCount: productlist.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10
                  ),
                  itemBuilder: (BuildContext context, index){

                    return InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> DetailsView(productlist[index])));

                      },

                   
                      child: Card(
                        elevation: 20,
                        child: Column(
                          children: [
                            Container(
                              child: Image.network(productlist[index].imageUrl),
                            ),
                            Text(productlist[index].title)
                          ],
                        ),
                      )
                     );
                  }),
            )],)
    ) ,));
  
  }
}