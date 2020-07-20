import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:izoneapp/data/AppPage.dart';
import 'package:izoneapp/pages/ViewPicturePage.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key, this.pageController, this.pages}) : super(key: key);

  final PageController pageController;
  final List<AppPageInfo> pages;

  Widget _izonePicture(BuildContext context) {
    const imagePath = 'assets/images/oneiric-diary/official-photo-4-izone.jpg';
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return ViewPicturePage(memberImagePath: imagePath);
            },
          ),
        );
      },
      child: Hero(
        tag: imagePath,
        child: Image.asset(imagePath),
      ),
    );
  }

  ListView _pageSelection(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Card(
          child: InkWell(
            onTap: () => pageController.animateToPage(
              pages[index].index,
              duration: Duration(seconds: 1),
              curve: Curves.fastLinearToSlowEaseIn,
            ),
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
                  child: _izonePicture(context),
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
                  child: _izonePicture(context),
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
