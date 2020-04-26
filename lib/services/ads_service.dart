import 'package:firebase_admob/firebase_admob.dart';

// Will be updated when we recieve these, DONDE ones here
const String appID = "ca-app-pub-5777492202424173~3025761937";
const String interstitialID = "ca-app-pub-5777492202424173/6773435257";
const String bannerID = "ca-app-pub-5777492202424173/7164317495";

class Ads {

  static const List<String> keywordsList = ["Conversations", "Questions",
    "Convo", "Conversation", "Question", "Answer", "Topics ", "Eat"];

  static const MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
      testDevices: appID != null ? <String>[appID] : null,
      nonPersonalizedAds: true,
      keywords: keywordsList
  );

  BannerAd createBannerAd() {
    return BannerAd(
        adUnitId: bannerID,
        size: AdSize.banner, // can be diff sized
        targetingInfo: targetingInfo,
        listener: (event) {
          if ( event == MobileAdEvent.loaded ) {

          }
          print("BannerAd $event");
        }
    );
  }

  InterstitialAd createInterstitialAd() {
    return InterstitialAd(
        adUnitId: interstitialID,
        targetingInfo: targetingInfo,
        listener: (MobileAdEvent event) {
          print("InterstitialAd $event");
        }
    );
  }
}
