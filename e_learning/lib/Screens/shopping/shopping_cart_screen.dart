import 'package:e_learning/argument/checkout_argument.dart';
import 'package:e_learning/data_provider/shopping_cart_data_provider.dart';
import 'package:e_learning/models/course.dart';
import 'package:e_learning/shared/components/constants.dart';
import 'package:e_learning/util/route_names.dart';
import 'package:flutter/material.dart';

class ShoppingCartScreen extends StatefulWidget {
  const ShoppingCartScreen({super.key});

  @override
  State<ShoppingCartScreen> createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {

  @override
  Widget build(BuildContext context) {
    double totalAmount =calculateTotal();
    List<Course> cartCourseList = ShoppingCartDataProvider.shoppingCartCourseList;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text('Shopping Cart'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children:[ Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Container(
                  child: Row(
                    children: [
                      Text("Total: ",style: TextStyle(fontSize: 20,color: Colors.grey.shade800),),
                      const SizedBox(
                        width: 20,
                      ),

                      Text("\$$totalAmount",style: TextStyle(fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade800),),

                    ],
                  ),
                ),
              ),
          
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("promotion",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black87),),
                    const SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                         const SizedBox(
                          width: 300,
                          height: 50,
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: "Enter promo code",
                              filled: true,
                              isDense: true,
                              contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                            ),
                          ),
                          
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: ElevatedButton(onPressed: (){},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: kPrimaryColor,
                              ),
                              child: const Text('Apply')),
                        )
                      ],
                    ),
                    Text("${cartCourseList.length} Courses in List", style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black26,
                    ),),
                    const SizedBox(height: 10,),
                    Expanded(child: ListView.builder(
                      itemCount: cartCourseList.length,
                      itemBuilder: (context,index){
                        return createShoppingCartItem(index);
                      },)),
                  ],
                ),
              ),
            ],
          ),

            Container(
              height: 50,
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 10,left:20,right: 20,),
              child: ElevatedButton(onPressed: (){
                Navigator.pushNamed(context, RouteNames.checkout,
                  arguments: CheckoutArgument(cartCourseList, totalAmount)
                );
              },
                style: ElevatedButton.styleFrom(
                  backgroundColor: kPrimaryColor,
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 50.0,vertical: 10),
                  child: Text("checkout",style: TextStyle(fontSize: 20,),),
                ),),
            ),

          ],
        ),
      ),
    );
  }


  double calculateTotal(){
    return ShoppingCartDataProvider.shoppingCartCourseList.fold(0, (old,course)=> old + course.price);
  }


  Widget createShoppingCartItem(int index){
    Course course = ShoppingCartDataProvider.shoppingCartCourseList[index];
    return Card(
      child: ListTile(
        leading: Image.asset(course.thumbnailUrl),
        title: Text(course.title,maxLines: 2,
        style: const TextStyle(fontSize: 17,color: Colors.white12),),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("By ${course.createdBy}",
            style: const TextStyle(color: Colors.blue,fontSize: 13),),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text(course.duration,
                style: const TextStyle(fontSize: 14,color: Colors.grey),),
                const SizedBox(
                  width: 10,
                ),
                CircleAvatar(
                    radius: 3,
                    backgroundColor: Colors.grey,
                    child: Container(),

                ),
                const SizedBox(
                  width: 10,
                ),
                Text("${course.lessonNo} Lessons",
                  style: const TextStyle(fontSize: 14,color: Colors.grey),),

              ],
            ),
          ],
        ),

        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("\$${course.price}"), InkWell(
              onTap: (){
                ShoppingCartDataProvider.removeCourseFromCart(course.id);
                setState(() {
                  ShoppingCartDataProvider.shoppingCartCourseList.removeAt(index);
                });
              },
                child: const Icon(Icons.delete)),
          ],
        ),
      ),
    );
  }
}
