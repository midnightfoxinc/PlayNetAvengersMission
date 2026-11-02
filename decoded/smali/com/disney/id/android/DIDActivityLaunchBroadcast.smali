.class public Lcom/disney/id/android/DIDActivityLaunchBroadcast;
.super Ljava/lang/Object;
.source "DIDActivityLaunchBroadcast.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/disney/id/android/DIDActivityLaunchBroadcast$DIDActivityLaunchListener;
    }
.end annotation


# instance fields
.field private mListener:Lcom/disney/id/android/DIDActivityLaunchBroadcast$DIDActivityLaunchListener;

.field private final receiver:Landroid/content/BroadcastReceiver;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    new-instance v0, Lcom/disney/id/android/DIDActivityLaunchBroadcast$1;

    invoke-direct {v0, p0}, Lcom/disney/id/android/DIDActivityLaunchBroadcast$1;-><init>(Lcom/disney/id/android/DIDActivityLaunchBroadcast;)V

    iput-object v0, p0, Lcom/disney/id/android/DIDActivityLaunchBroadcast;->receiver:Landroid/content/BroadcastReceiver;

    .line 36
    return-void
.end method

.method static synthetic access$000(Lcom/disney/id/android/DIDActivityLaunchBroadcast;)Lcom/disney/id/android/DIDActivityLaunchBroadcast$DIDActivityLaunchListener;
    .locals 1
    .param p0, "x0"    # Lcom/disney/id/android/DIDActivityLaunchBroadcast;

    .prologue
    .line 12
    iget-object v0, p0, Lcom/disney/id/android/DIDActivityLaunchBroadcast;->mListener:Lcom/disney/id/android/DIDActivityLaunchBroadcast$DIDActivityLaunchListener;

    return-object v0
.end method

.method public static broadcast(Landroid/content/Context;Lcom/disney/id/android/DIDRequest;)V
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "request"    # Lcom/disney/id/android/DIDRequest;

    .prologue
    .line 42
    new-instance v0, Landroid/content/Intent;

    const-string v1, "com.disney.id.android.REQUEST"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 43
    .local v0, "requestIntent":Landroid/content/Intent;
    const-string v1, "com.disney.id.android.REQUEST"

    invoke-virtual {p1}, Lcom/disney/id/android/DIDRequest;->getRequestCode()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 44
    invoke-static {p0}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/support/v4/content/LocalBroadcastManager;->sendBroadcast(Landroid/content/Intent;)Z

    .line 45
    return-void
.end method


# virtual methods
.method public registerContext(Landroid/content/Context;Lcom/disney/id/android/DIDActivityLaunchBroadcast$DIDActivityLaunchListener;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "listener"    # Lcom/disney/id/android/DIDActivityLaunchBroadcast$DIDActivityLaunchListener;

    .prologue
    .line 25
    iput-object p2, p0, Lcom/disney/id/android/DIDActivityLaunchBroadcast;->mListener:Lcom/disney/id/android/DIDActivityLaunchBroadcast$DIDActivityLaunchListener;

    .line 26
    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "com.disney.id.android.REQUEST"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 27
    .local v0, "filter":Landroid/content/IntentFilter;
    invoke-static {p1}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object v1

    iget-object v2, p0, Lcom/disney/id/android/DIDActivityLaunchBroadcast;->receiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v1, v2, v0}, Landroid/support/v4/content/LocalBroadcastManager;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)V

    .line 28
    return-void
.end method

.method public unregisterContext(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 31
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/disney/id/android/DIDActivityLaunchBroadcast;->mListener:Lcom/disney/id/android/DIDActivityLaunchBroadcast$DIDActivityLaunchListener;

    .line 32
    invoke-static {p1}, Landroid/support/v4/content/LocalBroadcastManager;->getInstance(Landroid/content/Context;)Landroid/support/v4/content/LocalBroadcastManager;

    move-result-object v0

    iget-object v1, p0, Lcom/disney/id/android/DIDActivityLaunchBroadcast;->receiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/support/v4/content/LocalBroadcastManager;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 34
    return-void
.end method
