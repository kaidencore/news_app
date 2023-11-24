import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/show_category.dart';
import 'package:news_app/pages/article_view.dart';
import 'package:news_app/services/show_category_news.dart';

class CategoryNews extends StatefulWidget {
  String name;
  CategoryNews({required this.name});

  @override
  State<CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  List<ShowCategoryModel> categories = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    getNews();
  }

  getNews() async {
    ShowCategoryNews showCategoryNews = ShowCategoryNews();
    await showCategoryNews.getCategoriesNews(widget.name.toLowerCase());
    categories = showCategoryNews.categories;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.name,
            style: TextStyle(
                fontFamily: 'Lora',
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Color(0xFF001747),
          elevation: 0.0,
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 10.0),
          child: ListView.builder(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return ShowCategory(
                    desc: categories[index].description!,
                    image: categories[index].urlToImage!,
                    title: categories[index].title!,
                    url: categories[index].url!,
                );
              }),
        ));
  }
}

class ShowCategory extends StatelessWidget {
  String image, desc, title, url;
  ShowCategory({required this.image, required this.desc, required this.title, required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> ArticleView(blogUrl: url)));
    },
      child: Container(
          child: Column(
        children: [
          SizedBox(height: 5.0,),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
                imageUrl: image,
                width: MediaQuery.of(context).size.width,
                height: 200,
                fit: BoxFit.cover),
          ),
          SizedBox(height: 5.0,),
          Text(title, maxLines: 2, style: TextStyle(color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.bold)),
          Text(desc, maxLines: 3, style: TextStyle(color: Colors.black, fontSize: 14.0)),
          SizedBox(height: 20.0,),
        ],
      )),
    );
  }
}
