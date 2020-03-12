import 'package:flutter/material.dart';

class project extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
     return new _scafold();
  }

}

class _scafold extends State<project>{
  final TextEditingController t = new TextEditingController();
  int radioValue = 0;
  double _finalAnswer = 0.0;
  String _formatedAnswer = "";
  void handleRadioValueChanged(int value){
    setState(() {
          radioValue = value;
          switch(value){
            case 0:
              _finalAnswer = claculate(t.text, 0.06);
              _formatedAnswer = "your weight on pluto is ${_finalAnswer.toStringAsFixed(1)}";
              break;
              case 1:
              _finalAnswer = claculate(t.text, 0.38);
              _formatedAnswer = "your weight on Mars is ${_finalAnswer.toStringAsFixed(1)}";

              break;
              case 2:
              _finalAnswer = claculate(t.text, 0.91);
              _formatedAnswer = "your weight on venus is ${_finalAnswer.toStringAsFixed(1)}";

              break;
          }

        });

  }
  double claculate (String weight, double multipe){
    if(weight.isNotEmpty){
    return int.parse(weight)*multipe;
    }
    else{
      return 0.0;
    }
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text("Weight on the planet"),
        backgroundColor: Colors.black38,
      ),
      backgroundColor: Colors.blueGrey,
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          padding: const EdgeInsets.all(2.5),
          children: <Widget>[
            new Image.asset('images/planet.png', height: 133.0,width: 200.0,),
            new Container(
              margin: const EdgeInsets.all(3.0),
              child: new Column(
                children: <Widget>[
                  new TextField(
                    keyboardType: TextInputType.number,
                    controller: t,
                    decoration: new InputDecoration(
                      labelText: 'weight on earth',
                      hintText: 'in pounds',
                      icon:new Icon(Icons.person_outline),
                    ),
                  ),
                  new Padding(padding: const EdgeInsets.all(5.0),),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      //kol radio leh alvalue bt3too 3shan a3rf ana mtk 3la a w 3shan
                      //a5tar wa7d bas algroupvalue lazm tb2a zi alvalue fa hia fo2 default b zero
                      //w b3ml setstate w b7ot fe alradiovalue bta3 algroupvalue alkema bta3t alvalue
                      //ale hia 0 aw 1 aw 2 fa hin2a fe wa7d bs algraoupvalue zi alvalue fa wa7d bs ynwr
                      new Radio <int> (value: 0,groupValue: radioValue,onChanged:  handleRadioValueChanged,activeColor: Colors.brown,),
                      new Text("Pluto", style: new TextStyle(color: Colors.white30),),
                      new Radio <int> (value: 1,groupValue: radioValue,onChanged:  handleRadioValueChanged,activeColor: Colors.red,),
                      new Text("Mars", style: new TextStyle(color: Colors.white30),),
                      new Radio <int> (value: 2,groupValue: radioValue,onChanged:  handleRadioValueChanged,activeColor: Colors.orangeAccent,),
                      new Text("Venus", style: new TextStyle(color: Colors.white30),),
                    ],
                  ),
                  new Padding(padding: EdgeInsets.all(5.6),),
                  new Text("$_formatedAnswer",
                  style: new TextStyle(
                    color: Colors.white,
                    fontSize: 19.4,
                    fontWeight: FontWeight.w500,
                  ),)


                  
                ],
              ),
            )

          ],
        ),
      ),
    );
  }

}