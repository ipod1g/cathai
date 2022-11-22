import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class MessageBubble extends StatelessWidget {
  final String msg;
  MessageBubble(this.msg);

  @override
  Widget build(BuildContext context) {
    return (msg.contains("{CathAI:") || msg.contains("{User:"))
        ? Stack(
            children: [
              Row(
                mainAxisAlignment: msg.contains("{User:")
                    ? MainAxisAlignment.end
                    : MainAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: msg.contains("{User:")
                          ? Colors.blue[100]
                          : Colors.purple[100],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                        bottomLeft: !msg.contains("{User:")
                            ? Radius.circular(0)
                            : Radius.circular(12),
                        bottomRight: msg.contains("{User:")
                            ? Radius.circular(0)
                            : Radius.circular(12),
                      ),
                    ),
                    width: 200,
                    height: 200,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                    margin: EdgeInsets.symmetric(vertical: 4, horizontal: 6),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: msg.contains("{User:")
                            ? CrossAxisAlignment.end
                            : CrossAxisAlignment.start,
                        children: [
                          //Text(showTime(time.ti)),
                          Text(
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w700),
                            msg.replaceAll("{", "").replaceAll("}", ""),
                            textAlign: msg.contains("{User:")
                                ? TextAlign.end
                                : TextAlign.start,
                          )
                        ]),
                  )
                ],
              ),
            ],
            clipBehavior: Clip.none,
          )
        : Container();
  }
}

class NewMessageBar extends StatefulWidget {
  @override
  State<NewMessageBar> createState() => _NewMessageStateBar();
}

class _NewMessageStateBar extends State<NewMessageBar> {
  var _enteredMessage = '';
  final _controller = TextEditingController();

  void _sendMessage() async {
    FocusScope.of(context).unfocus();
    // FirebaseFirestore.instance.collection('chats').doc("custom_id").set({'text': _enteredMessage,'text': _enteredMessage});
    var a = FirebaseDatabase.instance.ref('user_input');
    await a.set({
      "User": _enteredMessage,
    });
    setState(() {
      _controller.clear();
      _enteredMessage = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8, bottom: 8),
      padding: EdgeInsets.all(8),
      child: Row(children: [
        Expanded(
            child: TextField(
          controller: _controller,
          decoration: InputDecoration(labelText: '  Send Message'),
          onChanged: (value) {
            setState(() {
              _enteredMessage = value;
            });
          },
        )),
        IconButton(
            onPressed: _enteredMessage.trim().isEmpty ? null : _sendMessage,
            icon: const Icon(Icons.send))
      ]),
    );
  }
}
