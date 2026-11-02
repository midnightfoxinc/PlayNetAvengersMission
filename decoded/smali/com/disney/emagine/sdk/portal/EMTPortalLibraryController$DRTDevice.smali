.class public Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$DRTDevice;
.super Ljava/lang/Object;
.source "EMTPortalLibraryController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "DRTDevice"
.end annotation


# instance fields
.field public deviceHSwid:S

.field public deviceId:I

.field public deviceType:I

.field public imHereFlags:S

.field public lastTimeBeaconReceived:J

.field final synthetic this$0:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;


# direct methods
.method public constructor <init>(Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;)V
    .locals 0
    .param p1, "this$0"    # Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    .prologue
    .line 133
    iput-object p1, p0, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController$DRTDevice;->this$0:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
