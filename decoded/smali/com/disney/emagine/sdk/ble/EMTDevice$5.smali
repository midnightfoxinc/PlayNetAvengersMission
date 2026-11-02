.class Lcom/disney/emagine/sdk/ble/EMTDevice$5;
.super Ljava/lang/Object;
.source "EMTDevice.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/disney/emagine/sdk/ble/EMTDevice;->encodeAndSendOperation(SLcom/disney/emagine/sdk/EMTMessage;Ljava/util/HashMap;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/disney/emagine/sdk/ble/EMTDevice;

.field final synthetic val$message:Lcom/disney/emagine/sdk/EMTMessage;

.field final synthetic val$opcode:S

.field final synthetic val$parameters:Ljava/util/HashMap;


# direct methods
.method constructor <init>(Lcom/disney/emagine/sdk/ble/EMTDevice;SLjava/util/HashMap;Lcom/disney/emagine/sdk/EMTMessage;)V
    .locals 0
    .param p1, "this$0"    # Lcom/disney/emagine/sdk/ble/EMTDevice;

    .prologue
    .line 2500
    iput-object p1, p0, Lcom/disney/emagine/sdk/ble/EMTDevice$5;->this$0:Lcom/disney/emagine/sdk/ble/EMTDevice;

    iput-short p2, p0, Lcom/disney/emagine/sdk/ble/EMTDevice$5;->val$opcode:S

    iput-object p3, p0, Lcom/disney/emagine/sdk/ble/EMTDevice$5;->val$parameters:Ljava/util/HashMap;

    iput-object p4, p0, Lcom/disney/emagine/sdk/ble/EMTDevice$5;->val$message:Lcom/disney/emagine/sdk/EMTMessage;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 2502
    iget-object v2, p0, Lcom/disney/emagine/sdk/ble/EMTDevice$5;->this$0:Lcom/disney/emagine/sdk/ble/EMTDevice;

    invoke-static {v2}, Lcom/disney/emagine/sdk/ble/EMTDevice;->access$600(Lcom/disney/emagine/sdk/ble/EMTDevice;)Ljava/util/ArrayList;

    move-result-object v3

    monitor-enter v3

    .line 2505
    :try_start_0
    iget-short v2, p0, Lcom/disney/emagine/sdk/ble/EMTDevice$5;->val$opcode:S

    const/16 v4, 0x4005

    if-ne v2, v4, :cond_0

    .line 2507
    new-instance v1, Ljava/util/HashMap;

    iget-object v2, p0, Lcom/disney/emagine/sdk/ble/EMTDevice$5;->val$parameters:Ljava/util/HashMap;

    invoke-direct {v1, v2}, Ljava/util/HashMap;-><init>(Ljava/util/Map;)V

    .line 2509
    .local v1, "operation":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v2, "opcode"

    iget-short v4, p0, Lcom/disney/emagine/sdk/ble/EMTDevice$5;->val$opcode:S

    invoke-static {v4}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v4

    invoke-virtual {v1, v2, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2510
    iget-object v2, p0, Lcom/disney/emagine/sdk/ble/EMTDevice$5;->this$0:Lcom/disney/emagine/sdk/ble/EMTDevice;

    invoke-static {v2}, Lcom/disney/emagine/sdk/ble/EMTDevice;->access$600(Lcom/disney/emagine/sdk/ble/EMTDevice;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2512
    .end local v1    # "operation":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_0
    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2515
    iget-object v2, p0, Lcom/disney/emagine/sdk/ble/EMTDevice$5;->val$message:Lcom/disney/emagine/sdk/EMTMessage;

    iget-object v2, v2, Lcom/disney/emagine/sdk/EMTMessage;->data:[B

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/disney/emagine/sdk/ble/EMTDevice$5;->val$parameters:Ljava/util/HashMap;

    if-eqz v2, :cond_4

    .line 2517
    :cond_1
    iget-object v2, p0, Lcom/disney/emagine/sdk/ble/EMTDevice$5;->this$0:Lcom/disney/emagine/sdk/ble/EMTDevice;

    iget-short v3, p0, Lcom/disney/emagine/sdk/ble/EMTDevice$5;->val$opcode:S

    iget-object v4, p0, Lcom/disney/emagine/sdk/ble/EMTDevice$5;->val$parameters:Ljava/util/HashMap;

    invoke-static {v2, v3, v4}, Lcom/disney/emagine/sdk/ble/EMTDevice;->access$700(Lcom/disney/emagine/sdk/ble/EMTDevice;SLjava/util/HashMap;)[B

    move-result-object v0

    .line 2519
    .local v0, "data":[B
    iget-object v2, p0, Lcom/disney/emagine/sdk/ble/EMTDevice$5;->val$message:Lcom/disney/emagine/sdk/EMTMessage;

    iput-object v0, v2, Lcom/disney/emagine/sdk/EMTMessage;->data:[B

    .line 2526
    .end local v0    # "data":[B
    :cond_2
    :goto_0
    iget-object v2, p0, Lcom/disney/emagine/sdk/ble/EMTDevice$5;->val$message:Lcom/disney/emagine/sdk/EMTMessage;

    iget-object v3, p0, Lcom/disney/emagine/sdk/ble/EMTDevice$5;->val$message:Lcom/disney/emagine/sdk/EMTMessage;

    iget-object v3, v3, Lcom/disney/emagine/sdk/EMTMessage;->data:[B

    array-length v3, v3

    int-to-long v4, v3

    iput-wide v4, v2, Lcom/disney/emagine/sdk/EMTMessage;->length:J

    .line 2528
    iget-object v2, p0, Lcom/disney/emagine/sdk/ble/EMTDevice$5;->this$0:Lcom/disney/emagine/sdk/ble/EMTDevice;

    invoke-static {v2}, Lcom/disney/emagine/sdk/ble/EMTDevice;->access$1000(Lcom/disney/emagine/sdk/ble/EMTDevice;)Lcom/disney/emagine/sdk/crypto/EMTCrypto;

    .line 2530
    iget-object v2, p0, Lcom/disney/emagine/sdk/ble/EMTDevice$5;->this$0:Lcom/disney/emagine/sdk/ble/EMTDevice;

    invoke-static {v2}, Lcom/disney/emagine/sdk/ble/EMTDevice;->access$1100(Lcom/disney/emagine/sdk/ble/EMTDevice;)Lcom/disney/emagine/sdk/keystore/EMTKeyStore;

    move-result-object v2

    iget-object v3, p0, Lcom/disney/emagine/sdk/ble/EMTDevice$5;->val$message:Lcom/disney/emagine/sdk/EMTMessage;

    iget-byte v3, v3, Lcom/disney/emagine/sdk/EMTMessage;->keySlot:B

    invoke-virtual {v2, v3}, Lcom/disney/emagine/sdk/keystore/EMTKeyStore;->isKeyAvailable(B)Z

    move-result v2

    if-nez v2, :cond_3

    .line 2532
    iget-object v2, p0, Lcom/disney/emagine/sdk/ble/EMTDevice$5;->val$message:Lcom/disney/emagine/sdk/EMTMessage;

    const/4 v3, 0x0

    iput-byte v3, v2, Lcom/disney/emagine/sdk/EMTMessage;->keySlot:B

    .line 2535
    :cond_3
    iget-object v2, p0, Lcom/disney/emagine/sdk/ble/EMTDevice$5;->this$0:Lcom/disney/emagine/sdk/ble/EMTDevice;

    invoke-static {v2}, Lcom/disney/emagine/sdk/ble/EMTDevice;->access$1000(Lcom/disney/emagine/sdk/ble/EMTDevice;)Lcom/disney/emagine/sdk/crypto/EMTCrypto;

    .line 2556
    iget-object v2, p0, Lcom/disney/emagine/sdk/ble/EMTDevice$5;->this$0:Lcom/disney/emagine/sdk/ble/EMTDevice;

    invoke-static {v2}, Lcom/disney/emagine/sdk/ble/EMTDevice;->access$1000(Lcom/disney/emagine/sdk/ble/EMTDevice;)Lcom/disney/emagine/sdk/crypto/EMTCrypto;

    .line 2561
    iget-object v2, p0, Lcom/disney/emagine/sdk/ble/EMTDevice$5;->this$0:Lcom/disney/emagine/sdk/ble/EMTDevice;

    iget-object v3, p0, Lcom/disney/emagine/sdk/ble/EMTDevice$5;->val$message:Lcom/disney/emagine/sdk/EMTMessage;

    invoke-static {v2, v3}, Lcom/disney/emagine/sdk/ble/EMTDevice;->access$1200(Lcom/disney/emagine/sdk/ble/EMTDevice;Lcom/disney/emagine/sdk/EMTMessage;)Z

    .line 2562
    return-void

    .line 2512
    :catchall_0
    move-exception v2

    :try_start_1
    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v2

    .line 2521
    :cond_4
    iget-object v2, p0, Lcom/disney/emagine/sdk/ble/EMTDevice$5;->val$message:Lcom/disney/emagine/sdk/EMTMessage;

    iget-object v2, v2, Lcom/disney/emagine/sdk/EMTMessage;->data:[B

    array-length v2, v2

    if-nez v2, :cond_2

    .line 2523
    iget-object v2, p0, Lcom/disney/emagine/sdk/ble/EMTDevice$5;->this$0:Lcom/disney/emagine/sdk/ble/EMTDevice;

    invoke-static {v2}, Lcom/disney/emagine/sdk/ble/EMTDevice;->access$900(Lcom/disney/emagine/sdk/ble/EMTDevice;)Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v2

    invoke-static {}, Lcom/disney/emagine/sdk/ble/EMTDevice;->access$800()Ljava/lang/String;

    move-result-object v3

    const-string v4, "Error, there should be data in the message if the parameter is null."

    invoke-virtual {v2, v3, v4}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method
