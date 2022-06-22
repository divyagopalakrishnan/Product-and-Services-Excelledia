
import 'package:excelledia_project/productandservice_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:im_stepper/stepper.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import 'addproduct_screen.dart';

class AddPriceScreen extends StatefulWidget {
  const AddPriceScreen({Key? key}) : super(key: key);

  @override
  State<AddPriceScreen> createState() => _AddPriceScreenState();
}

class _AddPriceScreenState extends State<AddPriceScreen> {
  int activeStep = 0;
  int dotCount = 4;
  double _value = 40.0;
  RangeValues _currentRangeValues = const RangeValues(80, 120);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF313131),

      body: _scaffoldBody(),
    );
  }
  Widget _scaffoldBody() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.87,
          width: MediaQuery.of(context).size.width * 0.87,
          decoration: const BoxDecoration(
            color: Color(0xFF5C5B5B),
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _closeIcon(),
              _title(),
              const SizedBox(height: 20,),
              _stepperDesign(),
              const SizedBox(height: 20,),
              _priceValue(),
              const Spacer(),
              _ButtonStyle(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _title(){
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Center(
        child: Text("ADD PRICE",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _closeIcon(){
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
                  MaterialPageRoute(builder: (context) => const ProductAndServiceScreen()),
                );
              },
              child: Icon(
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

  Widget _stepperDesign(){
    return DotStepper(
      activeStep: activeStep,
      shape: Shape.pipe,
      spacing: 10,
      dotCount: dotCount,
      dotRadius: 18,
      fixedDotDecoration: FixedDotDecoration(
        color: Colors.grey,
      ),
      indicatorDecoration: IndicatorDecoration(
        color: Colors.amber,
      ),
      onDotTapped: (tappedDotIndex) {
        setState(() {
          activeStep = tappedDotIndex;
        });
      },
    );
  }

  Widget _priceValue(){
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(23.0),
          child: Container(
            height: 250.0,
            width: 300.0,
            decoration: BoxDecoration(
                color: Color(0xFF313131),
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            height: 280,
            child: SfSlider(
              min: 0.0,
              max: 100.0,
              interval: 50,
              showTicks: true,
              showLabels: true,
              showDividers: true,
              shouldAlwaysShowTooltip: true,
              minorTicksPerInterval: 16,
              activeColor: Colors.amber,
              inactiveColor: Colors.grey,
              onChanged: (dynamic value) {
                setState(() {
                  _value = value;
                });
              },
              value: _value,

            ),

          ),
        )

      ],

    );
  }

  Widget _ButtonStyle(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: SizedBox(
            height: 40,
            width: 140,
            child: ElevatedButton(
              onPressed: (){
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const ProductAndServiceScreen()),
                );
              },
              child: const Text('PREVIOUS',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.grey,
              ),
            ),
          ),
        ),
        SizedBox(),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: SizedBox(
            height: 40,
            width: 140,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const AddProduct()),
                );
              },
              child: const Text('NEXT',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.amberAccent,

              ),
            ),
          ),
        ),
      ],
    );
  }
}
