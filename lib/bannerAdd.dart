
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
class BannerADS_Page extends StatefulWidget {
  const BannerADS_Page({super.key});

  @override
  State<BannerADS_Page> createState() => _BannerADS_PageState();
}

class _BannerADS_PageState extends State<BannerADS_Page> {

  BannerAd? _bannerAd;
  bool _isLoaded = false;

  final adUnitId = 'ca-app-pub-3940256099942544/6300978111';

  void loadBannerAd() {
    _bannerAd = BannerAd(
      adUnitId: adUnitId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          debugPrint('$ad loaded.');
          setState(() {
            _isLoaded = true;
          });
        },

        onAdFailedToLoad: (ad, err) {
          debugPrint('BannerAd failed to load: $err');

          ad.dispose();
        },
      ),
    )..load();}
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadBannerAd();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Banner ADD"),),
      bottomNavigationBar: Container(
        height: _bannerAd?.size.height.toDouble(),
        width: _bannerAd?.size.width.toDouble(),
        child: AdWidget(ad: _bannerAd!),
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}



