import 'package:flutter/material.dart';
import 'package:izoneapp/data/Members.dart';
import 'package:izoneapp/widgets/MemberTile.dart';

class MembersPage extends StatelessWidget {
  const MembersPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: CustomScrollView(
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
                      member: Members.members[index],
                    ),
                  );
                },
                childCount: Members.members.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
