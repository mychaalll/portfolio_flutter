import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:portfolio_flutter/data/skills-data.dart';
import 'package:portfolio_flutter/utils/colors.dart';
import 'package:portfolio_flutter/utils/responsive.dart';
import 'package:portfolio_flutter/utils/text-style.dart';
import 'package:portfolio_flutter/widget/page-header.dart';
import 'package:portfolio_flutter/widget/skills-card.dart';

class SkillsPage extends StatefulWidget {
  SkillsPage({
    super.key,
    required this.height,
  });

  final double height;

  @override
  State<SkillsPage> createState() => _SkillsPageState();
}

class _SkillsPageState extends State<SkillsPage> {
  PageController pageController = new PageController();

  final List<Skills> skills1 = programmingSkills; 

  final List<Skills> skills2 = developmentSkills; 

  final List<Skills> skills3 = dbbeSkills; 

  final List<Skills> skills4 = toolSkills; 

  late List<Skills> skillsToDisplay = skills1;

  final List skillTitles = ['Programming Languages', 'Development Skills', 'Database and Back-end', 'Development Tools'];
  int currentPage = 0;


  @override
  Widget build(BuildContext context) {
    ResponsiveLayout responsiveLayout = ResponsiveLayout(context);
    String deviceType = responsiveLayout.getDeviceType();
    return Container(
      height: widget.height - 80,
      color: AppColors.backColor,
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: deviceType == 'web' 
            ? 100.0 
            : deviceType == 'tablet' 
            ? 50 
            : 30,
          vertical: deviceType == 'mobile' 
            ? 20
            : 50
        ),
        child: Column(
          children: [
            PageHeader(
              title: 'SKILLS',
              subtitle: 'Expertise and Abilities',
            ),
            SizedBox(height:20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 30,
                  width: 5,
                  decoration: BoxDecoration(
                    color: AppColors.purple,
                    borderRadius: BorderRadius.circular(12)
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  flex: 4,
                  child: Text(
                    skillTitles[currentPage],
                    textAlign: TextAlign.start,
                    style: AppTextStyles.subtitle_white,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                Spacer(flex: 1),
                currentPage != 0 ? Column(
                  children: [
                    IconButton(
                      onPressed: (){
                        pageController.previousPage(
                          duration: Duration(milliseconds: 500), 
                          curve: Curves.decelerate
                        );
                      }, 
                      icon: Icon(
                        Icons.arrow_left_rounded,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                    SizedBox(height: 5)
                  ],
                ): Container(),
                currentPage != 3 ? Column(
                  children: [
                    IconButton(
                      onPressed: (){
                        pageController.nextPage(
                          duration: Duration(milliseconds: 500), 
                          curve: Curves.decelerate
                        );
                      }, 
                      icon: Icon(
                        Icons.arrow_right_rounded,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                    SizedBox(height: 5)
                  ],
                ): Container()
              ],
            ),
            SizedBox(height:20),
            Expanded(
              child: PageView.builder(
                controller: pageController,
                itemCount: 4,
                onPageChanged:(value) {
                  setState(() {
                    currentPage = value;
                  });
                  
                  if (currentPage == 0){
                    skillsToDisplay = skills1;
                    print(skillsToDisplay.length);
                  }
                  else if (currentPage == 1){
                    skillsToDisplay = skills2;
                    print(skillsToDisplay.length);
                  }
                  else if(currentPage == 2){
                    skillsToDisplay = skills3;
                    print(skillsToDisplay.length);
                  }
                  else if(currentPage == 3){
                    skillsToDisplay = skills4;
                    print(skillsToDisplay.length);
                  }
                },
                itemBuilder: (context, index){
                  return Container(
                    child: GridView.builder(
                      gridDelegate: deviceType == 'mobile' ? 
                      SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                      )
                      : SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 250,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                      ), 
                      itemCount: skillsToDisplay.length,
                      itemBuilder: ((context, index) {
                        return SkillsCard(
                          skillsToDisplay: skillsToDisplay,
                          index: index,
                        );
                    }))
                  );
                },
                
              ),
            )
          ],
        ),
      ),
    );
  }
}


