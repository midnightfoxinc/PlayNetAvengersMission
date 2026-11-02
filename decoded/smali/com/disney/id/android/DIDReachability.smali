.class public Lcom/disney/id/android/DIDReachability;
.super Ljava/lang/Object;
.source "DIDReachability.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/disney/id/android/DIDReachability$DIDReachabilityListener;
    }
.end annotation


# instance fields
.field private mListener:Lcom/disney/id/android/DIDReachability$DIDReachabilityListener;

.field private final receiver:Landroid/content/BroadcastReceiver;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    new-instance v0, Lcom/disney/id/android/DIDReachability$1;

    invoke-direct {v0, p0}, Lcom/disney/id/android/DIDReachability$1;-><init>(Lcom/disney/id/android/DIDReachability;)V

    iput-object v0, p0, Lcom/disney/id/android/DIDReachability;->receiver:Landroid/content/BroadcastReceiver;

    .line 41
    return-void
.end method

.method static synthetic access$000(Lcom/disney/id/android/DIDReachability;Landroid/content/Context;)V
    .locals 0
    .param p0, "x0"    # Lcom/disney/id/android/DIDReachability;
    .param p1, "x1"    # Landroid/content/Context;

    .prologue
    .line 10
    invoke-direct {p0, p1}, Lcom/disney/id/android/DIDReachability;->updateStatus(Landroid/content/Context;)V

    return-void
.end method

.method private updateStatus(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 22
    invoke-static {p1}, Lcom/disney/id/android/DIDUtils;->isContextAlive(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 23
    iget-object v0, p0, Lcom/disney/id/android/DIDReachability;->mListener:Lcom/disney/id/android/DIDReachability$DIDReachabilityListener;

    if-eqz v0, :cond_0

    .line 24
    iget-object v0, p0, Lcom/disney/id/android/DIDReachability;->mListener:Lcom/disney/id/android/DIDReachability$DIDReachabilityListener;

    invoke-static {p1}, Lcom/disney/id/android/DIDWebUtils;->isConnected(Landroid/content/Context;)Z

    move-result v1

    invoke-interface {v0, v1}, Lcom/disney/id/android/DIDReachability$DIDReachabilityListener;->onNetworkReachabilityChange(Z)V

    .line 27
    :cond_0
    return-void
.end method


# virtual methods
.method public registerContext(Landroid/content/Context;Lcom/disney/id/android/DIDReachability$DIDReachabilityListener;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "listener"    # Lcom/disney/id/android/DIDReachability$DIDReachabilityListener;

    .prologue
    .line 30
    iput-object p2, p0, Lcom/disney/id/android/DIDReachability;->mListener:Lcom/disney/id/android/DIDReachability$DIDReachabilityListener;

    .line 31
    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "android.net.conn.CONNECTIVITY_CHANGE"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 32
    .local v0, "filter":Landroid/content/IntentFilter;
    iget-object v1, p0, Lcom/disney/id/android/DIDReachability;->receiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p1, v1, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 33
    invoke-direct {p0, p1}, Lcom/disney/id/android/DIDReachability;->updateStatus(Landroid/content/Context;)V

    .line 34
    return-void
.end method

.method public unregisterContext(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 37
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/disney/id/android/DIDReachability;->mListener:Lcom/disney/id/android/DIDReachability$DIDReachabilityListener;

    .line 38
    iget-object v0, p0, Lcom/disney/id/android/DIDReachability;->receiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p1, v0}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 39
    return-void
.end method
