import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ui_for_online_shopping/pages/drawer.dart';

void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Product"),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.search)),
        ],
        ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.redAccent,
        showUnselectedLabels: true,
        backgroundColor: Colors.white70,
        onTap: (index){

        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
            label: "Home"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
            label: "Card",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.category),
            label: "Category"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile"
          ),
        ],

      ),
      
      drawer: myDrawer(context),
      body: ListView(
        children: [
          CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 16 / 9,
              autoPlay: true,
            ),
            items: [1,2,3,4,5].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: const BoxDecoration(
                          color: Colors.amber
                      ),
                      child: Text('text $i', style: const TextStyle(fontSize: 16.0),)
                  );
                },
              );
            }).toList(),
          ),

          // horizontalProductSlider(),
          horizontalProductSlider(),
        ],
      ),

    );
  }
  Widget horizontalProductSlider(){
      return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("data"),
                  TextButton(
                      onPressed: (){},
                      child: const Text("Most Like")),

                ],
              ),
            )
          ],
      );
  }
}


