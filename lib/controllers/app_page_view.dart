import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:izoneapp/controllers/scrollable_app_bar_scroll_behavior.dart';
import 'package:izoneapp/data/app_pages.dart';
import 'package:izoneapp/widgets/MediaButtons.dart';
import 'package:izoneapp/widgets/AppMoreButton.dart';

class AppPageView extends StatefulWidget {
  AppPageView({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AppPageViewState();
}

class _AppPageViewState extends State<AppPageView> {
  PageController _pageController;
  ScrollController _appBarController;
  AppPage _page = AppPage.LYRICS;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _page.index);
    _appBarController =
        ScrollController(initialScrollOffset: _page.index * 50.0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    _appBarController.dispose();
    super.dispose();
  }

  Widget _pageTitle(BuildContext context, AppPageInfo page) {
    return GestureDetector(
      onTap: () => AppPages.goToPage(page, _pageController, _appBarController),
      child: Text(
        page.title,
        style: _page.index != page.index
            ? TextStyle(
                color: Theme.of(context).disabledColor,
              )
            : null,
      ),
    );
  }

  Widget _pageViewAppBar(BuildContext context, List<AppPageInfo> appPages) {
    return AppBar(
      title: ScrollConfiguration(
        behavior: ScrollableAppBarScrollBehavior(),
        child: SingleChildScrollView(
          controller: _appBarController,
          scrollDirection: Axis.horizontal,
          child: ButtonBar(
            alignment: MainAxisAlignment.start,
            children: List<Widget>.generate(
              appPages.length,
              (index) => _pageTitle(context, appPages.elementAt(index)),
            ),
          ),
        ),
      ),
      actions: [
        AppMoreButton(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    List<AppPageInfo> _appPages = AppPages.pages(
      context,
      _pageController,
      _appBarController,
    );
    return Scaffold(
      appBar: _pageViewAppBar(context, _appPages),
      drawer: Drawer(
        child: ListView.builder(
          itemBuilder: (context, index) {
            AppPageInfo _appPage = _appPages.elementAt(index);
            return InkWell(
              onTap: () {
                AppPages.goToPage(
                  _appPage,
                  _pageController,
                  _appBarController,
                );
                Navigator.pop(context);
              },
              child: ListTile(
                leading: _appPage.icon,
                title: Text(
                  _appPage.title,
                ),
              ),
            );
          },
          itemCount: _appPages.length,
        ),
      ),
      body: PageView(
        onPageChanged: (index) {
          SystemChrome.setPreferredOrientations(DeviceOrientation.values);
          setState(() {
            _page = AppPage.values.elementAt(index);
          });
          AppPages.scrollAppBarToPage(
            _appPages.elementAt(index),
            _appBarController,
          );
        },
        controller: _pageController,
        scrollDirection: Axis.horizontal,
        children: List.generate(
          _appPages.length,
          (index) => _appPages.elementAt(index).page,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: MediaButtons(),
        color: Theme.of(context).primaryColor,
      ),
    );
  }
}
