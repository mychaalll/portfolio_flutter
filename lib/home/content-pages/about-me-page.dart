
import 'package:flutter/material.dart';
import 'package:portfolio_flutter/utils/colors.dart';
import 'package:portfolio_flutter/utils/text-style.dart';
import 'package:portfolio_flutter/widget/education-container.dart';
import 'package:portfolio_flutter/widget/page-header.dart';
import 'package:portfolio_flutter/widget/personal-container.dart';


class AboutMePage extends StatefulWidget {
  const AboutMePage({
    super.key,
    required this.height, required this.deviceType,
  });

  final double height;
  final String deviceType;

  @override
  State<AboutMePage> createState() => _AboutMePageState();
}

List<List<String>> education = [
    ['Bago Bantay Elementary School', '2007 - 2013'],
    ['San Francisco High School', '2013 - 2017'],
    ['Gardner College', '2017-2019'],
    ['Polytechnic University of the Philippines', '2019 - Present'],
  ];

class _AboutMePageState extends State<AboutMePage> {
  bool isFirstExpanded = true;
  bool isSecondExpanded = false;

  

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backColor,
      height: widget.height - 80,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: widget.deviceType == 'web' 
            ? 100.0 
            : widget.deviceType == 'tablet' 
            ? 50 
            : 30,
          vertical: widget.deviceType == 'mobile' 
            ? 20
            : 50
        ),

        child: Column(
          children: [
            //heading
            PageHeader(
              title: 'ABOUT ME',
              subtitle: 'Who am I?',
            ),
            SizedBox(height: 20),
            //containers
            Expanded(
              child: MediaQuery.of(context).size.width >  650 ? 
              //HORIZONTAL
              Row(
                children: [
                   PersonalExpandedContainer(
                    expanded: isFirstExpanded,
                    onTap: () {
                      if (!isFirstExpanded) {
                        setState(() {
                          isFirstExpanded = !isFirstExpanded;
                          isSecondExpanded = false;
                        });
                      }
                    },
                    icon: Icons.person_2,
                    title: 'Personal Background',
                  ),
                  SizedBox(width: 20),
                  EducExpandedContainer(
                    expanded: isSecondExpanded,
                    onTap: () {
                      if (!isSecondExpanded) {
                        setState(() {
                          isSecondExpanded = !isSecondExpanded;
                          isFirstExpanded = false;
                        });
                      }
                    },
                    icon: Icons.school_rounded,
                    title: 'Educational Background',
                  ),
                ],
              )

              //VERTICAL
              : Column(
                children: [
                  PersonalExpandedContainer(
                    expanded: isFirstExpanded,
                    onTap: () {
                      if (!isFirstExpanded) {
                        setState(() {
                          isFirstExpanded = !isFirstExpanded;
                          isSecondExpanded = false;
                        });
                      }
                    },
                    icon: Icons.person_2,
                    title: 'Personal Background',
                  ),
                  SizedBox(height: 20),
                  EducExpandedContainer(
                    expanded: isSecondExpanded,
                    onTap: () {
                      if (!isSecondExpanded) {
                        setState(() {
                          isSecondExpanded = !isSecondExpanded;
                          isFirstExpanded = false;
                        });
                      }
                    },
                    icon: Icons.school_rounded,
                    title: 'Educational Background',
                  ),
                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}




