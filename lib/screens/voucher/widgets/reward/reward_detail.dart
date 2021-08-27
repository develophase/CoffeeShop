import 'package:coffee_shop/models/reward.dart';
import 'package:coffee_shop/screens/voucher/widgets/positioned_voucher.dart';
import 'package:coffee_shop/values/color_theme.dart';
import 'package:coffee_shop/values/function.dart';
import 'package:coffee_shop/values/size_config.dart';
import 'package:flutter/material.dart';

class RewardDetail extends StatelessWidget {
  final RewardModel reward;
  RewardDetail({this.reward});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 70.0),
      child: Column(
        children: [
          Container(
            height: SizeConfig.screenHeigh * 0.4,
            child: Stack(clipBehavior: Clip.none, children: <Widget>[
              SizedBox.expand(
                child: Hero(
                    tag: reward.title,
                    child: Image(
                      image: base64StringToImage(reward.image),
                      fit: BoxFit.cover,
                    )),
              ),
              PositionedVoucher(reward: reward)
            ]),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 80.0, 20.0, 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Table(
                  children: [
                    TableRow(children: [
                      Text(
                        'Exchange with',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      Text(
                        'Expried date',
                        style: TextStyle(fontSize: 16.0),
                        textAlign: TextAlign.end,
                      )
                    ]),
                    TableRow(children: [
                      Row(
                        children: [
                          Text(
                            '${reward.point}',
                            style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w700,
                                color: primaryColor),
                          ),
                          SizedBox(width: 3.0),
                          Text(
                            'BEAN',
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ],
                      ),
                      Text(
                        '${formartDate(reward.expiryDate)}',
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.w700),
                        textAlign: TextAlign.end,
                      )
                    ])
                  ],
                ),
                Divider(
                  height: 30.0,
                ),
                Text('Detail Information',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.w600)),
                Text(
                  reward.content,
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
