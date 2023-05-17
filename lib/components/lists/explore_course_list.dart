import 'package:flutter/material.dart';
import '../../model/course.dart';
import '../cards/explore_course_card.dart';


class ExploreCourseList extends StatelessWidget {
  const ExploreCourseList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: exploreCourses.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(left: index == 0 ? 20.0 : 0.0),   // if card index 0 then left padding 0 otherwise left padding is 20 pixel
              child: ExploreCourseCard(course: exploreCourses[index]),
            );
          }),
    );
  }
}
