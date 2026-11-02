.class Lnet/hockeyapp/unity/HockeyUnityPlugin$3;
.super Ljava/lang/Object;
.source "HockeyUnityPlugin.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lnet/hockeyapp/unity/HockeyUnityPlugin;->startHockeyAppManager(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;ZZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$appID:Ljava/lang/String;

.field private final synthetic val$autoSendEnabled:Z

.field private final synthetic val$currentActivity:Landroid/app/Activity;

.field private final synthetic val$serverURL:Ljava/lang/String;

.field private final synthetic val$updateManagerEnabled:Z


# direct methods
.method constructor <init>(ZLandroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 0

    .prologue
    .line 1
    iput-boolean p1, p0, Lnet/hockeyapp/unity/HockeyUnityPlugin$3;->val$updateManagerEnabled:Z

    iput-object p2, p0, Lnet/hockeyapp/unity/HockeyUnityPlugin$3;->val$currentActivity:Landroid/app/Activity;

    iput-object p3, p0, Lnet/hockeyapp/unity/HockeyUnityPlugin$3;->val$serverURL:Ljava/lang/String;

    iput-object p4, p0, Lnet/hockeyapp/unity/HockeyUnityPlugin$3;->val$appID:Ljava/lang/String;

    iput-boolean p5, p0, Lnet/hockeyapp/unity/HockeyUnityPlugin$3;->val$autoSendEnabled:Z

    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 58
    iget-boolean v0, p0, Lnet/hockeyapp/unity/HockeyUnityPlugin$3;->val$updateManagerEnabled:Z

    if-eqz v0, :cond_0

    .line 59
    iget-object v0, p0, Lnet/hockeyapp/unity/HockeyUnityPlugin$3;->val$currentActivity:Landroid/app/Activity;

    iget-object v1, p0, Lnet/hockeyapp/unity/HockeyUnityPlugin$3;->val$serverURL:Ljava/lang/String;

    iget-object v2, p0, Lnet/hockeyapp/unity/HockeyUnityPlugin$3;->val$appID:Ljava/lang/String;

    const/4 v3, 0x0

    invoke-static {v0, v1, v2, v3}, Lnet/hockeyapp/android/UpdateManager;->register(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;Lnet/hockeyapp/android/UpdateManagerListener;)V

    .line 61
    :cond_0
    iget-object v0, p0, Lnet/hockeyapp/unity/HockeyUnityPlugin$3;->val$currentActivity:Landroid/app/Activity;

    iget-object v1, p0, Lnet/hockeyapp/unity/HockeyUnityPlugin$3;->val$serverURL:Ljava/lang/String;

    iget-object v2, p0, Lnet/hockeyapp/unity/HockeyUnityPlugin$3;->val$appID:Ljava/lang/String;

    .line 62
    new-instance v3, Lnet/hockeyapp/unity/HockeyUnityPlugin$3$1;

    iget-boolean v4, p0, Lnet/hockeyapp/unity/HockeyUnityPlugin$3;->val$autoSendEnabled:Z

    invoke-direct {v3, p0, v4}, Lnet/hockeyapp/unity/HockeyUnityPlugin$3$1;-><init>(Lnet/hockeyapp/unity/HockeyUnityPlugin$3;Z)V

    .line 61
    invoke-static {v0, v1, v2, v3}, Lnet/hockeyapp/android/CrashManager;->register(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lnet/hockeyapp/android/CrashManagerListener;)V

    .line 67
    return-void
.end method
