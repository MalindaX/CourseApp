import 'package:flutter/material.dart';
import '../constants.dart';
import '../screens/profile_screen.dart';
import 'searchfield_widget.dart';
import 'sidebar_button.dart';


class HomeScreenNavBar extends StatelessWidget {
  HomeScreenNavBar({required this.triggerAnimation});

  final Function()? triggerAnimation;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5.0, right: 5.0, top: 20, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:  [
          SidebarButton(triggerAnimation: triggerAnimation),
          const SearchFieldWidget(),
          const Icon(Icons.notifications, color: kPrimaryLabelColor),
          const SizedBox(width: 16),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfileScreen()));
            },
            child: const CircleAvatar(
              radius: 18,
              backgroundImage: AssetImage('asset/images/profile.jpg'),
            ),
          )
        ],
      ),
    );
  }
}




