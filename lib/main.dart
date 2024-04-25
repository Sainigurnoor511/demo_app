import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MaterialApp(
        title: "Horoscope App",
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const DateTogglePage(),
      ),
    );
  }
}

class DateTogglePage extends StatefulWidget {
  const DateTogglePage({Key? key}) : super(key: key);

  @override
  _DateTogglePageState createState() => _DateTogglePageState();
}

class _DateTogglePageState extends State<DateTogglePage> {
  int _selectedIndex = 1; // Default to 'Today'

  final List<String> _content = [
    "Apr 23, 2024 - Carve out a few moments for quiet introspection and meditation this morning, Scorpion, as the moon takes its final steps through Libra and your solar twelfth house. You won't have much privacy once Luna migrates into your sign, putting your attention in high demand. Though you'll be eager to connect, be mindful to check in with your mood when Luna and Pluto square off this afternoon. Too much socializing could lead to agitation, and it may be necessary to take a breather in the name of personal nurturing. Reconnect with your goals for the next six months when the Scorpio full moon rises this evening.",

    "Apr 24, 2024 - You'll feel unstoppable as the moon continues its journey through your sign, sweet Scorpion, propelling you forward on a wave of high vibrations after yesterday's illuminating full moon. Now is the time to barrel toward the future, though it'll be important to let go of the unnecessary along the way. You'll be reminded that you can't be responsible for other people when Luna blows a kiss to Saturn, asking you to get serious about personal goals and creative passions. Meanwhile, Mercury retrograde connects with the Nodes of Fate, pushing you to recommit to healthy habits that may have fallen to the wayside recently.",

    "Apr 25, 2024 - Love may strike in odd ways this morning, dear Scorpio, as the moon faces off with Jupiter and Uranus. Lean into the spirit of this cosmic climate by spreading joy and offering small gifts or gestures to loved ones as a statement of appreciation. You'll sense a shift when Mercury stations direct, helping you reclaim personal organization. If you've struggled to stay on task since this retrograde began on April 1, you can expect things to move more smoothly from this point forward. Chase your creative visions when Mars and Neptune stir this afternoon, basking in any attention it gains you. Your manifestation skills increase this evening once Luna enters Sagittarius."
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Horoscope App")),
      ),
      body: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height * 0.6,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 223, 174, 174),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 20),
              const Text(
                "Scorpio",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const Divider(
                color: Colors.black,
                thickness: 1,
                height: 30,
                indent: 20,
                endIndent: 20,
              ),
              ToggleButtons(
                borderRadius: BorderRadius.circular(10),
                isSelected: List.generate(3, (index) => _selectedIndex == index),
                onPressed: _onItemTapped,
                children: const <Widget>[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text("Yesterday", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text("Today", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),) // Change font size here
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text("Tomorrow", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Text(
                    _content[_selectedIndex],
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
