.class public Lcom/disney/emagine/sdk/completion/EMTRegisterUserTokenSuccess;
.super Ljava/lang/Object;
.source "EMTRegisterUserTokenSuccess.java"

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

    iput v0, p0, Lcom/disney/emagine/sdk/completion/EMTRegisterUserTokenSuccess;->deviceId:I

    .line 22
    iput-object p1, p0, Lcom/disney/emagine/sdk/completion/EMTRegisterUserTokenSuccess;->delegate:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    .line 23
    iput p2, p0, Lcom/disney/emagine/sdk/completion/EMTRegisterUserTokenSuccess;->deviceId:I

    .line 24
    return-void
.end method


# virtual methods
.method public run()V
    .locals 0

    .prologue
    .line 34
    return-void
.end method

.method public run([B)V
    .locals 2
    .param p1, "token"    # [B

    .prologue
    .line 28
    iget-object v0, p0, Lcom/disney/emagine/sdk/completion/EMTRegisterUserTokenSuccess;->delegate:Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;

    iget v1, p0, Lcom/disney/emagine/sdk/completion/EMTRegisterUserTokenSuccess;->deviceId:I

    invoke-virtual {v0, p1, v1}, Lcom/disney/emagine/sdk/portal/EMTPortalLibraryController;->sendTokenForDeviceId([BI)V

    .line 29
    return-void
.end method
