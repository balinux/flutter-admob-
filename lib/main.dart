import 'package:flutter/material.dart';
import 'package:firebase_admob/firebase_admob.dart';

const String testDevice = 'YOUR_DEVICE_ID';
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static const MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
    testDevices: testDevice != null ? <String>[testDevice] : null,
    keywords: <String>['code', 'game'],
    // contentUrl: 'http://foo.com/bar.html',
    childDirected: true,
    nonPersonalizedAds: true,
  );

  int coin = 0;
  RewardedVideoAd videoAd = RewardedVideoAd.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseAdMob.instance.initialize(appId: FirebaseAdMob.testAppId);

    // videoAd.listener = (RewardedVideoAdEvent event, {String rewardType, int rewardAmount}){
    //   print("rewarded video open ${event}");
    // };
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Vue.net'),
        ),
        body: Container(
          child: Center(
            child: RaisedButton(
              onPressed: () {
                videoAd.load(adUnitId: RewardedVideoAd.testAdUnitId);
              },
              child: Text('load Rewarded ads'),
            ),
            
          ),
        ),
      ),
    );
  }
}
