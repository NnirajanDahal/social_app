import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_app/helpers/base64Convert.dart';
import 'package:social_app/helpers/post_helper.dart';
import 'package:social_app/helpers/post_likes_helper.dart';
import 'package:social_app/helpers/user_helper.dart';
import 'package:social_app/models/post_model.dart';
import 'package:social_app/screens/auth/login_screen.dart';
import 'package:social_app/screens/mainscreen/pages/add_post_screen.dart';

class NewsFeedScreen extends StatefulWidget {
  const NewsFeedScreen({super.key});

  @override
  State<NewsFeedScreen> createState() => _NewsFeedScreenState();
}

class _NewsFeedScreenState extends State<NewsFeedScreen> {
  bool likeButtonPressed = false;
  String retrievedUserId = "";
  List<PostModel> posts = [];
  retrievePosts() async {
    final retrievedPosts = await PostManager.getPosts();
    final retrievedUser = await SharedPreferencesUserHelper.getUserModel();
    retrievedUserId = retrievedUser!.userId;

    log(retrievedUser.userId);
    setState(() {
      posts = retrievedPosts;
    });
  }

  deletePost(int index) async {
    final List<PostModel> existingPosts = await PostManager.getPosts();
    if (index >= 0 && index < existingPosts.length) {
      existingPosts.removeAt(index);
      await PostManager.savePosts(existingPosts);
      setState(() {
        posts = existingPosts;
      });
    }
  }

  handleLogout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('loggedIn', false);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  int totalLikes = 0;
  void incrementLikes() {
    totalLikes++;
  }

  void decrementLike() {
    totalLikes--;
  }

