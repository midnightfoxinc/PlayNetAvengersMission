.class Lcom/google/unity/InterstitialPlugin$3;
.super Ljava/lang/Object;
.source "InterstitialPlugin.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/unity/InterstitialPlugin;->showInterstitialAd()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$plugin:Lcom/google/unity/InterstitialPlugin;


# direct methods
.method constructor <init>(Lcom/google/unity/InterstitialPlugin;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/google/unity/InterstitialPlugin$3;->val$plugin:Lcom/google/unity/InterstitialPlugin;

    .line 156
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 159
    iget-object v0, p0, Lcom/google/unity/InterstitialPlugin$3;->val$plugin:Lcom/google/unity/InterstitialPlugin;

    invoke-static {v0}, Lcom/google/unity/InterstitialPlugin;->access$1(Lcom/google/unity/InterstitialPlugin;)Lcom/google/android/gms/ads/InterstitialAd;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/ads/InterstitialAd;->isLoaded()Z

    move-result v0

    if-nez v0, :cond_0

    .line 160
    const-string v0, "GoogleMobileAdsUnityPlugin"

    const-string v1, "Interstitial hasn\'t loaded. Aborting showInterstitialAd."

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 164
    :goto_0
    return-void

    .line 163
    :cond_0
    iget-object v0, p0, Lcom/google/unity/InterstitialPlugin$3;->val$plugin:Lcom/google/unity/InterstitialPlugin;

    invoke-static {v0}, Lcom/google/unity/InterstitialPlugin;->access$1(Lcom/google/unity/InterstitialPlugin;)Lcom/google/android/gms/ads/InterstitialAd;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/android/gms/ads/InterstitialAd;->show()V

    goto :goto_0
.end method
