import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_app/functions/functions.dart';
import 'package:social_app/screens/mainscreen/pages/add_post_screen.dart';

import '../../../network_images/network_image.dart';

class NewsFeedScreen extends StatefulWidget {
  const NewsFeedScreen({super.key});

  @override
  State<NewsFeedScreen> createState() => _NewsFeedScreenState();
}

class _NewsFeedScreenState extends State<NewsFeedScreen> {
  bool likeButtonPressed = false;

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
            onPressed: () {},
            icon: const Icon(
              Icons.messenger_outline_rounded,
              size: 30,
            ),
          ),
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
                            builder: (context) => const AddPostPage()));
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
                    onPressed: () {},
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
                        itemCount: stories.length,
                        itemBuilder: (context, index) {
                          return Container(
                              height: 200,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 5),
                              margin: const EdgeInsets.symmetric(horizontal: 2),
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
                              child: Image.network(
                                stories[index],
                                fit: BoxFit.cover,
                              ));
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
                  itemCount: stories.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 7),
                      child: Container(
                        height: 550,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 241, 239, 239),
                          // borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(255, 182, 178, 178)
                                  .withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    ClipOval(
                                      child: Image.network(
                                        feeds[index],
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
                                          randomNames[index],
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
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
                                      icon: const Icon(Icons.more_horiz),
                                    ),
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.clear))
                                  ],
                                )
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 2),
                              child: Text(caption[index]),
                            ),
                            Image.network(
                              feeds[index],
                              height: 350,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    Text(
                                      likesCount.toString(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
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
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  children: [
                                    likeButtonPressed
                                        ? IconButton(
                                            onPressed: () {
                                              setState(() {
                                                likeButtonPressed = true;
                                              });
                                            },
                                            icon: const Icon(
                                              Icons.thumb_up_alt_sharp,
                                              color: Colors.blue,
                                            ))
                                        : IconButton(
                                            onPressed: () {
                                              setState(() {
                                                likeButtonPressed = false;
                                              });
                                            },
                                            icon: const Icon(
                                              Icons.thumb_up_alt_sharp,
                                            )),
                                    const Text("Like"),
                                  ],
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.comment)),
                                    const Text("Comment"),
                                  ],
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.messenger)),
                                    const Text("Message")
                                  ],
                                )
                              ],
                            ),
                            const Divider()
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
