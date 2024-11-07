import 'package:e_learning/Screens/drawer_categories/About.dart';
import 'package:e_learning/Screens/drawer_categories/edit_profile.dart';
import 'package:e_learning/Screens/home/course_home.dart';
import 'package:e_learning/Screens/jobs/jobs.dart';
import 'package:e_learning/Screens/home/NavHome/navigation.dart';
import 'package:e_learning/Screens/drawer_categories/privacy_policies.dart';
import 'package:e_learning/Screens/drawer_categories/settings.dart';
import 'package:e_learning/upcoming_meetings_screen.dart';
import 'package:e_learning/util/route_names.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Screens/courses/my_courses_list.dart';
import 'Screens/courses/whishlist_screen.dart';
import 'Screens/details/course_details.dart';
import 'Screens/Authentication/forgotPassword.dart';
import 'Screens/shopping/checkout_screen.dart';
import 'Screens/shopping/shopping_cart_screen.dart';
import 'Screens/home/NavHome/splash_Screen.dart';
import 'Screens/Authentication/login.dart';
import 'Screens/Authentication/sign_up.dart';
import 'Screens/home/NavHome/welcome.dart';
import 'argument/checkout_argument.dart';
import 'argument/course_argument.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Learn To Career',
      routes: {
        'LoginPage': (context) => const Login(),
        'SignupPage': (context) => const SignUp(),
        'SplashScreen': (context) => const SplashScreen(),
        'ForgotPassword': (context) => const ForgotPassword(),
        'WelcomeScreen': (context) => const Welcome(),
        'NavigatorPage' : (context) => const Navigation(),
        'EditProfile' : (context) => const Editprofile(),
        'Settings' : (context) => const Settings(),
        'PrivacyPolicies' : (context) => const PrivacyPolicies(),
        'About' : (context) => const About(),
        'JobsScreen' : (context) =>   const Jobs(),
        'CoursesHome' : (context) => const CourseHome(),
        'MeetingsScreen' :(context) =>  UpcomingMeetingsScreen(),
        RouteNames.shoppingCart: (context) => const ShoppingCartScreen(),
        RouteNames.myCourseList:(context) => const MyCoursesList(),
        RouteNames.whishlist:(context) => const WhishlistScreen(),


      },
      theme: ThemeData(
        colorScheme: const ColorScheme.light(),
        useMaterial3: true,
      ),
      initialRoute: 'SplashScreen',

      onGenerateRoute: (settings){
        if(settings.name == RouteNames.courseDetails){
          final args = settings.arguments as CourseArgument;
          return MaterialPageRoute(builder: (context) => CourseDetails(course: args.course));
        }else if(settings.name==RouteNames.checkout){
          final args = settings.arguments as CheckoutArgument;
          return MaterialPageRoute(builder: (context) => CheckoutScreen(courseList: args.courseList,totalPrice: args.totalPrice,));

        }
      },
    );
  }
}
