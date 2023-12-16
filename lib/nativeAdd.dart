
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
class NativeADS_Page extends StatefulWidget {
  const NativeADS_Page({super.key});

  @override
  State<NativeADS_Page> createState() => _NativeADS_PageState();
}

class _NativeADS_PageState extends State<NativeADS_Page> {

  NativeAd? _nativeAd;
  bool _nativeAdIsLoaded = false;


  final String _adUnitId ="ca-app-pub-3940256099942544/2247696110";

   void loadNativeAd() {
    _nativeAd = NativeAd(
        adUnitId: _adUnitId,
        listener: NativeAdListener(
          onAdLoaded: (ad) {
            debugPrint('$NativeAd loaded.');
            setState(() {
              _nativeAdIsLoaded = true;
            });
          },
          onAdFailedToLoad: (ad, error) {
            debugPrint('$NativeAd failed to load: $error');
            ad.dispose();
          },
        ),
        request: const AdRequest(),

        nativeTemplateStyle: NativeTemplateStyle(
            templateType: TemplateType.small,
            // Optional: Customize the ad's style.
            mainBackgroundColor: Colors.purple,
            cornerRadius: 10.0,
            callToActionTextStyle: NativeTemplateTextStyle(
                textColor: Colors.cyan,
                backgroundColor: Colors.red,
                style: NativeTemplateFontStyle.monospace,
                size: 16.0),
            primaryTextStyle: NativeTemplateTextStyle(
                textColor: Colors.red,
                backgroundColor: Colors.cyan,
                style: NativeTemplateFontStyle.italic,
                size: 16.0),
            secondaryTextStyle: NativeTemplateTextStyle(
                textColor: Colors.green,
                backgroundColor: Colors.black,
                style: NativeTemplateFontStyle.bold,
                size: 16.0),
            tertiaryTextStyle: NativeTemplateTextStyle(
                textColor: Colors.brown,
                backgroundColor: Colors.amber,
                style: NativeTemplateFontStyle.normal,
                size: 16.0))
    )
      ..load();
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadNativeAd();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Banner ADD"),),
 bottomNavigationBar: Container(
   width: double.infinity,
  height: 200,
  child: AdWidget(ad: _nativeAd!),
 ),
     );
  }
}



