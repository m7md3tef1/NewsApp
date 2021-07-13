import 'dart:convert';
import 'package:appnew/Models/NewsModel.dart';
import 'package:appnew/Provider/countryProvider.dart';
import 'package:http/http.dart'as http;
import 'package:provider/provider.dart';

class ApiHelper
{
 var apikey='ef4651c375f54e17a472a770ff46bc85';
 getNews(context)async{
   List<NewsModel>news=[];
   var response =await http.get(Uri.parse(
    'https://newsapi.org/v2/top-headlines?country=${Provider.of<CountryProvider>(context).code} &apiKey=$apikey'));
   var body=jsonDecode(response.body);
 try{
   if(body["status"]=='ok')
   {
     body["articles"].forEach((article)
     {
       NewsModel newsModel =NewsModel(
           title: article["title"],
           author: article["author"],
           time: article["publishedAt"],
           url: article["url"],
           imageUrl: article["urlToImage"],
           desc: article["description"]
       ) ;
       news.add(newsModel);
     });

   }
   else{
     print('No Data');
   }
 }
 catch(e){
   print(e);
 }
 return news;

 }
 getNewsByCategory(category)async{
   var response=await http.get(Uri.parse('https://newsapi.org/v2/top-headlines?country=Eg=$category&apiKey=$apikey'));
   var body=jsonDecode(response.body);
   List<NewsModel>news=[];
   try{
     if(body["status"]=='ok'){
       body["articles"].forEach((article){
         NewsModel newsModel=NewsModel(
             title: article["title"],
             author: article["author"],
             time: article["publishedAt"],
             url: article["url"],
             imageUrl: article["urlToImage"],
             desc: article["description"]
         );
         news.add(newsModel);
       });
       print(response.body);
     }
     else{
       print('No Data');
     }
   }catch(e){
     print(e);
   }return news;
 }

}