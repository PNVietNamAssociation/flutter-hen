import 'package:flutter/material.dart';
import 'package:Hang/ui/screens/search/map_pin_screen.dart';

class SearchVenueScreen extends StatefulWidget {
  SearchVenueScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State createState() => new _SearchVenueState();
}

class _SearchVenueState extends State<SearchVenueScreen> {

  final TextEditingController _controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        elevation: 0,
        title: Text("Search"),
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.grey),
          onPressed: () => Navigator.pop(context),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.map, color: Colors.grey),
            onPressed: () => Navigator.of(context, rootNavigator: true).push(
              MaterialPageRoute(builder: (context) => MapsPinScreen())
            )
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            padding: EdgeInsets.only(left: 15.0, right: 15.0),
            child: TextField(
              controller: _controller,
              style: TextStyle(fontSize: 24.0, color: Colors.black),
              decoration: InputDecoration(
                  icon: Icon(Icons.search, color: Colors.cyan),
                  border: InputBorder.none,
                  hintText: "Enter location",
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    fontSize: 24.0,
                  ),
                  suffixIcon: IconButton(
                      icon: Icon(Icons.cancel, color: Colors.grey),
                      onPressed: () => _controller.clear(),
                      iconSize: 16.0,
                  )
              ),
            ),
            margin: EdgeInsets.only(bottom: 10.0),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                Container(
                  child: ListTileTheme(
                    child: ListTile(
                      title: Text('Công ty mgm technology partners Vietnam', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold), overflow: TextOverflow.ellipsis),
                      subtitle: Text("07 Phan Chau Trinh, Hai Chau, Da Nang, Viet Nam", style: TextStyle(fontSize: 12.0), overflow: TextOverflow.ellipsis),
                      leading: Column(
                        children: <Widget>[
                          Icon(Icons.place, color: Colors.cyan, size: 18.0),
                          Container(
                            margin: EdgeInsets.only(top: 5.0),
                            child: Text("1.0 km", style: TextStyle(fontSize: 12.0, color: Colors.grey), overflow: TextOverflow.ellipsis),
                          ),
                        ],
                      ),
                    ),
                  ),
                  color: Colors.white,
                ),
                Divider(color: Colors.black12, height: 1.0),
                Container(
                  child: ListTileTheme(
                    child: ListTile(
                      title: Text('DANTEK JSC', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold), overflow: TextOverflow.ellipsis),
                      subtitle: Text("31 Tran phu, Hai Chau, Da Nang, Viet Nam", style: TextStyle(fontSize: 12.0), overflow: TextOverflow.ellipsis),
                      leading: Column(
                        children: <Widget>[
                          Icon(Icons.place, color: Colors.cyan, size: 18.0),
                          Container(
                            margin: EdgeInsets.only(top: 5.0),
                            child: Text("2.1 km", style: TextStyle(fontSize: 12.0, color: Colors.grey), overflow: TextOverflow.ellipsis),
                          ),
                        ],
                      ),
                    ),
                  ),
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}