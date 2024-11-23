import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../utils/constant/asset_constant.dart';
import '../widgets/maincard_widget.dart';

class BureauService extends StatefulWidget {
  const BureauService({super.key});

  @override
  State<BureauService> createState() => _BureauServiceState();
}

class _BureauServiceState extends State<BureauService> {

  List<Widget> carouselItems = [
    CarouselTile(width: 300,height: 180,imgurl: '${AssetConstants.mainImgPath}home_img1.jpg',),
    CarouselTile(width: 300,height: 180,imgurl: '${AssetConstants.mainImgPath}home_img2.jpeg',),
    CarouselTile(width: 300,height: 180,imgurl: '${AssetConstants.mainImgPath}home_img3.jpg',),

  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width ;
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Bureau Services"),
          backgroundColor: Colors.lightBlue,
        ),
        body: SingleChildScrollView(
          child: Container(
            height: height,
            decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/bgimage.jpg'),
                  fit: BoxFit.cover,
                  opacity: 0.4,
                )),
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 30),
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
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  [
                          MainCards(text:'APPOINTMENTS',color:Colors.white,icon: 'assets/icon/appointment.png',route: 'apointmentservice',),
                          MainCards(text:'EMPLOYMENT',color:Colors.white,icon: 'assets/icon/employe.png',route: 'empservice',),
                        ],
                      ),
                      const SizedBox(height: 20,),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  [
                          MainCards(text:'WELFARE',color:Colors.white,icon: 'assets/icon/welfare.png',route: '',),
                        ],
                      ),






                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
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

