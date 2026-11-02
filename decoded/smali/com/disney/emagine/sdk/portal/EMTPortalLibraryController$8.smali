.class Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$8;
.super Ljava/lang/Object;
.source "EMTPortalLibraryController.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->onScanDevices(Lcom/disney/emagine/sdk/transitionkit/TKTransition;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

.field final synthetic val$controller:Lcom/disney/emagine/sdk/ble/EMTController;

.field final synthetic val$whiteListDevice:J


# direct methods
.method constructor <init>(Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;JLcom/disney/emagine/sdk/ble/EMTController;)V
    .locals 0
    .param p1, "this$0"    # Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    .prologue
    .line 3081
    iput-object p1, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$8;->this$0:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    iput-wide p2, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$8;->val$whiteListDevice:J

    iput-object p4, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$8;->val$controller:Lcom/disney/emagine/sdk/ble/EMTController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 3084
    iget-object v0, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$8;->this$0:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    invoke-static {v0}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->access$200(Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;)Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v0

    invoke-static {}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->access$100()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Whitelisting device: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-wide v4, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$8;->val$whiteListDevice:J

    invoke-virtual {v2, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 3085
    iget-object v0, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$8;->val$controller:Lcom/disney/emagine/sdk/ble/EMTController;

    invoke-virtual {v0}, Lcom/disney/emagine/sdk/ble/EMTController;->whitelistDevice()V

    .line 3086
    return-void
.end method
