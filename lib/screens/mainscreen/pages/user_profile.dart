import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  // final TextEditingController _searchController = TextEditingController();
  XFile? pickCoverImage;
  XFile? pickProfileImage;

  _pickCoverImage(ImageSource imageSource) async {
    final ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: imageSource);
    if (image != null) {
      setState(() {
        pickCoverImage = XFile(image.path);
      });
    }

    Navigator.pop(context);
  }

  _pickProfileImage(ImageSource imageSource) async {
    final ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: imageSource);
    if (image != null) {
      setState(() {
        pickProfileImage = XFile(image.path);
      });
    }

    Navigator.pop(context);
  }

  _handleCoverImage() async {
    showModalBottomSheet(
      context: context,
      builder: ((context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              onTap: () {
                _pickCoverImage(ImageSource.camera);
              },
              title: const Text("Camera "),
            ),
            ListTile(
              onTap: () {
                _pickCoverImage(ImageSource.gallery);
              },
              title: const Text("Gallery "),
            ),
          ],
        );
      }),
    );
  }

  _handleProfileImage() async {
    showModalBottomSheet(
      context: context,
      builder: ((context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              onTap: () {
                _pickProfileImage(ImageSource.camera);
              },
              title: const Text("Camera "),
            ),
            ListTile(
              onTap: () {
                _pickProfileImage(ImageSource.gallery);
              },
              title: const Text("Gallery "),
            ),
          ],
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 225,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),

                  //Cover Image
                  child: pickCoverImage != null
                      ? Image.file(
                          File(pickCoverImage!.path),
                          fit: BoxFit.cover,
                        )
                      : const Center(child: Text("No Image")),
                ),
                Positioned(
                  top: 125,
                  left: MediaQuery.of(context).size.width / 2 - 185,
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 5),
                    ),
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                      child: pickProfileImage != null
                          ? CircleAvatar(
                              radius: 50,

                              //Profile Image
                              backgroundImage: FileImage(
                                File(pickProfileImage!.path),
                              ))
                          : const Center(child: Text("No image")),
                    ),
                  ),
                ),
                Positioned(
                  top: 200,
                  left: 340,
                  child: IconButton(

                      //Select Cover Image
                      onPressed: () {
                        _handleCoverImage();
                      },
                      icon: Container(
                        height: 30,
                        width: 30,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        child: const Icon(
                          Icons.photo_camera,
                          size: 25,
                        ),
                      )),
                ),
                Positioned(
                  top: 200,
                  left: 185,
                  child: IconButton(

                      //Select Cover Image
                      onPressed: () {
                        _handleProfileImage();
                      },
                      icon: Container(
                        height: 30,
                        width: 30,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        child: const Icon(
                          Icons.photo_camera,
                          size: 25,
                        ),
                      )),
                ),
              ],
            ),
            const SizedBox(
              height: 130,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Text(
                        "Your Name",
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MaterialButton(
                        color: Colors.blue,
                        onPressed: () {},
                        child: const Row(
                          children: [
                            Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "Add to story",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      MaterialButton(
                        color: const Color.fromARGB(255, 231, 226, 226),
                        onPressed: () {},
                        child: const Row(
                          children: [
                            Icon(Icons.edit),
                            SizedBox(
                              width: 5,
                            ),
                            Text("Edit profile")
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      MaterialButton(
                        minWidth: 5,
                        color: const Color.fromARGB(255, 231, 226, 226),
                        onPressed: () {},
                        child: const Icon(Icons.more_horiz),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Basic Info",
                        style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Gender",
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const Text("2023-10-05"),
                      IconButton(onPressed: () {}, icon: const Icon(Icons.edit))
                    ],
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "DOB",
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const Text("2023-10-05"),
                      IconButton(onPressed: () {}, icon: const Icon(Icons.edit))
                    ],
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Marital Status",
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const Text("Unmarried"),
                      IconButton(onPressed: () {}, icon: const Icon(Icons.edit))
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Work Experiences",
                        style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.bold),
                      ),
                      IconButton(onPressed: () {}, icon: const Icon(Icons.add))
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Skills",
                        style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.bold),
                      ),
                      IconButton(onPressed: () {}, icon: const Icon(Icons.add))
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Hobbies",
                        style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.bold),
                      ),
                      IconButton(onPressed: () {}, icon: const Icon(Icons.add))
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "languages",
                        style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.bold),
                      ),
                      IconButton(onPressed: () {}, icon: const Icon(Icons.add))
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Education",
                        style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.bold),
                      ),
                      IconButton(onPressed: () {}, icon: const Icon(Icons.add))
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Contact Info",
                        style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.bold),
                      ),
                      IconButton(onPressed: () {}, icon: const Icon(Icons.add))
                    ],
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Mobile No",
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      const Text("9804079737"),
                      IconButton(onPressed: () {}, icon: const Icon(Icons.edit))
                    ],
                  ),
                  const Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Social Media links",
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text("Links"),
                      // IconButton(onPressed: () {}, icon: const Icon(Icons.edit))
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
