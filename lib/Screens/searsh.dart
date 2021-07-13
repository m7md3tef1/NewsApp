import 'package:appnew/Widgets/SmartCodeTitle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: SmartCodeTitle(),
      ),
      body: Column(
        children: [
           Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black,

                    ),
                    labelText: 'Search Here',
                  labelStyle: TextStyle(fontSize: 15.sp),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))

                    ),
              ),
            ),
             Expanded(child: Center(
               child: Image.network('https://i.dlpng.com/static/png/6430467_preview.png'),
             )),
        ],
      ),
    );
  }
}

