import 'package:flutter/material.dart';
import 'package:portfolio_flutter/home/content-pages/about-me-page.dart';
import 'package:portfolio_flutter/utils/colors.dart';
import 'package:portfolio_flutter/utils/responsive.dart';
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
    ResponsiveLayout responsiveLayout = ResponsiveLayout(context);
    String deviceType = responsiveLayout.getDeviceType();

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        padding: deviceType == 'mobile' ? EdgeInsets.all(15) : EdgeInsets.all(30),
        duration: Duration(milliseconds: 300),
        height: 
          //row form
          width > 650 ? height 
          : deviceType == 'mobile' ? (expanded ? height * 2 / 3 - 115 : height / 3 - 115)
          : (expanded ? height * 2 / 3 - 150 : height / 3 - 150),
        width: 
          width < 650 ? double.infinity // column form
          //row form
          // web
          : deviceType == 'web' ?( expanded ? width * 2 / 3 - 110 : width / 3 - 110) 
          // tablet
          :( expanded ? width * 2 / 3 - 60 : width / 3 - 60) 
          ,
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
                style: deviceType == 'mobile' ? AppTextStylesMobile.content_white_bold : AppTextStyles.subtitle_white,
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
                          style: AppTextStylesMobile.content_white,
                        ),
                        subtitle: Text(
                          dateRange,
                          style:  AppTextStylesMobile.small_white,
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