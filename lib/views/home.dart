// ignore_for_file: use_key_in_widget_constructors, prefer_typing_uninitialized_variables, prefer_const_constructors_in_immutables, avoid_unnecessary_containers, prefer_const_constructors, sized_box_for_whitespace, unused_field

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/helper/data.dart';
import 'package:news_app/helper/news.dart';
import 'package:news_app/model/article_model.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/views/articles_view.dart';
import 'package:news_app/views/category_news.dart';
import 'package:news_app/views/favourite_screen.dart';
import 'package:news_app/views/profile.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = <CategoryModel>[];
  List<ArticleModel> articles = <ArticleModel>[];
  bool _loading = true;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    categories = getCategories();
    getNews();
  }

  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        actions: [
          Opacity(
            opacity: 0,
            child: Container(
              child: Icon(Icons.search),
            ),
          ),
        ],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "Shayan",
              style: TextStyle(color: Colors.black, fontSize: 25),
            ),
            SizedBox(
              width: 2,
            ),
            Text(
              "News App",
              style: TextStyle(color: Colors.red),
            ),
          ],
        ),
        elevation: 0.0,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://www.oyeyeah.com/wp-content/uploads/2019/12/p02y4lwd_620x400.jpg'),
                      fit: BoxFit.fill)),
              child: Text(""),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home()));
              },
              child: ListTile(
                tileColor: Colors.grey[200],
                leading: Icon(
                  Icons.home,
                  size: 30,
                ),
                title: Text(
                  "Home",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Profile()));
              },
              child: ListTile(
                tileColor: Colors.grey[200],
                leading: Icon(
                  Icons.person_sharp,
                  size: 30,
                ),
                title: Text(
                  "Profile",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Favourite()));
              },
              child: ListTile(
                tileColor: Colors.grey[200],
                leading: Icon(
                  Icons.favorite,
                  size: 30,
                ),
                title: Text(
                  "Favourite",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListTile(
              tileColor: Colors.grey[200],
              leading: Icon(
                Icons.settings,
                size: 30,
              ),
              title: Text(
                "Settings",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
      body: _loading
          ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  children: [
                    //Categories
                    Container(
                      height: 70,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: categories.length,
                          itemBuilder: (context, index) {
                            return CategoryTile(
                              imageUrl: categories[index].imageUrl,
                              categoryName: categories[index].categoryName,
                            );
                          }),
                    ),
                    //Blogs
                    Container(
                      padding: EdgeInsets.only(top: 16),
                      child: ListView.builder(
                          physics: ClampingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: articles.length,
                          itemBuilder: (context, index) {
                            return BlogTile(
                              imageUrl: articles[index].urlToImage,
                              title: articles[index].title,
                              description: articles[index].description,
                              url: articles[index].url,
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final String imageUrl, categoryName;
  CategoryTile({required this.imageUrl, required this.categoryName});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    CategoryNews(category: categoryName.toLowerCase())));
      },
      child: Container(
        margin: EdgeInsets.only(right: 10),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                height: 60,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 60,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.black26,
              ),
              child: Text(
                categoryName,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BlogTile extends StatelessWidget {
  final String imageUrl, title, description, url;
  BlogTile(
      {required this.imageUrl,
      required this.title,
      required this.description,
      required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ArticleView(
                      blogUrl: url,
                    )));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: Image.network(
                imageUrl,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              title,
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.black87,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              description,
              style: TextStyle(color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }
}
