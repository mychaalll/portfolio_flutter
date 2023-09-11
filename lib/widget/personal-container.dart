import 'package:flutter/material.dart';
import 'package:portfolio_flutter/utils/colors.dart';
import 'package:portfolio_flutter/utils/text-style.dart';
import 'package:portfolio_flutter/widget/closed-container.dart';

class PersonalExpandedContainer extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool expanded;
  final VoidCallback onTap;

  PersonalExpandedContainer({required this.expanded, required this.onTap, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        padding: height < 700 ? EdgeInsets.all(15) : EdgeInsets.all(30),
        duration: Duration(milliseconds: 300),
        height: 
          width > 650 ? height : (expanded ? height * 2 / 3 - 150 : height / 3 - 150),
        width: 
          width < 650 ? double.infinity :
          width > 850 
          ?( expanded ? width * 2 / 3 - 110 : width / 3 - 110)
          :( expanded ? width * 2 / 3 - 60 : width / 3 - 60) 
          ,
        decoration: BoxDecoration(
          color: !expanded ? AppColors.purple : AppColors.blue,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: expanded ? Column(
            children: [
              Text(
                'MY BACKGROUND',
                style: AppTextStyles.subtitle_white,
              ),
              SizedBox(height: 20),
              Expanded(
                child: Container(
                  child: SingleChildScrollView(
                    child: Text(
                      'I am Mychal Jandro Esureña, a student soon to complete my studies in Computer Engineering at the Polytechnic University of the Philippines. At the age of 21, I have focused my efforts on the realm of software development, where I\'m currently engrossed in exploring the intricacies of Flutter to create user-friendly applications. As I approach the transition to the professional sphere, I am enthusiastic about contributing solutions that align with user preferences and enhance the technological landscape.',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 40,
                      style: AppTextStyles.parag_white,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
              )
            ],
          )
          //closed container
          : ClosedContainer(expanded: expanded, icon: icon, title: title)
        ),
      ),
    );
  }
}


