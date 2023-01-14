import 'package:flutter/material.dart';

import 'data.dart';

class contract extends StatefulWidget {
  contract({Key? key}) : super(key: key);

  @override
  State<contract> createState() => _contractState();
}

class _contractState extends State<contract> {
  List contractdata = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Agreement"),
        // actions: [
        //   IconButton(
        //     color: Colors.white,
        //     onPressed: () {
        //       Navigator.push(
        //         context,
        //         MaterialPageRoute(
        //           builder: (context) => Prof(),
        //         ),
        //       );
        //     },
        //     icon: Icon(Icons.keyboard_backspace),
        //   ),
        // ],
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 5, 24, 40),
      ),
      body: FutureBuilder(
        future: FireStoreDataBase3().getData3(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text("Something went wrong");
          }
          if (snapshot.connectionState == ConnectionState.done) {
            contractdata = snapshot.data;
            return view_contract(contractdata);
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

Widget view_contract(contractdata) => ListView.separated(
    padding: const EdgeInsets.all(8),
    itemCount: [contractdata].length,
    separatorBuilder: (BuildContext context, int index) => const Divider(),
    itemBuilder: (BuildContext context, int index) {
      return Column(
        children: [
          Container(
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 73),
                  child: Column(children: [
                    Container(
                      child: Text(
                        contractdata[0]["client name"].toString() +
                            " agrees to " +
                            contractdata[0]["type of contract"] +
                            " to " +
                            contractdata[0]["other partie"].toString() +
                            " the following item: " +
                            contractdata[0]["type of item"].toString() +
                            "\n \n 1.The date of the sale of the Vehicle     will be  " +
                            contractdata[0]["contract date"].toString() +
                            "\n 2.The total purchase price of the     Vehicle will be   " +
                            contractdata[0]["price"].toString() +
                            "Dolars" +
                            '\n 3.Upon receipt of payment as provided       above, The Seller agrees to provide the following documents to Buyer on the sale date:   ' +
                            "\n •Certificate of Title (including Odometer Disclosure Section), signed by Seller \n •	The current registration for the Vehicle.  " +
                            "\n 4.The Buyer agrees to register the Vehicle in his/her name with the California Department of Motor Vehicles within one week of the date of the sale. " +
                            " \n \n \n Name of client : " +
                            contractdata[0]["client name"].toString() +
                            "  \n \n Other partie : " +
                            contractdata[0]["other partie"].toString() +
                            "",
                        style: TextStyle(
                          color: Color.fromARGB(255, 5, 24, 40),
                          fontWeight: FontWeight.bold,
                          // fontFamily: 'Lobster',

                          fontSize: 20,
                        ),
                      ),
                    )
                  ])))
        ],

        // title: Text(dataList[0]["last-name"].toString()),
        // subtitle: Text(dataList[0]["first-name"].toString()),
        // trailing: Text(dataList[0]["gender"],
        // ),
      );
    });
