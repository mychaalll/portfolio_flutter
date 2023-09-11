
import 'package:flutter/material.dart';
import 'package:portfolio_flutter/utils/colors.dart';
import 'package:portfolio_flutter/utils/text-style.dart';
import 'package:portfolio_flutter/widget/education-container.dart';
import 'package:portfolio_flutter/widget/page-header.dart';
import 'package:portfolio_flutter/widget/personal-container.dart';


class AboutMePage extends StatefulWidget {
  const AboutMePage({
    super.key,
    required this.height,
  });

  final double height;

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
          horizontal: MediaQuery.of(context).size.width > 850 ? 100.0 : 50,
          vertical: 50.0
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
              : 
              Column(
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




