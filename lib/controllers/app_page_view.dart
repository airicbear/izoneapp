import 'package:flutter/material.dart';
import 'package:izoneapp/controllers/scrollable_app_bar_scroll_behavior.dart';
import 'package:izoneapp/data/app_pages.dart';
import 'package:izoneapp/widgets/buttons_media.dart';
import 'package:izoneapp/widgets/button_app_more.dart';

class AppPageView extends StatefulWidget {
  AppPageView({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AppPageViewState();
}

class _AppPageViewState extends State<AppPageView> {
  PageController _pageController;
  ScrollController _appBarController;
  AppPage _page;

  @override
  void initState() {
    super.initState();
    _page = AppPage.LYRICS;
    _pageController = PageController(
      initialPage: _page.index,
    );
    _appBarController = ScrollController(
      initialScrollOffset: _page.index * 50.0,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    _appBarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<AppPageInfo> _appPages = AppPages.pages(
      context,
      _pageController,
      _appBarController,
    );
    return Scaffold(
      appBar: AppBar(
        title: _PageViewAppBar(
          appPages: _appPages,
          pageController: _pageController,
          appBarController: _appBarController,
          nextPage: _page,
        ),
        actions: [
          AppMoreButton(),
        ],
      ),
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
                title: Text(_appPage.title),
              ),
            );
          },
          itemCount: _appPages.length,
        ),
      ),
      body: PageView(
        onPageChanged: (index) {
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

class _PageTitle extends StatelessWidget {
  final AppPageInfo page;
  final AppPage nextPage;
  final PageController pageController;
  final ScrollController appBarController;

  const _PageTitle({
    Key key,
    @required this.page,
    @required this.nextPage,
    @required this.pageController,
    @required this.appBarController,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => AppPages.goToPage(page, pageController, appBarController),
      child: Text(
        page.title,
        style: nextPage.index != page.index
            ? TextStyle(
                color: Theme.of(context).disabledColor,
              )
            : null,
      ),
    );
  }
}

class _PageViewAppBar extends StatelessWidget {
  final List<AppPageInfo> appPages;
  final PageController pageController;
  final ScrollController appBarController;
  final AppPage nextPage;

  const _PageViewAppBar({
    Key key,
    @required this.appPages,
    @required this.pageController,
    @required this.appBarController,
    @required this.nextPage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollableAppBarScrollBehavior(),
      child: SingleChildScrollView(
        controller: appBarController,
        scrollDirection: Axis.horizontal,
        child: ButtonBar(
          alignment: MainAxisAlignment.start,
          children: List<Widget>.generate(
            appPages.length,
            (index) => _PageTitle(
              page: appPages.elementAt(index),
              nextPage: nextPage,
              pageController: pageController,
              appBarController: appBarController,
            ),
          ),
        ),
      ),
    );
  }
}
