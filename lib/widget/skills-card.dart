import 'package:flutter/material.dart';
import 'package:portfolio_flutter/data/skills-data.dart';
import 'package:portfolio_flutter/utils/colors.dart';
import 'package:portfolio_flutter/utils/text-style.dart';


class SkillsCard extends StatelessWidget {
  int index;
  
  SkillsCard({
    super.key,
    required this.index,
    required this.skillsToDisplay,
  });

  final List<Skills> skillsToDisplay;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.blue,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0,horizontal:20.0),
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: Image.asset(
                skillsToDisplay[index].imgPath,
                fit: BoxFit.fill,
              ),
            ),
            Spacer(
              flex: 1,
            ),
            Text(
              skillsToDisplay[index].title,
              style: AppTextStyles.content_white,
            )
          ],
        ),
      ),  
    );
  }
}