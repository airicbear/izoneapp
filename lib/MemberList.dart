import 'dart:convert';
import 'package:flutter/material.dart';
import 'Member.dart';
import 'MemberTile.dart';

class MemberList extends StatelessWidget {
  MemberList({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        child: FutureBuilder(
          future:
              DefaultAssetBundle.of(context).loadString('assets/izone.json'),
          builder: (context, snapshot) {
            var members = json.decode(snapshot.data.toString());
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1.15,
              ),
              itemCount: members == null ? 0 : members.length,
              itemBuilder: (context, index) {
                return MemberTile(
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
                );
              },
            );
          },
        ),
      ),
    );
  }
}
