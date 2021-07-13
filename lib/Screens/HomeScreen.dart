import 'package:animations/animations.dart';
import 'package:appnew/Models/NewsModel.dart';
import 'package:appnew/Screens/CategoryScreen.dart';
import 'package:appnew/Screens/searsh.dart';
import 'package:appnew/api-helper/api_helper.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:appnew/Widgets/CategoryContainer.dart';
import 'package:appnew/Widgets/SmartCodeTitle.dart';
import 'package:appnew/Models/CategoryModel.dart';
import 'package:appnew/Screens/ArticleScreen.dart';
import 'package:appnew/Provider/countryProvider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);
static String id='homeScreen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 final connectInternet=Connectivity();
 bool isConnected=true;
  List<CategoryModel>categories=[
    CategoryModel(name: 'General',imageUrl: 'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg' ),
    CategoryModel(name: 'Health', imageUrl: 'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg'),
    CategoryModel(name: 'Business',imageUrl: 'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg'),
    CategoryModel(name: 'Sports', imageUrl: 'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg'),
  ];
  List<NewsModel>article=[];
  ApiHelper apiHelper=ApiHelper();
 Future<List<NewsModel>> getNews(){
    apiHelper.getNews(context).then((value) {
      if (mounted) {
        setState(() {
          article = value;
        });
      }
    });
  }
  @override
void initState(){
   setState(() {
     super.initState();
     connectInternet.onConnectivityChanged.listen((event) {
       setState(() {
         if(event !=ConnectivityResult.none){
           isConnected=true;
         }else{
           isConnected=false;
         }
       });
     });
   });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child:OpenContainer(
            transitionDuration: Duration(milliseconds: 500),
            closedBuilder: (context,c){
          return Icon(Icons.search,color: Colors.deepPurple,);
        }, openBuilder:(context,c){
    return SearchScreen(); }),
      ),
appBar: AppBar(
  centerTitle: true,
  backgroundColor: Colors.transparent,
  elevation: 0,

  title: SmartCodeTitle(),

 bottom:PreferredSize(
   preferredSize: Size(100.h,100.w),
   child: Container(
     height: 90.h,width: 1.sw,

   child: Row(
     mainAxisAlignment: MainAxisAlignment.end,
     children: [
       CountryCodePicker(
         initialSelection: 'Eg',
         showOnlyCountryWhenClosed:true ,
         onChanged: (v){
           print(v.code);
           Provider.of<CountryProvider>(context,listen: false).onChanged(v.code);
         },
       )
     ],
   ),
   ),
 ),
),
      body:isConnected==false?
      Center(
        child: Text('No Internet Connection'),
      ):
      Column(
        children: [
          Container(
              height: .20.sh,
              width: 1.sw,
                child: FutureBuilder(
                  future: getNews(),
                  builder:(context,snapShot)=> ListView.builder(
                      physics: BouncingScrollPhysics(),
                    itemCount: categories.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder:(context,index)
                  {
                    return  InkWell(
                        onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)
                      => CategoryScreen(
                          categoryName: categories[index].name,

                      )
                      ));
                    },

                        child: CategoryContainer(categoryModel: categories[index]),


                    );
                  }),
                ),

              ),


          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
                itemCount: article.length,
                itemBuilder:(context,index)
                {
                  return
                  article==null ||article.isEmpty?
                      Center(child: Text('No Data Yet'),)
                    :Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap:(){
                        Navigator.push(context, MaterialPageRoute(builder:
                        (context)=>ArticleScreen(
                          url: article[index].url,
                        )

                        ));
                      } ,
                      child: Container(
                        width: .8.sw,
                        height: .4.sh,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          image: DecorationImage(fit: BoxFit.cover,
                          image: NetworkImage(
                            article[index].imageUrl==null?
                            'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg':
                              article[index].imageUrl,

                          )
                          )
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ) ,
    );
  }
}




