import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:lanka_konect_uae/utils/constant/asset_constant.dart';
import 'package:logger/logger.dart';

import '../models/shared_pref.dart';
import '../widgets/card_widget.dart';
import '../widgets/createGridItem.dart';
import '../widgets/drawer_widget.dart';
import '../widgets/maincard_widget.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {


  List<Widget> carouselItems = [
    CarouselTile(width: 300,height: 180,imgurl: '${AssetConstants.mainImgPath}home_img1.jpg',),
    CarouselTile(width: 300,height: 180,imgurl: '${AssetConstants.mainImgPath}home_img2.jpeg',),
    CarouselTile(width: 300,height: 180,imgurl: '${AssetConstants.mainImgPath}home_img3.jpg',),

  ];

  List<Widget> pramoItems = [
    CarouselTile(width: 300,height: 120,imgurl: '${AssetConstants.pramoImgPath}home_img1.jpg',),
    CarouselTile(width: 300,height: 120,imgurl: '${AssetConstants.pramoImgPath}home_img2.jpeg',),
    CarouselTile(width: 300,height: 120,imgurl: '${AssetConstants.pramoImgPath}home_img3.jpg',),

  ];

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width ;
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Home"),
          backgroundColor: Colors.lightBlue,
          foregroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Container(
            height: height * 0.9,
            decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/bgimage.jpg'),
                  fit: BoxFit.cover,
                  opacity: 0.4,
                )),
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
                  child: Column(
                    children: [
                      CarouselSlider(
                        items: carouselItems,
                        options: CarouselOptions(
                          height: 180,
                          aspectRatio: 16/9,
                          viewportFraction: 0.8,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 3),
                          autoPlayAnimationDuration: Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          enlargeFactor: 0.3,
                          scrollDirection: Axis.horizontal,
                        ),
                      ),
                      const SizedBox(height: 40,),
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  [
                          Cards(text:'Consular Services',color:Colors.white,icon: 'assets/icon/visa.png',route: 'consular',width: 300,height: 120,),
                          const SizedBox(height: 30,),
                          Cards(text:'Employment &\nWelfare Services',color:Colors.white,icon: 'assets/icon/passport.png',route: 'bureau',width: 300,height: 120,),
                        ],
                      ),
                      const SizedBox(height: 40,),
                      CarouselSlider(
                        items: pramoItems,
                        options: CarouselOptions(
                          height: 100,
                          aspectRatio: 16/9,
                          viewportFraction: 0.8,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 3),
                          autoPlayAnimationDuration: Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          enlargeFactor: 0.3,
                          scrollDirection: Axis.horizontal,
                        ),
                      ),






                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        drawer: const DrawerWidget(),
      ),
    );
  }


}

class CarouselTile extends StatelessWidget {
  const CarouselTile({
    required this.width,
    required this.height,
    required this.imgurl,
    super.key,
  });

  final double width;
  final double height;
  final String imgurl;

  @override
  Widget build(BuildContext context) {

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        image: DecorationImage(
          image: NetworkImage(imgurl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}


