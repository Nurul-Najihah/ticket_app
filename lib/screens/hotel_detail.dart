import 'package:flutter/material.dart';
import 'package:ticket_app/styles/app_styles.dart';

import '../utils/all_json.dart';

class HotelDetail extends StatefulWidget {
  const HotelDetail({super.key});

  @override
  State<HotelDetail> createState() => _HotelDetailState();
}

class _HotelDetailState extends State<HotelDetail> {
  late int index = 0;

  @override
  void didChangeDependencies() {
    var args = ModalRoute.of(context)!.settings.arguments as Map;
    print(args["index"]);
    index = args["index"];
    super.didChangeDependencies();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300.0,
            floating: false,
            pinned: true,
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppStyles.primaryColor,
                  ),
                  child: Icon(Icons.arrow_back, color: Colors.white),
                ),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              //title: Text(hotelList[index]["place"]),
              background: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      "assets/images/${hotelList[index]["image"]}",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    right: 20,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      color: Colors.black.withOpacity(0.5),
                      child: Text(
                        hotelList[index]["place"],
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          shadows: [
                            Shadow(
                              blurRadius: 10.0,
                              color: AppStyles.primaryColor,
                              offset: Offset(2.0, 2.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: EdgeInsets.all(16.0),
                child: ExpandedTextWidget(text: hotelList[index]["detail"]),
                /*Text(
              "In this article,we will create a custom scrollable app bar with a background image in Flutter.The app bar will shrink as the user scrolls up, and it will include a back button.Below the image, we will display some descriptive text wit a More or Less button to show or hide additional text.Finally, we will add a section to display recent images in a horizontal list."
                  )*/
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "More Images",
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                height: 200.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: hotelList[index]["images"].length,
                  itemBuilder: (context, imagesIndex) {
                    print("${hotelList[index]["images"][0]}");
                    return Container(
                      margin: EdgeInsets.all(16),
                      color: Colors.red,
                      child: Image.asset(
                        "assets/images/${hotelList[index]["images"][imagesIndex]}",
                      ),
                    );
                  },
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}

class ExpandedTextWidget extends StatefulWidget {
  const ExpandedTextWidget({super.key, required this.text});

  final String text;

  @override
  State<ExpandedTextWidget> createState() => _ExpandedTextWidgetState();
}

class _ExpandedTextWidgetState extends State<ExpandedTextWidget> {
  bool isExpanded = false;

  _toggleExpansion() {
    setState(() {
      isExpanded = !isExpanded;
    });
    print("The value is $isExpanded");
  }

  @override
  Widget build(BuildContext context) {
    var textWidget = Text(
      widget.text,
      maxLines: isExpanded ? null : 3,
      overflow: isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        textWidget,
        GestureDetector(
          onTap: () {
            _toggleExpansion();
          },
          child: Text(
            isExpanded ? 'Less' : 'More',
            style: AppStyles.textStyle.copyWith(color: AppStyles.primaryColor),
          ),
        ),
      ],
    );
  }
}
