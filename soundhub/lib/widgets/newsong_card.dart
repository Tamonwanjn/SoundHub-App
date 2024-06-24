import 'package:flutter/material.dart';

import '../models/newsong_model.dart';

class NewSongCard extends StatelessWidget {
  const NewSongCard({
    Key? key,
    required this.newsong,
  }) : super(key: key);

  final NewSong newsong;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      child: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.45,
            height: 170, // เปลี่ยนความสูงของรูปภาพที่นี่
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  newsong.coverUrl,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    newsong.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    newsong.description,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),// และข้อความอื่น ๆ ที่คุณต้องการแสดง
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

