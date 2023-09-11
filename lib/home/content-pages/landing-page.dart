import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_flutter/utils/colors.dart';
import 'package:portfolio_flutter/utils/text-style.dart';
import 'package:url_launcher/url_launcher.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({
    super.key,
    required this.height, required this.deviceType,
  });
  final String deviceType;
  final double height;

  @override
  Widget build(BuildContext context) {

    return Container(
      height: height - 80,
      width: double.infinity,
      color: AppColors.backColor,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: deviceType == 'web' 
            ? 100.0 
            : deviceType == 'tablet' 
            ? 50 
            : 30
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // middle contents
            SizedBox(height: 40),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hey there,',
                    style: deviceType == 'mobile' 
                      ? AppTextStylesMobile.content_grey 
                      : AppTextStyles.subtitle_grey
                  ),
                  SizedBox(height: 5),
                  Text(
                    'I\'m Mychal Esureña',
                    style: deviceType == 'mobile' 
                      ? AppTextStylesMobile.title_white
                      : AppTextStyles.title_white
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      Container(
                        height: deviceType == 'mobile' ? 20 : 30,
                        width: 5,
                        decoration: BoxDecoration(
                          color: AppColors.purple,
                          borderRadius: BorderRadius.circular(8)
                        ),
                      ),
                      SizedBox(width: 5),
                      Column(
                        children: [
                          AnimatedTextKit(
                            repeatForever: true,
                            animatedTexts: [
                              TyperAnimatedText(
                                'an Application Developer',
                                textStyle: deviceType == 'mobile' 
                                  ? AppTextStylesMobile.content_white 
                                  : AppTextStyles.subtitle_white,
                                speed: Duration(milliseconds: 50),
                                curve: Curves.easeIn,
                              ),
                              TyperAnimatedText(
                                'a Software Developer',
                                textStyle: deviceType == 'mobile' 
                                  ? AppTextStylesMobile.content_white 
                                  : AppTextStyles.subtitle_white,
                                speed: Duration(milliseconds: 50),
                                curve: Curves.linear,
                              ),
                              TyperAnimatedText(
                                'a Website Developer',
                                textStyle: deviceType == 'mobile' 
                                  ? AppTextStylesMobile.content_white 
                                  : AppTextStyles.subtitle_white,
                                speed: Duration(milliseconds: 50),
                                curve: Curves.linear,
                              ),
                            ]
                          )
                          ,
                          deviceType == 'mobile' ? SizedBox(height: 3): Container(),
                        ],
                      ),
                    ],
                  ),
      
                  SizedBox(height: 20),
                  Text(
                    'a dedicated programmer driven by the art of coding and a commitment to crafting efficient solutions. With expertise in various frameworks and a keen eye for detail, I specialize in developing user-friendly applications that seamlessly integrate cutting-edge technologies. ',
                    style: deviceType == 'mobile' 
                      ? AppTextStylesMobile.small_white 
                      : AppTextStyles.parag_white,
                    maxLines:  8,
                    overflow: TextOverflow.ellipsis,
                  ),
                  
                ],
              ),
            ),
            // Get in touch and icons
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FaIcon(
                        FontAwesomeIcons.link,
                        color: Colors.white,
                        size: deviceType == 'mobile' 
                          ? 12 
                          : 16,
                      ),
                      SizedBox(width: 5),
                      Column(
                        children: [
                          Text(
                            'Get in touch',
                            style: deviceType == 'mobile' 
                              ? AppTextStylesMobile.content_white 
                              : AppTextStyles.subtitle_white
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 50,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SocialButtons(
                          icon: FontAwesomeIcons.facebookF, 
                          tooltip: 'facebook.com',
                          url: 'https://www.facebook.com/tsm.mychaalll',
                        ),
                        SocialButtons(
                          icon: FontAwesomeIcons.solidEnvelope, 
                          tooltip: 'gmail.com',
                          url: 'mailto:tsmmychaalll@gmail.com?subject=Job%20Related',
                        ),
                        SocialButtons(
                          icon: FontAwesomeIcons.linkedin, 
                          tooltip: 'linkedin.com/m',
                          url: 'https://www.linkedin.com/in/mychal-esure%C3%B1a-534903286',
                        ),
                        SocialButtons(
                          icon: FontAwesomeIcons.github, 
                          tooltip: 'github.com/mychaalll',
                          url: 'https://github.com/mychaalll'
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SocialButtons extends StatefulWidget {
  final String tooltip;
  final IconData icon;
  final String url;
  
  const SocialButtons({
    Key? key,
    required this.tooltip,
    required this.icon,
    required this.url,
  }) : super(key: key);

  @override
  _SocialButtonsState createState() => _SocialButtonsState();
}

class _SocialButtonsState extends State<SocialButtons> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      child: Center(
        child: MouseRegion(
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
            child: Ink(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: _isHovered ? Colors.white : Colors.transparent,
              ),
              child: FaIcon(
                size: _isHovered? 45 : 30,
                widget.icon,
                color: AppColors.purple,
              )
            ),
          ),
        ),
      ),
    );
  }
}

