import 'package:flutter/material.dart';
import 'package:izoneapp/controllers/app_page_view.dart';
import 'package:izoneapp/data/app_themes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesPage extends StatefulWidget {
  final AppPageViewState root;

  const PreferencesPage({Key key, @required this.root}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PreferencesPageState();
}

class _PreferencesPageState extends State<PreferencesPage> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Future<String> _theme;

  Future<void> _changeTheme(String theme) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _theme = prefs.setString('theme', theme).then((bool success) => theme);
    });
    widget.root.setState(() {
      widget.root.theme =
          prefs.setString('theme', theme).then((bool success) => theme);
    });
  }

  @override
  void initState() {
    super.initState();
    _theme = _prefs.then((prefs) => prefs.getString('theme') ?? 'Auto');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _theme,
      builder: (context, snapshot) => Theme(
        data: AppThemes.themes(context)[snapshot.data ?? 'Auto'],
        child: Scaffold(
          appBar: AppBar(
            title: Text('Preferences'),
          ),
          body: ListView(
            children: [
              InkWell(
                child: ExpansionTile(
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
                          trailing: Icon(Icons.circle,
                              color: AppThemes.themes(context)
                                  .values
                                  .toList()
                                  .elementAt(index)
                                  .primaryColor),
                        ),
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
