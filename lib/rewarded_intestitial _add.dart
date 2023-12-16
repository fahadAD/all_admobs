import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
class RewardedIntestitialADS_Page extends StatefulWidget {
  const RewardedIntestitialADS_Page({super.key});

  @override
  State<RewardedIntestitialADS_Page> createState() => _RewardedIntestitialADS_PageState();
}

class _RewardedIntestitialADS_PageState extends State<RewardedIntestitialADS_Page> {
  RewardedInterstitialAd? _rewardeInterstitialdAd;

  final adUnitId ="ca-app-pub-3940256099942544/5354046379";

  void loadInterstitialAd() {
    RewardedInterstitialAd.load(
        adUnitId: adUnitId,
        request: const AdRequest(),
        rewardedInterstitialAdLoadCallback: RewardedInterstitialAdLoadCallback(
           onAdLoaded: (ad) {
            debugPrint('$ad loaded.');
            _rewardeInterstitialdAd = ad;

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
          onAdFailedToLoad: (LoadAdError error) {
            debugPrint('RewardedInterstitialAd failed to load: $error');
          },
        ));
  }

  @override
  void initState() {
    super.initState();
    loadInterstitialAd();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Rewarded ADD"),),
      body: Center(
        child: ElevatedButton(onPressed: (){
          _rewardeInterstitialdAd?.show(onUserEarnedReward: (ad, reward) {

          },);
          }, child: Text("Show Rewarded Interstitial ADD ")),
      ),
    );
  }
}