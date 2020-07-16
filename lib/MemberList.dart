import 'dart:convert';
import 'package:flutter/material.dart';
import 'Member.dart';
import 'MemberTile.dart';

class MemberList extends StatelessWidget {
  const MemberList({Key key, this.pageController}) : super(key: key);

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FutureBuilder(
          future:
              DefaultAssetBundle.of(context).loadString('assets/izone.json'),
          builder: (context, snapshot) {
            final members = json.decode(snapshot.data.toString());
            return CustomScrollView(
              slivers: [
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
