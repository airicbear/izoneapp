import 'dart:convert';
import 'package:flutter/material.dart';
import 'Member.dart';
import 'MemberTile.dart';
import 'MediaButtons.dart';

class MemberList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: MediaButtons(),
        color: Theme.of(context).primaryColor,
      ),
      body: Container(
        child: FutureBuilder(
          future:
              DefaultAssetBundle.of(context).loadString('assets/izone.json'),
          builder: (context, snapshot) {
            final members = json.decode(snapshot.data.toString());
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  floating: true,
                  snap: true,
                  title: SingleChildScrollView(
                    child: ButtonBar(
                      alignment: MainAxisAlignment.start,
                      children: [
                        FlatButton(
                          onPressed: () {
                            Navigator.popAndPushNamed(context, '/About');
                          },
                          child: Text(
                            'About',
                            style: TextStyle(
                              color: Theme.of(context).disabledColor,
                            ),
                          ),
                        ),
                        Text('Members'),
                      ],
                    ),
                  ),
                ),
                SliverGrid(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    childAspectRatio: 1.0,
                    maxCrossAxisExtent: 256.0,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return Container(
                        padding: const EdgeInsets.all(8.0),
                        child: MemberTile(
                          member: Member(
                            id: members[index]['ID'],
                            birthplace: members[index]['BIRTHPLACE'],
                            dateOfBirth: members[index]['DATEOFBIRTH'],
                            fullName: members[index]['FULLNAME'],
                            fullNameKorean: members[index]['FULLNAME_KR'],
                            nationality: members[index]['NATIONALITY'],
                            stageName: members[index]['STAGENAME'],
                            stageNameKorean: members[index]['STAGENAME_KR'],
                          ),
                        ),
                      );
                    },
                    childCount: members == null ? 0 : members.length,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
