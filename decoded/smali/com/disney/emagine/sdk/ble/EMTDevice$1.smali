.class Lcom/disney/emagine/sdk/ble/EMTDevice$1;
.super Ljava/util/TimerTask;
.source "EMTDevice.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/disney/emagine/sdk/ble/EMTDevice;->respondWithNonce()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private hashSeed:[B

.field final synthetic this$0:Lcom/disney/emagine/sdk/ble/EMTDevice;


# direct methods
.method constructor <init>(Lcom/disney/emagine/sdk/ble/EMTDevice;)V
    .locals 1
    .param p1, "this$0"    # Lcom/disney/emagine/sdk/ble/EMTDevice;

    .prologue
    .line 409
    iput-object p1, p0, Lcom/disney/emagine/sdk/ble/EMTDevice$1;->this$0:Lcom/disney/emagine/sdk/ble/EMTDevice;

    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    .line 410
    const/16 v0, 0xa

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    iput-object v0, p0, Lcom/disney/emagine/sdk/ble/EMTDevice$1;->hashSeed:[B

    return-void

    nop

    :array_0
    .array-data 1
        0x74t
        0x68t
        -0x26t
        -0x60t
        0xet
        -0xct
        -0x59t
        0x27t
        -0x10t
        -0x59t
    .end array-data
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 414
    const/4 v1, 0x0

    .line 415
    .local v1, "md":Ljava/security/MessageDigest;
    const/4 v2, 0x0

    .line 419
    .local v2, "mdBytes":[B
    :try_start_0
    const-string v3, "SHA1"

    invoke-static {v3}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v1

    .line 421
    iget-object v3, p0, Lcom/disney/emagine/sdk/ble/EMTDevice$1;->hashSeed:[B

    invoke-virtual {v1, v3}, Ljava/security/MessageDigest;->update([B)V

    .line 422
    iget-object v3, p0, Lcom/disney/emagine/sdk/ble/EMTDevice$1;->this$0:Lcom/disney/emagine/sdk/ble/EMTDevice;

    invoke-static {v3}, Lcom/disney/emagine/sdk/ble/EMTDevice;->access$000(Lcom/disney/emagine/sdk/ble/EMTDevice;)[B

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/security/MessageDigest;->update([B)V

    .line 423
    iget-object v3, p0, Lcom/disney/emagine/sdk/ble/EMTDevice$1;->this$0:Lcom/disney/emagine/sdk/ble/EMTDevice;

    invoke-static {v3}, Lcom/disney/emagine/sdk/ble/EMTDevice;->access$100(Lcom/disney/emagine/sdk/ble/EMTDevice;)[B

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/security/MessageDigest;->update([B)V

    .line 425
    invoke-virtual {v1}, Ljava/security/MessageDigest;->digest()[B
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 432
    :goto_0
    iget-object v3, p0, Lcom/disney/emagine/sdk/ble/EMTDevice$1;->this$0:Lcom/disney/emagine/sdk/ble/EMTDevice;

    const/4 v4, 0x0

    iget-object v5, p0, Lcom/disney/emagine/sdk/ble/EMTDevice$1;->this$0:Lcom/disney/emagine/sdk/ble/EMTDevice;

    invoke-static {v5}, Lcom/disney/emagine/sdk/ble/EMTDevice;->access$300(Lcom/disney/emagine/sdk/ble/EMTDevice;)B

    move-result v5

    invoke-static {v2, v4, v5}, Lcom/disney/emagine/sdk/EMTData;->copyOfRange([BII)[B

    move-result-object v4

    invoke-static {v3, v4}, Lcom/disney/emagine/sdk/ble/EMTDevice;->access$202(Lcom/disney/emagine/sdk/ble/EMTDevice;[B)[B

    .line 435
    iget-object v3, p0, Lcom/disney/emagine/sdk/ble/EMTDevice$1;->this$0:Lcom/disney/emagine/sdk/ble/EMTDevice;

    const/4 v4, 0x1

    iput-boolean v4, v3, Lcom/disney/emagine/sdk/ble/EMTDevice;->nonceEstablished:Z

    .line 438
    iget-object v3, p0, Lcom/disney/emagine/sdk/ble/EMTDevice$1;->this$0:Lcom/disney/emagine/sdk/ble/EMTDevice;

    iget-object v3, v3, Lcom/disney/emagine/sdk/ble/EMTDevice;->controller:Lcom/disney/emagine/sdk/ble/EMTController;

    invoke-virtual {v3}, Lcom/disney/emagine/sdk/ble/EMTController;->deviceIsReadyForApplication()V

    .line 439
    return-void

    .line 427
    :catch_0
    move-exception v0

    .line 429
    .local v0, "e":Ljava/security/NoSuchAlgorithmException;
    invoke-virtual {v0}, Ljava/security/NoSuchAlgorithmException;->printStackTrace()V

    goto :goto_0
.end method
