import 'package:corona_test/main.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  bool opa = false;
  bool detail = false;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2)).then((value) async {
      setState(() {
        opa = true;
      });
      await Future.delayed(Duration(seconds: 2));
      setState(() {
        detail = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(38, 1, 110, 1),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Spacer(),
          Text(
            "შენ ხარ",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.yellow, fontSize: 30),
          ),
          Expanded(flex: 5, child: Image.asset('assets/virus.gif')),
          AnimatedOpacity(
            opacity: opa ? 1 : 0,
            duration: Duration(milliseconds: 500),
            child: Text(
              "იდიოტი",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.yellow, fontSize: 50),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          AnimatedOpacity(
            opacity: detail ? 1 : 0,
            duration: Duration(milliseconds: 500),
            child: Column(
              children: <Widget>[
                Text(
                  "ენა აღარ აუსვა იდიოტო",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.yellow,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Material(
                  borderRadius: BorderRadius.circular(25),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(25),
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (_) => MyHomePage()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40.0, vertical: 20),
                      child: Text("თავიდან",
                          style: TextStyle(color: Colors.white, fontSize: 25)),
                    ),
                  ),
                  color: Colors.blue,
                  // padding: EdgeInsets.all(30),
                  // minWidth: 150,
                )
              ],
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
