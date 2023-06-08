import 'package:case_study/detailPage.dart';
import 'package:case_study/widgets/bottomNavigationbar.dart';
import 'package:case_study/widgets/sideBar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Case Study',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();
  List usernameList = [
    "Emily Johnson",
    "Michael Davis",
    "Sophia Wilson",
    "Ethan Thompson",
    "Olivia Martinez"
  ];
  List priceList = ["\$42.0", "\$55.0", "\$60.0", "\$40.0", "\$35.0"];
  List locationList = [
    "Paris, France",
    "New York City, USA",
    "Tokyo, Japan",
    "Sydney, Australia",
    "Rio de Janeiro, Brazil",
  ];
  List imageList = [
    "assets/77.jpg",
    "assets/nature-beauty-reflected-tranquil-outdoor-scene-generative-ai.jpg",
    "assets/Ekran Resmi 2023-06-08 01.31.43.png",
    "assets/mountain-landscape-lake-highlands-generative-ai.jpg",
    "assets/Scene-24.jpg",
  ];
  List aboutList = [
    "Known as the "
        "City of Love,"
        " Paris is renowned for its romantic atmosphere, iconic landmarks like the Eiffel Tower, charming streets lined with cafes, and world-class art and culture.",
    "Often referred to as the "
        "Big Apple,"
        " New York City is a bustling metropolis famous for its towering skyscrapers, vibrant Times Square, diverse culinary scene, and renowned cultural institutions such as Broadway and the Metropolitan Museum of Art.",
    "okyo, the capital of Japan, is a captivating blend of traditional and modern elements. From futuristic technology and bustling city streets to serene gardens, historic temples, and mouthwatering cuisine, Tokyo offers a unique cultural experience.",
    "Sydney captivates visitors with its stunning harbor, including the iconic Sydney Opera House and Harbour Bridge. This vibrant city offers beautiful beaches, a lively arts and entertainment scene, and a laid-back atmosphere that embodies the Australian way of life.",
    "Rio de Janeiro, nestled between mountains and the Atlantic Ocean, is famous for its breathtaking landscapes, including the iconic Christ the Redeemer statue atop Corcovado Mountain. Known for its vibrant Carnival celebrations, Copacabana Beach, and samba music, Rio exudes a lively and energetic spirit."
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          drawer: SideBar(),
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.black),
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: CircleAvatar(
                    radius: 18, child: Image.asset("assets/man.png")),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text("Hi Alen!",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                const Text(
                  "Let's Explore the Big World Around Us!",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextField(
                  controller: _searchController,
                  style: const TextStyle(color: Colors.black),
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    hintText: 'Search...',
                    hintStyle: const TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 3, color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onChanged: (value) {},
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return cardWidget(
                          usernameList[index],
                          priceList[index],
                          locationList[index],
                          imageList[index],
                          aboutList[index]);
                    },
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: const BottomNavBar()),
    );
  }

  Widget cardWidget(String username, String price, String location,
      String image, String about) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return DetailPage(
              username: username,
              price: price,
              location: location,
              image: image,
              about: about,
            );
          }));
        },
        child: Card(
          clipBehavior: Clip.antiAlias,
          color: Colors.white,
          margin: EdgeInsets.zero,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: const BorderSide(color: Colors.grey),
          ),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 16, 16, 16),
              child: Stack(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: AspectRatio(
                        aspectRatio: 16 / 12,
                        child: Image.asset(
                          image,
                          fit: BoxFit.cover,
                        ),
                      )),
                  Positioned(
                      left: 1,
                      bottom: 1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                          width: 110,
                          color: Colors.white,
                          child: Stack(
                            children: <Widget>[
                              CircleAvatar(
                                  radius: 18,
                                  child: Image.asset("assets/man.png")),
                              Positioned(
                                left: 22.0,
                                child: CircleAvatar(
                                    radius: 18,
                                    child: Image.asset("assets/woman.png")),
                              ),
                              Positioned(
                                left: 44.0,
                                child: CircleAvatar(
                                    radius: 18,
                                    child:
                                        Image.asset("assets/businessman.png")),
                              ),
                              const Positioned(
                                right: 10.0,
                                top: 10,
                                child: Text(
                                  "+5",
                                  style: TextStyle(color: Colors.blue),
                                ),
                              )
                            ],
                          ),
                        ),
                      ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 32, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        username,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w800),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: Colors.grey,
                          ),
                          Text(
                            location,
                            style: const TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                    ],
                  ),
                  Text(
                    price,
                    style: const TextStyle(
                        color: Colors.blue,
                        fontSize: 20,
                        fontWeight: FontWeight.w800),
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
