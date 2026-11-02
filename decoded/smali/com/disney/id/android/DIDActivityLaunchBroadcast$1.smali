.class Lcom/disney/id/android/DIDActivityLaunchBroadcast$1;
.super Landroid/content/BroadcastReceiver;
.source "DIDActivityLaunchBroadcast.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/disney/id/android/DIDActivityLaunchBroadcast;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/disney/id/android/DIDActivityLaunchBroadcast;


# direct methods
.method constructor <init>(Lcom/disney/id/android/DIDActivityLaunchBroadcast;)V
    .locals 0

    .prologue
    .line 16
    iput-object p1, p0, Lcom/disney/id/android/DIDActivityLaunchBroadcast$1;->this$0:Lcom/disney/id/android/DIDActivityLaunchBroadcast;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 19
    iget-object v0, p0, Lcom/disney/id/android/DIDActivityLaunchBroadcast$1;->this$0:Lcom/disney/id/android/DIDActivityLaunchBroadcast;

    invoke-static {v0}, Lcom/disney/id/android/DIDActivityLaunchBroadcast;->access$000(Lcom/disney/id/android/DIDActivityLaunchBroadcast;)Lcom/disney/id/android/DIDActivityLaunchBroadcast$DIDActivityLaunchListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 20
    iget-object v0, p0, Lcom/disney/id/android/DIDActivityLaunchBroadcast$1;->this$0:Lcom/disney/id/android/DIDActivityLaunchBroadcast;

    invoke-static {v0}, Lcom/disney/id/android/DIDActivityLaunchBroadcast;->access$000(Lcom/disney/id/android/DIDActivityLaunchBroadcast;)Lcom/disney/id/android/DIDActivityLaunchBroadcast$DIDActivityLaunchListener;

    move-result-object v0

    invoke-interface {v0}, Lcom/disney/id/android/DIDActivityLaunchBroadcast$DIDActivityLaunchListener;->onActivityLaunched()V

    .line 21
    :cond_0
    return-void
.end method
