import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
class InterstitialADS_Page extends StatefulWidget {
  const InterstitialADS_Page({super.key});

  @override
  State<InterstitialADS_Page> createState() => _InterstitialADS_PageState();
}

class _InterstitialADS_PageState extends State<InterstitialADS_Page> {

  InterstitialAd? _interstitialAd;
  final adUnitId ="ca-app-pub-3940256099942544/1033173712";

  void loadInterstitialAd() {
    InterstitialAd.load(
        adUnitId: adUnitId,
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(

          onAdLoaded: (ad) {
            debugPrint('$ad loaded.');
             _interstitialAd = ad;

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
            debugPrint('InterstitialAd failed to load: $error');
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
      appBar: AppBar(title: Text("Interstitial ADD"),),
      body: Center(
        child: ElevatedButton(onPressed: () {
           _interstitialAd?.show();
        }, child: Text("Show Interstitial ADD ")),
      ),
    );
  }
}
