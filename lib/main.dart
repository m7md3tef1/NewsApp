import 'package:appnew/Screens/HomeScreen.dart';
import 'package:appnew/Screens/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:appnew/Screens/ArticleScreen.dart';
import 'package:provider/provider.dart';
import 'package:appnew/Provider/countryProvider.dart';

void main()
{

   runApp(
    MultiProvider
    (
      providers: [
        ChangeNotifierProvider(create: (context)=>CountryProvider()),
      ],
        child: NewApp()));
}
class NewApp extends StatefulWidget {
  const NewApp({Key key}) : super(key: key);

  @override
  _NewAppState createState() => _NewAppState();
}

class _NewAppState extends State<NewApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        builder:()=> MaterialApp(
          theme: ThemeData(primaryColor: Colors.deepPurple),
        initialRoute: SplashScreen.id,
        routes: {
          SplashScreen.id:(context)=>SplashScreen(),
          HomeScreen.id:(context)=>HomeScreen(),
          ArticleScreen.id:(context)=>ArticleScreen(),
        },
      ),
    );
  }
}






