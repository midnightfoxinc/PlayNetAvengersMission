.class Lcom/kochava/android/tracker/lite/KochavaSDKLite$1;
.super Ljava/lang/Thread;
.source "KochavaSDKLite.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/kochava/android/tracker/lite/KochavaSDKLite;->init(Landroid/content/Context;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 101
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 1
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 106
    const/4 v1, 0x0

    .line 109
    .local v1, "token":Ljava/lang/String;
    :try_start_0
    invoke-static {}, Lcom/kochava/android/tracker/lite/KochavaSDKLite;->access$0()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 116
    :cond_0
    :goto_0
    invoke-static {v1}, Lcom/kochava/android/tracker/lite/KochavaSDKLite;->access$1(Ljava/lang/String;)V

    .line 117
    return-void

    .line 111
    :catch_0
    move-exception v0

    .line 113
    .local v0, "e":Ljava/lang/Error;
    sget-boolean v2, Lcom/kochava/android/tracker/lite/Global;->DEBUGERROR:Z

    if-eqz v2, :cond_0

    const-string v2, "KochavaSDKLite"

    const-string v3, "*****NOTICE***** \nAn error has occured when trying to gather the Google Advertising Id. Please make sure you have the Google Play Services Library integrated in your app! \n*****NOTICE*****"

    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method
