import 'package:bloc_example/model/albums_model.dart';
import 'package:bloc_example/view/widget/text_widget.dart';
import 'package:flutter/material.dart';

class ListRowWidget extends StatelessWidget {
  final AlbumsModel? album;
  const ListRowWidget({Key? key, this.album}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(text: album!.title),
          const Divider(),
        ],
      ),
    );
  }
}