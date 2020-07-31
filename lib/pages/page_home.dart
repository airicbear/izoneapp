import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:izoneapp/data/app_pages.dart';
import 'package:izoneapp/widgets/group_picture.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key, this.pageController, this.appBarController})
      : super(key: key);

  final PageController pageController;
  final ScrollController appBarController;

  ListView _pageSelection(BuildContext context) {
    List<AppPageInfo> pages =
        AppPages.pages(context, pageController, appBarController).sublist(1);

    return ListView.builder(
      itemBuilder: (context, index) {
        return Card(
          clipBehavior: ClipRRect(
            borderRadius: BorderRadius.circular(4.0),
          ).clipBehavior,
          child: InkWell(
            onTap: () => AppPages.goToPage(
                pages[index], pageController, appBarController),
            child: ListTile(
              leading: pages[index].icon,
              title: Text('${pages[index].title}'),
              trailing: FaIcon(FontAwesomeIcons.arrowRight),
            ),
          ),
        );
      },
      itemCount: pages.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth < 600) {
            return Column(
              children: [
                Flexible(
                  flex: 2,
                  child: GroupPicture(
                    imagePath:
                        'assets/images/oneiric-diary/official-photo-3-izone.jpg',
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: _pageSelection(context),
                ),
              ],
            );
          } else {
            return Row(
              children: [
                Expanded(
                  child: GroupPicture(
                    imagePath:
                        'assets/images/oneiric-diary/official-photo-3-izone.jpg',
                  ),
                ),
                Flexible(
                  child: _pageSelection(context),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}