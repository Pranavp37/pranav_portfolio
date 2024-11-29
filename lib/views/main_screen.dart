import 'package:flutter/material.dart';
import 'package:pranav_portfolio/utils/constants/colors.dart';
import 'package:pranav_portfolio/utils/constants/size.dart';
import 'package:pranav_portfolio/widgets/drawer_mobile.dart';
import 'package:pranav_portfolio/widgets/header_desktop.dart';
import 'package:pranav_portfolio/widgets/header_mobile.dart';
import 'package:pranav_portfolio/widgets/main_desktop.dart';
import 'package:pranav_portfolio/widgets/main_mobile.dart';
import 'package:pranav_portfolio/widgets/project_desktop.dart';
import 'package:pranav_portfolio/widgets/skills_desktop.dart';
import 'package:pranav_portfolio/widgets/skills_mobile.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scafflodKey = GlobalKey<ScaffoldState>();
    final maxSize = MediaQuery.of(context).size;

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        key: scafflodKey,
        endDrawer: constraints.maxWidth >= kMindesktopWid
            ? null
            : const DrawerMobile(),
        backgroundColor: CustomColor.scaffoldBg,
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            //header
            if (constraints.maxWidth >= kMindesktopWid)
              const HeaderDesktop()
            else
              HeaderMobile(menuBtnPress: () {
                scafflodKey.currentState!.openEndDrawer();
              }),

            //mainSectionPP
            if (constraints.maxWidth >= kMindesktopWid)
              const MainDesktop()
            else
              const MainMobile(),
            //skillsSection
            Container(
              width: maxSize.width,
              padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
              color: CustomColor.bgLight1,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  //titile
                  const Text(
                    'What I can do',
                    style: TextStyle(
                      fontSize: 28,
                      color: CustomColor.whitePrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 40),
                  // platforms
                  if (constraints.maxWidth >= kMindesktopWid)
                    const SkillsDesktop()
                  else
                    const SkillsMobile()
                ],
              ),
            ),
            //ProjectsSection
            Container(
              padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
              width: maxSize.width,
              color: CustomColor.scaffoldBg,
              child: const Column(
                children: [
                  //titile
                  Text(
                    'Projects',
                    style: TextStyle(
                      fontSize: 28,
                      color: CustomColor.whitePrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 30),
                  ProjectDesktop(),
                ],
              ),
            ),
            //GetIt Section  // maxLines: 3,
            Container(
              height: 500,
              width: double.maxFinite,
              color: Colors.black,
            ),
            //Footer
            Container(
              height: 500,
              width: double.maxFinite,
              color: Colors.grey,
            ),
          ],
        ),
      );
    });
  }
}
