import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),
      ),
      body: Container(
        child: ListView(
          children: [
             Card(
              child: Padding(
                padding: const EdgeInsets.all(1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      flex: 8,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.all(1),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("jldkjfs",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                      )),
                                  Padding(
                                    padding: const EdgeInsets.all(1),
                                    child: GFAvatar(
                                      //radius: 100,
                                      minRadius: 200,
                                      maxRadius: 200,
                                      //borderRadius: 2,
                                      shape: GFAvatarShape.standard,
                                      //size: GFSize.LARGE,
                                      backgroundColor: Colors.transparent,
                                      child: Image.asset("name"),
                                    ),
                                  ),

                                  // ReadMoreText(
                                  //     e["description"],
                                  //
                                  //     trimLines: 1,
                                  //     trimMode: TrimMode.Line,
                                  //     style: const TextStyle(color: Colors.black),
                                  //     colorClickableText: Colors.blue,
                                  //     trimCollapsedText: '...Read more',
                                  //     trimExpandedText: ' Less'
                                  // ),
                                  // Padding(
                                  //  padding: const EdgeInsets.all(20),
                                  //   child: Text(
                                  //     " Price ${e["price"].toString() == "null" ? "0" : e["price"].toString()}",
                                  //     style: const TextStyle(
                                  //       fontWeight: FontWeight.bold,
                                  //       fontSize: 20,
                                  //      // ${e["productRate"].toString(),maxLines: 1,overflow: TextOverflow.ellipsis},
                                  //     ),
                                  //   ),
                                  //
                                  // ),
                                  Text(
                                    "hdklgfjsfdkasl",
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      // ${e["productRate"].toString(),maxLines: 1,overflow: TextOverflow.ellipsis},
                                    ),
                                  ),
                                  const Text("Rating",style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    // ${e["productRate"].toString(),maxLines: 1,overflow: TextOverflow.ellipsis},
                                  ),
                                  ),
                                  Text("kdflhaksd",maxLines: 1,overflow: TextOverflow.ellipsis,style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    // ${e["productRate"].toString(),maxLines: 1,overflow: TextOverflow.ellipsis},
                                  )
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Expanded(
                    //   flex: 1,
                    //   child: Text(
                    //     " Price ${e["price"].toString() == "null" ? "0" : e["price"].toString()}",
                    //     style: const TextStyle(
                    //       fontWeight: FontWeight.bold,
                    //       fontSize: 20,
                    //     ),
                    //   ),
                    // ),
                    // Text(e["productRate"].toString(),maxLines: 1,overflow: TextOverflow.ellipsis,),
                  ],
                ),
              ),
            ),
          ])

        ),
        );


  }
}
