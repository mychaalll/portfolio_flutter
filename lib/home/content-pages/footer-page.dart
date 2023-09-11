import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_flutter/utils/colors.dart';
import 'package:portfolio_flutter/utils/text-style.dart';
import 'package:url_launcher/url_launcher.dart';

class FooterPage extends StatelessWidget {
  FooterPage({
    super.key,
    required this.height,
  });

  final double height;
  ScrollController scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 20,
        horizontal: MediaQuery.of(context).size.width > 850 ? 100.0 : 50,
      ),
      color: Color.fromARGB(255, 12, 12, 12),
      height: height / 3,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Connect',
            style: AppTextStyles.content_grey,
          ),
          SizedBox(height:20),
          Container(
            height: 60,
            child: Row(
              children: [
                Spacer(),
                FooterIcons(
                  icon: FontAwesomeIcons.facebookF, 
                  url: 'https://www.facebook.com/tsm.mychaalll',
                ),
                Spacer(),
                FooterIcons(
                  icon: FontAwesomeIcons.solidEnvelope, 
                  url: 'mailto:tsmmychaalll@gmail.com?subject=Job%20Related',
                ),
                Spacer(),
                FooterIcons(
                  icon: FontAwesomeIcons.linkedin, 
                  url: 'https://www.linkedin.com/in/mychal-esure%C3%B1a-534903286',
                ),
                Spacer(),
                FooterIcons(
                  icon: FontAwesomeIcons.github,
                  url: 'https://github.com/mychaalll'
                ),
                Spacer(),
              ],
            ),
          ),
          Spacer(),
          
          Text(
            "Mychal Jandro Esureña",
            style: AppTextStyles.subtitle_white,
          ),
          Spacer(),
          Row(
            children: [
              Text(
                "Made with Flutter.",
                style: AppTextStyles.content_grey,
              ),
              Spacer(),
              Text(
                "2023",
                style: AppTextStyles.content_grey,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class FooterIcons extends StatefulWidget {
  final String url;
  final IconData icon;
  const FooterIcons({
    super.key, required this.url, required this.icon,
  });

  @override
  State<FooterIcons> createState() => _FooterIconsState();
}

class _FooterIconsState extends State<FooterIcons> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: InkWell(
        onTap: ()async{
              Uri url = Uri.parse(widget.url);
              if( await canLaunchUrl(url)){
                await launchUrl(url);
              }
              else{
                throw ("Couldnt launch $url");
              }
            },
        child: FaIcon(
          widget.icon,
          color: _isHovered ? AppColors.purple: Colors.grey,
          size:  30,
        ),
      ),
    );
  }
}