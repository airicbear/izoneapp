import 'dart:convert';
import 'package:flutter/material.dart';

class Member {
  final int id;
  final String birthplace;
  final String dateOfBirth;
  final String fullName;
  final String fullNameKorean;
  final String nationality;
  final String stageName;
  final String stageNameKorean;

  Member(
      {this.id,
      this.birthplace,
      this.dateOfBirth,
      this.fullName,
      this.fullNameKorean,
      this.nationality,
      this.stageName,
      this.stageNameKorean});
}

class MembersList extends StatelessWidget {
  MembersList({Key key, this.title}) : super(key: key);

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
              return ListView.builder(
                itemCount: members == null ? 0 : members.length,
                itemBuilder: (context, index) {
                  return MemberCard(
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
        ));
  }
}

class MemberCard extends StatelessWidget {
  MemberCard({Key key, this.member}) : super(key: key);

  final Member member;

  int calculateAge(String dateOfBirth) {
    return DateTime.now().difference(DateTime.parse(dateOfBirth)).inDays ~/ 365;
  }

  Widget memberPicture() {
    var imagePath =
        'assets/images/official-photo-3-${member.stageName.toLowerCase()}.jpg';
    return ClipRRect(
        borderRadius: new BorderRadius.circular(32.0),
        child: GestureDetector(child: Image.asset(imagePath)));
  }

  TableRow memberInfoItem(property, description) {
    return TableRow(
      children: <Widget>[
        TableCell(
            child: Padding(
                padding: const EdgeInsets.all(10.0), child: Text(property))),
        TableCell(
            child: Padding(
                padding: const EdgeInsets.all(10.0), child: Text(description))),
      ],
    );
  }

  Widget memberInfoTable() {
    return Padding(
        padding: const EdgeInsets.all(24.0),
        child: Table(
          columnWidths: {0: const FixedColumnWidth(105.0)},
          border: TableBorder.symmetric(
              inside: BorderSide(color: Color.fromRGBO(255, 255, 255, 0.1))),
          children: <TableRow>[
            memberInfoItem('Stage name',
                '${member.stageName} (${member.stageNameKorean})'),
            memberInfoItem(
                'Full name', '${member.fullName} (${member.fullNameKorean})'),
            memberInfoItem('Nationality', '${member.nationality}'),
            memberInfoItem('Date of birth',
                '${member.dateOfBirth} (${calculateAge(member.dateOfBirth)} years old)'),
            memberInfoItem('Birthplace', '${member.birthplace}'),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.all(Radius.circular(32.0)),
      ),
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          memberPicture(),
          memberInfoTable(),
        ],
      ),
    );
  }
}
