import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:motion/motion.dart';
import 'package:pranav_portfolio/data/header_data.dart';
import 'package:pranav_portfolio/utils/constants/colors.dart';
import 'package:pranav_portfolio/widgets/projct_container/project_large_container.dart';
import 'package:pranav_portfolio/widgets/projct_container/project_small_container.dart';

class ProjectDesktop extends StatefulWidget {
  const ProjectDesktop({super.key});

  @override
  State<ProjectDesktop> createState() => _ProjectDesktopState();
}

class _ProjectDesktopState extends State<ProjectDesktop>
    with SingleTickerProviderStateMixin {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    final maxSize = MediaQuery.of(context).size;

    return Row(
      children: [
        for (int i = 0; i < projcts.length; i++)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: MouseRegion(
              onEnter: (event) {
                log("enter");
                setState(() {
                  isHover = true;
                  log(isHover.toString());
                });
              },
              onExit: (event) {
                log("exit");
                setState(() {
                  isHover = false;
                  log(isHover.toString());
                });
              },
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 600),
                transitionBuilder: (child, animation) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
                child: isHover == true
                    ? ProjectLargeContainer(
                        index: i,
                      )
                    : ProjectSmallContainer(
                        index: i,
                      ),
              ),
            ),
          ),
      ],
    );
  }
}
