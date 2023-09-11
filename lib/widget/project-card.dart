import 'package:flutter/material.dart';
import 'package:portfolio_flutter/data/projects-data.dart';
import 'package:portfolio_flutter/utils/colors.dart';
import 'package:portfolio_flutter/utils/text-style.dart';

class ProjectCard extends StatefulWidget {
  final int index;
  ProjectCard({
    super.key, required this.index,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            _isTapped = !_isTapped;
          });
        },
        child: AnimatedContainer(
          width: MediaQuery.of(context).size.width > 1000 ? (!_isTapped? MediaQuery.of(context).size.width  / 5 : MediaQuery.of(context).size.width * 3/4 - 200) : (!_isTapped? MediaQuery.of(context).size.width  / 3 : MediaQuery.of(context).size.width * 3/4 ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Colors.black,
              width: 2,
            ),
          ),
          duration: Duration(milliseconds: 300),
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width > 1000 ? (MediaQuery.of(context).size.width  / 5 - 4): (MediaQuery.of(context).size.width  / 3 - 4),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          bottomLeft: Radius.circular(12),
                          topRight: !_isTapped ? Radius.circular(12) : Radius.zero,
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
                      top: _isTapped ? 16 : MediaQuery.of(context).size.height - 345,
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
                      topRight: Radius.circular(12),
                      bottomRight: Radius.circular(12),
                    ),
                    border: Border.all(width: 2),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            projectList[widget.index].title,
                            textAlign: TextAlign.start,
                            style: AppTextStyles.subtitle_white,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(height: 10),
                        Expanded(
                          flex: 4,
                          child: SingleChildScrollView(
                            child: Text(
                              projectList[widget.index].details,
                              textAlign: TextAlign.justify,
                              style: AppTextStyles.parag_white,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Expanded(
                          flex: 1,
                          child: Text(
                            'Used: ${projectList[widget.index].tools.join(", ")}',
                            textAlign: TextAlign.start,
                            style: AppTextStyles.content_white,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
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
