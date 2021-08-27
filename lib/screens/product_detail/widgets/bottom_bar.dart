import 'package:coffee_shop/values/color_theme.dart';
import 'package:coffee_shop/values/function.dart';
import 'package:coffee_shop/values/size_config.dart';
import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  final double price;
  final Function buttonPress;
  final String buttonText;

  BottomBar({@required this.price, @required this.buttonPress,@required this.buttonText});
  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          height: SizeConfig.screenHeigh * 0.085,
          decoration: BoxDecoration(
              color: darkColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 6,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total:',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        convertVND(price),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        width: 20.0,
                      )
                    ]),
              ),
              Expanded(
                flex: 4,
                child: ElevatedButton(
                    onPressed: buttonPress,
                    style: ElevatedButton.styleFrom(
                        elevation: 0, primary: primaryLightColor),
                    child: Text(
                      buttonText,
                      style: TextStyle(
                          color: darkColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 16.0),
                    )),
              ),
            ],
          ),
        ));
  }
}
