import 'package:flutter/material.dart';

class CommentCard extends StatefulWidget {
  const CommentCard({Key? key}) : super(key: key);

  @override
  State<CommentCard> createState() => _CommentCardState();
}

class _CommentCardState extends State<CommentCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1638913665258-ddd2bceafb30?ixlib=rb-1.2.1&ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHw2fHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60'),
            radius: 18,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: ' username',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: ' Some description from username',
                    ),
                  ]),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    '23/12/22',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                  ),
                )
              ],
            ),
          ),
          Container(
              padding: const EdgeInsets.all(2),
              child: const Icon(
                Icons.favorite,
                size: 16,
              ))
        ],
      ),
    );
  }
}
