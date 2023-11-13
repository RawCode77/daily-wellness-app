import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SummaryScreen extends StatefulWidget {
  const SummaryScreen({Key? key}) : super(key: key);

  @override
  State<SummaryScreen> createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {
  String sliderValuenight = '';
  String sliderValuemood = '';
  String sliderValuewater = '';
  String exercise = '';
  String isChecked = '';
  String note = '';
  getvalues() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      sliderValuenight = prefs.getString("sliderValuenight").toString();
      sliderValuemood = prefs.getString("sliderValuemood").toString();
      sliderValuewater = prefs.getString("sliderValuewater").toString();
      exercise = prefs.getString("exercise").toString();
      isChecked = prefs.getString("isChecked").toString();
      note = prefs.getString("note").toString();
    });
  }

  @override
  void initState() {
    getvalues();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Summary'),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        child: Image.asset(
                          'assets/login.PNG',
                          width: 40,
                          height: 40,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 7,
                      child: Text(
                        "${sliderValuenight}",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        child: Image.asset(
                          'assets/login.PNG',
                          width: 40,
                          height: 40,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 7,
                      child: Text(
                        "${sliderValuemood}",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        child: Image.asset(
                          'assets/login.PNG',
                          width: 40,
                          height: 40,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 7,
                      child: Text(
                        "${exercise}",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        child: Image.asset(
                          'assets/login.PNG',
                          width: 40,
                          height: 40,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 7,
                      child: Text(
                        "${sliderValuewater}",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        child: Image.asset(
                          'assets/login.PNG',
                          width: 40,
                          height: 40,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 7,
                      child: Text(
                        "${isChecked}",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        child: Image.asset(
                          'assets/login.PNG',
                          width: 40,
                          height: 40,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 7,
                      child: Text(
                        "${note}",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
