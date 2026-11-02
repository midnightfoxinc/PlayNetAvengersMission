.class Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$9;
.super Ljava/lang/Object;
.source "EMTPortalLibraryController.java"

# interfaces
.implements Lcom/disney/emagine/sdk/foreground/Foreground$Listener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;


# direct methods
.method constructor <init>(Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;)V
    .locals 0
    .param p1, "this$0"    # Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    .prologue
    .line 3447
    iput-object p1, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$9;->this$0:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onBecameBackground()V
    .locals 6

    .prologue
    .line 3461
    iget-object v2, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$9;->this$0:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    invoke-static {v2}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->access$200(Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;)Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v2

    invoke-static {}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->access$100()Ljava/lang/String;

    move-result-object v3

    const-string v4, "Application is about to go to background."

    invoke-virtual {v2, v3, v4}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 3463
    iget-object v2, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$9;->this$0:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    invoke-static {v2}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->access$700(Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;)Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;

    move-result-object v2

    const-string v3, "Scanning"

    invoke-virtual {v2, v3}, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->isInState(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 3465
    iget-object v2, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$9;->this$0:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    invoke-virtual {v2}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->bleController()Lcom/disney/emagine/sdk/ble/EMTController;

    move-result-object v0

    .line 3466
    .local v0, "controller":Lcom/disney/emagine/sdk/ble/EMTController;
    invoke-virtual {v0}, Lcom/disney/emagine/sdk/ble/EMTController;->stopScanning()V

    .line 3476
    .end local v0    # "controller":Lcom/disney/emagine/sdk/ble/EMTController;
    :cond_0
    :goto_0
    return-void

    .line 3470
    :cond_1
    iget-object v2, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$9;->this$0:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    invoke-virtual {v2}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->currentDevice()Lcom/disney/emagine/sdk/ble/EMTDevice;

    move-result-object v1

    .line 3471
    .local v1, "currentDevice":Lcom/disney/emagine/sdk/ble/EMTDevice;
    if-eqz v1, :cond_0

    .line 3473
    iget-object v2, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$9;->this$0:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    iget-wide v4, v1, Lcom/disney/emagine/sdk/ble/EMTDevice;->deviceId:J

    long-to-int v3, v4

    invoke-virtual {v2, v3}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->disconnect(I)V

    goto :goto_0
.end method

.method public onBecameForeground()V
    .locals 4

    .prologue
    .line 3450
    iget-object v1, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$9;->this$0:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    invoke-static {v1}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->access$200(Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;)Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v1

    invoke-static {}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->access$100()Ljava/lang/String;

    move-result-object v2

    const-string v3, "Application is about to go to foreground."

    invoke-virtual {v1, v2, v3}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 3452
    iget-object v1, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$9;->this$0:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    invoke-static {v1}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->access$700(Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;)Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;

    move-result-object v1

    const-string v2, "Scanning"

    invoke-virtual {v1, v2}, Lcom/disney/emagine/sdk/transitionkit/TKStateMachine;->isInState(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 3454
    iget-object v1, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$9;->this$0:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    invoke-virtual {v1}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->bleController()Lcom/disney/emagine/sdk/ble/EMTController;

    move-result-object v0

    .line 3455
    .local v0, "controller":Lcom/disney/emagine/sdk/ble/EMTController;
    invoke-virtual {v0}, Lcom/disney/emagine/sdk/ble/EMTController;->beginScanning()V

    .line 3457
    .end local v0    # "controller":Lcom/disney/emagine/sdk/ble/EMTController;
    :cond_0
    return-void
.end method
