import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController notecontroller = TextEditingController();
  double _sliderValuenight = 2.0;
  double _sliderValuemood = 2.0;
  double _sliderValuewater = 0.0;
  String exercise = 'None';
  bool _isChecked = false;
  List<String> labels = ["Horrible", "Bad", "Average", "Good", "Excellent"];
  updatedefaultvalues() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("sliderValuenight", "Your sleep was Average.");
    prefs.setString("sliderValuemood", "Your mood was Average.");
    prefs.setString("sliderValuewater", "Your drink 0.0 cup of water.");
    prefs.setString("exercise", "Your did no exercise.");
    prefs.setString("isChecked", "You didn't do something new.");
    prefs.setString("note", "You noted down.");
  }

  @override
  void initState() {
    updatedefaultvalues();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Daily Wellness'),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Welcome Home.',
                      style: TextStyle(fontSize: 35),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Image.asset(
                      'assets/login.PNG',
                      width: 50,
                      height: 50,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Let's begin with some questions.",
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 5),
                child: Row(
                  children: [
                    Text(
                      "Did you sleep well last night?",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Slider(
                value: _sliderValuenight,
                onChanged: (double value) async {
                  final SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  setState(() {
                    _sliderValuenight = value;
                    prefs.setString("sliderValuenight",
                        "Your sleep was ${labels[_sliderValuenight.toInt()]}.");
                  });
                },
                min: 0.0,
                max: 4.0, // Adjust the max value based on the number of labels
                divisions:
                    4, // Number of divisions (one less than the number of labels)
                label: labels[_sliderValuenight
                    .toInt()], // Display the label for the current value
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 5),
                child: Row(
                  children: [
                    Text(
                      "How was your mood today?",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Slider(
                value: _sliderValuemood,
                onChanged: (double value) async {
                  final SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  setState(() {
                    _sliderValuemood = value;
                    prefs.setString("sliderValuemood",
                        "Your mood was ${labels[_sliderValuemood.toInt()]}.");
                  });
                },
                min: 0.0,
                max: 4.0, // Adjust the max value based on the number of labels
                divisions:
                    4, // Number of divisions (one less than the number of labels)
                label: labels[_sliderValuemood
                    .toInt()], // Display the label for the current value
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 5),
                child: Row(
                  children: [
                    Text(
                      "How much exercise did you do today?",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(80.0, 5, 80, 0),
                  child: DropdownSearch(
                    items: ['None', 'Little', 'Some', 'A lot'],
                    onChanged: (value) async {
                      final SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      setState(() {
                        exercise = value.toString();
                        prefs.setString("exercise",
                            "Your did ${value.toString()} exercise.");
                      });
                    },
                    selectedItem: "${exercise}",
                  )),
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 5),
                child: Row(
                  children: [
                    Text(
                      "How much water did you drink? (cups)",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Row(
                  children: [
                    Text(
                      '0',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Expanded(
                      flex: 9,
                      child: Slider(
                        value: _sliderValuewater,
                        onChanged: (double value) async {
                          final SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          setState(() {
                            _sliderValuewater = value;
                            prefs.setString("sliderValuewater",
                                "Your drink ${value.toString()} cup of water.");
                          });
                        },
                        min: 0.0,
                        max: 8.0, // Set the maximum value to 8
                        divisions:
                            8, // You can choose the number of divisions as needed
                        label:
                            '${_sliderValuewater.round()}', // Display the current value as a label
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: Text(
                          '8',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 5),
                child: Row(
                  children: [
                    Text(
                      "Did you do something new today?",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: _isChecked,
                    onChanged: (newValue) async {
                      final SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      setState(() {
                        _isChecked = newValue!;
                        if (newValue == false) {
                          prefs.setString(
                              "isChecked", "You didn't do something new.");
                        } else {
                          prefs.setString("isChecked", "You do something new.");
                        }
                      });
                    },
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 10,
                    child: Text(
                      "Yes, i did something new.",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 5),
                child: Row(
                  children: [
                    Text(
                      "Personal notes",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: Colors.grey,
                          width: 1,
                        )),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            controller: notecontroller,
                            maxLines: 5,
                            onChanged: (value) async {
                              final SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              prefs.setString("note",
                                  "You noted down: ${value.toString()}");
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'What did you like to say?',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
