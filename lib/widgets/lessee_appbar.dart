import 'package:flutter/material.dart';
import 'package:mad_project/core/constant/app_color.dart';
import 'package:mad_project/widgets/tabs.dart';

class LesseeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const LesseeAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(100.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                'Rent It',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ],
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   crossAxisAlignment: CrossAxisAlignment.end,
          //   children: <Widget>[
          //     WhatsAppIcons(
          //       icon: Icons.camera_alt_outlined,
          //       right: 20.0,
          //       color: WhatsAppColors.white.withOpacity(0.5),
          //       ontap: () async {},
          //     ),
          //     WhatsAppIcons(
          //       icon: Icons.search,
          //       right: 20.0,
          //       color: WhatsAppColors.white.withOpacity(0.5),
          //       ontap: () async {},
          //     ),
          //     WhatsAppIcons(
          //       icon: Icons.more_vert,
          //       color: WhatsAppColors.white.withOpacity(0.5),
          //       ontap: () async {},
          //     ),
          //   ],
          // ),
        ],
      ),
      bottom: TabBar(
        indicatorColor: AppColors.uploadColor,
        indicatorWeight: 3.5,
        labelColor: AppColors.uploadColor,
        unselectedLabelColor: Colors.black,
        tabs: const <Widget>[
          MyTabs(text: 'Posted'),
          MyTabs(text: 'Given'),
          MyTabs(text: 'Rented'),
        ],
      ),
    );
  }
}
