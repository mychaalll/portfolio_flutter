import 'package:flutter/material.dart';
import 'package:portfolio_flutter/data/projects-data.dart';
import 'package:portfolio_flutter/utils/colors.dart';
import 'package:portfolio_flutter/utils/text-style.dart';

class ProjectCardMobile extends StatefulWidget {
  final int index;
  ProjectCardMobile({
    super.key, required this.index,
  });

  @override
  State<ProjectCardMobile> createState() => _ProjectCardStateMobile();
}

class _ProjectCardStateMobile extends State<ProjectCardMobile> {
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            _isTapped = !_isTapped;
          });
        },
        child: AnimatedContainer(
          height: !_isTapped? 150 : 500,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.blue,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Colors.black,
              width: 2,
            ),
          ),
          duration: Duration(milliseconds: 300),
          child: Column(
            children: [
              Container(
                height: 146,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight:Radius.circular(12),
                          bottomLeft: !_isTapped ? Radius.circular(12) : Radius.zero,
                          bottomRight: !_isTapped ? Radius.circular(12) : Radius.zero,
                        ),
                        child: Image.asset(
                          projectList[widget.index].thumbnail,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned.fill(
                      bottom: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.transparent, Colors.black],
                          ),
                        ),
                      ),
                    ),
                    !_isTapped ? Positioned(
                      top: 12,
                      right: 12,
                      child: AnimatedOpacity(
                        opacity: !_isTapped ? 1.0 : 0.0,
                        duration: Duration(milliseconds: 300),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: SizedBox(
                            height: 20, // Set a fixed height for the ListView if needed
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: projectList[widget.index].tools.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(right: 4.0),
                                  child: CircleAvatar(
                                    radius: 10,
                                    backgroundImage: AssetImage(projectList[widget.index].toolsIcon[index]),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ):Container(),
                    AnimatedPositioned(
                      top: _isTapped ? 16 : 84,
                      left: 16,
                      duration: Duration(milliseconds: 300),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          !_isTapped? Text(
                            projectList[widget.index].title,
                            style: AppTextStyles.content_white,
                          ):Container(),
                          SizedBox(height: !_isTapped ? 4: 0),
                          !_isTapped ? Text(
                            projectList[widget.index].date,
                            style: AppTextStyles.parag_white
                          ):
                          Container(
                            padding: EdgeInsets.only(
                              top:8,
                              bottom: 12,
                              left: 8,
                              right: 8
                            ),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Center(
                              child: Text(
                                projectList[widget.index].date,
                                style: AppTextStyles.parag_white
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              _isTapped ? Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.blue,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                    border: Border.all(width: 2),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          projectList[widget.index].title,
                          textAlign: TextAlign.start,
                          style: AppTextStylesMobile.content_white_bold,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 20),
                        Expanded(
                          flex: 5,
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  projectList[widget.index].details,
                                  textAlign: TextAlign.justify,
                                  style: AppTextStylesMobile.small_white,
                                ),
                                SizedBox(height: 20),
                                Text(
                                  'Used: ${projectList[widget.index].tools.join(", ")}',
                                  textAlign: TextAlign.start,
                                  style: AppTextStylesMobile.small_white,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ),
                        
                      ],
                    ),
                  ),
                )
              ):Container()
            ],
          )
        ),
      ),
    );
  }
}
