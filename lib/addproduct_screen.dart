import 'package:excelledia_project/productandservice_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:im_stepper/stepper.dart';
import 'addprice_screen.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  int activeStep = 0;
  int dotCount = 4;
  double _value = 40.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF313131),
      body: _scaffoldBody(),
    );
  }

  Widget _scaffoldBody() {
    return Center(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.87,
        width: MediaQuery.of(context).size.width * 0.87,
        decoration: const BoxDecoration(
          color: Color(0xFF5C5B5B),
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _closeIcons(),
            _title(),
            const SizedBox(
              height: 20,
            ),
            _stepperDesigns(),
            _productName(),
            _detailsText(),
            _chooseIcon(),
            const Spacer(),
            _nextButton()
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return const Center(
      child: Text(
        "ADD PRODUCT",
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _closeIcons() {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ClipOval(
          child: Material(
            color: Color(0xFF313131),
            child: InkWell(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AddPriceScreen()),
                );
              },
              child: const Icon(
                Icons.close_rounded,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _stepperDesigns() {
    return Center(
      child: DotStepper(
        activeStep: activeStep,
        shape: Shape.pipe,
        spacing: 10,
        dotCount: dotCount,
        dotRadius: 18,
        fixedDotDecoration: const FixedDotDecoration(
          color: Colors.grey,
        ),
        indicatorDecoration: const IndicatorDecoration(
          color: Colors.amber,
        ),
        onDotTapped: (tappedDotIndex) {
          setState(() {
            activeStep = tappedDotIndex;
          });
        },
      ),
    );
  }

  Widget _productName() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "PRODUCT NAME",
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(color: Colors.white),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            cursorColor: Colors.grey,
            style: const TextStyle(fontSize: 15.0, color: Colors.black),
            decoration: InputDecoration(
                hintText: '2 week athletics plan',
                hintStyle: const TextStyle(fontSize: 14.0, color: Colors.grey),
                contentPadding: const EdgeInsets.fromLTRB(12.0, 12.0, 4.0, 4.0),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(width: 1, color: Colors.grey)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(width: 1, color: Colors.grey))),
          )
        ],
      ),
    );
  }

  Widget _detailsText() {
    final maxLines = 5;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "ENTER DETAILS",
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(color: Colors.white),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: maxLines * 24.0,
            child: TextField(
              cursorColor: Colors.grey,
              maxLines: maxLines,
              decoration: InputDecoration(
                  hintText: "Enter text...",
                  hintStyle: const TextStyle(fontSize: 14.0, color: Colors.grey),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                          const BorderSide(width: 1, color: Colors.grey)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(width: 1, color: Colors.grey))),
            ),
          ),
        ],
      ),
    );
  }

  Widget _chooseIcon() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "CHOOSE ICON",
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(color: Colors.white),
          ),
          const SizedBox(
            height: 10,
          ),
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.20,
                width: MediaQuery.of(context).size.width * 0.80,
                decoration: BoxDecoration(
                  color: const Color(0xFF5C5B5B),
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.all(const Radius.circular(12.0)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Draggable(
                      data: ClipOval(
                        child: Material(
                          color: Colors.amber,
                          child: Image.asset(
                            "assets/images/angry-birds.png",
                            height: 25,
                          ),
                        ),
                      ),
                      feedback: ClipOval(
                        child: Material(
                          color: Colors.amber,
                          child: Image.asset(
                            "assets/images/angry-birds.png",
                            height: 25,
                          ),
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: ClipOval(
                                  child: Material(
                                    color: Colors.amber,
                                    child: Image.asset(
                                      "assets/images/angry-birds.png",
                                      height: 25,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: ClipOval(
                                  child: Material(
                                    color: Colors.limeAccent,
                                    child: Image.asset(
                                      "assets/images/boy.png",
                                      height: 25,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: ClipOval(
                                  child: Material(
                                    color: Colors.white,
                                    child: Image.asset(
                                      "assets/images/trophy.png",
                                      height: 25,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: ClipOval(
                                  child: Material(
                                    color: Colors.cyan,
                                    child: Image.asset(
                                      "assets/images/girl.png",
                                      height: 25,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: ClipOval(
                                  child: Material(
                                    color: Colors.grey,
                                    child: Image.asset(
                                      "assets/images/heart.png",
                                      height: 25,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: ClipOval(
                                  child: Material(
                                    color: Colors.lightGreenAccent,
                                    child: Image.asset(
                                      "assets/images/online-shopping.png",
                                      height: 25,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: ClipOval(
                                  child: Material(
                                    color: Colors.purpleAccent,
                                    child: Image.asset(
                                      "assets/images/tiger.png",
                                      height: 25,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: ClipOval(
                                  child: Material(
                                    color: Colors.tealAccent,
                                    child: Image.asset(
                                      "assets/images/fish.png",
                                      height: 25,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: ClipOval(
                                  child: Material(
                                    color: Colors.cyan,
                                    child: Image.asset(
                                      "assets/images/butterfly.png",
                                      height: 25,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                        height: 120,
                        child: const VerticalDivider(
                          color: Colors.amber,
                          thickness: 3,
                        )),
                    DragTarget(onAccept: (data) {
                      setState(() {
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          radius: 48,
                          child: CircleAvatar(
                            radius: 25,
                            backgroundImage:
                            AssetImage("assets/images/angry-birds.png"),
                          ),
                        );
                      });
                    }, builder: (
                      context,
                      _,
                      __,
                    ) {
                      return Stack(
                        children: [
                           CircleAvatar(
                            backgroundColor: Colors.grey,
                            radius: 48,
                            child: CircleAvatar(
                              radius: 25,
                              backgroundImage:
                                  AssetImage("assets/images/angry-birds.png"),
                            ),
                          ),
                        ],
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _nextButton() {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const ProductAndServiceScreen()),
          );
        },
        child: const Text(
          'NEXT',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.amberAccent,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        ),
      ),
    );
  }
}
