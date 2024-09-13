import 'package:flutter/material.dart';

class VideoPlayerScreenNew extends StatefulWidget {
  const VideoPlayerScreenNew({super.key});

  @override
  State<VideoPlayerScreenNew> createState() => _VideoPlayerScreenNewState();
}

class _VideoPlayerScreenNewState extends State<VideoPlayerScreenNew> {
  bool showOptions = false;
  void optionsTimer() {
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        showOptions = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Video Player Section
              Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        showOptions = true;
                      });
                      optionsTimer();
                    },
                    child: SizedBox(
                      height: 250,
                      child: Image.asset(
                        "assets/show1.jpeg",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  /// Video Player Option Section
                  Positioned.fill(
                    child: showOptions
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: const Icon(
                                        Icons.arrow_back,
                                        color: Colors.white,
                                      )),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.more_vert,
                                        color: Colors.white,
                                      ))
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.replay_10,
                                        color: Colors.white,
                                        size: 40,
                                      )),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.play_arrow,
                                        color: Colors.white,
                                        size: 50,
                                      )),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.forward_10,
                                        color: Colors.white,
                                        size: 40,
                                      ))
                                ],
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  children: [
                                    const Expanded(
                                      child: Row(
                                        children: [
                                          Text(
                                            "01:20",
                                            style: TextStyle(color: Colors.white),
                                          ),
                                          Expanded(
                                              child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: LinearProgressIndicator(
                                              color: Colors.blueAccent,
                                              value: 0.2,
                                              backgroundColor: Colors.white54,
                                            ),
                                          )),
                                          Text(
                                            "03:00",
                                            style: TextStyle(color: Colors.white),
                                          )
                                        ],
                                      ),
                                    ),
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.branding_watermark_outlined,
                                          color: Colors.white,
                                          size: 30,
                                        )),
                                    IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.crop,
                                          color: Colors.white,
                                          size: 30,
                                        ))
                                  ],
                                ),
                              )
                            ],
                          )
                        : const SizedBox(),
                  )
                ],
              ),
              /// Video Detail Section
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ExpansionTile(

                      title: Text(
                        "Marvel's The Avenger",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      tilePadding: EdgeInsets.zero,
                      iconColor: Colors.white,
                      collapsedIconColor: Colors.white,
                      children: [
                        Text(
                          "Earth's mightiest heroes must come together and learn to fight as a team if they are going to stop the mischievous Loki and his alien army from enslaving humanity.",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal,
                              fontSize: 16),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    /// Options Section
                    Row(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Column(
                              children: [
                                Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                Text(
                                  "My List",
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            )),
                        const SizedBox(
                          width: 20,
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Column(
                              children: [
                                Icon(
                                  Icons.download,
                                  color: Colors.white,
                                  size: 25,
                                ),
                                Text(
                                  "Download",
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            )),
                        const SizedBox(
                          width: 20,
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Column(
                              children: [
                                Icon(
                                  Icons.share,
                                  color: Colors.white,
                                  size: 25,
                                ),
                                Text(
                                  "Share",
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            )),
                      ],
                    ),
                    /// Join Whatsapp Section
                    Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        height: 40,
                        width: double.infinity,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: const Color(0xff052659).withOpacity(0.5),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: const Row(
                          children: [
                            Icon(
                              Icons.share,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              "Join Whatsapp channel for updates",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        )),
                    /// Recommended Section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const  Text("Recommended",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
                        IconButton(onPressed: (){}, icon:const  Icon(Icons.arrow_forward_ios_rounded,color: Colors.white,))
                      ],
                    ),
                    const  SizedBox(height: 10,),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          for (int i = 0; i < 6; i++) ...[
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
          
                                  });
                                },
                                child: Container(
                                  height: 160,
                                  width: 120,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image:const  DecorationImage(
                                          image: AssetImage("assets/poster.jpeg"),fit: BoxFit.fill
                                      )
                                  ),
          
                                ),
                              ),
                            )
                          ]
                        ],
                      ),
                    ),
                   const  SizedBox(height: 20,),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          for (int i = 0; i < 6; i++) ...[
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
          
                                  });
                                },
                                child: Container(
                                  height: 160,
                                  width: 120,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image:const  DecorationImage(
                                          image: AssetImage("assets/poster.jpeg"),fit: BoxFit.fill
                                      )
                                  ),
          
                                ),
                              ),
                            )
                          ]
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10,),
              /// Ad Section
              Container(
                height: 50,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                        image: AssetImage("assets/ad.jpg"),
                        fit: BoxFit.fill)),
              ),
              const SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }
}
