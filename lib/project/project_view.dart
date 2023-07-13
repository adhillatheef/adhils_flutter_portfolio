import 'package:adhils_portfolio/constants.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../skills/skills_section.dart';

class ProjectView extends StatelessWidget {
  const ProjectView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (_, size) {
      return ProjectDesktopView(
        size: size,
      );
    });
  }
}

class ProjectDesktopView extends StatelessWidget {
  final SizingInformation size;
  const ProjectDesktopView({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      // height: 864,
      width: kInitWidth,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (size.isMobile)
              const Divider(
                thickness: 3,
              ),
            AutoSizeText(
              'Projects',
              style: Theme.of(context)
                  .textTheme
                  .displayMedium
                  ?.copyWith(color: Colors.black),
            ),
            const SizedBox(
              height: 20,
            ),
            size.isMobile || size.isTablet? Column(
              children: kProjectItems.map((e) {
                int index = kProjectItems.indexWhere((element) => element == e);
                return ProjectItems(projectItem: kProjectItems[index],size: size, index: index,);
              }).toList(),
            ): GridView.builder(
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: size.isTablet? 1300: 1100,
                childAspectRatio: 1,
                crossAxisCount: 3,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 10.0,
              ),
              itemCount: kProjectItems.length,
              itemBuilder: (BuildContext context, int index) {
                return ProjectItems(projectItem: kProjectItems[index],size: size, index: index,);
              },
            ) ,
          ],
        ),
      ),
    );
  }
}

class ProjectItems extends StatelessWidget {
  final ProjectItem projectItem;
  final SizingInformation size;
  final int index;
  const ProjectItems({
    super.key,
    required this.projectItem, required this.size, required this.index,
  });

  @override
  Widget build(BuildContext context) {
    const colors = ColorAssets.all;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(
            width: 3,
            color: colors.elementAt(index % colors.length),
          ),
          borderRadius: BorderRadius.circular(3),
        ),
        child: Column(
          children: [
            Image.asset(
              projectItem.image,
              fit: BoxFit.contain,
            ),
            AutoSizeText(
              projectItem.title,
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(color: Colors.black, fontSize: size.isMobile? 24: null),
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: projectItem.description.map((e) =>
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '\u2022',
                        style: TextStyle(
                          fontSize: 16,
                          height: 1.55,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                        child: Text(
                          e,
                          textAlign: TextAlign.left,
                          softWrap: true,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black.withOpacity(0.6),
                            height: 1.55,
                          ),
                        ),
                      ),
                    ],
                  )).toList(),
            ),
            const SizedBox(
              height: 10,
            ),
            size.isMobile || size.isTablet?Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: projectItem.technologies.map((e) {
                int colorIndex = projectItem.technologies.indexWhere((element) => element == e);
                return ListTile(
                  leading: CircleAvatar(
                    radius: 8,
                    backgroundColor: colors.elementAt(colorIndex % colors.length),),
                  title: Text(e,style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black)),
                );
              }).toList(),
            ): Flexible(
              child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      // crossAxisSpacing: 8.0,
                      // mainAxisSpacing: 10.0,
                    mainAxisExtent: 40,
                      crossAxisCount: 2),
                  itemCount: projectItem.technologies.length,
                  itemBuilder: (BuildContext context, int index){
                    return  ListTile(
                      leading: CircleAvatar(
                        radius: 12,
                        backgroundColor: colors.elementAt(index % colors.length),),
                      title: Text(projectItem.technologies[index],style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black),),
                    );
              }),
            ),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}

class ProjectItem {
  final String image;
  final String title;
  final List<String> description;
  final List<String> technologies;

  const ProjectItem(
      {Key? key,
      required this.image,
      required this.title,
      required this.description,
      required this.technologies});
}

final kProjectItems = [
  const ProjectItem(
      image: "images/flutterAmazonClone.png",
      title: "Flutter Amazon Clone",
      description: [
        "Developed a fully functional Amazon Clone from scratch, using Flutter for the front end and Node.js, Express, and MongoDB for the backend infrastructure.",
        "Implemented an intuitive admin panel and ensured a responsive user experience.",
        "Established seamless communication between frontend and backend systems through REST APIs.",
        "Incorporated essential features such as user authentication, product listings, cart management, and secure payment processing.",
        "Adhered to industry best practices and delivered a high-quality, scalable solution.",
        "Demonstrated expertise in full-stack development, showcasing proficiency in both frontend and backend technologies."
      ],
      technologies: [
        "Flutter",
        "REST Api",
        "Node Js",
        "Express",
        "MonogDb",
        "Provider"
      ]),
  const ProjectItem(
      image: "images/toDoIstHive.png",
      title: "ToDoIst",
      description: [
        "ToDoIst: A Flutter-based app for effortless task organization and to-do list management.",
        "Utilized Provider as the state management for the application. Flutter hive database used.",
        "Implemented an alert feature that sends an alert message at a specific time set by the user. Added a toggle switch for users to select whether they need a daily alert or not.",
      ],
      technologies: [
        "Flutter",
        "Provider",
        "Notification",
        "Reminder",
      ]),
  const ProjectItem(
      image: "images/TrackMyFinance.png",
      title: "TrackMyFinance",
      description: [
        "TrackMyFinance is a user-friendly mobile application built using Flutter, designed to seamlessly track daily income and expenses.",
        "I implemented state management using the Flutter Bloc package and utilized the Hive database for storage. Additionally, I developed features such as 'Import to Excel' to assist users in analyzing their income and expense patterns.",
        "Designed a detailed report screen for viewing transactions and categorized transactions based on income or expense. Added an option to switch between dark and light modes for user preference.",
      ],
      technologies: [
        "Flutter",
        "Bloc",
        "Hive",
        "Dark/Lite",
      ]),
];
