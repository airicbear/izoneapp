import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:izoneapp/data/AppPages.dart';
import 'package:izoneapp/widgets/GroupPicture.dart';

class HomePage extends StatelessWidget {
  const HomePage(
      {Key key, this.pageController, this.pages, this.appBarController})
      : super(key: key);

  final PageController pageController;
  final ScrollController appBarController;
  final List<AppPageInfo> pages;

  ListView _pageSelection(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Card(
          child: InkWell(
            onTap: () => AppPages.goToPage(
                pages[index], pageController, appBarController),
            child: ListTile(
              leading: pages[index].icon,
              title: Text('${pages[index].longTitle}'),
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
          if (constraints.maxWidth < 800) {
            return Column(
              children: [
                Flexible(
                  child: GroupPicture(
                    imagePath:
                        'assets/images/oneiric-diary/official-photo-3-izone.jpg',
                  ),
                ),
                Expanded(
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
