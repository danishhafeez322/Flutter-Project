import 'package:flutter/material.dart';
import 'package:mad_project/pages/notification/widgets/notification_appbar.dart';
import 'package:mad_project/pages/notification/widgets/notification_view.dart';
import 'package:mad_project/pages/notification/widgets/offer_view.dart';

import '../categorybottombar.dart';

class MyNotification extends StatefulWidget {
  const MyNotification ({super.key});

  @override
  State<MyNotification> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<MyNotification> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: const NotificationAppBar(),
            body: const TabBarView(
              children: <Widget>[
                NotificationView(),
                OfferView(),
              ],
            ),
            ),
          
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: CategoryBottomBar(),
        )
        
      ],
    );
  }
}
