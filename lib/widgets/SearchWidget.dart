import 'package:Grabzo/pages/SearchSeeAll.dart';
import 'package:Grabzo/pages/SeeAll.dart';
import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  TextEditingController _search = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, top: 5, right: 10, bottom: 5),
      child: TextField(
        controller: _search,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            borderSide: BorderSide(
              width: 0,
              color: Color(0xff42950a),
              style: BorderStyle.none,
            ),
          ),
          filled: true,
          prefixIcon: Icon(
            Icons.search,
            color: Color(0xff42950a),
          ),
          fillColor: Color(0xFFFAFAFA),
          suffixIcon: IconButton(
            icon: const Icon(Icons.arrow_forward),
            tooltip: 'Increase volume by 10',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SearchSeeAll(search: _search.text),
                ),
              );
            },
          ),
          hintStyle: new TextStyle(color: Color(0xFFd0cece), fontSize: 18),
          hintText: "What would your like to buy?",
        ),
      ),
    );
  }
}
