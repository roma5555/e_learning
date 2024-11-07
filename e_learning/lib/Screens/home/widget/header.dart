import 'package:e_learning/shared/components/constants.dart';
import 'package:flutter/material.dart';


class Header extends StatelessWidget {
   const Header({super.key});

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Column(
          children:  [
            Text('welcome Student',
            style: TextStyle(fontSize: 30.0,fontWeight: FontWeight.bold,color: Colors.white),),
            SizedBox(
              height: 10.0,
            ),
            Text('Let\'s learn something new today',
              style: TextStyle(fontSize: 18.0,color: Colors.white),),

          ],
        ),
        Row(
          children: [
            Container(
              height: 40.0,
              width: 40.0,
              decoration: const BoxDecoration(
                color: kOptionColor,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Align(
                alignment: Alignment.center,
                child: Stack(alignment: Alignment.topRight
                  ,children: [const Icon(Icons.notifications,color: Colors.white),
                Container(
                  height: 10,
                    width: 10,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),],),
              ) ,
            ),
          ],
        ),
      ],
    );
  }
}
