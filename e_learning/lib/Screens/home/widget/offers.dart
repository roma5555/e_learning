
import 'dart:async';

import 'package:flutter/material.dart';

class Offers extends StatefulWidget {
   Offers({super.key});

  @override
  State<Offers> createState() => _OffersState();
}

class _OffersState extends State<Offers> {
   int selectedpromo =0;

  List<Image> widgetList = [
    Image.asset("assets/images/offers/offer1.png"),
    Image.asset("assets/images/offers/offer2.png"),

  ];

  late Timer timer;
  final PageController controller = PageController();

  @override
  void initState() {
    // TODO: implement deactivate
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 5), (timer){
      if(selectedpromo <2) {
        selectedpromo++;
      }else{
        selectedpromo=0;
      }
      if(controller.positions.isNotEmpty){
        controller.animateToPage(selectedpromo, duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [PageView.builder(
          controller: controller,
          itemCount: widgetList.length,
            itemBuilder: (context,index){

          return widgetList[index];
        },
          onPageChanged: (int selectedPage){
            setState(() {
              selectedpromo = selectedPage;
            });
          },
        ),

      Container(
        margin: const EdgeInsets.only(bottom: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for(int index=0; index<widgetList.length; index++)
               if(index == selectedpromo)...[createCircle(true)] else
                 createCircle(false)
              ],
        ),
      ),
    ]),
    );
  }
}

Widget createCircle(bool isCurrent){
  return AnimatedContainer(duration: const Duration(
    milliseconds: 150,

  ),
  margin: const EdgeInsets.symmetric(horizontal: 8),

  height: isCurrent? 12:8,width: isCurrent? 12:8,
      decoration:  BoxDecoration(
        color: isCurrent? Colors.orange: Colors.grey,
        borderRadius: const BorderRadius.all(Radius.circular(12))
      ),);
}
