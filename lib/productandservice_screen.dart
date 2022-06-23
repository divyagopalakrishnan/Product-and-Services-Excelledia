

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'addprice_screen.dart';

class ProductAndServiceScreen extends StatefulWidget {
  const ProductAndServiceScreen({Key? key,}) : super(key: key);

  @override
  State<ProductAndServiceScreen> createState() =>
      _ProductAndServiceScreenState();
}

class _ProductAndServiceScreenState extends State<ProductAndServiceScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF313131),
      appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {},
          ),
          backgroundColor: const Color(0xFF313131),
          centerTitle: true,
          title: const Text("PRODUCTS & SERVICES")),
      body: _scaffoldBody(),
    );
  }

  Widget _scaffoldBody() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 46.0),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.82,
          width: MediaQuery.of(context).size.width * 0.87,
          decoration: const BoxDecoration(
            color: Color(0xFF5C5B5B),
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _tabBarDesign(),
              const SizedBox(height: 120,),
              _circleWithProduct(),
              const SizedBox(height: 40,),
              _title(),
              const SizedBox(height: 15,),
              _subtitle(),
                const Spacer(),
              _addNowButton(),

            ],
          ),
        ),
      ),
    );
  }


  Widget _circleWithProduct(){
    return Center(
      child: Stack(
        children: [
          DottedBorder(
            dashPattern: const [10, 10],
            strokeWidth: 2,
            strokeCap: StrokeCap.round,
            color: const Color(0xFF959595),
            borderType: BorderType.Circle,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: DottedBorder(
                    dashPattern: const [10, 10],
                    strokeWidth: 2,
                    strokeCap: StrokeCap.round,
                    color: const Color(0xFF959595),
                    borderType: BorderType.Circle,
                    child: const CircleAvatar(
                      backgroundColor: Color(0xFF313131),
                      radius: 85,
                      backgroundImage: AssetImage("assets/images/picture.jpg"),
                    ),
                  ),
                ),
              ],

            ),
          ),
        ],


      ),
    );

  }

  Widget _tabBarDesign(){
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0),topRight: Radius.circular(20.0)),
      ),
      height: 50,
      child: Row(
        children: [
          InkWell(
            onTap: (){
              setState(() {
                _selectedIndex = 0;
              });
            },
            child: Container(
              decoration:  BoxDecoration(
                border: _selectedIndex == 0 ? Border.all(
                    color: Colors.amberAccent,
                    width: 2
                ) : null,
                color: _selectedIndex == 0 ? Colors.black : const Color(0xFF959595),
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(20.0)),
              ),
              width: MediaQuery.of(context).size.width * 0.42,
              height: MediaQuery.of(context).size.height * 0.42,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.shopping_bag,
                    color: Colors.amberAccent,
                    size: 14,
                  ),
                  Text(" PRODUCT",
                    style: TextStyle(
                        color: Colors.amberAccent,
                        fontWeight: FontWeight.bold
                    ),
                  )
                ],
              ),
            ),
          ),

          InkWell(
            onTap: (){
              setState(() {
                _selectedIndex = 1;
              });
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.45,
              height: MediaQuery.of(context).size.height * 0.42,
              decoration:  BoxDecoration(
                border: _selectedIndex == 1 ?Border.all(
                    color: Colors.amberAccent,
                    width: 2):null,
                color: _selectedIndex == 1 ?  Colors.black : const Color(0xFF959595),
                borderRadius: const BorderRadius.only(topRight: Radius.circular(20.0)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.admin_panel_settings,
                    color: Colors.white,
                    size: 14,
                  ),
                  Text(" SERVICE",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _title(){
    return Center(
      child: Text("ADD YOUR PRODUCT",
        style: Theme.of(context).textTheme.headline6!.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22
        ),
      ),
    );
  }

  Widget _subtitle(){
    return Column(
      children: [
        Text(
          'You can upload programs for your clients',
          style: Theme.of(context).textTheme.headline6!.copyWith(
            color: Colors.white60,
            fontSize: 10,
          ),
        ),
        Text(
          'as well as other products here',
          style: Theme.of(context).textTheme.headline6!.copyWith(
            color: Colors.white60,
            fontSize: 10,
          ),
        ),
      ],
    );
  }

  Widget _addNowButton(){
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const AddPriceScreen()),
          );
        },
        child: const Text(
          'ADD NOW',
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