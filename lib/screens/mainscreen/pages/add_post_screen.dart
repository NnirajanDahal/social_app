import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_app/helpers/post_helper.dart';
import 'package:social_app/models/post_model.dart';
import 'package:social_app/screens/mainscreen/pages/news_feed_screen.dart';

class AddPostPage extends StatefulWidget {
  const AddPostPage({super.key});

  @override
  State<AddPostPage> createState() => _AddPostPageState();
}

class _AddPostPageState extends State<AddPostPage> {
  final TextEditingController _feedController = TextEditingController();
  XFile? demoImage;
  String? pickedImage;
  _pickImage(ImageSource imageSource) async {
    final ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: imageSource);
    if (image != null) {
      List<int> imageBytes = await image.readAsBytes();
      String base64Image = base64Encode(imageBytes);

      pickedImage = base64Image;
      setState(() {
        demoImage = image;
      });
    }

    Navigator.pop(context);
  }

  _handleImage() async {
    showModalBottomSheet(
      context: context,
      builder: ((context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              onTap: () {
                _pickImage(ImageSource.camera);
              },
              title: const Text("Camera "),
            ),
            ListTile(
              onTap: () {
                _pickImage(ImageSource.gallery);
              },
              title: const Text("Gallery "),
            ),
          ],
        );
      }),
    );
  }

  addPost() async {
    DateTime date = DateTime.now();
    String enteredContent = _feedController.text;

    final post = PostModel(
        postContent: enteredContent, postDate: date, image: pickedImage);
    final List<PostModel> existingPosts = await PostManager.getPosts();
    existingPosts.add(post);
    await PostManager.savePosts(existingPosts);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => NewsFeedScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_back_ios)),
                      const Text(
                        "Create post",
                        style: TextStyle(fontSize: 25),
                      ),
                    ],
                  ),
                  ElevatedButton(
                      onPressed: () {
                        addPost();
                      },
                      child: const Text(
                        "POST",
                        style: TextStyle(fontSize: 17),
                      )),
                ],
              ),
              const Divider(),
              Row(
                children: [
                  ClipOval(
                    child: Image.network(
                      "https://imgs.search.brave.com/jH07hakOqODDY4DUpMCriStNajqSddPFdNYUEd5VjmA/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9pbWFn/ZXMudW5zcGxhc2gu/Y29tL3Bob3RvLTE1/MzQzNTE0NTAxODEt/ZWE5Zjc4NDI3ZmU4/P2l4bGliPXJiLTQu/MC4zJml4aWQ9TTN3/eE1qQTNmREI4TUh4/elpXRnlZMmg4TVRK/OGZHUnZaM044Wlc1/OE1IeDhNSHg4ZkRB/PSZ3PTEwMDAmcT04/MA.jpeg",
                      height: 50,
                      width: 50,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    "Ethan Anderson",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _feedController,
                maxLines: 10,
                decoration: const InputDecoration(
                    hintText: "What's on your mind?",
                    hintStyle: TextStyle(fontSize: 25)),
              ),
              const SizedBox(
                height: 10,
              ),
              demoImage != null
                  ? Container(
                      height: 200,
                      width: double.infinity,
                      child: pickedImage != null
                          ? Image.file(File(demoImage!.path))
                          : Center(
                              child: Text("Upload image"),
                            ))
                  : SizedBox(),
              InkWell(
                onTap: () {
                  _handleImage();
                },
                child: const Row(
                  children: [
                    Icon(
                      Icons.photo,
                      size: 35,
                      color: Colors.green,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Photo/Video",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
              ),
              const Divider()
            ],
          ),
        ),
      ),
    );
  }
}
