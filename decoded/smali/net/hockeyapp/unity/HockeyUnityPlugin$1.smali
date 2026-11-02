.class Lnet/hockeyapp/unity/HockeyUnityPlugin$1;
.super Ljava/lang/Object;
.source "HockeyUnityPlugin.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lnet/hockeyapp/unity/HockeyUnityPlugin;->startHockeyAppManager(Ljava/lang/String;Landroid/app/Activity;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$appID:Ljava/lang/String;

.field private final synthetic val$currentActivity:Landroid/app/Activity;

.field private final synthetic val$updateManagerEnabled:Z


# direct methods
.method constructor <init>(ZLandroid/app/Activity;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1
    iput-boolean p1, p0, Lnet/hockeyapp/unity/HockeyUnityPlugin$1;->val$updateManagerEnabled:Z

    iput-object p2, p0, Lnet/hockeyapp/unity/HockeyUnityPlugin$1;->val$currentActivity:Landroid/app/Activity;

    iput-object p3, p0, Lnet/hockeyapp/unity/HockeyUnityPlugin$1;->val$appID:Ljava/lang/String;

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 21
    iget-boolean v0, p0, Lnet/hockeyapp/unity/HockeyUnityPlugin$1;->val$updateManagerEnabled:Z

    if-eqz v0, :cond_0

    .line 22
    iget-object v0, p0, Lnet/hockeyapp/unity/HockeyUnityPlugin$1;->val$currentActivity:Landroid/app/Activity;

    iget-object v1, p0, Lnet/hockeyapp/unity/HockeyUnityPlugin$1;->val$appID:Ljava/lang/String;

    invoke-static {v0, v1}, Lnet/hockeyapp/android/UpdateManager;->register(Landroid/app/Activity;Ljava/lang/String;)V

    .line 24
    :cond_0
    iget-object v0, p0, Lnet/hockeyapp/unity/HockeyUnityPlugin$1;->val$currentActivity:Landroid/app/Activity;

    iget-object v1, p0, Lnet/hockeyapp/unity/HockeyUnityPlugin$1;->val$appID:Ljava/lang/String;

    invoke-static {v0, v1}, Lnet/hockeyapp/android/CrashManager;->register(Landroid/content/Context;Ljava/lang/String;)V

    .line 25
    return-void
.end method
