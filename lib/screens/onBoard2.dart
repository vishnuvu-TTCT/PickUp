import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../model/content_model.dart';

class OnboardPage extends StatefulWidget {
  const OnboardPage({Key? key}) : super(key: key);

  @override
  _OnboardPageState createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  int currentIndex = 0;
  PageController? _controller;
@override
  void initState() {
    super.initState();
    _controller  = PageController(
      initialPage: 0,
    );
  }
  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size.height;
    print(size);
    return SafeArea(
        child: Scaffold(
          body: PageView.builder(
            physics:new NeverScrollableScrollPhysics(),
        itemCount: contents.length,
        controller: _controller,
        onPageChanged: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        itemBuilder: (_, i) {
          return customCard(i);
        },
      ),
    ));
  }
  Widget customCard(int i){
    return  Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .9,
            padding: const EdgeInsets.only(left: 16),
            child: Image.asset(contents[i].image,),
          ),
          Container(
            height: MediaQuery.of(context).size.height *.35 ,
            color: Colors.white,
            alignment: Alignment.bottomCenter,
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  contents[i].title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      fontFamily: 'Cabin'),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  contents[i].description1,
                  style: TextStyle(
                    fontFamily: "Cabin",
                    fontSize: 18,
                  ),
                ),
                Text(
                  contents[i].description2,
                  style: TextStyle(
                    fontFamily: "Cabin",
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    contents.length,
                        (index) => buildDot(index, context),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    currentIndex > 0
                        ? ElevatedButton(
                      child: Text('<'),
                      style: ElevatedButton.styleFrom(
                        onPrimary: Colors.white,
                        primary: Colors.black,
                        minimumSize: Size(
                            MediaQuery.of(context).size.width * .15,
                            MediaQuery.of(context).size.width * .15),
                      ),
                      onPressed: () {
                        _controller?.previousPage(
                            duration: Duration(microseconds: 300),
                            curve: Curves.bounceIn);
                      },

                    )
                        : Container(),
                    SizedBox(
                      width: 5.0,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _controller?.nextPage(
                          duration: Duration(milliseconds: 10),
                          curve: Curves.easeIn,
                        );
                      },
                      child: Text(
                        currentIndex == contents.length - 1
                            ? "Let's Signup"
                            : 'Next',
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ElevatedButton.styleFrom(
                        onPrimary: Colors.white,
                        primary: Colors.black,
                        // minimumSize: Size(50, 50),
                        minimumSize: currentIndex > 0
                            ? Size(MediaQuery.of(context).size.width * .65,
                            MediaQuery.of(context).size.width * .15)
                            : Size(MediaQuery.of(context).size.width * .80,
                            MediaQuery.of(context).size.width * .15),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )

        ],
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: currentIndex == index ? 25 : 10,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.black,
      ),
    );
  }
}
