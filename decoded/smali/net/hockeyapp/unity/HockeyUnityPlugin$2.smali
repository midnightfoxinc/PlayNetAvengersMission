.class Lnet/hockeyapp/unity/HockeyUnityPlugin$2;
.super Ljava/lang/Object;
.source "HockeyUnityPlugin.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lnet/hockeyapp/unity/HockeyUnityPlugin;->startHockeyAppManager(Ljava/lang/String;Landroid/app/Activity;ZZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$appID:Ljava/lang/String;

.field private final synthetic val$autoSendEnabled:Z

.field private final synthetic val$currentActivity:Landroid/app/Activity;

.field private final synthetic val$updateManagerEnabled:Z


# direct methods
.method constructor <init>(ZLandroid/app/Activity;Ljava/lang/String;Z)V
    .locals 0

    .prologue
    .line 1
    iput-boolean p1, p0, Lnet/hockeyapp/unity/HockeyUnityPlugin$2;->val$updateManagerEnabled:Z

    iput-object p2, p0, Lnet/hockeyapp/unity/HockeyUnityPlugin$2;->val$currentActivity:Landroid/app/Activity;

    iput-object p3, p0, Lnet/hockeyapp/unity/HockeyUnityPlugin$2;->val$appID:Ljava/lang/String;

    iput-boolean p4, p0, Lnet/hockeyapp/unity/HockeyUnityPlugin$2;->val$autoSendEnabled:Z

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 37
    iget-boolean v0, p0, Lnet/hockeyapp/unity/HockeyUnityPlugin$2;->val$updateManagerEnabled:Z

    if-eqz v0, :cond_0

    .line 38
    iget-object v0, p0, Lnet/hockeyapp/unity/HockeyUnityPlugin$2;->val$currentActivity:Landroid/app/Activity;

    iget-object v1, p0, Lnet/hockeyapp/unity/HockeyUnityPlugin$2;->val$appID:Ljava/lang/String;

    invoke-static {v0, v1}, Lnet/hockeyapp/android/UpdateManager;->register(Landroid/app/Activity;Ljava/lang/String;)V

    .line 40
    :cond_0
    iget-object v0, p0, Lnet/hockeyapp/unity/HockeyUnityPlugin$2;->val$currentActivity:Landroid/app/Activity;

    iget-object v1, p0, Lnet/hockeyapp/unity/HockeyUnityPlugin$2;->val$appID:Ljava/lang/String;

    .line 41
    new-instance v2, Lnet/hockeyapp/unity/HockeyUnityPlugin$2$1;

    iget-boolean v3, p0, Lnet/hockeyapp/unity/HockeyUnityPlugin$2;->val$autoSendEnabled:Z

    invoke-direct {v2, p0, v3}, Lnet/hockeyapp/unity/HockeyUnityPlugin$2$1;-><init>(Lnet/hockeyapp/unity/HockeyUnityPlugin$2;Z)V

    .line 40
    invoke-static {v0, v1, v2}, Lnet/hockeyapp/android/CrashManager;->register(Landroid/content/Context;Ljava/lang/String;Lnet/hockeyapp/android/CrashManagerListener;)V

    .line 46
    return-void
.end method
