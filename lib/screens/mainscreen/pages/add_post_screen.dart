import 'package:flutter/material.dart';

class AddPostPage extends StatefulWidget {
  const AddPostPage({super.key});

  @override
  State<AddPostPage> createState() => _AddPostPageState();
}

class _AddPostPageState extends State<AddPostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
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
                    onPressed: () {},
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
              maxLines: 10,
              decoration: const InputDecoration(
                  hintText: "What's on your mind?",
                  hintStyle: TextStyle(fontSize: 25)),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {},
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
    );
  }
}
