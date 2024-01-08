import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../routes/routes.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: const Color.fromARGB(255, 9, 52, 116),
        child: Column(
          children: <Widget>[
            ListTile(
              hoverColor: Colors.blue,
              dense: true,
              visualDensity: const VisualDensity(vertical: -4),
              leading: SizedBox(
                width: 25,
                height: 25,
                child: SvgPicture.asset(
                  'assets/icons/home.svg',
                  // ignore: deprecated_member_use
                  color: Colors.white,
                ),
              ),
              title: const Text('Dashboard',
                  style: TextStyle(color: Colors.white, fontSize: 16)),
              onTap: () {
                Get.toNamed(Routes.home);
              },
            ),
            const SizedBox(height: 20),
            ListTile(
              hoverColor: Colors.blue,
              dense: true,
              visualDensity: const VisualDensity(vertical: -4),
              leading: SizedBox(
                height: 25,
                width: 25,
                child: SvgPicture.asset(
                  'assets/icons/Plant details.svg',
                  // ignore: deprecated_member_use
                  color: Colors.white,
                ),
              ),
              title: const Text('Plant Details',
                  style: TextStyle(color: Colors.white, fontSize: 16)),
              onTap: () {
                Get.toNamed(
                  Routes.plantDetails,
                );
              },
            ),
            const SizedBox(height: 20),
            ListTile(
              hoverColor: Colors.blue,
              dense: true,
              visualDensity: const VisualDensity(vertical: -4),
              leading: SizedBox(
                height: 25,
                width: 25,
                child: SvgPicture.asset(
                  'assets/icons/SP.svg',
                  // ignore: deprecated_member_use
                  color: Colors.white,
                ),
              ),
              title: const Text('Set Points',
                  style: TextStyle(color: Colors.white, fontSize: 16)),
              onTap: () {
                Get.toNamed(Routes.setPoints);
              },
            ),
            const SizedBox(height: 20),
            ListTile(
              hoverColor: Colors.blue,
              dense: true,
              visualDensity: const VisualDensity(vertical: -4),
              leading: SizedBox(
                height: 25,
                width: 25,
                child: SvgPicture.asset(
                  'assets/icons/profile.svg',
                  // ignore: deprecated_member_use
                  color: Colors.white,
                ),
              ),
              title: const Text('User Management',
                  style: TextStyle(color: Colors.white, fontSize: 16)),
              onTap: () {
                Get.toNamed(Routes.userManagement);
              },
            ),
            const SizedBox(height: 20),
            ListTile(
              hoverColor: Colors.blue,
              dense: true,
              visualDensity: const VisualDensity(vertical: -4),
              leading: SizedBox(
                height: 25,
                width: 25,
                child: SvgPicture.asset(
                  'assets/icons/plant.svg',
                  // ignore: deprecated_member_use
                  color: Colors.white,
                ),
              ),
              title: const Text('Plant Information',
                  style: TextStyle(color: Colors.white, fontSize: 16)),
              onTap: () {},
            ),
            const SizedBox(height: 20),
            ListTile(
              hoverColor: Colors.blue,
              dense: true,
              visualDensity: const VisualDensity(vertical: -4),
              leading: SizedBox(
                height: 25,
                width: 25,
                child: SvgPicture.asset(
                  'assets/icons/file.svg',
                  // ignore: deprecated_member_use
                  color: Colors.white,
                ),
              ),
              title: const Text('Support Document',
                  style: TextStyle(color: Colors.white, fontSize: 16)),
              onTap: () {},
            ),
            const SizedBox(height: 20),
            ListTile(
              hoverColor: Colors.blue,
              dense: true,
              visualDensity: const VisualDensity(vertical: -4),
              leading: SizedBox(
                height: 25,
                width: 25,
                child: SvgPicture.asset(
                  'assets/icons/Help.svg',
                  // ignore: deprecated_member_use
                  color: Colors.white,
                ),
              ),
              title: const Text('Help',
                  style: TextStyle(color: Colors.white, fontSize: 16)),
              onTap: () {},
            ),
            const SizedBox(height: 20),
            ListTile(
              hoverColor: Colors.blue,
              dense: true,
              visualDensity: const VisualDensity(vertical: -4),
              leading: SizedBox(
                height: 25,
                width: 25,
                child: SvgPicture.asset(
                  'assets/icons/user.svg',
                  // ignore: deprecated_member_use
                  color: Colors.white,
                ),
              ),
              title: const Text(
                'User Information',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