  @override
  void initState() {
    retrievePosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          "feedbook",
          style: TextStyle(
              color: Colors.blue, fontSize: 30, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add,
              size: 40,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              size: 35,
            ),
          ),
          IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Logout'),
                    content: Text('Are you sure want to logout?.'),
                    actions: <Widget>[
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('No')),
                      TextButton(
                        onPressed: () {
                          handleLogout();
                        },
                        child: Text('Yes'),
                      ),
                    ],
                  ),
                );
              },
              icon: Icon(Icons.logout, size: 30)),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Divider(),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: ClipOval(
                    child: Image.network(
                      "https://imgs.search.brave.com/jH07hakOqODDY4DUpMCriStNajqSddPFdNYUEd5VjmA/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9pbWFn/ZXMudW5zcGxhc2gu/Y29tL3Bob3RvLTE1/MzQzNTE0NTAxODEt/ZWE5Zjc4NDI3ZmU4/P2l4bGliPXJiLTQu/MC4zJml4aWQ9TTN3/eE1qQTNmREI4TUh4/elpXRnlZMmg4TVRK/OGZHUnZaM044Wlc1/OE1IeDhNSHg4ZkRB/PSZ3PTEwMDAmcT04/MA.jpeg",
                      height: 50,
                      width: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => AddPostPage(
                                  likes: totalLikes,
                                )));
                  },
                  child: Expanded(
                      child: Container(
                    height: 40,
                    width: 275,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: const Center(
                        child: Row(
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          "What's on your mind?",
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    )),
                  )),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddPostPage()));
                    },
                    icon: const Icon(
                      Icons.photo,
                      color: Colors.green,
                    ))
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              thickness: 10,
            ),
            SizedBox(
              height: 150,
              child: Expanded(
                child: Row(
                  children: [
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                        padding: const EdgeInsets.all(5),
                        height: 150,
                        width: 90,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Column(
                              children: [
                                Image.network(
                                  "https://imgs.search.brave.com/jH07hakOqODDY4DUpMCriStNajqSddPFdNYUEd5VjmA/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9pbWFn/ZXMudW5zcGxhc2gu/Y29tL3Bob3RvLTE1/MzQzNTE0NTAxODEt/ZWE5Zjc4NDI3ZmU4/P2l4bGliPXJiLTQu/MC4zJml4aWQ9TTN3/eE1qQTNmREI4TUh4/elpXRnlZMmg4TVRK/OGZHUnZaM044Wlc1/OE1IeDhNSHg4ZkRB/PSZ3PTEwMDAmcT04/MA.jpeg",
                                  height: 50,
                                  fit: BoxFit.cover,
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(Icons.add)),
                                const Text("Create"),
                                const Text("story")
                              ],
                            ),
                          ],
                        )),
                    const SizedBox(
                      width: 2,
                    ),
                    Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: posts.length,
                        itemBuilder: (context, index) {
                          return posts[index].image != null
                              ? Container(
                                  height: 200,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 2),
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.white.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: const Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  width: 100,
                                  child: Image.memory(
                                    base64Decode(
                                      posts[index].image ??
                                          base64Image.imageString,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : SizedBox();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(
              thickness: 10,
            ),
            SizedBox(
              height: 600,
              child: Expanded(
                child: ListView.builder(
                  // reverse: true,
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    return retrievedUserId != posts[index].postId
                        ? SizedBox()
                        :
                        // posts[index].image == null &&
                        //         posts[index].postContent == null
                        //     ? SizedBox()
                        //     :
                        Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 7),
                            child: Column(
                              children: [
                                Container(
                                  // height: 550,
                                  decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 241, 239, 239),
                                    // borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color.fromARGB(
                                                255, 182, 178, 178)
                                            .withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: const Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              ClipOval(
                                                child: Image.memory(
                                                  base64Decode(
                                                    posts[index].image ??
                                                        base64Image.imageString,
                                                  ),
                                                  height: 50,
                                                  width: 50,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    posts[index]
                                                        .postDate
                                                        .toString(),
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 10),
                                                  ),
                                                  const Row(
                                                    children: [
                                                      Text("3d "),
                                                      Icon(
                                                        Icons.public,
                                                        size: 15,
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                          // const SizedBox(
                                          //   width: 82,
                                          // ),
                                          Row(
                                            children: [
                                              IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                    Icons.more_horiz),
                                              ),
                                              IconButton(
                                                  onPressed: () {
                                                    showDialog(
                                                      context: context,
                                                      builder: (context) =>
                                                          AlertDialog(
                                                        title: Text('ALERT!'),
                                                        content: Text(
                                                            'Sure want to delete?'),
                                                        actions: <Widget>[
                                                          TextButton(
                                                            onPressed: () =>
                                                                Navigator.pop(
                                                                    context),
                                                            child: Text('No'),
                                                          ),
                                                          TextButton(
                                                            onPressed: () {
                                                              deletePost(index);
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: Text('Yes'),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                  icon: const Icon(Icons.clear))
                                            ],
                                          )
                                        ],
                                      ),
                                      posts[index].postContent != null
                                          ? Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 2),
                                              child: Text(
                                                  posts[index].postContent ??
                                                      ""),
                                            )
                                          : SizedBox(),
                                      posts[index].postId != null
                                          ? Text(posts[index].postId.toString())
                                          : SizedBox(),
                                      posts[index].image != null
                                          ? Center(
                                              child: Image.memory(
                                                base64Decode(
                                                  posts[index].image ??
                                                      base64Image.imageString,
                                                ),
                                                height: 300,
                                                width: double.infinity,
                                                fit: BoxFit.cover,
                                              ),
                                            )
                                          : SizedBox(),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              const Icon(
                                                Icons.thumb_up_sharp,
                                                color: Colors.blue,
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              // posts[index].likes != null
                                              // ?
                                              Text(
                                                totalLikes.toString(),
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                              // : Text("0"),
                                            ],
                                          ),
                                          // const SizedBox(
                                          //   width: 220,
                                          // ),
                                          const Text("comments")
                                        ],
                                      ),
                                      const Divider(),
                                      Row(
                                        // mainAxisAlignment:
                                        //     MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Row(
                                              children: [
                                                // likeButtonPressed?
                                                IconButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        likeButtonPressed =
                                                            likeButtonPressed
                                                                ? false
                                                                : true;
                                                      });
                                                      if (likeButtonPressed ==
                                                          true) {
                                                        setState(() {
                                                          incrementLikes();
                                                        });
                                                      } else {
                                                        setState(() {
                                                          decrementLike();
                                                        });
                                                      }
                                                      // PostLikesHelper()
                                                      //     .incrementLike;
                                                    },
                                                    icon: Icon(
                                                      Icons.thumb_up_alt_sharp,
                                                      color: likeButtonPressed
                                                          ? Colors.blue
                                                          : Colors.black,
                                                    )),
                                                Text("Like"),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Row(
                                              children: [
                                                IconButton(
                                                    onPressed: () {},
                                                    icon: const Icon(
                                                        Icons.comment)),
                                                const Text("Comment"),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Row(
                                              children: [
                                                IconButton(
                                                    onPressed: () {},
                                                    icon: const Icon(
                                                        Icons.messenger)),
                                                const Text("Message")
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      const Divider(),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
