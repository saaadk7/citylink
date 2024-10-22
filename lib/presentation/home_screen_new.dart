import 'package:carousel_slider/carousel_slider.dart';
import 'package:citylink/presentation/video_player_screen_new.dart';
import 'package:flutter/material.dart';

class HomeScreenNew extends StatefulWidget {
  const HomeScreenNew({super.key});

  @override
  State<HomeScreenNew> createState() => _HomeScreenNewState();
}

class _HomeScreenNewState extends State<HomeScreenNew> {
  /// List Of Heading titles
  List<String> headingList = [
    "HOME",
    "NEWS",
    "EVENTS",
    "SHOWS",
    "MY CORNER",
    "SAVED"
  ];

  /// Variable to handle heading selection
  int selectedHeading = 0;

  /// List Of showImage
  List<String> showImageList = [
    "assets/show1.jpeg",
    "assets/show2.jpg",
    "assets/show3.jpg",
    "assets/show4.jpg"
  ];
  List<SimpleItem> optionList = [
    SimpleItem(title: "My Corner", icon: Icons.grid_view),
    SimpleItem(title: "My List", icon: Icons.arrow_downward),
    SimpleItem(title: "Hot Topics", icon: Icons.play_circle),
    SimpleItem(title: "Govt Schemes", icon: Icons.verified),
    SimpleItem(title: "Watch Now", icon: Icons.hourglass_top),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        /// Logo
        leading: Image.asset("assets/logo.png"),

        /// Title
        title: const Text(
          "CityLink",
          style: TextStyle(color: Colors.white),
        ),

        /// Action
        actions: [
          /// Search
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Theme.of(context).appBarTheme.foregroundColor,
              )),

          /// Notification
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications_none,
                color: Theme.of(context).appBarTheme.foregroundColor,
              )),
          const SizedBox(
            width: 10,
          ),

          /// Profile Icon
          const CircleAvatar(
            radius: 15,
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: ListView(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,

            /// heading  Section
            child: Row(
              children: [
                for (int i = 0; i < headingList.length; i++) ...[
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedHeading = i;
                          });
                        },
                        child: Column(
                          children: [
                            i == 0
                                ? Icon(
                                    Icons.home_filled,
                                    color: Theme.of(context)
                                        .appBarTheme
                                        .foregroundColor,
                                    size: selectedHeading == 0 ? 25 : 20,
                                  )
                                : Text(
                                    headingList[i],
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .appBarTheme
                                            .foregroundColor,
                                        fontSize: 15,
                                        fontWeight: selectedHeading == i
                                            ? FontWeight.w900
                                            : FontWeight.normal),
                                  ),
                            selectedHeading == i
                                ? Container(
                                    margin: const EdgeInsets.only(top: 5),
                                    height: 3,
                                    width: 30,
                                    decoration: const BoxDecoration(
                                        color: Colors.white),
                                  )
                                : const SizedBox(),
                          ],
                        )),
                  )
                ]
              ],
            ),
          ),

          /// Ad  Section
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                          image: AssetImage("assets/ad.jpg"),
                          fit: BoxFit.fill)),
                ),
                const SizedBox(
                  height: 20,
                ),

                /// Top Video Slider  Section
                CarouselSlider.builder(
                  options: CarouselOptions(
                      autoPlay: true, height: 200.0, viewportFraction: 1),
                  itemCount: showImageList.length,
                  itemBuilder:
                      (BuildContext context, int index, int realIndex) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const VideoPlayerScreenNew()));
                      },
                      child: Container(
                        height: 150,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            image: DecorationImage(
                                image: AssetImage(showImageList[index]),
                                fit: BoxFit.fill)),
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "${index + 1}/${showImageList.length}",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: CircleAvatar(
                                radius: 15,
                                backgroundColor: Colors.white.withOpacity(0.5),
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ),

          /// ShotCut  Buttons  Section
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (int i = 0; i < optionList.length; i++) ...[
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: GestureDetector(
                        onTap: () {
                          setState(() {});
                        },
                        child: Column(
                          children: [
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xff052659).withOpacity(0.5),
                              ),
                              child: Icon(
                                optionList[i].icon,
                                color: const Color(0xffC1E8FF),
                                size: 30,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              optionList[i].title,
                              style: const TextStyle(color: Colors.blueGrey),
                            )
                          ],
                        )),
                  )
                ]
              ],
            ),
          ),

          /// Our Shows  Section

          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Our Show",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.white,
                    ))
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (int i = 0; i < optionList.length; i++) ...[
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {});
                      },
                      child: Container(
                        height: 160,
                        width: 120,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: const DecorationImage(
                                image: AssetImage("assets/poster.jpeg"),
                                fit: BoxFit.fill)),
                      ),
                    ),
                  )
                ]
              ],
            ),
          ),

          /// Our Shows  Section

          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Contest",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.white,
                    ))
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (int i = 0; i < optionList.length; i++) ...[
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {});
                      },
                      child: Container(
                        height: 160,
                        width: 120,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: const DecorationImage(
                                image: AssetImage("assets/poster.jpeg"),
                                fit: BoxFit.fill)),
                      ),
                    ),
                  )
                ]
              ],
            ),
          ),
          const SizedBox(
            height: 100,
          )
        ],
      ),
    );
  }
}

class SimpleItem {
  final String title;
  final IconData icon;
  SimpleItem({required this.title, required this.icon});
}
