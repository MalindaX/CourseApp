import 'package:flutter/material.dart';

import '../components/lists/course_sections_list.dart';
import '../constants.dart';

class CourseSectionScreen extends StatelessWidget {
  const CourseSectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kBackgroundColor,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(34),),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(32),
            decoration: BoxDecoration(
                color: kCardPopupBackgroundColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(34),
                  bottomLeft: Radius.circular(34),
                ),
                boxShadow: [
                  BoxShadow(
                      color: kShadowColor,
                      offset: Offset(0,12),
                      blurRadius: 32
                  )
                ]
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Course Sections',style: kTitle2Style,),
                SizedBox(height: 5),
                Text('12 Sections',style: kSubtitleStyle)
              ],
            ),
          ),
          CourseSectionList(),
          SizedBox(height: 32)
        ],
      ),
    );
  }
}


