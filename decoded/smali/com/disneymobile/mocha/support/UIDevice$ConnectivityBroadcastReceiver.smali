.class Lcom/disneymobile/mocha/support/UIDevice$ConnectivityBroadcastReceiver;
.super Landroid/content/BroadcastReceiver;
.source "UIDevice.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/disneymobile/mocha/support/UIDevice;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ConnectivityBroadcastReceiver"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/disneymobile/mocha/support/UIDevice;


# direct methods
.method private constructor <init>(Lcom/disneymobile/mocha/support/UIDevice;)V
    .locals 0

    .prologue
    .line 219
    iput-object p1, p0, Lcom/disneymobile/mocha/support/UIDevice$ConnectivityBroadcastReceiver;->this$0:Lcom/disneymobile/mocha/support/UIDevice;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/disneymobile/mocha/support/UIDevice;Lcom/disneymobile/mocha/support/UIDevice$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/disneymobile/mocha/support/UIDevice;
    .param p2, "x1"    # Lcom/disneymobile/mocha/support/UIDevice$1;

    .prologue
    .line 219
    invoke-direct {p0, p1}, Lcom/disneymobile/mocha/support/UIDevice$ConnectivityBroadcastReceiver;-><init>(Lcom/disneymobile/mocha/support/UIDevice;)V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 222
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "action: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 225
    sget-object v0, Lcom/disneymobile/mocha/support/UIDevice;->currentDevice:Lcom/disneymobile/mocha/support/UIDevice;

    .line 226
    .local v0, "currentDevice":Lcom/disneymobile/mocha/support/UIDevice;
    invoke-virtual {v0}, Lcom/disneymobile/mocha/support/UIDevice;->internetConnectionStatus()Lcom/disneymobile/network/DMONetworkStatus;

    move-result-object v1

    .line 227
    .local v1, "currentStatus":Lcom/disneymobile/network/DMONetworkStatus;
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 228
    .local v2, "userInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v3, "previousStatus"

    invoke-static {v0}, Lcom/disneymobile/mocha/support/UIDevice;->access$100(Lcom/disneymobile/mocha/support/UIDevice;)Lcom/disneymobile/network/DMONetworkStatus;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 229
    const-string v3, "currentStatus"

    invoke-virtual {v2, v3, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 230
    invoke-static {}, Lcom/disneymobile/mocha/NSNotificationCenter;->defaultCenter()Lcom/disneymobile/mocha/NSNotificationCenter;

    move-result-object v3

    const-string v4, "DMOReachabilityChangedNotification"

    invoke-virtual {v3, v4, v0, v2}, Lcom/disneymobile/mocha/NSNotificationCenter;->postNotificationNameObjectAndUserInfo(Ljava/lang/String;Ljava/lang/Object;Ljava/util/HashMap;)V

    .line 232
    invoke-static {v0, v1}, Lcom/disneymobile/mocha/support/UIDevice;->access$102(Lcom/disneymobile/mocha/support/UIDevice;Lcom/disneymobile/network/DMONetworkStatus;)Lcom/disneymobile/network/DMONetworkStatus;

    .line 235
    return-void
.end method
