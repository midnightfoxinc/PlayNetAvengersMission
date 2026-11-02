.class Lcom/google/unity/ads/Banner$1$1;
.super Lcom/google/android/gms/ads/AdListener;
.source "Banner.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/unity/ads/Banner$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/google/unity/ads/Banner$1;


# direct methods
.method constructor <init>(Lcom/google/unity/ads/Banner$1;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lcom/google/unity/ads/Banner$1$1;->this$1:Lcom/google/unity/ads/Banner$1;

    .line 65
    invoke-direct {p0}, Lcom/google/android/gms/ads/AdListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onAdClosed()V
    .locals 1

    .prologue
    .line 89
    iget-object v0, p0, Lcom/google/unity/ads/Banner$1$1;->this$1:Lcom/google/unity/ads/Banner$1;

    invoke-static {v0}, Lcom/google/unity/ads/Banner$1;->access$0(Lcom/google/unity/ads/Banner$1;)Lcom/google/unity/ads/Banner;

    move-result-object v0

    invoke-static {v0}, Lcom/google/unity/ads/Banner;->access$3(Lcom/google/unity/ads/Banner;)Lcom/google/unity/ads/UnityAdListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 90
    iget-object v0, p0, Lcom/google/unity/ads/Banner$1$1;->this$1:Lcom/google/unity/ads/Banner$1;

    invoke-static {v0}, Lcom/google/unity/ads/Banner$1;->access$0(Lcom/google/unity/ads/Banner$1;)Lcom/google/unity/ads/Banner;

    move-result-object v0

    invoke-static {v0}, Lcom/google/unity/ads/Banner;->access$3(Lcom/google/unity/ads/Banner;)Lcom/google/unity/ads/UnityAdListener;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/unity/ads/UnityAdListener;->onAdClosed()V

    .line 92
    :cond_0
    return-void
.end method

.method public onAdFailedToLoad(I)V
    .locals 2
    .param p1, "errorCode"    # I

    .prologue
    .line 75
    iget-object v0, p0, Lcom/google/unity/ads/Banner$1$1;->this$1:Lcom/google/unity/ads/Banner$1;

    invoke-static {v0}, Lcom/google/unity/ads/Banner$1;->access$0(Lcom/google/unity/ads/Banner$1;)Lcom/google/unity/ads/Banner;

    move-result-object v0

    invoke-static {v0}, Lcom/google/unity/ads/Banner;->access$3(Lcom/google/unity/ads/Banner;)Lcom/google/unity/ads/UnityAdListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 76
    iget-object v0, p0, Lcom/google/unity/ads/Banner$1$1;->this$1:Lcom/google/unity/ads/Banner$1;

    invoke-static {v0}, Lcom/google/unity/ads/Banner$1;->access$0(Lcom/google/unity/ads/Banner$1;)Lcom/google/unity/ads/Banner;

    move-result-object v0

    invoke-static {v0}, Lcom/google/unity/ads/Banner;->access$3(Lcom/google/unity/ads/Banner;)Lcom/google/unity/ads/UnityAdListener;

    move-result-object v0

    invoke-static {p1}, Lcom/google/unity/ads/PluginUtils;->getErrorReason(I)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/google/unity/ads/UnityAdListener;->onAdFailedToLoad(Ljava/lang/String;)V

    .line 78
    :cond_0
    return-void
.end method

.method public onAdLeftApplication()V
    .locals 1

    .prologue
    .line 96
    iget-object v0, p0, Lcom/google/unity/ads/Banner$1$1;->this$1:Lcom/google/unity/ads/Banner$1;

    invoke-static {v0}, Lcom/google/unity/ads/Banner$1;->access$0(Lcom/google/unity/ads/Banner$1;)Lcom/google/unity/ads/Banner;

    move-result-object v0

    invoke-static {v0}, Lcom/google/unity/ads/Banner;->access$3(Lcom/google/unity/ads/Banner;)Lcom/google/unity/ads/UnityAdListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 97
    iget-object v0, p0, Lcom/google/unity/ads/Banner$1$1;->this$1:Lcom/google/unity/ads/Banner$1;

    invoke-static {v0}, Lcom/google/unity/ads/Banner$1;->access$0(Lcom/google/unity/ads/Banner$1;)Lcom/google/unity/ads/Banner;

    move-result-object v0

    invoke-static {v0}, Lcom/google/unity/ads/Banner;->access$3(Lcom/google/unity/ads/Banner;)Lcom/google/unity/ads/UnityAdListener;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/unity/ads/UnityAdListener;->onAdLeftApplication()V

    .line 99
    :cond_0
    return-void
.end method

.method public onAdLoaded()V
    .locals 1

    .prologue
    .line 68
    iget-object v0, p0, Lcom/google/unity/ads/Banner$1$1;->this$1:Lcom/google/unity/ads/Banner$1;

    invoke-static {v0}, Lcom/google/unity/ads/Banner$1;->access$0(Lcom/google/unity/ads/Banner$1;)Lcom/google/unity/ads/Banner;

    move-result-object v0

    invoke-static {v0}, Lcom/google/unity/ads/Banner;->access$3(Lcom/google/unity/ads/Banner;)Lcom/google/unity/ads/UnityAdListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 69
    iget-object v0, p0, Lcom/google/unity/ads/Banner$1$1;->this$1:Lcom/google/unity/ads/Banner$1;

    invoke-static {v0}, Lcom/google/unity/ads/Banner$1;->access$0(Lcom/google/unity/ads/Banner$1;)Lcom/google/unity/ads/Banner;

    move-result-object v0

    invoke-static {v0}, Lcom/google/unity/ads/Banner;->access$3(Lcom/google/unity/ads/Banner;)Lcom/google/unity/ads/UnityAdListener;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/unity/ads/UnityAdListener;->onAdLoaded()V

    .line 71
    :cond_0
    return-void
.end method

.method public onAdOpened()V
    .locals 1

    .prologue
    .line 82
    iget-object v0, p0, Lcom/google/unity/ads/Banner$1$1;->this$1:Lcom/google/unity/ads/Banner$1;

    invoke-static {v0}, Lcom/google/unity/ads/Banner$1;->access$0(Lcom/google/unity/ads/Banner$1;)Lcom/google/unity/ads/Banner;

    move-result-object v0

    invoke-static {v0}, Lcom/google/unity/ads/Banner;->access$3(Lcom/google/unity/ads/Banner;)Lcom/google/unity/ads/UnityAdListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 83
    iget-object v0, p0, Lcom/google/unity/ads/Banner$1$1;->this$1:Lcom/google/unity/ads/Banner$1;

    invoke-static {v0}, Lcom/google/unity/ads/Banner$1;->access$0(Lcom/google/unity/ads/Banner$1;)Lcom/google/unity/ads/Banner;

    move-result-object v0

    invoke-static {v0}, Lcom/google/unity/ads/Banner;->access$3(Lcom/google/unity/ads/Banner;)Lcom/google/unity/ads/UnityAdListener;

    move-result-object v0

    invoke-interface {v0}, Lcom/google/unity/ads/UnityAdListener;->onAdOpened()V

    .line 85
    :cond_0
    return-void
.end method
