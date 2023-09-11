import 'package:flutter/material.dart';
import 'package:portfolio_flutter/utils/responsive.dart';
import 'package:portfolio_flutter/utils/text-style.dart';

class PageHeader extends StatelessWidget {
  final String title, subtitle;
  const PageHeader({
    super.key, required this.title, required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    ResponsiveLayout responsiveLayout = ResponsiveLayout(context);
    String deviceType = responsiveLayout.getDeviceType();
    return Container(
      child: Column(
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: deviceType == 'mobile' 
              ? AppTextStylesMobile.title2_white 
              : AppTextStyles.title2_white,
          ),
          SizedBox(height: 10),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: deviceType == 'mobile' 
              ? AppTextStylesMobile.parag_white
              : AppTextStyles.content_white,
          )
        ],
      ),
      
    );
  }
}