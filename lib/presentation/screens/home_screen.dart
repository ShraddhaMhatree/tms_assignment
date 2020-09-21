import 'package:flutter/material.dart';
import 'package:tms_assignment/bloc/home_bloc.dart';
import 'package:tms_assignment/models/PetsResponse.dart';
import 'package:tms_assignment/presentation/screens/other_screen.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Pets> petList = List();
  final HomeBloc homeBloc = HomeBloc();
  int _value = 0;

  @override
  void initState() {
    super.initState();
    homeBloc.getList();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    homeBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Icon(Icons.list),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Pets near you',
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                    padding: EdgeInsets.only(right: 60, top: 5),
                    child: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                      style:
                          TextStyle(fontSize: 12, color: Colors.grey.shade700),
                    )),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  textAlign: TextAlign.start,
                  decoration: new InputDecoration(
                    hintText: 'Search',
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade200,
                    border: new OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(20.0),
                      ),
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Take your tour',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 30,
                  child: ListView(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    scrollDirection: Axis.horizontal,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: ChoiceChip(
                          selected: _value == 0,
                          label: Padding(
                            padding: EdgeInsets.all(3),
                            child: Text(
                              'Hot',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                          backgroundColor: Colors.grey.shade200,
                          selectedColor: Colors.pink,
                          onSelected: (bool selected) {
                            setState(() {
                              _value = selected ? 0 : null;
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: ChoiceChip(
                          selected: _value == 1,
                          label: Padding(
                            padding: EdgeInsets.all(3),
                            child: Text(
                              'Trend',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                          backgroundColor: Colors.grey.shade200,
                          selectedColor: Colors.pink,
                          onSelected: (bool selected) {
                            setState(() {
                              _value = selected ? 1 : null;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => OtherScreen()),
                              );
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: ChoiceChip(
                          selected: _value == 4,
                          label: Padding(
                            padding: EdgeInsets.all(3),
                            child: Text(
                              'Dog',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                          backgroundColor: Colors.grey.shade200,
                          selectedColor: Colors.pink,
                          onSelected: (bool selected) {
                            setState(() {
                              _value = selected ? 4 : null;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => OtherScreen()),
                              );
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: ChoiceChip(
                          selected: _value == 2,
                          label: Padding(
                            padding: EdgeInsets.all(3),
                            child: Text(
                              'Private',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                          backgroundColor: Colors.grey.shade200,
                          selectedColor: Colors.pink,
                          onSelected: (bool selected) {
                            setState(() {
                              _value = selected ? 2 : null;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => OtherScreen()),
                              );
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: ChoiceChip(
                          selected: _value == 3,
                          label: Padding(
                            padding: EdgeInsets.all(3),
                            child: Text(
                              'Cat',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                          backgroundColor: Colors.grey.shade200,
                          selectedColor: Colors.pink,
                          onSelected: (bool selected) {
                            setState(() {
                              _value = selected ? 3 : null;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => OtherScreen()),
                              );
                            });
                          },
                        ),
                      ),

                    ],
                  ),
                ),
                Container(
                  height: 280,
                  child: StreamBuilder(
                    stream: homeBloc.breweryList,
                    builder: (BuildContext context,
                        AsyncSnapshot<List<Pets>> snapshot) {
                      List<Pets> data = snapshot.data;
                      if (data != null) {
                        petList = data;
                      }
                      return _listViewBuilder(petList);
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                _footerWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _listViewBuilder(List<Pets> pets) {
    return pets.length > 0
        ? ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            itemCount: pets.length,
            itemBuilder: (ctx, i) => Container(
                margin: EdgeInsets.symmetric(vertical: 8),
                child: _listItemBuilder(pets, i)),
          )
        : Center(
            child: CircularProgressIndicator(),
          );
  }

  Container _listItemBuilder(List<Pets> pets, int i) {
    print(' pic ${pets[i].photo}');
    return Container(
        width: 180,
        padding: EdgeInsets.only(right: 20),
        child: Stack(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(30)),
                child: Image.network(
                  pets[i].photo,
                  height: 280,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(top: 25, left: 15),
                child: Text(
                  '${pets[i].name}',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                )),
          ],
        ));
  }

  Container _footerWidget() {
    return Container(
      width: double.infinity,
      height: 130,
      child: Card(
        color: Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        // elevation: 2,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.add,
                    color: Colors.pink,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 20, left: 20, bottom: 10),
                      child: Text(
                        'Join today and save lives',
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 50, left: 20, bottom: 10),
                      child: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                        style: TextStyle(
                            fontSize: 11,
                            color: Colors.white,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: <Widget>[
                            Text(
                              'Donate now',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 4,
                            ),
                            Icon(Icons.navigate_next,
                                size: 20, color: Colors.white),
                          ],
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
