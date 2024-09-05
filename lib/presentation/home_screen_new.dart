import 'package:carousel_slider/carousel_slider.dart';
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
    "SHOWS",
    "MOVIES",
    "MY CORNER",
    "DISTROTV",
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
      body: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
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
                const SizedBox(height: 20,),
                CarouselSlider.builder(
                  options: CarouselOptions(
                    autoPlay: true,
                      height: 200.0,
                      viewportFraction: 1
                  ),
                  itemCount: showImageList.length,
                  itemBuilder: (BuildContext context, int index, int realIndex) {
                    return Container(
                      height: 150,
                      width: MediaQuery.of(context).size.width,
                      decoration:  BoxDecoration(
                          color: Colors.white,
                          image: DecorationImage(
                              image: AssetImage(showImageList[index]), fit: BoxFit.fill)),
                      padding:const  EdgeInsets.all(10),

                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("${index+1}/${showImageList.length}",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.white.withOpacity(0.5),
                              child: const Icon(Icons.add,color: Colors.black,),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                )
              ],
            ),
          ),

        ],
      ),
    );
  }
}
