import 'package:bibleapp/models/bible.dart';
import 'package:bibleapp/models/bibleob.dart';
import 'package:bibleapp/pages/biblecategorieslistview.dart';
import 'package:bibleapp/provider/bibleProvider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  BibleProvider bibleProvider = BibleProvider();
  //late Future<BibleResponse> _bible;

  final List<BibleOb> _bibles = [
    BibleOb(
        packageName: "com.hailey.goodnews.holybible",
        bibleName: "Good News",
        category: "English",
        imageLink: "https://textbookcentre.com/media/products/2010122000062.jpg",
        ),
        
    BibleOb(
        packageName: "bible.kingjamesbiblelite",
        bibleName: "King James",
        category: "English",
        imageLink: "https://www.shutterstock.com/image-photo/black-holy-bible-inside-textile-260nw-522262135.jpg"
        ),
        
    BibleOb(
        packageName: "kikuyu.holy.bible.AOVGUEHTERZFTWPYRJ",
        bibleName: "Kikuyu Bible",
        category: "Kikuyu",
        imageLink: "https://play-lh.googleusercontent.com/8KMPjiawgjrgXYaRmPct6ApR4kk_ITGKpbA48CHnl1FFiXjc6G_XMYQc-SotHyxwTg=w240-h480-rw"
        ),
    BibleOb(
        bibleName: "NIV Bible Study",
        packageName: "new.international.version.bible.niv",
                category: "English",
                imageLink: "https://s35422.pcdn.co/wp-content/uploads/2020/06/NIV-Study-Bible-logo-1024x1018.jpg"
                ), 
     BibleOb(
        category: "English",
        bibleName: "The Study Bible",
        packageName: "com.gty.macarthurstudybible",
        imageLink: "https://thumbs.dreamstime.com/b/bible-study-letterpress-words-written-vintage-type-44054840.jpg"), 
      BibleOb(
        category: "English",
        bibleName: "Blue Letter Bible",
        packageName: "org.blueletterbible.blb",
        imageLink: "https://w7.pngwing.com/pngs/690/816/png-transparent-blue-letter-bible-god-s-word-translation-bible-study-study-bible-blue-letter-thumbnail.png"),
        BibleOb(
        category: "Kikuyu",
        bibleName: "Kiugo Gĩtheru Kĩa Ngai ",
        packageName: "org.fcbh.kikkgv.o1n1.on",
         imageLink: "https://play-lh.googleusercontent.com/ncciFA9FQc4G92B_w-nC64LUoVM-9-lhCjrG7Roj25cjGwajMiSFKu3DSv0OS8mMkQh8=w240-h480-rw"),
  ];

  List<BibleOb> bibles=[];
  @override
  void initState() {
    
    super.initState();
    bibles= _bibles;
  }

  Color containerColor = Colors.red;

  @override
  Widget build(BuildContext context) {
       
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Bible versions'),
        ),
        body: SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListView(
                shrinkWrap: true,

              children: [
               BibleCategoriesView(bibles: bibles,),   
            
              ],
            ),
          ),
        ),
      ),
    );
  }
}
