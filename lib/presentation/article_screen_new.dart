import 'package:flutter/material.dart';
class ArticleScreenNew extends StatelessWidget {
  const ArticleScreenNew({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        centerTitle: true,
        title:const  Text("News Article",style: TextStyle(color: Colors.white),),
      ),
      body: PageView.builder(
        itemCount: 5,
          scrollDirection: Axis.vertical,
          itemBuilder: (context,index){
        return SizedBox(
          height: MediaQuery.sizeOf(context).height-60,
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
                          image:const  DecorationImage(
                              image: AssetImage("assets/artical_image.jpg"),fit: BoxFit.fill

                          )
                      ),
                    ),
                    /// Article Card Section
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 30),
                      height: 150,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)
                      ),
                      padding: const EdgeInsets.all(15),
                      child:  Column(
                        children: [
                          const  Text("'Breakthrough in Fusion Energy Brings Clean and LimitLess Power to the World'",style: TextStyle(fontWeight: FontWeight.w900,fontSize: 17),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton.icon(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  label:const  Text("567",style: TextStyle(color: Colors.grey),),
                                  icon:const  Icon(
                                    Icons.thumb_up_alt_outlined,
                                    color:Colors.blue,
                                  )),
                              TextButton.icon(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  label:const  Text("57",style: TextStyle(color: Colors.grey),),
                                  icon:const  Icon(
                                    Icons.share,
                                    color:Colors.blue,
                                  )),
                            ],
                          ),

                        ],
                      ),
                    )
                  ],
                ),
                /// Description section
                Expanded(
                  child: const Padding(
                    padding:  EdgeInsets.all(20),
                    child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",style: TextStyle(color: Colors.white),),
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
      })
    );

  }
}
