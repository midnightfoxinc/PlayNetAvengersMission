.class public Lcom/disney/emagine/sdk/completion/EMTManifestMetadataSuccess;
.super Ljava/lang/Object;
.source "EMTManifestMetadataSuccess.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "DefaultLocale"
    }
.end annotation


# instance fields
.field private deviceId:I


# direct methods
.method public constructor <init>(I)V
    .locals 1
    .param p1, "id"    # I

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    const/4 v0, 0x0

    iput v0, p0, Lcom/disney/emagine/sdk/completion/EMTManifestMetadataSuccess;->deviceId:I

    .line 25
    iput p1, p0, Lcom/disney/emagine/sdk/completion/EMTManifestMetadataSuccess;->deviceId:I

    .line 26
    return-void
.end method


# virtual methods
.method public run()V
    .locals 0

    .prologue
    .line 38
    return-void
.end method

.method public run(Z)V
    .locals 6
    .param p1, "success"    # Z

    .prologue
    .line 30
    if-eqz p1, :cond_0

    const-string v1, "success"

    .line 31
    .local v1, "status":Ljava/lang/String;
    :goto_0
    const-string v2, "{\"device_id\":%d,\"status\":\"%s\"}"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    iget v5, p0, Lcom/disney/emagine/sdk/completion/EMTManifestMetadataSuccess;->deviceId:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x1

    aput-object v1, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 33
    .local v0, "jsonString":Ljava/lang/String;
    invoke-static {}, Lcom/disney/emagine/sdk/EMTCallback;->sharedInstance()Lcom/disney/emagine/sdk/EMTCallback;

    move-result-object v2

    const/16 v3, 0x14

    invoke-virtual {v2, v3, v0}, Lcom/disney/emagine/sdk/EMTCallback;->sendAppEvent(ILjava/lang/String;)V

    .line 34
    return-void

    .line 30
    .end local v0    # "jsonString":Ljava/lang/String;
    .end local v1    # "status":Ljava/lang/String;
    :cond_0
    const-string v1, "failed"

    goto :goto_0
.end method
