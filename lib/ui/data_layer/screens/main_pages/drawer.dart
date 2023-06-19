import 'package:flutter/material.dart';
import 'package:myelbum_retail/ui/comon/palette.dart';
import 'package:myelbum_retail/ui/data_layer/screens/main_pages/profile/buiness_profile_page.dart';
import 'package:myelbum_retail/ui/data_layer/utils/utils.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer(
      {super.key,
      required this.displayHomePage,
      required this.displaySeting,
      required this.closeDrawer,
      required this.displayHelp});

  final Function() displayHomePage, displaySeting, displayHelp, closeDrawer;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Drawer(
          child: Column(
        children: [
          Container(
            width: double.infinity,
            height: size.height * 0.2,
            color: Palette.appThemeColor,
            padding: const EdgeInsets.symmetric(
              vertical: 14.0,
            ),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    closeDrawer();
                    buildPage(context, const BuisnessProfilePage());
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage("assets/images/profile.png"),
                      radius: 50,
                    ),
                  ),
                ),
                const Spacer(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Jeff Print",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontSize: 12.0,
                      ),
                    ),
                    const SizedBox(
                      height: 3.0,
                    ),
                    const Text(
                      "Rating",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                        fontSize: 12.0,
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "OPEN",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 12.0,
                      ),
                    ),
                    const SizedBox(
                      height: 3.0,
                    ),
                    InkWell(
                      onTap: () {
                        closeDrawer();
                        buildPage(context, const BuisnessProfilePage());
                      },
                      child: Text(
                        "Business Profile",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 12.0,
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
              ],
            ),
          ),
          _buildListTile(Icons.home, "Home", displayHomePage),
          _buildListTile(Icons.settings, "General Settings", displaySeting),
          _buildListTile(Icons.info, "Help and Support", displayHelp),
          const Spacer(),
          _buildListTile(Icons.power_settings_new, "Log out", () {}),
        ],
      )),
    );
  }

  _buildListTile(IconData icon, String text, Function()? onTap) => ListTile(
        leading: Icon(icon),
        title: Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 16.0,
          ),
        ),
        onTap: onTap,
      );
}
