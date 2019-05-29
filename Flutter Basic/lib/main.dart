import 'package:flutter/material.dart';
import './hal_headset.dart' as headset;
import './hal_komputer.dart' as komputer;
import './hal_radio.dart' as radio;
import './hal_smartphone.dart' as hp;

void main(){
  runApp(new MaterialApp(
    title: "Navigasi",
    home: new HalSatu(),
    routes: <String, WidgetBuilder>{
      '/HalSatu' : (BuildContext context) => new HalSatu(),
      '/HalDua' : (BuildContext context) => new HalDua(),
      '/Home' : (BuildContext context) => new Home(),
      '/image': (BuildContext context) => new Gambar(),
    },
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {

  TabController controller;
  @override
  void initState() {
    controller = new TabController(vsync: this, length: 4);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.amber,
        title: new Text("Daftar Elektronik"),
        bottom: new TabBar(
          controller: controller,
          tabs: <Widget>[
            new Tab(icon: new Icon(Icons.computer), text: "Komputer",),
            new Tab(icon: new Icon(Icons.headset), text: "Headset",),
            new Tab(icon: new Icon(Icons.radio), text: "Radio",),
            new Tab(icon: new Icon(Icons.smartphone), text: "Smartphone",),
          ],
        ),
      ),
      body: new TabBarView(
        controller: controller,
        children: <Widget>[
          new komputer.Komputer(),
          new headset.Headset(),
          new radio.Radio(),
          new hp.Smartphone()
        ],
      ),
      bottomNavigationBar: new Material(
        color: Colors.amber,
        child: new TabBar(
          controller: controller,
          tabs: <Widget>[
            new Tab(icon: new Icon(Icons.computer),),
            new Tab(icon: new Icon(Icons.headset),),
            new Tab(icon: new Icon(Icons.radio),),
            new Tab(icon: new Icon(Icons.smartphone),),
          ],
        ),
      ),
    );
  }
}
class HalSatu extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(title: new Text("Home"),),
      body: new Center(
        child: new IconButton(icon: new Icon(Icons.home, size: 50.0 ),
        onPressed: (){
          Navigator.pushNamed(context, '/Home');
        },
        )
      )
    );
  }
}

class HalDua extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(title: new Text("Speaker"),),
      body: new Center(
        child: new IconButton(icon: new Icon(Icons.speaker, size: 50.0, color: Colors.red, ),
        onPressed: (){
          Navigator.pushNamed(context, '/HalSatu');
        },
        )
      )
    );
  }
}

class Gambar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Daftar Tutorial"),
        backgroundColor: Colors.red[900],
     ),

     body: new ListView(
       children: <Widget>[
         new ListTutorial(gambar: "https://upload.wikimedia.org/wikipedia/commons/thumb/8/80/HTML5_logo_resized.svg/170px-HTML5_logo_resized.svg.png", judul: "HTML5",),
         new ListTutorial(gambar: "https://cdn.freebiesupply.com/logos/large/2x/css-3-logo-png-transparent.png", judul: "CSS",),
         new ListTutorial(gambar: "http://assets.stickpng.com/thumbs/58480979cef1014c0b5e4901.png", judul: "Java",),
         new ListTutorial(gambar: "https://upload.wikimedia.org/wikipedia/commons/1/17/Google-flutter-logo.png", judul: "Flutter",),
         new ListTutorial(gambar: "https://www.dartlang.org/assets/shared/dart-logo-for-shares.png?2", judul: "Dart",),
       ],
     ),
    );
  }
}

class ListTutorial extends StatelessWidget {

  ListTutorial({this.gambar, this.judul});
  final String gambar;
  final String judul;

  @override
  Widget build(BuildContext context) {
    return new Container(
           padding: new EdgeInsets.all(20.0),
           child: new Center(
             child: new Row(
               children: <Widget>[
                 new Image(image: new NetworkImage(gambar), width: 80.0,),
                 new Container(
                   padding: new EdgeInsets.all(30.0),
                   child: new Center(
                     child: new Column(
                       children: <Widget>[
                         new Text(judul, style: new TextStyle(fontSize: 20.0)),
                        new Text("Ini adalah deskripsi tutorial ....", style: new TextStyle(fontSize: 13.0))
                       ],
                     ),
                   ),
                 )
               ],
             ),
           ),
         );
  }
}