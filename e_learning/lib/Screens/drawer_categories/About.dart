import 'package:e_learning/Widgets/custom_text.dart';
import 'package:flutter/material.dart';

import '../../Widgets/custom_appbar.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: Appbar(title: 'About')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(text: 'About LearnToCareer :'),
            SizedBox(height: 20,),
            Text(
                'LearnToCareer is a cutting-edge e-learning platform designed to empower learners of all ages by '
                'offering high-quality, accessible, and interactive learning experiences. Our mission is to make '
                'education accessible, engaging, and personalized, regardless of geographical location or learning style.'
                'We believe that everyone deserves the opportunity to expand their knowledge, learn new skills, and achieve'
                ' personal and professional growth. Whether you are a student, a working professional, or someone looking to'
                ' enhance their skills, LearnToCareer provides a flexible learning environment that adapts to your needs.'),

            SizedBox(height: 40,),

            CustomText(text: 'What We Offer:'),
            SizedBox(height: 20,),

            Text(
                'Courses for All Levels: From beginner to advanced, we offer a wide range of courses across various subjects such as technology, business, personal development, and more.'
                'Interactive Learning: Our platform incorporates quizzes, assignments, and interactive activities to enhance learning and ensure you can apply what you’ve learned.'
                'Expert Instructors: Learn from industry experts and experienced educators who provide high-quality course content and guidance.'
                'Personalized Learning Paths: Customize your learning journey based on your goals, interests, and pace. Our AI-powered recommendations help you discover courses that suit your learning style and preferences.'
                'Accessible Anytime, Anywhere: Learn at your own pace with our mobile-friendly app, available on iOS, Android, and web platforms.'
                ' Whether you\'re on the go or at home, learning is always at your fingertips.'
                'Community & Support: Join a global community of learners, ask questions, participate in discussions, and get support from instructors and peers to ensure a successful learning experience.',),
          ],
        ),
      ),
    );
  }
}
