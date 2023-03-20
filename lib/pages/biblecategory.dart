

import 'package:bibleapp/models/bibleob.dart';
import 'package:bibleapp/pages/biblecategorieslistview.dart';
import 'package:flutter/material.dart';
import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/rendering.dart';

class CategoryBiblesScreen extends StatelessWidget {
  final List<BibleOb> bibles;

  const CategoryBiblesScreen({Key? key, required this.bibles}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bibles'),
      ),
      body: BibleCategoriesView(bibles: bibles),
    );
  }
}