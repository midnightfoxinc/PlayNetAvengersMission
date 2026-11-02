.class Lnet/hockeyapp/unity/HockeyUnityPlugin$5;
.super Ljava/lang/Object;
.source "HockeyUnityPlugin.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lnet/hockeyapp/unity/HockeyUnityPlugin;->startFeedbackForm(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$appID:Ljava/lang/String;

.field private final synthetic val$currentActivity:Landroid/app/Activity;

.field private final synthetic val$serverURL:Ljava/lang/String;


# direct methods
.method constructor <init>(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lnet/hockeyapp/unity/HockeyUnityPlugin$5;->val$currentActivity:Landroid/app/Activity;

    iput-object p2, p0, Lnet/hockeyapp/unity/HockeyUnityPlugin$5;->val$serverURL:Ljava/lang/String;

    iput-object p3, p0, Lnet/hockeyapp/unity/HockeyUnityPlugin$5;->val$appID:Ljava/lang/String;

    .line 88
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 91
    iget-object v0, p0, Lnet/hockeyapp/unity/HockeyUnityPlugin$5;->val$currentActivity:Landroid/app/Activity;

    iget-object v1, p0, Lnet/hockeyapp/unity/HockeyUnityPlugin$5;->val$serverURL:Ljava/lang/String;

    iget-object v2, p0, Lnet/hockeyapp/unity/HockeyUnityPlugin$5;->val$appID:Ljava/lang/String;

    const/4 v3, 0x0

    invoke-static {v0, v1, v2, v3}, Lnet/hockeyapp/android/FeedbackManager;->register(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lnet/hockeyapp/android/FeedbackManagerListener;)V

    .line 92
    iget-object v0, p0, Lnet/hockeyapp/unity/HockeyUnityPlugin$5;->val$currentActivity:Landroid/app/Activity;

    invoke-static {v0}, Lnet/hockeyapp/android/FeedbackManager;->showFeedbackActivity(Landroid/content/Context;)V

    .line 93
    return-void
.end method
