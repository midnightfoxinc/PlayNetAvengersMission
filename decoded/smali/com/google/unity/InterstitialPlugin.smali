.class public Lcom/google/unity/InterstitialPlugin;
.super Ljava/lang/Object;
.source "InterstitialPlugin.java"


# static fields
.field private static final instance:Lcom/google/unity/InterstitialPlugin;


# instance fields
.field private activity:Landroid/app/Activity;

.field private callbackHandlerName:Ljava/lang/String;

.field private interstitial:Lcom/google/android/gms/ads/InterstitialAd;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 20
    new-instance v0, Lcom/google/unity/InterstitialPlugin;

    invoke-direct {v0}, Lcom/google/unity/InterstitialPlugin;-><init>()V

    sput-object v0, Lcom/google/unity/InterstitialPlugin;->instance:Lcom/google/unity/InterstitialPlugin;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    return-void
.end method

.method static synthetic access$0(Lcom/google/unity/InterstitialPlugin;Lcom/google/android/gms/ads/InterstitialAd;)V
    .locals 0

    .prologue
    .line 23
    iput-object p1, p0, Lcom/google/unity/InterstitialPlugin;->interstitial:Lcom/google/android/gms/ads/InterstitialAd;

    return-void
.end method

.method static synthetic access$1(Lcom/google/unity/InterstitialPlugin;)Lcom/google/android/gms/ads/InterstitialAd;
    .locals 1

    .prologue
    .line 23
    iget-object v0, p0, Lcom/google/unity/InterstitialPlugin;->interstitial:Lcom/google/android/gms/ads/InterstitialAd;

    return-object v0
.end method

.method static synthetic access$2(Lcom/google/unity/InterstitialPlugin;)Ljava/lang/String;
    .locals 1

    .prologue
    .line 29
    iget-object v0, p0, Lcom/google/unity/InterstitialPlugin;->callbackHandlerName:Ljava/lang/String;

    return-object v0
.end method

.method public static createInterstitialAd(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 2
    .param p0, "activity"    # Landroid/app/Activity;
    .param p1, "publisherId"    # Ljava/lang/String;

    .prologue
    .line 52
    invoke-static {}, Lcom/google/unity/InterstitialPlugin;->instance()Lcom/google/unity/InterstitialPlugin;

    move-result-object v0

    .line 53
    .local v0, "plugin":Lcom/google/unity/InterstitialPlugin;
    iput-object p0, v0, Lcom/google/unity/InterstitialPlugin;->activity:Landroid/app/Activity;

    .line 54
    new-instance v1, Lcom/google/unity/InterstitialPlugin$1;

    invoke-direct {v1, v0, p0, p1}, Lcom/google/unity/InterstitialPlugin$1;-><init>(Lcom/google/unity/InterstitialPlugin;Landroid/app/Activity;Ljava/lang/String;)V

    invoke-virtual {p0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 102
    return-void
.end method

.method public static instance()Lcom/google/unity/InterstitialPlugin;
    .locals 1

    .prologue
    .line 42
    sget-object v0, Lcom/google/unity/InterstitialPlugin;->instance:Lcom/google/unity/InterstitialPlugin;

    return-object v0
.end method

.method public static requestInterstitialAd(Z)V
    .locals 1
    .param p0, "isTesting"    # Z

    .prologue
    .line 121
    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/google/unity/InterstitialPlugin;->requestInterstitialAd(ZLjava/lang/String;)V

    .line 122
    return-void
.end method

.method public static requestInterstitialAd(ZLjava/lang/String;)V
    .locals 3
    .param p0, "isTesting"    # Z
    .param p1, "extrasJson"    # Ljava/lang/String;

    .prologue
    .line 133
    invoke-static {}, Lcom/google/unity/InterstitialPlugin;->instance()Lcom/google/unity/InterstitialPlugin;

    move-result-object v0

    .line 134
    .local v0, "plugin":Lcom/google/unity/InterstitialPlugin;
    iget-object v1, v0, Lcom/google/unity/InterstitialPlugin;->activity:Landroid/app/Activity;

    if-eqz v1, :cond_0

    iget-object v1, v0, Lcom/google/unity/InterstitialPlugin;->interstitial:Lcom/google/android/gms/ads/InterstitialAd;

    if-nez v1, :cond_1

    .line 135
    :cond_0
    const-string v1, "GoogleMobileAdsUnityPlugin"

    .line 136
    const-string v2, "Either Activity or interstitial is null. Did you call createInterstitialAd?"

    .line 135
    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 146
    :goto_0
    return-void

    .line 140
    :cond_1
    iget-object v1, v0, Lcom/google/unity/InterstitialPlugin;->activity:Landroid/app/Activity;

    new-instance v2, Lcom/google/unity/InterstitialPlugin$2;

    invoke-direct {v2}, Lcom/google/unity/InterstitialPlugin$2;-><init>()V

    invoke-virtual {v1, v2}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method public static setCallbackHandlerName(Ljava/lang/String;)V
    .locals 1
    .param p0, "callbackHandlerName"    # Ljava/lang/String;

    .prologue
    .line 110
    invoke-static {}, Lcom/google/unity/InterstitialPlugin;->instance()Lcom/google/unity/InterstitialPlugin;

    move-result-object v0

    .line 111
    .local v0, "plugin":Lcom/google/unity/InterstitialPlugin;
    iput-object p0, v0, Lcom/google/unity/InterstitialPlugin;->callbackHandlerName:Ljava/lang/String;

    .line 112
    return-void
.end method

.method public static showInterstitialAd()V
    .locals 3

    .prologue
    .line 154
    invoke-static {}, Lcom/google/unity/InterstitialPlugin;->instance()Lcom/google/unity/InterstitialPlugin;

    move-result-object v0

    .line 156
    .local v0, "plugin":Lcom/google/unity/InterstitialPlugin;
    iget-object v1, v0, Lcom/google/unity/InterstitialPlugin;->activity:Landroid/app/Activity;

    new-instance v2, Lcom/google/unity/InterstitialPlugin$3;

    invoke-direct {v2, v0}, Lcom/google/unity/InterstitialPlugin$3;-><init>(Lcom/google/unity/InterstitialPlugin;)V

    invoke-virtual {v1, v2}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 166
    return-void
.end method
