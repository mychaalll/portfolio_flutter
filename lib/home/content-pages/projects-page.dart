import 'package:flutter/material.dart';
import 'package:portfolio_flutter/data/projects-data.dart';
import 'package:portfolio_flutter/utils/colors.dart';
import 'package:portfolio_flutter/widget/page-header.dart';
import 'package:portfolio_flutter/widget/project-card-mobile.dart';
import 'package:portfolio_flutter/widget/project-card.dart';


class ProjectsPage extends StatelessWidget {
  ProjectsPage({
    super.key,
    required this.height,
  });

  final double height;
  ScrollController scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height - 80,
      width: double.infinity,
      color: AppColors.backColor,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width > 850 ? 100.0 : 50,
          vertical: 50.0
        ),
        child: Column(
          children: [
            PageHeader(
              title: 'PROJECTS', 
              subtitle: 'Crafted Works and Contributions',
            ),
            SizedBox(height: 20),
            Expanded(
              child: RawScrollbar(
                trackVisibility: true,
                trackRadius: Radius.circular(12), 
                radius: Radius.circular(12),
                thumbColor: AppColors.purple,
                thickness: 8,
                controller: scrollController,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: ListView.builder(
                    scrollDirection: MediaQuery.of(context).size.width > 700 ? Axis.horizontal: Axis.vertical,
                    controller: scrollController,
                    itemCount: projectList.length,
                    itemBuilder:(context, index) {
                      
                      if (MediaQuery.of(context).size.width > 700) {
                        return ProjectCard(
                          index:index,
                        );
                      }
                      else{
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ProjectCardMobile(
                            index: index,

                          )
                        );
                      }
                    },
                  ),
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}

