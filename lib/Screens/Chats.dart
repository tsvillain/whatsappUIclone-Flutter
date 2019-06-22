import 'package:flutter/material.dart';
import 'package:mywhatsapp/Screens/DetailChat.dart';
import '../model/chat.dart';

class Chats extends StatefulWidget {
  @override
  _ChatsState createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).accentColor,
        onPressed: () {},
        child: Icon(
          Icons.message,
          color: Colors.white,
        ),
      ),
      body: ListView.builder(
        itemCount: messageData.length,
        itemBuilder: (context, index) {
          return Column(
            children: <Widget>[
              Divider(
                height: 20.0,
              ),
              ListTile(
                leading: CircleAvatar(
                  maxRadius: 30.0,
                  backgroundImage: NetworkImage(messageData[index].imageUrl),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      messageData[index].name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      messageData[index].time,
                      style: TextStyle(color: Colors.grey, fontSize: 12.0),
                    ),
                  ],
                ),
                subtitle: Container(
                  padding: EdgeInsets.only(top: 5.0),
                  child: Text(
                    messageData[index].message,
                    style: TextStyle(color: Colors.grey, fontSize: 15.0),
                  ),
                ),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return DetailChat(messageData[index].name,
                        messageData[index].imageUrl, messageData[index].time);
                  }));
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
