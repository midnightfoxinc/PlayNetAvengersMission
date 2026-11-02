.class Lcom/google/unity/InterstitialPlugin$1$1;
.super Lcom/google/android/gms/ads/AdListener;
.source "InterstitialPlugin.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/unity/InterstitialPlugin$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/google/unity/InterstitialPlugin$1;

.field private final synthetic val$plugin:Lcom/google/unity/InterstitialPlugin;


# direct methods
.method constructor <init>(Lcom/google/unity/InterstitialPlugin$1;Lcom/google/unity/InterstitialPlugin;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/google/unity/InterstitialPlugin$1$1;->this$1:Lcom/google/unity/InterstitialPlugin$1;

    iput-object p2, p0, Lcom/google/unity/InterstitialPlugin$1$1;->val$plugin:Lcom/google/unity/InterstitialPlugin;

    .line 59
    invoke-direct {p0}, Lcom/google/android/gms/ads/AdListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onAdClosed()V
    .locals 1

    .prologue
    .line 88
    iget-object v0, p0, Lcom/google/unity/InterstitialPlugin$1$1;->val$plugin:Lcom/google/unity/InterstitialPlugin;

    invoke-static {v0}, Lcom/google/unity/InterstitialPlugin;->access$2(Lcom/google/unity/InterstitialPlugin;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/unity/InterstitialPlugin$1$1;->val$plugin:Lcom/google/unity/InterstitialPlugin;

    invoke-static {v0}, Lcom/google/unity/InterstitialPlugin;->access$2(Lcom/google/unity/InterstitialPlugin;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 91
    :cond_0
    return-void
.end method

.method public onAdFailedToLoad(I)V
    .locals 1
    .param p1, "errorCode"    # I

    .prologue
    .line 73
    iget-object v0, p0, Lcom/google/unity/InterstitialPlugin$1$1;->val$plugin:Lcom/google/unity/InterstitialPlugin;

    invoke-static {v0}, Lcom/google/unity/InterstitialPlugin;->access$2(Lcom/google/unity/InterstitialPlugin;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/unity/InterstitialPlugin$1$1;->val$plugin:Lcom/google/unity/InterstitialPlugin;

    invoke-static {v0}, Lcom/google/unity/InterstitialPlugin;->access$2(Lcom/google/unity/InterstitialPlugin;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 77
    :cond_0
    return-void
.end method

.method public onAdLeftApplication()V
    .locals 1

    .prologue
    .line 95
    iget-object v0, p0, Lcom/google/unity/InterstitialPlugin$1$1;->val$plugin:Lcom/google/unity/InterstitialPlugin;

    invoke-static {v0}, Lcom/google/unity/InterstitialPlugin;->access$2(Lcom/google/unity/InterstitialPlugin;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/unity/InterstitialPlugin$1$1;->val$plugin:Lcom/google/unity/InterstitialPlugin;

    invoke-static {v0}, Lcom/google/unity/InterstitialPlugin;->access$2(Lcom/google/unity/InterstitialPlugin;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 98
    :cond_0
    return-void
.end method

.method public onAdLoaded()V
    .locals 3

    .prologue
    .line 62
    const-string v0, "GoogleMobileAdsUnityPlugin"

    .line 63
    const-string v1, "AD LOADED. IS CALLBACK HANDLER SET?"

    .line 62
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 64
    iget-object v0, p0, Lcom/google/unity/InterstitialPlugin$1$1;->val$plugin:Lcom/google/unity/InterstitialPlugin;

    invoke-static {v0}, Lcom/google/unity/InterstitialPlugin;->access$2(Lcom/google/unity/InterstitialPlugin;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/unity/InterstitialPlugin$1$1;->val$plugin:Lcom/google/unity/InterstitialPlugin;

    invoke-static {v0}, Lcom/google/unity/InterstitialPlugin;->access$2(Lcom/google/unity/InterstitialPlugin;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 65
    const-string v0, "GoogleMobileAdsUnityPlugin"

    .line 66
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Invoking message on: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lcom/google/unity/InterstitialPlugin$1$1;->val$plugin:Lcom/google/unity/InterstitialPlugin;

    invoke-static {v2}, Lcom/google/unity/InterstitialPlugin;->access$2(Lcom/google/unity/InterstitialPlugin;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 65
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 69
    :cond_0
    return-void
.end method

.method public onAdOpened()V
    .locals 1

    .prologue
    .line 81
    iget-object v0, p0, Lcom/google/unity/InterstitialPlugin$1$1;->val$plugin:Lcom/google/unity/InterstitialPlugin;

    invoke-static {v0}, Lcom/google/unity/InterstitialPlugin;->access$2(Lcom/google/unity/InterstitialPlugin;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/unity/InterstitialPlugin$1$1;->val$plugin:Lcom/google/unity/InterstitialPlugin;

    invoke-static {v0}, Lcom/google/unity/InterstitialPlugin;->access$2(Lcom/google/unity/InterstitialPlugin;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 84
    :cond_0
    return-void
.end method
