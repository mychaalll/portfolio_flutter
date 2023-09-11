import 'package:flutter/material.dart';
import 'package:portfolio_flutter/home/content-pages/about-me-page.dart';
import 'package:portfolio_flutter/utils/colors.dart';
import 'package:portfolio_flutter/utils/text-style.dart';
import 'package:portfolio_flutter/widget/closed-container.dart';

class EducExpandedContainer extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool expanded;
  final VoidCallback onTap;

  EducExpandedContainer({required this.expanded, required this.onTap, required this.icon, required this.title});

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
          :( expanded ? width * 2 / 3 - 60 : width / 3 - 60) ,
        decoration: BoxDecoration(
          color: !expanded ? AppColors.purple : AppColors.blue,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: expanded ?  Column(
            children: [
              Text(
                'EDUCATIONAL BACKGROUND',
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.subtitle_white,
              ),
              SizedBox(height: 20),
              Expanded(
                child: Container(
                  child: ListView.builder(
                    itemCount: education.length,
                    itemBuilder: (context, index) {
                      final location = education[index][0];
                      final dateRange = education[index][1];

                      return ListTile(
                        title: Text(
                          location,
                          style: AppTextStyles.content_white,
                        ),
                        subtitle: Text(
                          dateRange,
                          style: AppTextStyles.parag_white,
                        ),
                      );
                    },
                  )
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