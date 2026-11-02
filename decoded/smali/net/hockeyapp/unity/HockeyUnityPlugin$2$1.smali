.class Lnet/hockeyapp/unity/HockeyUnityPlugin$2$1;
.super Lnet/hockeyapp/android/CrashManagerListener;
.source "HockeyUnityPlugin.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lnet/hockeyapp/unity/HockeyUnityPlugin$2;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lnet/hockeyapp/unity/HockeyUnityPlugin$2;

.field private final synthetic val$autoSendEnabled:Z


# direct methods
.method constructor <init>(Lnet/hockeyapp/unity/HockeyUnityPlugin$2;Z)V
    .locals 0

    .prologue
    .line 1
    iput-object p1, p0, Lnet/hockeyapp/unity/HockeyUnityPlugin$2$1;->this$1:Lnet/hockeyapp/unity/HockeyUnityPlugin$2;

    iput-boolean p2, p0, Lnet/hockeyapp/unity/HockeyUnityPlugin$2$1;->val$autoSendEnabled:Z

    .line 41
    invoke-direct {p0}, Lnet/hockeyapp/android/CrashManagerListener;-><init>()V

    return-void
.end method


# virtual methods
.method public shouldAutoUploadCrashes()Z
    .locals 1

    .prologue
    .line 43
    iget-boolean v0, p0, Lnet/hockeyapp/unity/HockeyUnityPlugin$2$1;->val$autoSendEnabled:Z

    return v0
.end method
