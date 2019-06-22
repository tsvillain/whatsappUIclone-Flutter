import 'package:flutter/material.dart';
import '../model/chat.dart';
import 'package:intl/intl.dart';

class DetailChat extends StatefulWidget {
  final String name, imageurl, time;
  DetailChat(this.name, this.imageurl, this.time);
  @override
  _DetailChatState createState() => _DetailChatState(name, imageurl, time);
}

class _DetailChatState extends State<DetailChat> {
  final String name, imageurl, time;
  _DetailChatState(this.name, this.imageurl, this.time);
  TextEditingController _textController = TextEditingController();
  final List<ChatMessage> _messages = <ChatMessage>[];
  bool isType = false;

  void _handleSubmit(String text) {
    ChatMessage message = new ChatMessage(
      text: text,
      name: name,
    );
    setState(() {
      _messages.insert(0, message);
      var data = messageData.firstWhere((t) => t.name == name);
      data.message = message.text;
    });
  }

  Widget _buildText() {
    return new Container(
      child: Row(
        children: <Widget>[
          Flexible(
            child: Card(
              elevation: 2.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0)),
              child: new Row(
                children: <Widget>[
                  Container(
                    child: IconButton(
                      icon: Icon(
                        Icons.tag_faces,
                        color: Colors.grey,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  new Container(
                    child: new Flexible(
                        child: new TextField(
                      controller: _textController,
                      decoration: new InputDecoration.collapsed(
                          hintText: "Type a message"),
                    )),
                  ),
                  Container(
                    child: IconButton(
                      icon: Icon(
                        Icons.camera_alt,
                        color: Colors.grey,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            color: Theme.of(context).primaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0)),
            child: IconButton(
              onPressed: () {
                _handleSubmit(_textController.text);
                _textController.clear();
              },
              icon: Icon(Icons.send, color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              name,
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
            Text(
              time,
              style: TextStyle(fontSize: 15.0, color: Colors.white70),
            )
          ],
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Icon(
                Icons.arrow_back,
              ),
              CircleAvatar(
                maxRadius: 15.0,
                backgroundImage: NetworkImage(imageurl),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.videocam,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.call,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/bg.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: new Column(
            children: <Widget>[
              new Flexible(
                child: new ListView.builder(
                  reverse: true,
                  itemBuilder: (context, int index) => _messages[index],
                  itemCount: _messages.length,
                ),
              ),
              new Divider(
                height: 1.0,
              ),
              new Container(
                child: _buildText(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final String name;
  final String text;
  ChatMessage({this.name, this.text});

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: EdgeInsets.fromLTRB(150.0, 5.0, 5.0, 5.0),
      margin: EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
      child: Card(
        color: Colors.greenAccent,
        clipBehavior: Clip.hardEdge,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        child: Padding(
          padding: EdgeInsets.all(5.0),
          child: new Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                  margin: const EdgeInsets.only(left: 6.0, right: 6.0),
                  child: new Text(text,
                      style:
                          new TextStyle(color: Colors.black, fontSize: 18.0))),
              Container(
                  margin: const EdgeInsets.only(left: 6.0, right: 6.0),
                  child: new Text('12:25 pm',
                      style:
                          new TextStyle(color: Colors.black54, fontSize: 10.0)))
            ],
          ),
        ),
      ),
    );
  }
}
