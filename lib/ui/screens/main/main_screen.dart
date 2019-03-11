import 'package:flutter/material.dart';
import 'fab_bottom_appbar_item.dart';
import 'package:Hang/ui/screens/search/search_venue_screen.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State createState() => new _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  String _lastSelected = 'TAB: 0';

  void _selectedTab(int index) {
    setState(() {
      _lastSelected = 'TAB: $index';
    });
  }

  Widget card() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5.0),
      child: Column(
        children: <Widget>[
        Image.network(
          "https://media-cdn.tripadvisor.com/media/photo-s/0c/6d/ed/33/mod-coffee-house-cafe.jpg",
          height: 150.0,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Container(
          color: Colors.white,
          width: double.infinity,
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "The Coffee House",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 22.0
                ),
              ),
              Row(
                children: <Widget>[
                  Icon(Icons.alarm, size: 14),
                  Padding(
                    padding: EdgeInsets.only(left: 5.0),
                    child: Text("Today, 1:00 PM",
                      style: TextStyle(fontSize: 14.0, color: Colors.grey),
                    ),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 10.0, right: 5.0),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage("http://www.learnyzen.com/wp-content/uploads/2017/08/test1.png"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0, right: 5.0),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage("http://envato.rathemes.com/infinity/assets/images/221.jpg"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0, right: 5.0),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage("http://endlesstheme.com/simplify1.0/images/profile/profile2.jpg"),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0, right: 5.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: Text("+1", style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  FlatButton(
                    child: Row(
                      children: <Widget>[
                        Icon(Icons.delete, color: Colors.red, size: 18.0),
                        Text("CANCEL", style: TextStyle(color: Colors.red)),
                      ],
                    ) ,
                  ),
                ],
              )
            ],
          ),
        ),
      ])
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color.fromRGBO(240, 240, 240, 1.0),
      appBar: AppBar(
        title: Text('Hang', style: TextStyle(color: Colors.cyan, fontSize: 20.0)),
        backgroundColor: Colors.white,
        brightness: Brightness.light,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            child: card(),
            padding: EdgeInsets.all(15.0),
          ),
          Container(
            child: card(),
            padding: EdgeInsets.all(15.0),
          ),
          Container(
            child: card(),
            padding: EdgeInsets.all(15.0),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
          Navigator.of(context, rootNavigator: true).push(MaterialPageRoute(
            fullscreenDialog: true,
            builder: (context) => SearchVenueScreen())
          ),
        tooltip: "Add",
        child: Icon(Icons.add),
        elevation: 2.0,
        backgroundColor: Colors.cyan,
      ),
      bottomNavigationBar: FABBottomAppBar(
        color: Colors.grey,
        selectedColor: Colors.cyan,
        onTabSelected: _selectedTab,
        notchedShape: CircularNotchedRectangle(),
        items: [
          FABBottomAppBarItem(iconData: Icons.home, text: 'Upcoming'),
          FABBottomAppBarItem(iconData: Icons.favorite_border, text: 'Favorite'),
          FABBottomAppBarItem(iconData: Icons.person_outline, text: 'Profile'),
          FABBottomAppBarItem(iconData: Icons.menu, text: 'Menu'),
        ],
      ),
    );
  }
}