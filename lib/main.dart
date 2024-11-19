import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // Needed for JSON encoding and decoding.

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  // final ScrollController _scrollController = ScrollController();

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'MIND OF SAH'),
    );
  }
}

class MyAppState extends ChangeNotifier {
    notifyListeners();
  }


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
    final ScrollController _scrollController = ScrollController();
    late Timer _timer;
  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }



  @override
    void initState() {
    super.initState();
    
    // Initialize the Timer to scroll every 50ms
    _timer = Timer.periodic(Duration(milliseconds: 50), (timer) {
      if (_scrollController.position.pixels >=
    _scrollController.position.maxScrollExtent) {
      _scrollController.jumpTo(0);
      }

      if (_scrollController.hasClients) {
        // Scroll the ListView horizontally
        _scrollController.animateTo(
          _scrollController.offset + 3, // Increment the scroll offset
          duration: Duration(milliseconds: 10), // Smooth animation duration
          curve: Curves.linear, // Linear scrolling
        ) ; 
      } 
      // else {_scrollController.jumpTo(0);}
    });
  }
  @override
  void dispose() {
    // Dispose the controller and timer when the widget is removed
    _scrollController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body:  Row(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
            Expanded(
            flex: 1,
            // child: Image.asset('assets/images/squid.jpg', width: double.infinity, height: double.infinity, fit: BoxFit.cover,
            // child: Image.asset('assets/images/sah.jpg', width: double.infinity, height: double.infinity, fit: BoxFit.cover,
            // child: Image.asset('assets/images/sah.png', width: double.infinity, height: double.infinity, fit: BoxFit.cover,
            // child: Image.asset('assets/images/notes.jpg', width: double.infinity, height: double.infinity, fit: BoxFit.cover,
            // child: Image.asset('assets/images/sahbabii-saaheem.webp', width: double.infinity, height: double.infinity, fit: BoxFit.cover,
            child: Image.asset('assets/images/barnacles.jpg', width: double.infinity, height: double.infinity, fit: BoxFit.cover,

            ),
          ),

          Expanded(
            flex: 3,
            child: Stack(
              children: <Widget>[
            //     Image.asset('images/notes3.heic', width: double.infinity, height: double.infinity, fit: BoxFit.cover,
            // ),
                SafeArea(
                  child: Column(
                    children: [
                      Expanded(flex:2, // Title
                        child: Row(
                          children: [
                            Expanded( flex:3,
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Container(decoration:BoxDecoration(border: Border.all(width: 3.0)), child: Expanded(child: Padding(
                                  padding: const EdgeInsets.only(left:8.0,),
                                  child: Text('SAHBABII, SELECTED POEMS', style: TextStyle(fontFamily: 'Helvetica Neue', fontSize: 35.0, fontWeight: FontWeight.bold, letterSpacing: -3.5)),
                                ), flex: 1,)),
                              ),
                            ),
                            // Expanded(flex: 1, child:Image.asset('assets/images/sahbabii-saaheem.webp', width: double.infinity, height: double.infinity, fit: BoxFit.cover,)),
                          ],
                        ),
                      ),
                  
                      Expanded(flex:6, // Scroller
                        child: Container( margin: EdgeInsets.all(5.0),decoration:BoxDecoration(border: Border.all(width: 3.0)),            
                          child: SingleChildScrollView(
                          controller: _scrollController, scrollDirection: Axis.vertical,
                            child: const Flexible(
                              child: Padding(
                                padding: EdgeInsets.only(left:10, right:10, bottom:10, top:40.0),
                                child: Text( '\n\n\n\nMicrowaved doo doo, get hit with that hot shit \n\nShe got a donut booty how you suck dick but dont eat string beans \n\nBitch screaming like an Indian [AHYAYAYAYAYAYEEEEEE!] \n\nIm fucking this bitch and spreading her asscheeks, that bootyhole pink \n\nI wana fuck an amphibian \n\nI may just bust on her pinky \n\nShe’s vegetarian but she still ate my meat \n\nBitch we havin stripes and yo bitch want some zebra dick \n\nShe reached in my pants I got 2 peepees \n\nBitch I’m vegan throw that apple back \n\nShe suckin my dick while she cooking the shrimp that lil hoe from New Orleans\n\n Nut in her mouth got her tongue pregnant \n\nIf I was coke she’d be snortin me', 
                                style: TextStyle(fontFamily: 'Helvetica Neue', color: Colors.black, fontSize: 30.0, fontWeight: FontWeight.bold, letterSpacing: -3.5),
                                ),
                              ),
                            ),
                                        ),
                        ),
                      ),
                      Expanded(flex:1, child: Padding( // TextBox
            padding: const EdgeInsets.all(5.0),
            child: TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.zero,     
                borderSide: BorderSide(
                  color: Colors.black, // Border color
                  width: 3.0,         // Border thickness
    ),

),
                hintText: 'YOUR FAV LYRIC HERE...', hintStyle: TextStyle(color: Colors.black)
              ),
            ),
          ),
),
                    ],
                  ),
                ),
        ]
        ),
          ),
    
        ],
                )

      );

  }
}

