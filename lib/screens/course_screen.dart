import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../components/cards/course_section_card.dart';
import '../components/lists/course_sections_list.dart';
import '../constants.dart';
import '../model/course.dart';
import 'course_sections_screen.dart';

class CourseScreen extends StatefulWidget {
  CourseScreen({required this.course});

  late final Course course;

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  Widget indicators() {
    List<Widget> indicators = [];

    for (var i = 0; i < 9; i++) {
      indicators.add(Container(
        width: 7,
        height: 7,
        margin: EdgeInsets.symmetric(horizontal: 6.0),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: i == 0 ? Color(0xFF0971FE) : Color(0xFFA6AEBD)),
      ));
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: indicators,
    );
  }

  late PanelController panelController;

  @override
  void initState() {
    super.initState();
    panelController = PanelController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: kBackgroundColor,
        child: SlidingUpPanel(
          controller: panelController,
          backdropEnabled: true,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(34)),
          color: kCardPopupBackgroundColor,
          boxShadow: [
            BoxShadow(
              color: kShadowColor,
              offset: Offset(0,-12),
              blurRadius: 32
            )
          ],
          minHeight: 0.0,
          maxHeight: MediaQuery.of(context).size.height * 0.91,
          panel: CourseSectionScreen(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  clipBehavior: Clip.none,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.5,
                        decoration:
                            BoxDecoration(gradient: widget.course.background),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: SafeArea(
                        bottom: false,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      width: 60,
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(18),
                                      ),
                                      child: Image.asset(
                                          'asset/logos/${widget.course.logo}'),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Hero(
                                            tag: widget.course.courseSubtitle,
                                            child: Text(
                                              widget.course.courseSubtitle,
                                              style: kSecondaryCallOutLabelStyle
                                                  .copyWith(
                                                      color: Colors.white70),
                                            ),
                                          ),
                                          Hero(
                                            tag: widget.course.courseTitle,
                                            child: Text(
                                              widget.course.courseTitle,
                                              style: kLargeTitleStyle.copyWith(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pop(
                                            context); // pop the screen to home screen
                                      },
                                      child: Container(
                                        width: 36,
                                        height: 36,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(12),
                                          color:
                                              kPrimaryLabelColor.withOpacity(0.8),
                                        ),
                                        child: Icon(Icons.close,
                                            color: Colors.white),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 28,
                              ),
                              Expanded(
                                child: Hero(
                                  tag: widget.course.illustration,
                                  child: Image.asset(
                                    'asset/illustrations/${widget.course.illustration}',
                                    fit: BoxFit.cover,
                                    alignment: Alignment.topCenter,
                                    width: MediaQuery.of(context).size.width,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 28),
                      child: Container(
                        padding: EdgeInsets.only(
                            top: 12.5, bottom: 13.5, left: 20.5, right: 14.5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                  color: kShadowColor,
                                  blurRadius: 16,
                                  offset: Offset(0, 4))
                            ]),
                        width: 60,
                        height: 60,
                        child: Image.asset('asset/icons/icon-play.png'),
                      ),
                    )
                  ],
                ), // image + play button
                Padding(
                  padding: EdgeInsets.only(top: 12, left: 28, right: 28),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Container(
                            child: Padding(
                              padding: EdgeInsets.all(4),
                              child: Container(
                                padding: EdgeInsets.all(4),
                                child: CircleAvatar(
                                  child: Icon(
                                    Icons.people,
                                    color: Colors.white,
                                  ),
                                  radius: 21,
                                  backgroundColor: kCourseElementIconColor,
                                ),
                                decoration: BoxDecoration(
                                  color: kBackgroundColor,
                                  borderRadius: BorderRadius.circular(29),
                                ),
                              ),
                            ),
                            height: 58,
                            width: 58,
                            decoration: BoxDecoration(
                              gradient: widget.course.background,
                              borderRadius: BorderRadius.circular(29),
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "28.7K",
                                style: kTitle2Style,
                              ),
                              Text(
                                "Students",
                                style: kSearchPlaceholderStyle,
                              )
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            child: Padding(
                              padding: EdgeInsets.all(4),
                              child: Container(
                                padding: EdgeInsets.all(4),
                                child: CircleAvatar(
                                  child: Icon(
                                    Icons.insert_comment_sharp,
                                    color: Colors.white,
                                  ),
                                  radius: 21,
                                  backgroundColor: kCourseElementIconColor,
                                ),
                                decoration: BoxDecoration(
                                  color: kBackgroundColor,
                                  borderRadius: BorderRadius.circular(29),
                                ),
                              ),
                            ),
                            height: 58,
                            width: 58,
                            decoration: BoxDecoration(
                              gradient: widget.course.background,
                              borderRadius: BorderRadius.circular(29),
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "12.4K",
                                style: kTitle2Style,
                              ),
                              Text(
                                "Comments",
                                style: kSearchPlaceholderStyle,
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 28, vertical: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      indicators(),
                      GestureDetector(
                        onTap: () {
                          panelController.open();
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: kShadowColor,
                                    offset: Offset(0, 12),
                                    blurRadius: 16)
                              ],
                              borderRadius: BorderRadius.circular(14)),
                          width: 80,
                          height: 40,
                          child: Text(
                            'View All',
                            style: kSearchTextStyle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ), // Two Icons
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 28),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Flutter is an open-source UI software development kit created by Google. It is used to develop cross platform applications for Android, iOS, Linux, macOS, Windows, Google Fuchsia, and the web from a single codebase. First described in 2015, Flutter was released in May 2017.",
                        style: kBodyLabelStyle,
                      ),
                      SizedBox(
                        height: 24.0,
                      ),
                      Text(
                        "About this course",
                        style: kTitle1Style,
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Text(
                        "We operate some of the world’s most innovative, diverse and distinctive brands, and do so in a way which is responsible and in tune with our customers’ needs.We operate some of the world’s most innovative, diverse and distinctive brands,",
                        style: kBodyLabelStyle,
                      ),
                      SizedBox(
                        height: 24,
                      )
                    ],
                  ),
                ) // Text
              ],
            ),
          ),
        ),
      ),
    );
  }
}



