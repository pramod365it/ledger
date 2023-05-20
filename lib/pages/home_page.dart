import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:ledger/config/config.dart';
import 'package:ledger/models/models.dart';
import 'package:ledger/widgets/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;
  final CollectionReference _users =
  FirebaseFirestore.instance.collection('users');
  /*  await _users.add({"name":name });
      await _users.update({"name":name });
      await _users.doc(Id).delete();*/
  Future<void> _create([DocumentSnapshot]) async{
    await _users.add({"Name":"test Name added"});
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: CustomAppBar(
          title: 'Udharo Khata',
          height: 0.1 * size.height,
          leadingIcon: Icons.menu,
          trailingIcon: Icons.notifications_outlined,
        ),
      body: Column(
        children: [
          const _EnvironmentalConditions(),
          Expanded(
            //in order to occupy the vertical space of the column with white background
            child: UpperRoundedContainer(
              aboveCornersColor: AppColors.brownBackground,
              color: Colors.white,
              child: Column(
                children: [
                  TextField(
                      decoration: const InputDecoration(
                          hintText: "Search here",
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(20)),
                              borderSide: BorderSide(color: Colors.blue))),
                      onChanged: (value) {}),
                  Expanded(
                    child: StreamBuilder(
                        stream: _users.snapshots(),
                        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                          if (streamSnapshot.hasData) {
                            return ListView.builder(
                              itemCount: streamSnapshot.data!.docs.length,
                              itemBuilder: (context,index){
                                final DocumentSnapshot documentSnapshot =
                                streamSnapshot.data!.docs[index];
                                return Card(
                                  margin: const EdgeInsets.all(10),
                                  child: ListTile(
                                    title:Text(documentSnapshot['Name']),
                                  ),
                                );
                              },
                            );
                          } else if (streamSnapshot.hasError) {
                            return Icon(Icons.error_outline);
                          } else {
                            return CircularProgressIndicator();
                          }
                        }),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        //onPressed: _incrementCounter,
        onPressed: _create,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


class _EnvironmentalConditions extends StatelessWidget {
  const _EnvironmentalConditions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 53,
      margin: const EdgeInsets.only(bottom: 32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          /*
          _WeatherCondition(
              description: 'Lightning', icon: Icons.thunderstorm_outlined),*/
          _TemperatureCondition(
              description: 'Give', value: 1098932, valGreen: false),
          _TemperatureCondition(
              description: 'Receive', value: 253235, valGreen: true),
        ],
      ),
    );
  }
}


class _TemperatureCondition extends StatelessWidget {
  const _TemperatureCondition(
      {Key? key,
        required this.description,
        required this.value,
        required this.valGreen})
      : super(key: key); // coverage:ignore-line

  final String description;
  final int value;
  final bool valGreen;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (valGreen == false)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Rs ',
                style: AppTextStyles.currencyGiveUnit,
              ),
              Text(
                value.toString(),
                style: AppTextStyles.giveValue,
              ),
            ],
          ),
        if (valGreen == true)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Rs ',
                style: AppTextStyles.currencyReceiveUnit,
              ),
              Text(
                value.toString(),
                style: AppTextStyles.receiveValue,
              ),
            ],
          ),
        const Spacer(),
        if (valGreen == true)
          Text(
            description,
            style: AppTextStyles.liabilityGreen,
          ),
        if (valGreen == false)
          Text(
            description,
            style: AppTextStyles.responsibilityRed,
          ),
      ],
    );
  }
}