import 'package:adhils_portfolio/hover_effect.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../constants.dart';
import '../skills/skills_section.dart';

class Achievements extends StatelessWidget {
  const Achievements({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    const colors = ColorAssets.all;
    return ResponsiveBuilder(builder: (_, size){
      return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          width: kInitWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (size.isMobile)
                const Divider(
                  thickness: 3,
                ),
              AutoSizeText(
                'Achievements',
                maxLines: 1,
                style: Theme.of(context)
                    .textTheme
                    .displayMedium
                    ?.copyWith(color: Colors.black,),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: achievementItems.map((e) {
                  int index =  achievementItems.indexWhere((item) => item == e);
                  return OnHover(
                      builder: (isHovered) {
                        return ListTile(
                          leading: CircleAvatar(
                            backgroundColor: colors.elementAt(index % colors.length),
                          ),
                          title: Card(
                            elevation: isHovered? 5 : null,
                            shadowColor: isHovered? colors.elementAt(index % colors.length).withOpacity(0.6): null,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 3,
                                  color:colors.elementAt(index % colors.length) ),
                              borderRadius: BorderRadius.circular(3),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                title: Text(e.name, style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: size.isMobile? 16: null),),
                                subtitle: Text(e.description,style: TextStyle(fontSize: size.isMobile?12: null,),textAlign: TextAlign.justify),
                                trailing: Text(e.year),
                              ),
                            ),
                          ),
                        );
                      }
                  );
                } ).toList(),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          )
      );
    });
  }
}

class AchievementItem {
  final String name;
  final String description;
  final String year;

  AchievementItem({
    required this.name,
    required this.description,
    required this.year,
  });
}

final achievementItems = [
  AchievementItem(name: 'Achievement in State-Level Inter-College Symposium for Paper Presentations on AI and Big Data', description: 'I secured 2nd and 3rd place in the state-level inter-college symposium for my paper presentations on various topics such as Artificial Intelligence and Big Data.', year: '2019'),
  AchievementItem(name: '2nd Place in State-Level Web Designing Symposium', description: "I obtained 2nd place in the state-level inter-college symposium for web designing Using HTML and CSS.", year: '2020'),
  AchievementItem(name: '“International Conference on Intelligent and Computing Systems”', description: "I am honored to receive this certificate recognizing my active participation in the esteemed 'International Conference on Intelligent and Computing Systems' (ICICS)-2021. During the conference, I had the privilege of presenting my research paper titled 'A Comparative Study of Various Machine Learning Algorithms for Credit Card Fraud Detection'.", year: '2021')
];
