import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_learning/models/course.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ShoppingCartDataProvider{
  static final List<Course> _shoppingCartCourseList = [];
  static  List<Course> get shoppingCartCourseList => _shoppingCartCourseList;

  static void clearCart(){
    _shoppingCartCourseList.clear();
  }

  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<void> addCourseToCart(Course course) async {
    String userId = _auth.currentUser!.uid;

    await _firestore.collection('users').doc(userId).collection('cart').doc(course.id).set({
      'title': course.title,
      'createdBy': course.createdBy,
      'price': course.price,
    });
    _shoppingCartCourseList.add(course);

  }

  static Future<bool> isCourseInCart(String courseId) async {
    String userId = _auth.currentUser!.uid;
    DocumentSnapshot doc = await _firestore.collection('users').doc(userId).collection('cart').doc(courseId).get();
    return doc.exists;
  }

  static Future<void> removeCourseFromCart(String courseId) async {
    String userId = _auth.currentUser!.uid;
    await _firestore.collection('users').doc(userId).collection('cart').doc(courseId).delete();

  }
}