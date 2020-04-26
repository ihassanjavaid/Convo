import 'package:firebase_admob/firebase_admob.dart';

// Will be updated when we recieve these, DONDE ones here
const String appIDAndroid = "ca-app-pub-2167282335700083~6409081517";
const String interstitialIDAndroid = "ca-app-pub-2167282335700083/1902860291";
const String bannerIDAndroid = "ca-app-pub-2167282335700083/6572733049";

class Ads {

  static const List<String> keywordsList = ["Conversations", "Questions",
    "Convo", "Conversation", "Question", "Answer", "Topics ", "Eat"];

  static const MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
      testDevices: appIDAndroid != null ? <String>[appIDAndroid] : null,
      nonPersonalizedAds: true,
      keywords: keywordsList
  );

  BannerAd createBannerAd() {
    return BannerAd(
        adUnitId: bannerIDAndroid,
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
        adUnitId: interstitialIDAndroid,
        targetingInfo: targetingInfo,
        listener: (MobileAdEvent event) {
          print("InterstitialAd $event");
        }
    );
  }
}
