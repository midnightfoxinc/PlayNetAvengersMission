.class public Lnet/hockeyapp/unity/HockeyUnityPlugin;
.super Ljava/lang/Object;
.source "HockeyUnityPlugin.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getAppVersion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 99
    sget-object v0, Lnet/hockeyapp/android/Constants;->APP_VERSION:Ljava/lang/String;

    return-object v0
.end method

.method public static startFeedbackForm(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p0, "currentActivity"    # Landroid/app/Activity;
    .param p1, "serverURL"    # Ljava/lang/String;
    .param p2, "appID"    # Ljava/lang/String;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x9
    .end annotation

    .prologue
    .line 88
    new-instance v0, Lnet/hockeyapp/unity/HockeyUnityPlugin$5;

    invoke-direct {v0, p0, p1, p2}, Lnet/hockeyapp/unity/HockeyUnityPlugin$5;-><init>(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 95
    return-void
.end method

.method public static startFeedbackForm(Ljava/lang/String;Landroid/app/Activity;)V
    .locals 1
    .param p0, "appID"    # Ljava/lang/String;
    .param p1, "currentActivity"    # Landroid/app/Activity;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x9
    .end annotation

    .prologue
    .line 75
    new-instance v0, Lnet/hockeyapp/unity/HockeyUnityPlugin$4;

    invoke-direct {v0, p1, p0}, Lnet/hockeyapp/unity/HockeyUnityPlugin$4;-><init>(Landroid/app/Activity;Ljava/lang/String;)V

    invoke-virtual {p1, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 82
    return-void
.end method

.method public static startHockeyAppManager(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;ZZ)V
    .locals 6
    .param p0, "currentActivity"    # Landroid/app/Activity;
    .param p1, "serverURL"    # Ljava/lang/String;
    .param p2, "appID"    # Ljava/lang/String;
    .param p3, "updateManagerEnabled"    # Z
    .param p4, "autoSendEnabled"    # Z
    .annotation build Landroid/annotation/TargetApi;
        value = 0x9
    .end annotation

    .prologue
    .line 55
    new-instance v0, Lnet/hockeyapp/unity/HockeyUnityPlugin$3;

    move v1, p3

    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    move v5, p4

    invoke-direct/range {v0 .. v5}, Lnet/hockeyapp/unity/HockeyUnityPlugin$3;-><init>(ZLandroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Z)V

    invoke-virtual {p0, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 69
    return-void
.end method

.method public static startHockeyAppManager(Ljava/lang/String;Landroid/app/Activity;Z)V
    .locals 1
    .param p0, "appID"    # Ljava/lang/String;
    .param p1, "currentActivity"    # Landroid/app/Activity;
    .param p2, "updateManagerEnabled"    # Z
    .annotation build Landroid/annotation/TargetApi;
        value = 0x9
    .end annotation

    .prologue
    .line 18
    new-instance v0, Lnet/hockeyapp/unity/HockeyUnityPlugin$1;

    invoke-direct {v0, p2, p1, p0}, Lnet/hockeyapp/unity/HockeyUnityPlugin$1;-><init>(ZLandroid/app/Activity;Ljava/lang/String;)V

    invoke-virtual {p1, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 27
    return-void
.end method

.method public static startHockeyAppManager(Ljava/lang/String;Landroid/app/Activity;ZZ)V
    .locals 1
    .param p0, "appID"    # Ljava/lang/String;
    .param p1, "currentActivity"    # Landroid/app/Activity;
    .param p2, "updateManagerEnabled"    # Z
    .param p3, "autoSendEnabled"    # Z
    .annotation build Landroid/annotation/TargetApi;
        value = 0x9
    .end annotation

    .prologue
    .line 34
    new-instance v0, Lnet/hockeyapp/unity/HockeyUnityPlugin$2;

    invoke-direct {v0, p2, p1, p0, p3}, Lnet/hockeyapp/unity/HockeyUnityPlugin$2;-><init>(ZLandroid/app/Activity;Ljava/lang/String;Z)V

    invoke-virtual {p1, v0}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 48
    return-void
.end method
