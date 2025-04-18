import 'package:flutter/material.dart';

class ChatWithUser extends StatelessWidget {
  const ChatWithUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.blue.shade900,
              radius: 18,
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'username',
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Row(
                  children: [
                    Icon(Icons.circle, color: Colors.green, size: 10),
                    SizedBox(width: 4),
                    Text(
                      'Active Now',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          _chatBubble(isMe: false, text: "text"),
          _chatBubble(isMe: true, text: "text"),
          _chatBubble(isMe: false, text: "text"),
          _chatBubble(isMe: false, text: "text"),
          _voiceMessage(isMe: true),
          _chatDateLabel("Thursday 24, 2024"),
          _chatBubble(isMe: false, text: "text"),
          _voiceMessage(isMe: false),
          _chatBubble(isMe: false, text: "text"),
          _voiceMessage(isMe: true),
          Spacer(),
          _messageInput(),
        ],
      ),
    );
  }

  Widget _chatBubble({required bool isMe, required String text}) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        margin: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        decoration: BoxDecoration(
          color: isMe ? Colors.blue.shade400 : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: TextStyle(color: isMe ? Colors.white : Colors.black87),
        ),
      ),
    );
  }

  Widget _voiceMessage({required bool isMe}) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: isMe ? Colors.blue.shade400 : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.play_arrow, color: isMe ? Colors.white : Colors.black),
            SizedBox(width: 8),
            Container(
              width: 100,
              height: 20,
              child: CustomPaint(
                painter: WaveformPainter(isDark: isMe),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _chatDateLabel(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _messageInput() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
        ),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Send Message',
                  border: InputBorder.none,
                ),
              ),
            ),
            Icon(Icons.send, color: Colors.grey),
            SizedBox(width: 10),
            CircleAvatar(
              backgroundColor: Colors.blue.shade700,
              child: Icon(Icons.mic, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}


class WaveformPainter extends CustomPainter {
  final bool isDark;
  WaveformPainter({required this.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = isDark ? Colors.white : Colors.black
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    final barCount = 15;
    final spacing = size.width / (barCount * 2);
    for (int i = 0; i < barCount; i++) {
      double x = spacing + i * spacing * 2;
      double height = (i % 2 == 0 ? 0.5 : 1.0) * size.height;
      canvas.drawLine(Offset(x, size.height / 2 - height / 2), Offset(x, size.height / 2 + height / 2), paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}