import 'package:flutter/material.dart';
import 'package:social_app/widgets/widgets.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final TextEditingController _searchController = TextEditingController();
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
            // const SizedBox(
            //   height: 50,
            // ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 20),
            //   child: textField(
            //       prefixicon: const Icon(Icons.search),
            //       hinttext: "Search",
            //       controller: _searchController,
            //       borDer: const OutlineInputBorder(
            //           borderRadius: BorderRadius.all(Radius.circular(50)))),
            // ),
            // const SizedBox(
            //   height: 5,
            // ),
            // const Divider(),
            // const SizedBox(
            //   height: 1,
            // ),
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
                        offset: const Offset(
                            0, 3), // changes the position of the shadow
                      ),
                    ],
                  ),
                  child: Image.network(
                    "https://imgs.search.brave.com/Ysr9JoSKvDfi9oGY-bGj2jKwZl_Lo3oG3MZUqZebkeM/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9pbWFn/ZXMudW5zcGxhc2gu/Y29tL3Bob3RvLTE2/NDE2NjM1NzM0MTUt/ZjYyMTFhOWIwMDQ3/P2l4bGliPXJiLTQu/MC4zJml4aWQ9TTN3/eE1qQTNmREI4TUh4/elpXRnlZMmg4T1h4/OFpHOW5KVEl3Y0ds/amRIVnlaWHhsYm53/d2ZId3dmSHg4TUE9/PSZ3PTEwMDAmcT04/MA.jpeg",
                    height: double.infinity,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
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
                      child: const CircleAvatar(
                        // backgroundColor: Colors.blue,
                        radius: 50,
                        backgroundImage: NetworkImage(
                            "https://imgs.search.brave.com/jH07hakOqODDY4DUpMCriStNajqSddPFdNYUEd5VjmA/rs:fit:500:0:0/g:ce/aHR0cHM6Ly9pbWFn/ZXMudW5zcGxhc2gu/Y29tL3Bob3RvLTE1/MzQzNTE0NTAxODEt/ZWE5Zjc4NDI3ZmU4/P2l4bGliPXJiLTQu/MC4zJml4aWQ9TTN3/eE1qQTNmREI4TUh4/elpXRnlZMmg4TVRK/OGZHUnZaM044Wlc1/OE1IeDhNSHg4ZkRB/PSZ3PTEwMDAmcT04/MA.jpeg"),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 200,
                  left: 340,
                  child: InkWell(
                    onTap: () {},
                    child: IconButton(
                        onPressed: () {},
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
                ),
                Positioned(
                  top: 265,
                  left: 160,
                  child: InkWell(
                    onTap: () {},
                    child: IconButton(
                        onPressed: () {},
                        icon: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: const Color.fromARGB(255, 218, 210, 210)),
                          child: Icon(
                            Icons.photo_camera,
                            size: 25,
                          ),
                        )),
                  ),
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
