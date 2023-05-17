import 'package:flutter/material.dart';
import '../components/home_screen_navbar.dart';
import '../components/lists/explore_course_list.dart';
import '../components/lists/recent_course_list.dart';
import '../constants.dart';
import 'continue_watching_screen.dart';
import 'sidebar_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin{
  late Animation<Offset> sidebarAnimation;
  late Animation<double> fadeAnimation;
  late AnimationController sidebarAnimationController;

  var sidebarHidden = true;

  @override
  void initState() {
    super.initState();
    sidebarAnimationController= AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 250)
    );
    sidebarAnimation = Tween<Offset> (
      begin: Offset(-1,0),
      end: Offset(0,0),
    ).animate(
      CurvedAnimation(
          parent: sidebarAnimationController,
          curve: Curves.easeInOut
      ),
    );
    fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
          parent: sidebarAnimationController,
          curve: Curves.easeInOut
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    sidebarAnimationController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: kBackgroundColor,
        child: Stack(
          children: [
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      HomeScreenNavBar(triggerAnimation: () {
                        setState(() {
                          sidebarHidden = !sidebarHidden;
                        });
                        sidebarAnimationController.forward();
                      },),
                      Column(                 // Text Recents
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Recents',
                            style: kLargeTitleStyle,
                          ),
                          const SizedBox(height: 5.0),
                          Text(
                            '23 more courses, coming',
                            style: kSubtitleStyle,
                          )
                        ],
                      ),
                      const SizedBox(height: 15),
                      const RecentCourseList(),   // Course cards x axis scrool
                      Padding(                    // Text Explore
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, top: 15, bottom: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              "Explore",
                              style: kTitle1Style,
                            )
                          ],
                        ),
                      ),
                      ExploreCourseList(),      // Explore course list
                      SizedBox(height: 100),
                      Divider(color: Colors.black,)
                    ],
                  ),
                ),
              ),
            ),
            ContinueWatchingScreen(),           //bottom sheet
            IgnorePointer(
              ignoring: sidebarHidden,
              child: Stack(
                children: [
                  FadeTransition(
                    opacity: fadeAnimation,
                    child: GestureDetector(
                      child: Container(
                        color: Color.fromRGBO(36, 38  , 41, 0.4),
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                      ),
                      onTap: (){
                        setState(() {
                          sidebarHidden = !sidebarHidden;
                        });
                        sidebarAnimationController.reverse();
                      },
                    ),
                  ),
                  SlideTransition(
                    position: sidebarAnimation,
                    child: const SafeArea(
                      child: SidebarScreen(),
                      bottom: false,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



