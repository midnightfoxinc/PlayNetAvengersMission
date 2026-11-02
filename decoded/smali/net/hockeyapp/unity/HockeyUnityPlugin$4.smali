.class Lnet/hockeyapp/unity/HockeyUnityPlugin$4;
.super Ljava/lang/Object;
.source "HockeyUnityPlugin.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lnet/hockeyapp/unity/HockeyUnityPlugin;->startFeedbackForm(Ljava/lang/String;Landroid/app/Activity;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$appID:Ljava/lang/String;

.field private final synthetic val$currentActivity:Landroid/app/Activity;


# direct methods
.method constructor <init>(Landroid/app/Activity;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lnet/hockeyapp/unity/HockeyUnityPlugin$4;->val$currentActivity:Landroid/app/Activity;

    iput-object p2, p0, Lnet/hockeyapp/unity/HockeyUnityPlugin$4;->val$appID:Ljava/lang/String;

    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 78
    iget-object v0, p0, Lnet/hockeyapp/unity/HockeyUnityPlugin$4;->val$currentActivity:Landroid/app/Activity;

    iget-object v1, p0, Lnet/hockeyapp/unity/HockeyUnityPlugin$4;->val$appID:Ljava/lang/String;

    invoke-static {v0, v1}, Lnet/hockeyapp/android/FeedbackManager;->register(Landroid/content/Context;Ljava/lang/String;)V

    .line 79
    iget-object v0, p0, Lnet/hockeyapp/unity/HockeyUnityPlugin$4;->val$currentActivity:Landroid/app/Activity;

    invoke-static {v0}, Lnet/hockeyapp/android/FeedbackManager;->showFeedbackActivity(Landroid/content/Context;)V

    .line 80
    return-void
.end method
