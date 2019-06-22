import 'package:flutter/material.dart';
import '../model/calls.dart';

class Calls extends StatefulWidget {
  @override
  _CallsState createState() => _CallsState();
}

class _CallsState extends State<Calls> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).accentColor,
        onPressed: () {},
        child: Icon(
          Icons.add_call,
          color: Colors.white,
        ),
      ),
      body: ListView.builder(
        itemCount: callData.length,
        itemBuilder: (context, i) {
          return Column(
            children: <Widget>[
              Divider(
                height: 20.0,
              ),
              ListTile(
                leading: CircleAvatar(
                  maxRadius: 30.0,
                  backgroundImage: NetworkImage(callData[i].imageUrl),
                ),
                title: Text(
                  callData[i].name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Container(
                  padding: EdgeInsets.only(top: 5.0),
                  child: Text(
                    callData[i].time,
                    style: TextStyle(color: Colors.grey, fontSize: 14.0),
                  ),
                ),
                trailing:
                    Icon(Icons.call, color: Theme.of(context).primaryColor),
              )
            ],
          );
        },
      ),
    );
  }
}
