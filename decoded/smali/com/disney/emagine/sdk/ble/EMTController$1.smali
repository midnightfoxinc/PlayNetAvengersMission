.class Lcom/disney/emagine/sdk/ble/EMTController$1;
.super Landroid/content/BroadcastReceiver;
.source "EMTController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/disney/emagine/sdk/ble/EMTController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/disney/emagine/sdk/ble/EMTController;


# direct methods
.method constructor <init>(Lcom/disney/emagine/sdk/ble/EMTController;)V
    .locals 0
    .param p1, "this$0"    # Lcom/disney/emagine/sdk/ble/EMTController;

    .prologue
    .line 107
    iput-object p1, p0, Lcom/disney/emagine/sdk/ble/EMTController$1;->this$0:Lcom/disney/emagine/sdk/ble/EMTController;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 110
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 112
    .local v0, "action":Ljava/lang/String;
    const-string v3, "android.bluetooth.adapter.action.STATE_CHANGED"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 113
    const-string v3, "android.bluetooth.adapter.extra.STATE"

    const/4 v4, -0x1

    invoke-virtual {p2, v3, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    .line 114
    .local v1, "newState":I
    const/16 v3, 0xc

    if-ne v1, v3, :cond_0

    .line 116
    invoke-static {}, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->sharedInstance()Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;

    move-result-object v2

    .line 117
    .local v2, "tkStateMachine":Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;
    const-string v3, "Disconnect"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->fireEventUnconditionally(Ljava/lang/Object;Ljava/util/HashMap;)Lcom/disney/emagine/sdk/apple/NSError;

    .line 120
    .end local v1    # "newState":I
    .end local v2    # "tkStateMachine":Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;
    :cond_0
    return-void
.end method
