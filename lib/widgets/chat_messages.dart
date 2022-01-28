import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final String texto;
  final String uid;
  final AnimationController animationController;

  const ChatMessage({
    Key? key,
    required this.texto,
    required this.uid,
    required this.animationController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor: CurvedAnimation(
        parent: animationController,
        curve: Curves.easeOut,
      ),
      child: FadeTransition(
        opacity: animationController,
        child: Container(
          child: uid == '123' ? _myMessage(texto) : _notMyMessage(texto),
        ),
      ),
    );
  }
}

Widget _myMessage(String texto) {
  return Align(
    alignment: Alignment.centerRight,
    child: Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.only(bottom: 5, left: 50, right: 5),
      child: Text(
        texto,
        style: const TextStyle(color: Colors.white),
      ),
      decoration: BoxDecoration(
        color: const Color(0xff4D9EF6),
        borderRadius: BorderRadius.circular(20),
      ),
    ),
  );
}

Widget _notMyMessage(String texto) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.only(bottom: 5, left: 5, right: 50),
      child: Text(
        texto,
        style: const TextStyle(color: Colors.black87),
      ),
      decoration: BoxDecoration(
        color: const Color(0xffE4E5E8),
        borderRadius: BorderRadius.circular(20),
      ),
    ),
  );
}
