import 'package:flutter/material.dart';
import 'models/global.dart';
import 'UI/Intray/intray_page.dart';
import 'UI/Login/loginscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo App',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FutureBuilder(
        future: _calculation, // a previously-obtained Future<Stirng> or null
        builder: (BuildContext context, AsyncSnapshot<String> snapshot){
          switch (snapshot.connectionState){
            case ConnectionState.none:
              return Text('Press button to start.');
            case ConnectionState.active:
            case ConnectionState.waiting:
              return Text('Awaiting result...');
            case ConnectionState.done:
              if (snapshot.hasError) return Text('Error: ${snapshot.error}');
              return Text('Result: ${snapshot.data}');
          }
          return null;
        },     ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.yellow,
      home: SafeArea(
        child: DefaultTabController(
          length: 3,
          child: new Scaffold(
            body: Stack(children: <Widget>[
              TabBarView(
                children: [
                  IntrayPage(),
                  new Container(
                    color: darkGreyColor,
                  ),
                  new Container(
                    color: darkGreyColor,
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.only(left: 25),
                height: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50)),
                    color: Colors.white),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Intray", style: intrayTitleStyle),
                    Container()
                  ],
                ),
              ),
              Container(
                height: 80,
                width: 80,
                margin: EdgeInsets.only(
                    top: 160,
                    left: MediaQuery.of(context).size.width * 0.5 - 40),
                child: FloatingActionButton(
                  child: Icon(Icons.add, size: 80),
                  backgroundColor: lightBlueColor,
                  onPressed: () {},
                ),
              ),
            ]),
            appBar: AppBar(
                elevation: 0,
                title: new TabBar(
                  tabs: [
                    Tab(
                      icon: new Icon(Icons.home),
                    ),
                    Tab(
                      icon: new Icon(Icons.rss_feed),
                    ),
                    Tab(
                      icon: new Icon(Icons.perm_identity),
                    )
                  ],
                  labelColor: darkGreyColor,
                  unselectedLabelColor: lightBlueColor,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorPadding: EdgeInsets.all(5.0),
                  indicatorColor: Colors.transparent,
                ),
                backgroundColor: Colors.white),
            backgroundColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
