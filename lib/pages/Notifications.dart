import 'package:flutter/material.dart';
import 'package:app/widgets/bottomNavigationBar.dart';
import 'package:app/widgets/Mail.dart';
import 'package:app/utils/Property.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          child: AppBar(
            flexibleSpace: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFF025CCB), Color(0xFF022C94)],
                  ),
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 85,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 30, bottom: 5),
                        child: Text('Notifications',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                fontFamily: 'Poppins')),
                      ),
                    ])),
          ),
          preferredSize: Size.fromHeight(100)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 10, left: 8, right: 8),
              child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: properties.length,
                  itemBuilder: (context, index) {
                    final prop = properties[index];
                    return Dismissible(
                        key: Key(prop.id),
                        onDismissed: (direction) {
                          setState(() {
                            properties.removeAt(index);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Notification supprimée'))
                            );
                          });
                        },
                        background: Container(color: Color(0xFF025CCB),),
                        child: Mail(property: prop));
                  }),
            ),
          ],
        ),
      ),
      bottomNavigationBar: bottomNavigationBar(),
    );
  }
}