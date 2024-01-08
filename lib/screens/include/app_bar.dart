import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../routes/routes.dart';
import '../../utils/app_colors.dart';

class DynamicAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DynamicAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primary,
      title: SizedBox(
        width: MediaQuery.of(context).size.width * 0.30,
        height: 60,
        child: Image.asset('assets/images/nitto_hyd.png'),
      ),
      actions: [
        // Icon(Icons.person),
        // SizedBox(width: 10),
        // Icon(Icons.equalizer),
        // SizedBox(width: 10),
        // Icon(Icons.settings),
        // SizedBox(width: 10),
        IconButton(
          onPressed: () => {
            GetStorage().write("gs_login_data", null),
            Get.offAllNamed(Routes.login),
          },
          icon: Icon(Icons.logout),
        ),
        SizedBox(width: 10)
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
