.class public Lcom/disney/emagine/sdk/completion/EMTUnregisterDeviceSucccess;
.super Ljava/lang/Object;
.source "EMTUnregisterDeviceSucccess.java"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field delegate:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

.field deviceId:I


# direct methods
.method public constructor <init>(Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;I)V
    .locals 1
    .param p1, "del"    # Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;
    .param p2, "id"    # I

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    const/4 v0, 0x0

    iput v0, p0, Lcom/disney/emagine/sdk/completion/EMTUnregisterDeviceSucccess;->deviceId:I

    .line 22
    iput-object p1, p0, Lcom/disney/emagine/sdk/completion/EMTUnregisterDeviceSucccess;->delegate:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    .line 23
    iput p2, p0, Lcom/disney/emagine/sdk/completion/EMTUnregisterDeviceSucccess;->deviceId:I

    .line 24
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 34
    iget-object v0, p0, Lcom/disney/emagine/sdk/completion/EMTUnregisterDeviceSucccess;->delegate:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    iget v1, p0, Lcom/disney/emagine/sdk/completion/EMTUnregisterDeviceSucccess;->deviceId:I

    invoke-virtual {v0, v1}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->unregisterToy(I)V

    .line 35
    return-void
.end method

.method public run(Ljava/lang/String;)V
    .locals 2
    .param p1, "response"    # Ljava/lang/String;

    .prologue
    .line 28
    iget-object v0, p0, Lcom/disney/emagine/sdk/completion/EMTUnregisterDeviceSucccess;->delegate:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    iget v1, p0, Lcom/disney/emagine/sdk/completion/EMTUnregisterDeviceSucccess;->deviceId:I

    invoke-virtual {v0, v1}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->unregisterToy(I)V

    .line 29
    return-void
.end method
