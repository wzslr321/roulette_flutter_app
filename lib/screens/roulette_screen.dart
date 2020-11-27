import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math';

import '../widgets/roulette_item.dart';
import '../models/default_text_class.dart';
import '../providers/available_money.dart';

class RouletteScreen extends StatefulWidget {
  RouletteScreen({Key key}) : super(key:key);
  static const routeName = '/roulette';

  @override
  _RouletteScreenState createState() => _RouletteScreenState();
}
enum possibleBets{
  Black,
  Red,
}

class _RouletteScreenState extends State<RouletteScreen>
    with TickerProviderStateMixin {
  Animation _animation;
  AnimationController _animationController;


  bool didWin;
  bool didEnd;
  bool didStart = false;
  bool isRedOnTween;
  possibleBets userBet;
  String moneyInvested;

  void _roll(Money moneyProvider) {
    tweenEnd = 0;
    didStart = true;
    isRedOnTween = null;
    didWin = null;
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
      value: 0.1,
      lowerBound: 0.0,
      upperBound: 1.0,
    );
    _animationController.addListener(() {
      if (_animationController.isCompleted) {
        _animationController.forward();
        setState(() {
          String _convertedTween = tweenEnd.toString();
          int.parse(_convertedTween[3]) < 5
              ? isRedOnTween = true
              : isRedOnTween = false;
         (((isRedOnTween == true) && (userBet == possibleBets.Red)) || ((isRedOnTween == false) && (userBet == possibleBets.Black))) == true ? didWin = true : didWin = false;
         int convertedMoney = int.parse(moneyInvested);
         if(didWin) {
           convertedMoney *= 2;
           moneyProvider.addMoney(convertedMoney);
           convertedMoney = 0;
           moneyInvested = convertedMoney.toString();
         } else {
           convertedMoney = 0;
           moneyInvested = convertedMoney.toString();
         }
        });
      } else {
        _animationController.isDismissed
            ? _animationController.forward()
            : setState(() {});
      }
    });

    _animationController.forward();
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this);
  }

  @override
  dispose() {
    super.dispose();
    _animationController.dispose();
  }

  void betRed() {
    setState(() {
      userBet = possibleBets.Red;
    });
  }
  void betBlack() {
    setState(() {
      userBet = possibleBets.Black;
    });
  }

  void investMoney(val,Money userMoney) {
    setState(() {
      moneyInvested = val;
      int convMoney = int.parse(val);
      userMoney.removeMoney(convMoney);
    });
  }


  double tweenEnd = 0;

  @override
  Widget build(BuildContext context) {
    Money userMoney = Provider.of<Money>(context);

    final _formKey = GlobalKey<FormState>();

    MediaQueryData queryData = MediaQuery.of(context);

    if (tweenEnd == 0) {
      tweenEnd = new Random().nextInt(100) / 10 + 20;
    }
    _animation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeInOut);
    _animation = Tween(begin: -1.0, end: tweenEnd).animate(_animation);

    print(moneyInvested);

    return Container(
      width: queryData.size.width,
      height: queryData.size.height,
      child: Center(
          child: SingleChildScrollView(
            child: Column(
        children: <Widget>[
            RotationTransition(
              turns: _animation,
              child: Container(
                  width: queryData.size.width * 0.5,
                  height: queryData.size.height * 0.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.00),
                  ),
                  child: Row(
                    children: <Widget>[
                      RouletteItem(
                        'X2',
                        Colors.black,
                        BorderRadius.only(
                            topLeft: Radius.circular(100),
                            bottomLeft: Radius.circular(100)),
                      ),
                      RouletteItem(
                        'X2',
                        Colors.red,
                        BorderRadius.only(
                            topRight: Radius.circular(100),
                            bottomRight: Radius.circular(100)),
                      ),
                    ],
                  )),
            ),
            Container(
              color: Colors.green,
              child: DefaultTextWidget(
                textContent: didWin == null
                    ? didStart
                        ? 'You...'
                        : 'Try your chances!'
                    : didWin
                        ? 'You won!'
                        : 'You lost'
              ),
            ),
            InkWell(
              onTap:() {
                betBlack(); _roll(userMoney);
              },
              child:DefaultTextWidget(
                textContent:'Bet on black',
              ),
            ),
            InkWell(
              onTap:() {
                betRed(); _roll(userMoney);
              },
              child:DefaultTextWidget(
                textContent:'Bet on red',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom:0.0),
              child: Form(
                key:_formKey,
                child: Column(
                  children:<Widget> [
                    TextFormField(
                      decoration: const InputDecoration(
                          hintText: 'How much do you want to bet?'
                      ),
                      validator: (value) {
                        if(value.isEmpty){
                          return 'Please enter money amount first';
                        }
                        investMoney(value,userMoney);
                        return 'You just invested $value\$. You can now bet it!';
                      },
                    ),
                    ElevatedButton(
                      onPressed: (){
                        if(_formKey.currentState.validate()){
                          investMoney(moneyInvested,userMoney);
                        }
                      },
                      child: Text("Submit"),
                    )
                  ],
                ),
              ),
            ),
            Container(
              child: DefaultTextWidget(
                textContent: moneyInvested == null ? 'Your money deposit is empty' : 'You have $moneyInvested\$ in deposit'
              ),
            ),
            Container(
              child:DefaultTextWidget(
                textContent: 'You have ${userMoney.quantity}\$ total',
              )
            )

            // Transform(
            //   alignment: FractionalOffset(0.5,0.0),
            //   transform: Matrix4.rotationZ(_animation.value),
            //   child: Container(
            //     child:Text("!!!!!!!"),
            //   ),
            // )
        ],
      ),
          )),
    );
  }
}
