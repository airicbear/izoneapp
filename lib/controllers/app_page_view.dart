import 'package:flutter/material.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
// import 'package:izoneapp/ad_manager.dart';
import 'package:izoneapp/controllers/scrollable_app_bar_scroll_behavior.dart';
import 'package:izoneapp/data/app_pages.dart';
import 'package:izoneapp/data/app_themes.dart';
import 'package:izoneapp/pages/page_about.dart';
import 'package:izoneapp/pages/page_disclaimer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPageView extends StatefulWidget {
  AppPageView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AppPageViewState();
}

class _AppPageViewState extends State<AppPageView> {
  Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  late Future<String> theme;
  late PageController _pageController;
  late ScrollController _appBarController;
  late AppPage _page;
  // BannerAd _ad;
  // bool _isAdLoaded = false;

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
    theme = prefs.then((_prefs) => _prefs.getString('theme') ?? 'Auto');
    // _ad = BannerAd(
    //   size: AdSize.banner,
    //   adUnitId: AdManager.bannerAdUnitId,
    //   listener: AdListener(
    //     onAdLoaded: (_) {
    //       setState(() {
    //         _isAdLoaded = true;
    //       });
    //     },
    //     onAdFailedToLoad: (_, error) {
    //       print('Ad load failed (code=${error.code} message=${error.message})');
    //     },
    //   ),
    //   request: AdRequest(),
    // );
    // _ad.load();
  }

  @override
  void dispose() {
    // _ad?.dispose();
    _pageController.dispose();
    _appBarController.dispose();
    super.dispose();
  }

  Future<void> _changeTheme(String _theme) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    setState(() {
      theme = _prefs.setString('theme', _theme).then((bool success) => _theme);
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<AppPageInfo> _appPages = AppPages.pages(
      context,
      _pageController,
      _appBarController,
    );
    return FutureBuilder<String>(
      future: theme,
      builder: (context, snapshot) {
        ThemeData _themeData =
            AppThemes.themes(context)[snapshot.data ?? 'Auto']!;
        return Theme(
          data: _themeData,
          child: Scaffold(
            appBar: AppBar(
              iconTheme: IconThemeData(
                color: _themeData.textTheme.titleLarge?.color,
              ),
              title: _PageViewAppBar(
                appPages: _appPages,
                pageController: _pageController,
                appBarController: _appBarController,
                nextPage: _page,
              ),
            ),
            drawer: Drawer(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 12.0),
                          child: ListTile(
                            title: Text(
                              'IZ*ONE Lyrics',
                              textScaleFactor: 2.0,
                            ),
                            subtitle: Text('Unoffical lyrics app'),
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(12.0),
                              child: Image.asset('assets/launcher.png'),
                            ),
                          ),
                        ),
                        ...List<Widget>.generate(
                          _appPages.length,
                          (index) {
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
                        ),
                        Divider(
                          color: _themeData.disabledColor,
                          height: 24.0,
                          thickness: 1.0,
                          indent: 12.0,
                          endIndent: 12.0,
                        ),
                        InkWell(
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Theme(
                                data: _themeData,
                                child: DisclaimerPage(),
                              ),
                            ),
                          ),
                          child: ListTile(
                            leading: Icon(Icons.warning_rounded),
                            title: Text('Disclaimer'),
                          ),
                        ),
                        InkWell(
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => Theme(
                                data: _themeData,
                                child: AboutAppPage(),
                              ),
                            ),
                          ),
                          child: ListTile(
                            leading: Icon(Icons.info),
                            title: Text('About this app'),
                          ),
                        ),
                        InkWell(
                          child: ExpansionTile(
                            textColor: _themeData.indicatorColor,
                            iconColor: _themeData.indicatorColor,
                            leading: Icon(Icons.palette),
                            title: Text('Themes'),
                            children: List.generate(
                              AppThemes.themes(context).length,
                              (index) {
                                String _themeName = AppThemes.themes(context)
                                    .keys
                                    .toList()
                                    .elementAt(index);
                                return InkWell(
                                  onTap: () => _changeTheme(_themeName),
                                  child: ListTile(
                                    title: Text(_themeName),
                                    trailing: Icon(
                                      Icons.circle,
                                      color: AppThemes.themes(context)
                                          .values
                                          .toList()
                                          .elementAt(index)
                                          .primaryColor,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // if (_isAdLoaded)
                  //   Container(
                  //     child: AdWidget(ad: _ad),
                  //     width: _ad.size.width.toDouble(),
                  //     height: 72.0,
                  //     alignment: Alignment.center,
                  //   ),
                ],
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
            // bottomNavigationBar: BottomAppBar(
            //   child: MediaButtons(),
            //   color: _themeData.primaryColor,
            // ),
          ),
        );
      },
    );
  }
}

class _PageTitle extends StatelessWidget {
  final AppPageInfo page;
  final AppPage nextPage;
  final PageController pageController;
  final ScrollController appBarController;

  const _PageTitle({
    Key? key,
    required this.page,
    required this.nextPage,
    required this.pageController,
    required this.appBarController,
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
            : Theme.of(context).textTheme.titleLarge,
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
    Key? key,
    required this.appPages,
    required this.pageController,
    required this.appBarController,
    required this.nextPage,
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
