import 'package:doen/core/models/intro.dart';
import 'package:doen/theme/Pallete.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class IntroSlider extends StatefulWidget {
  List<Intro> datas;
  double height;

  IntroSlider({
    Key key,
    @required this.datas,
    this.height = 300.0,
  }) : super(key: key);

  @override
  _IntroSliderState createState() => _IntroSliderState();
}

class _IntroSliderState extends State<IntroSlider> {
  PageController _pageController;
  int activePage = 0;

  _animateSlider() {
    Future.delayed(Duration(seconds: 2)).then((value) {
      int nextPage = _pageController.page.round() + 1;
      if (nextPage == widget.datas.length) {
        nextPage = 0;
      }
      _pageController
          .animateToPage(nextPage,
              duration: Duration(seconds: 1), curve: Curves.easeInOut)
          .then(
            (value) => _animateSlider(),
          );
    });
  }

  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0,
    );
    WidgetsBinding.instance
        .addPostFrameCallback((timeStamp) => _animateSlider());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 52.0,
        ),
        SizedBox(
          height: widget.height,
          child: Stack(
            children: [
              PageView.builder(
                controller: _pageController,
                itemCount: widget.datas.length,
                onPageChanged: (page) {
                  setState(() {
                    this.activePage = page;
                  });
                },
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: widget.height - 150.0,
                        width: MediaQuery.of(context).size.width - 60.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                widget.datas[index].illustrationUrl),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 48.0,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        child: Text(
                          widget.datas[index].title,
                          style: Pallete.title,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.datas
                .asMap()
                .map((i, data) => MapEntry(
                      i,
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 2.0),
                        height: 10.0,
                        width: 10.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color:
                              i == activePage ? Pallete.primary : Pallete.white,
                        ),
                      ),
                    ))
                .values
                .toList(),
          ),
        ),
      ],
    );
  }
}
