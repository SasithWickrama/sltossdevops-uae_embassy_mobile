import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../utils/constant/asset_constant.dart';
import '../widgets/maincard_widget.dart';

class ConsularService extends StatefulWidget {
  const ConsularService({super.key});

  @override
  State<ConsularService> createState() => _ConsularServiceState();
}

class _ConsularServiceState extends State<ConsularService> {

  List<Widget> carouselItems = [
    CarouselTile(width: 300,height: 180,imgurl: '${AssetConstants.mainImgPath}home_img1.jpg',),
    CarouselTile(width: 300,height: 180,imgurl: '${AssetConstants.mainImgPath}home_img2.jpeg',),
    CarouselTile(width: 300,height: 180,imgurl: '${AssetConstants.mainImgPath}home_img3.jpg',),

  ];

  @override
  Widget build(BuildContext context) {
   // double width = MediaQuery.of(context).size.width ;
  //  double height = MediaQuery.of(context).size.height;

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Consular Services"),
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
                      const SizedBox(height: 30,),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  [
                          MainCards(text:'APPOINTMENTS',color:Colors.white,icon: 'assets/icon/appointment.png',route: 'apointmentservice',),
                          MainCards(text:'PASSPORT \n SERVICES',color:Colors.white,icon: 'assets/icon/passport.png',route: 'passportservice',),
                        ],
                      ),
                      const SizedBox(height: 20,),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  [
                          MainCards(text:'BIRTH \nREGISTRATION',color:Colors.white,icon: 'assets/icon/registration.png',route: 'birthregistration',),
                          MainCards(text:'MARRIAGE \nREGISTRATION',color:Colors.white,icon: 'assets/icon/registration.png',route: 'marriageregistration',),

                        ],
                      ),
                      const SizedBox(height: 20,),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  [
                          MainCards(text:'DEATH \nREGISTRATION',color:Colors.white,icon: 'assets/icon/registration.png',route: 'deathegistration',),
                          MainCards(text:'DOCUMENT \nATTESTATION',color:Colors.white,icon: 'assets/icon/documents.png',route: 'documentservice',),

                        ],
                      ),
                      const SizedBox(height: 20,),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  [
                          MainCards(text:'VISA \n SERVICES',color:Colors.white,icon: 'assets/icon/visa.png',route: 'visaservice',),

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

