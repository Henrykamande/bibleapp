import 'package:bibleapp/models/bibleob.dart';
import 'package:bibleapp/pages/biblecategorieslistview.dart';
import 'package:flutter/material.dart';
import 'package:external_app_launcher/external_app_launcher.dart';

class CategoryBiblesScreen extends StatelessWidget {

  final biblesInCategory;
    final String categoryName;

  const CategoryBiblesScreen({super.key, this.biblesInCategory, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return  Material(


      child: Scaffold(
appBar: AppBar(
          title: Text(categoryName),
        ),
        body: 
        
        
        GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: biblesInCategory.length,
        itemBuilder: (BuildContext context, int index) {
          final bible = biblesInCategory[index];
          return GestureDetector(
            onTap: () async {
              final openAppResult = await LaunchApp.openApp(androidPackageName: bible.packageName);
              print('openAppResult => $openAppResult ${openAppResult.runtimeType}');
            },
            child: Card(
              child: Column(
                children: [
                Image(image: NetworkImage(bible.imageLink), height: 100, width: 100,),
                SizedBox(height: 20,),
               Center(
                      child: Text(bible.bibleName),
                    ),
                  
                ],
              ),
            ),
          );
        },
      ),/* ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: biblesInCategory.length,
                            itemBuilder: (BuildContext context, int index) {
                              final bible = biblesInCategory[index];
                        
                              return ListTile(
                                title: Text(bible.bibleName),
                                onTap: () async {
                                  final openAppResult = await LaunchApp.openApp(
                                    androidPackageName: bible.packageName,
                                  );
                                  print('openAppResult => $openAppResult ${openAppResult.runtimeType}');
                                },
                              );
                            },
                          ), */
      ),
    );
  }
}