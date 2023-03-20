import 'package:bibleapp/models/bibleob.dart';
import 'package:bibleapp/pages/categorylisview.dart';
import 'package:flutter/material.dart';
import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/rendering.dart';
class BibleCategoriesView extends StatelessWidget {
  final List<BibleOb> bibles;


  const BibleCategoriesView({Key? key, required this.bibles}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final groupedBibles = groupBy<Category, BibleOb>(
      bibles,
      (bible) => Category(name: bible.category),
    );

    return Container(
              height: MediaQuery.of(context).size.height * 0.8,

      child: ListView(
        children: groupedBibles.keys.map((category) {
          final biblesInCategory = groupedBibles[category]!;
          return Card(
            child: InkWell(
              onTap: () {

                Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => CategoryBiblesScreen(biblesInCategory: biblesInCategory, categoryName: category.name,),
              ),
            );
                // Navigate to the bibles in this category
              },
              child: Padding(
                padding: const EdgeInsets.all(70.0),
                child: Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          category.name,
                          style: const TextStyle(
                            color: Colors.amberAccent,
                            fontWeight: FontWeight.bold,
                            fontSize: 25.0,
                          ),
                        ),
                      ),
                      /* SizedBox(height: 8.0),
                      ListView.builder(
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
                    ],
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  
}


class Category {
  final String name;
  
  const Category({required this.name});
  
  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Category && runtimeType == other.runtimeType && name == other.name;

  @override
  int get hashCode => name.hashCode;
}

Map<K, List<V>> groupBy<K, V>(List<V> list, K Function(V) keyFn) {
  final Map<K, List<V>> map = {};

  for (final element in list) {
    final key = keyFn(element);

    if (!map.containsKey(key)) {
      map[key] = [];
    }

    map[key]!.add(element);
  }

  return map;
}
/* 

import 'package:bibleapp/models/bibleob.dart';
import 'package:flutter/material.dart';
import 'package:external_app_launcher/external_app_launcher.dart';

class BibleListView extends StatelessWidget {
  final List<BibleOb> bibles;
  const BibleListView({Key? key, required this.bibles}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final groupedBibles = groupBy<Category, BibleOb>(
      bibles,
      (bible) => Category(name: bible.category),
    );

    return Container(
        height: MediaQuery.of(context).size.height * 0.8,

      child: ListView.builder(
          itemCount: groupedBibles.length,
          itemBuilder: (BuildContext context, int index) {
            final category = groupedBibles.keys.elementAt(index);
            final biblesInCategory = groupedBibles[category]!;
    
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: Text(
                    category.name,
                    style: const TextStyle(
                      color: Colors.amberAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                    ),
                  ),
                ),
                ListView.builder(
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
                ),
              ],
            );
          },
      ),
    );
    
  }
}

class Category {
  final String name;
  
  const Category({required this.name});
  
  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Category && runtimeType == other.runtimeType && name == other.name;

  @override
  int get hashCode => name.hashCode;
}

Map<K, List<V>> groupBy<K, V>(List<V> list, K Function(V) keyFn) {
  final Map<K, List<V>> map = {};

  for (final element in list) {
    final key = keyFn(element);

    if (!map.containsKey(key)) {
      map[key] = [];
    }

    map[key]!.add(element);
  }

  return map;
}


 */


/* 
import 'package:bibleapp/models/bibleob.dart';
import 'package:flutter/material.dart';
import 'package:external_app_launcher/external_app_launcher.dart';

class BibleListView extends StatelessWidget {
  final List<BibleOb> bibles;
  final String bibleCategory;
  const BibleListView({super.key, required this.bibles, required this.bibleCategory});

  @override
  Widget build(BuildContext context) {

        final filteredBibles = bibles.where((bible) => bible.category == bibleCategory).toList();
print(" filtterd list$filteredBibles");
    return SizedBox(
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text(
                    bibleCategory,
                    style:const TextStyle(
                      color: Colors.amberAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                    ),
                  ),
          Expanded(
                        child: ListView.builder(
                            padding: const EdgeInsets.all(8),
                            itemCount: filteredBibles.length,
                            itemBuilder: (BuildContext context, int index) {
                              print(filteredBibles);
                                return Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () async {
                                        print(filteredBibles[index].packageName);
                                        var openAppResult = await LaunchApp.openApp(
                                          androidPackageName:
                                              '${filteredBibles[index].packageName}',
                                        );
                                        print(
                                            'openAppResult => $openAppResult ${openAppResult.runtimeType}');
                                        // Enter thr package name of the App you want to open and for iOS add the URLscheme to the Info.plist file.
                                        // The second arguments decide wether the app redirects PlayStore or AppStore.
                                        // For testing purpose you can enter com.instagram.android
                                      },
                                      child: SizedBox(
                                        height: 30,
                                        child: Text('${filteredBibles[index].bibleName}'),
                                      ),
                                    ),
                                  ],
                                );
                   
                              }

                          
    
                            ),
                      ),
        ],
      ),
    );
  }
} */