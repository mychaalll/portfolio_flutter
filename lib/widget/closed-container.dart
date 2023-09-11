import 'package:flutter/material.dart';
import 'package:portfolio_flutter/utils/text-style.dart';

class ClosedContainer extends StatelessWidget {
  const ClosedContainer({
    super.key,
    required this.expanded,
    required this.icon,
    required this.title,
  });

  final bool expanded;
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return width > 650 ?
    Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedOpacity(
          duration: Duration(milliseconds: 300),
          opacity: !expanded ? 1.0 : 0.0,
          child: Icon(
            icon,
            size: width > 675 ? 100 : 50,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 10),
        AnimatedOpacity(
          duration: Duration(milliseconds: 300),
          opacity: !expanded ? 1.0 : 0.0,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: AppTextStyles.subtitle_white,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ),
      ],
    ):
    Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedOpacity(
          duration: Duration(milliseconds: 300),
          opacity: !expanded ? 1.0 : 0.0,
          child: Icon(
            icon,
            size: height < 750 ? 24 : height < 920 ? 50 : 100 ,
            color: Colors.white,
          ),
        ),
        SizedBox(width: 10),
        width > 475 ? AnimatedOpacity(
          duration: Duration(milliseconds: 300),
          opacity: !expanded ? 1.0 : 0.0,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: AppTextStyles.subtitle_white,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ): Container(),
      ],
    );
  }
}