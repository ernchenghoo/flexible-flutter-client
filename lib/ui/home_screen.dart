import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {

  Future<SharedPreferences> futurePreference;

  @override
  Widget build(BuildContext context) {

    futurePreference = SharedPreferences.getInstance();

    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(20),
        child: FutureBuilder<SharedPreferences>(
          future: futurePreference,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  Text(snapshot.data.getString("email")),
                  Divider(color: Colors.transparent, height: 30,),
                  Text(snapshot.data.getString("token")),
                ],
              );
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            // By default, show a loading spinner.
            return CircularProgressIndicator();
          },
        ),
      )
    );
  }
}
