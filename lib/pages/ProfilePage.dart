import 'package:flutter/material.dart';
import 'package:izoneapp/pages/ProfilePageGallery.dart';
import 'package:izoneapp/pages/ProfilePageInfo.dart';
import 'package:izoneapp/data/Member.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key key, @required this.member}) : super(key: key);

  final Member member;

  @override
  State<StatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  List<Widget> _pages;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _pages = [
      ProfilePageInfo(member: widget.member),
      Scaffold(
        appBar: AppBar(
          title: Text('Gallery'),
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Colors.transparent,
        body: ProfilePageGallery(member: widget.member),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color.lerp(
            widget.member.color, Theme.of(context).primaryColor, 0.5),
        currentIndex: _selectedIndex,
        selectedItemColor: Color.lerp(widget.member.color,
            Theme.of(context).textTheme.bodyText1.color, 0.8),
        unselectedItemColor: Color.lerp(Colors.transparent,
            Theme.of(context).textTheme.bodyText1.color.withOpacity(0.5), 0.8),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            title: Text('Info'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.image),
            title: Text('Gallery'),
          ),
        ],
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      backgroundColor: Color.lerp(
          Theme.of(context).scaffoldBackgroundColor.withOpacity(0.8),
          widget.member.color,
          0.5),
      body: _pages.elementAt(_selectedIndex),
    );
  }
}
