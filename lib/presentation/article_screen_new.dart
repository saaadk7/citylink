import 'package:flutter/material.dart';

class ArticleScreenNew extends StatelessWidget {
  const ArticleScreenNew({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          centerTitle: true,
          title: const Text(
            "News Article",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: PageView.builder(
            itemCount: 5,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return SizedBox(
                height: MediaQuery.sizeOf(context).height - 60,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          /// Image Section
                          Container(
                            height: 200,
                            margin: const EdgeInsets.only(bottom: 90),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                image: const DecorationImage(
                                    image:
                                        AssetImage("assets/ArticalImage.jpeg"),
                                    fit: BoxFit.fill)),
                          ),

                          /// Article Card Section
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 30),
                            height: 150,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              children: [
                                const Text(
                                  "'Jharange Patil Killed By Farnaves And Gang - Aurangabad'",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w900,
                                      fontSize: 17),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextButton.icon(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        label: const Text(
                                          "567",
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        icon: const Icon(
                                          Icons.thumb_up_alt_outlined,
                                          color: Colors.blue,
                                        )),
                                    TextButton.icon(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        label: const Text(
                                          "57",
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                        icon: const Icon(
                                          Icons.share,
                                          color: Colors.blue,
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),

                      /// Description section
                      const Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Text(
                            "'Manoj Jarange Patil and his supporters have been demanding Maratha community be classified as Kunbis and those who are included in the OBC category implement the Sage Soyare notification.After his 6-hour march to Pune, he also addressed the Maratha community gathered in the Deccan area of Pune city. During his address, Patil said, government tried to terrorise our community from the start of this agitation, which also created confusion among the community that Maratha could not unite; therefore, we are here to show that we are strong and united with the same strength that was seen in Solapur, Satara'",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),

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
                    ],
                  ),
                ),
              );
            }));
  }
}
