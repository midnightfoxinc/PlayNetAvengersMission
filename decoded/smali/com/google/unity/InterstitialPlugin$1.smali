.class Lcom/google/unity/InterstitialPlugin$1;
.super Ljava/lang/Object;
.source "InterstitialPlugin.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/unity/InterstitialPlugin;->createInterstitialAd(Landroid/app/Activity;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$activity:Landroid/app/Activity;

.field private final synthetic val$plugin:Lcom/google/unity/InterstitialPlugin;

.field private final synthetic val$publisherId:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/google/unity/InterstitialPlugin;Landroid/app/Activity;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/google/unity/InterstitialPlugin$1;->val$plugin:Lcom/google/unity/InterstitialPlugin;

    iput-object p2, p0, Lcom/google/unity/InterstitialPlugin$1;->val$activity:Landroid/app/Activity;

    iput-object p3, p0, Lcom/google/unity/InterstitialPlugin$1;->val$publisherId:Ljava/lang/String;

    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 57
    iget-object v0, p0, Lcom/google/unity/InterstitialPlugin$1;->val$plugin:Lcom/google/unity/InterstitialPlugin;

    new-instance v1, Lcom/google/android/gms/ads/InterstitialAd;

    iget-object v2, p0, Lcom/google/unity/InterstitialPlugin$1;->val$activity:Landroid/app/Activity;

    invoke-direct {v1, v2}, Lcom/google/android/gms/ads/InterstitialAd;-><init>(Landroid/content/Context;)V

    invoke-static {v0, v1}, Lcom/google/unity/InterstitialPlugin;->access$0(Lcom/google/unity/InterstitialPlugin;Lcom/google/android/gms/ads/InterstitialAd;)V

    .line 58
    iget-object v0, p0, Lcom/google/unity/InterstitialPlugin$1;->val$plugin:Lcom/google/unity/InterstitialPlugin;

    invoke-static {v0}, Lcom/google/unity/InterstitialPlugin;->access$1(Lcom/google/unity/InterstitialPlugin;)Lcom/google/android/gms/ads/InterstitialAd;

    move-result-object v0

    iget-object v1, p0, Lcom/google/unity/InterstitialPlugin$1;->val$publisherId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/google/android/gms/ads/InterstitialAd;->setAdUnitId(Ljava/lang/String;)V

    .line 59
    iget-object v0, p0, Lcom/google/unity/InterstitialPlugin$1;->val$plugin:Lcom/google/unity/InterstitialPlugin;

    invoke-static {v0}, Lcom/google/unity/InterstitialPlugin;->access$1(Lcom/google/unity/InterstitialPlugin;)Lcom/google/android/gms/ads/InterstitialAd;

    move-result-object v0

    new-instance v1, Lcom/google/unity/InterstitialPlugin$1$1;

    iget-object v2, p0, Lcom/google/unity/InterstitialPlugin$1;->val$plugin:Lcom/google/unity/InterstitialPlugin;

    invoke-direct {v1, p0, v2}, Lcom/google/unity/InterstitialPlugin$1$1;-><init>(Lcom/google/unity/InterstitialPlugin$1;Lcom/google/unity/InterstitialPlugin;)V

    invoke-virtual {v0, v1}, Lcom/google/android/gms/ads/InterstitialAd;->setAdListener(Lcom/google/android/gms/ads/AdListener;)V

    .line 100
    return-void
.end method
