// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:level_up_extra/model/posts_model.dart';
import 'package:level_up_extra/services/api_request.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<PostsModel> posts = [];
  var apiResponse = ApiRequest();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Api Request | Raro Academy',
          style: TextStyle(color: Colors.black87),
        ),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(
          Icons.web,
          color: Colors.black87,
        ),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: posts
            .map(
              (post) => Card(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 80.0,
                          width: MediaQuery.of(context).size.width * 0.5,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                (post.thumbnailUrl.toString()),
                              ),
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 4.0,
                          right: 60.0,
                          child: CircleAvatar(
                            radius: 36.0,
                            child: Text(
                              (post.id).toString(),
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            backgroundColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        (post.title).toString(),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic),
                      ),
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          posts = await apiResponse.fetchData(posts);
          setState(() {});
        },
        child: const Icon(
          Icons.refresh,
        ),
        backgroundColor: Colors.black87,
      ),
    );
  }
}
