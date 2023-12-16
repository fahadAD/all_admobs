import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
class RewardedADS_Page extends StatefulWidget {
  const RewardedADS_Page({super.key});

  @override
  State<RewardedADS_Page> createState() => _RewardedADS_PageState();
}

class _RewardedADS_PageState extends State<RewardedADS_Page> {
  RewardedAd? _rewardedAd;

   final adUnitId ="ca-app-pub-3940256099942544/5224354917";


  void loadRewardedAd() {
    RewardedAd.load(
        adUnitId: adUnitId,
        request: const AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
            onAdLoaded: (ad) {
              _rewardedAd = ad;

ad.fullScreenContentCallback = FullScreenContentCallback(
                // Called when the ad showed the full screen content.
                  onAdShowedFullScreenContent: (ad) {},
                  // Called when an impression occurs on the ad.
                  onAdImpression: (ad) {},
                  // Called when the ad failed to show full screen content.
                  onAdFailedToShowFullScreenContent: (ad, err) {
                    // Dispose the ad here to free resources.
                    ad.dispose();
                  },
                  // Called when the ad dismissed full screen content.
                  onAdDismissedFullScreenContent: (ad) {
                    // Dispose the ad here to free resources.
                    ad.dispose();
                  },
                  // Called when a click is recorded for an ad.
                  onAdClicked: (ad) {});
              
            },
            onAdFailedToLoad: (error) {
              debugPrint('RewardedAd failed to load: $error');
            },
        ),

    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadRewardedAd();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Rewarded ADD"),),
      body: Center(
        child: ElevatedButton(onPressed: () {
           _rewardedAd?.show(onUserEarnedReward: (ad, reward) {
              //------------------------- your code
           },);
        }, child: Text("Show Interstitial ADD ")),
      ),
    );
  }
}
