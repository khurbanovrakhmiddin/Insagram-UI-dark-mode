import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import '../../model/post_model.dart';
import '../../model/story_model.dart';



class FadePageDark extends StatefulWidget {
  const FadePageDark({Key? key}) : super(key: key);

  @override
  State<FadePageDark> createState() => _FadePageDarkState();
}

class _FadePageDarkState extends State<FadePageDark> {
  final List<Story> _stories = [
    Story("assets/images/user_1.jpeg", "Jazmin"),
    Story("assets/images/user_2.jpeg", "Sylvester"),
    Story("assets/images/user_3.jpeg", "Lavina"),
    Story("assets/images/user_1.jpeg", "Jazmin"),
    Story("assets/images/user_2.jpeg", "Sylvester"),
    Story("assets/images/user_3.jpeg", "Lavina"),
  ];
  final List<Post> _posts = [
    Post(
        userName: "Brianne",
        userImage: "assets/images/user_1.jpeg",
        postImage: "assets/images/feed_3.jpeg",
        caption: "Consequatur nihil aliquid omnis consequatur."),
    Post(
        userName: "Henri",
        userImage: "assets/images/user_2.jpeg",
        postImage: "assets/images/feed_2.jpeg",
        caption: "Consequatur nihil aliquid omnis consequatur."),
    Post(
        userName: "Mariano",
        userImage: "assets/images/user_3.jpeg",
        postImage: "assets/images/feed_1.jpeg",
        caption: "Consequatur nihil aliquid omnis consequatur."),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Divider(),
            //#stories
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Stories",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    "Watch all",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            //#story
            Container(
              color: Colors.black,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(vertical: 10),
              height: 110,
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: _stories.map((stroie) => _itemStory(stroie)).toList(),
              ),
            ),
            //#postList
            Container(
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: _posts.length,
                itemBuilder: (ctx, i) {
                  return _itemOfPost(_posts[i]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _itemStory(Story story) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(70),
            border: Border.all(
              width: 3,
              color: const Color(0xFF8E44AD),
            ),
          ),
          child: Container(
            padding: const EdgeInsets.all(2),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(70),
              child: Image(
                image: AssetImage(story.image),
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(story.name,style: TextStyle(color: Colors.grey),),
      ],
    );
  }

  Widget _itemOfPost(Post post) {
    return Container(
      child: Column(
        children: [
          //#header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: Image(
                        image: AssetImage(post.userImage!),
                        fit: BoxFit.cover,
                        width: 40,
                        height: 40,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(post.userName!,style: TextStyle(color: Colors.grey),),
                  ],
                ),
                IconButton(
                    onPressed: () {}, icon: const Icon(SimpleLineIcons.options,color: Colors.grey,))
              ],
            ),
          ),
          FadeInImage(
            image: AssetImage(post.postImage!),
            placeholder: AssetImage("assets/images/placeholder.png"),
            width: MediaQuery.of(context).size.width,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [Row(children: [
            IconButton(onPressed: (){}, icon: Icon(FontAwesome.heart_o,color: Colors.grey),),
            IconButton(onPressed: (){}, icon: Icon(FontAwesome.comment_o,color: Colors.grey),),
            IconButton(onPressed: (){}, icon: Icon(FontAwesome.send_o,color: Colors.grey,),),
          ],),
            IconButton(onPressed: (){}, icon: Icon(FontAwesome.bookmark_o,color: Colors.grey),),],),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 14),
            child: RichText(
              softWrap: true,
              overflow: TextOverflow.visible,
              text: const TextSpan(children: [
                TextSpan(
                  text: "Liked By ",
                  style: TextStyle(color: Colors.grey),
                ),
                TextSpan(
                  text: "Sigmund,",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                TextSpan(
                  text: " Yessenia,",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                TextSpan(
                  text: " Dayana",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                TextSpan(
                  text: " and",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                TextSpan(
                  text: " 1263 others",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],),
              
            ),
          ),
          //
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 14),
            child: RichText(
              softWrap: true,
              overflow: TextOverflow.visible,
              text: TextSpan(
                children: [

                  TextSpan(text: post.userName! + " ",
                  style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,),),

                  TextSpan(text: '${post.caption} ',
                  style: TextStyle(color: Colors.grey,),),
                ]
              ),
            ),
          ),

          Container(
            margin: EdgeInsets.symmetric(horizontal: 14),
            alignment: Alignment.topLeft,
            child: Text("February 2020",textAlign: TextAlign.start,style: TextStyle(color: Colors.grey),),
          )
        ],
      ),
    );
  }
}
