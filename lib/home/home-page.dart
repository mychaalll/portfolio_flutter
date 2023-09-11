import 'package:flutter/material.dart';
import 'package:portfolio_flutter/home/content-pages/about-me-page.dart';
import 'package:portfolio_flutter/home/content-pages/footer-page.dart';
import 'package:portfolio_flutter/home/content-pages/landing-page.dart';
import 'package:portfolio_flutter/home/content-pages/projects-page.dart';
import 'package:portfolio_flutter/home/content-pages/skills-page.dart';
import 'package:portfolio_flutter/utils/colors.dart';
import 'package:portfolio_flutter/utils/responsive.dart';
import 'package:portfolio_flutter/utils/text-style.dart';
import 'package:portfolio_flutter/widget/navigation-buttons.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController _controller = new ScrollController();
  

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    ResponsiveLayout responsiveLayout = ResponsiveLayout(context);
    String deviceType = responsiveLayout.getDeviceType();

    return Scaffold(
      appBar: AppBar(
      elevation: 4,
      toolbarHeight: 80,
      backgroundColor: AppColors.backColor,
      title: Container(
        child: Row(
          children: [
            Text(
              'Mychal\'s Portfolio',
              style: AppTextStyles.subtitle_white,
              overflow: TextOverflow.ellipsis,
            ),
            Spacer(),
            deviceType == 'web'
                ? Row(
                    children: [
                      NavButtons(
                        text: 'HOME',
                        onTap: (){
                          final double targetPosition = 0;
                          _controller.animateTo(
                            targetPosition, 
                            duration: Duration(milliseconds: 500), 
                            curve: Curves.easeOut);
                        },
                      ),
                      NavButtons(
                        text: 'ABOUT ME',
                        onTap: (){
                          final double targetPosition = height - 80;
                          _controller.animateTo(
                            targetPosition, 
                            duration: Duration(milliseconds: 500), 
                            curve: Curves.easeOut);
                        },
                      ),
                      NavButtons(
                        text: 'SKILLS',
                        onTap: (){
                          final double targetPosition = height * 2 - 150;
                          _controller.animateTo(
                            targetPosition, 
                            duration: Duration(milliseconds: 500), 
                            curve: Curves.easeOut);
                        },
                      ),
                      NavButtons(
                        text: 'PROJECTS',
                        onTap: (){
                          final double targetPosition = height * 3 - 230;
                          _controller.animateTo(
                            targetPosition, 
                            duration: Duration(milliseconds: 500), 
                            curve: Curves.easeOut);
                        },
                      ),
                      
                      GestureDetector(
                        onTap: ()async{
                          Uri url = Uri.parse('https://www.youtube.com/watch?v=dQw4w9WgXcQ&ab_channel=RickAstley');
                          if( await canLaunchUrl(url)){
                            await launchUrl(url);
                          }
                          else{
                            throw ("Couldnt launch $url");
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.purple,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              'CURRICULUM VITAE',
                              style:AppTextStyles.content_white_bold
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : Container()
          ],
        ),
      ),
      // Display the drawer
      
    ),
    endDrawer: deviceType == 'web'
      ? null
      : MyDrawer(
          controller: _controller,
          height: height,
        ),

      body: SingleChildScrollView(
        controller: _controller,
        child: Column(
          children: [
            LandingPage(height: height, deviceType: deviceType,),
            PageDivider(),
            AboutMePage(height: height, deviceType: deviceType,),
            PageDivider(),
            SkillsPage(height: height),
            PageDivider(),
            ProjectsPage(height: height),
            PageDivider(),
            FooterPage(height: height)
          ],
        ),
      ),
    );
  }
}



class PageDivider extends StatelessWidget {
  const PageDivider({
    super.key, 
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Colors.grey[800],
      height: 1,
    );
  }
}

class MyDrawer extends StatelessWidget {
  final double height;
  final ScrollController controller;

  const MyDrawer({super.key, required this.controller, required this.height});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.blue,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal:10.0,
          vertical: 50.0
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            NavButtons(
              text: 'HOME',
              onTap: (){
                final double targetPosition = 0;
                controller.animateTo(
                  targetPosition, 
                  duration: Duration(milliseconds: 500), 
                  curve: Curves.easeOut);
                Navigator.pop(context);
              },
            ),
            SizedBox(height: 20),
            NavButtons(
              text: 'ABOUT ME',
              onTap: (){
                final double targetPosition = height - 80;
                controller.animateTo(
                  targetPosition, 
                  duration: Duration(milliseconds: 500), 
                  curve: Curves.easeOut);
                Navigator.pop(context);
              },
            ),
            SizedBox(height: 20),
            NavButtons(
              text: 'SKILLS',
              onTap: (){
                final double targetPosition = height * 2 - 150;
                controller.animateTo(
                  targetPosition, 
                  duration: Duration(milliseconds: 500), 
                  curve: Curves.easeOut);
                Navigator.pop(context);
              },
            ),
            SizedBox(height: 20),
            NavButtons(
              text: 'PROJECTS',
              onTap: (){
                final double targetPosition = height * 3 - 230;
                controller.animateTo(
                  targetPosition, 
                  duration: Duration(milliseconds: 500), 
                  curve: Curves.easeOut);
                Navigator.pop(context);
              },
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: ()async{
                Uri url = Uri.parse('https://www.youtube.com/watch?v=dQw4w9WgXcQ&ab_channel=RickAstley');
                if( await canLaunchUrl(url)){
                  await launchUrl(url);
                }
                else{
                  throw ("Couldnt launch $url");
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.purple,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'CURRICULUM VITAE',
                    style: AppTextStyles.content_white_bold
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


