.class public Lcom/disney/emagine/sdk/marshal/EMTRadioMessage;
.super Ljava/lang/Object;
.source "EMTRadioMessage.java"


# static fields
.field public static final RADIO_INVALID_ADDRESS:I = 0x0

.field public static messagePool:[Lcom/disney/emagine/sdk/marshal/EMTRadioMessage; = null

.field public static final messagePoolSize:I = 0x1e


# instance fields
.field public activityTimestamp:J

.field public address:S

.field public data:[B

.field public frameCounter:B

.field public msgId:B

.field public nextPositionDelta:S

.field public numRequested:S

.field public position:S

.field public retries:B

.field public senderAddress:S

.field public sequenceNumber:B

.field public size:S

.field public targetAddress:S

.field public txCallback:Lcom/disney/emagine/sdk/marshal/EMTRadioCallback;


# direct methods
.method public constructor <init>(S[B)V
    .locals 0
    .param p1, "address1"    # S
    .param p2, "data1"    # [B

    .prologue
    .line 72
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 73
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/marshal/EMTRadioMessage;->setRadioMessagePool()V

    .line 75
    iput-short p1, p0, Lcom/disney/emagine/sdk/marshal/EMTRadioMessage;->address:S

    .line 76
    iput-object p2, p0, Lcom/disney/emagine/sdk/marshal/EMTRadioMessage;->data:[B

    .line 77
    return-void
.end method

.method public constructor <init>(S[B[B)V
    .locals 1
    .param p1, "address1"    # S
    .param p2, "data1"    # [B
    .param p3, "data2"    # [B

    .prologue
    .line 80
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 81
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/marshal/EMTRadioMessage;->setRadioMessagePool()V

    .line 83
    iput-short p1, p0, Lcom/disney/emagine/sdk/marshal/EMTRadioMessage;->address:S

    .line 84
    invoke-static {p2, p3}, Lcom/disney/emagine/sdk/EMTData;->append([B[B)[B

    move-result-object v0

    iput-object v0, p0, Lcom/disney/emagine/sdk/marshal/EMTRadioMessage;->data:[B

    .line 85
    return-void
.end method


# virtual methods
.method public addNumberOfRequestedBytes(S)V
    .locals 1
    .param p1, "requested"    # S

    .prologue
    .line 154
    iget-short v0, p0, Lcom/disney/emagine/sdk/marshal/EMTRadioMessage;->numRequested:S

    add-int/2addr v0, p1

    int-to-short v0, v0

    iput-short v0, p0, Lcom/disney/emagine/sdk/marshal/EMTRadioMessage;->numRequested:S

    .line 156
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/marshal/EMTRadioMessage;->updateActivityTimestamp()V

    .line 157
    return-void
.end method

.method public advancePosition()V
    .locals 2

    .prologue
    .line 197
    iget-short v0, p0, Lcom/disney/emagine/sdk/marshal/EMTRadioMessage;->position:S

    iget-short v1, p0, Lcom/disney/emagine/sdk/marshal/EMTRadioMessage;->nextPositionDelta:S

    add-int/2addr v0, v1

    int-to-short v0, v0

    iput-short v0, p0, Lcom/disney/emagine/sdk/marshal/EMTRadioMessage;->position:S

    .line 198
    iget-byte v0, p0, Lcom/disney/emagine/sdk/marshal/EMTRadioMessage;->sequenceNumber:B

    add-int/lit8 v0, v0, 0x1

    int-to-byte v0, v0

    iput-byte v0, p0, Lcom/disney/emagine/sdk/marshal/EMTRadioMessage;->sequenceNumber:B

    .line 199
    const/4 v0, 0x0

    iput-byte v0, p0, Lcom/disney/emagine/sdk/marshal/EMTRadioMessage;->retries:B

    .line 201
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/marshal/EMTRadioMessage;->updateActivityTimestamp()V

    .line 202
    return-void
.end method

.method public allocate(SS)Lcom/disney/emagine/sdk/marshal/EMTRadioMessage;
    .locals 2
    .param p1, "address"    # S
    .param p2, "size"    # S

    .prologue
    .line 105
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/marshal/EMTRadioMessage;->getFreeMessage()Lcom/disney/emagine/sdk/marshal/EMTRadioMessage;

    move-result-object v0

    .line 107
    .local v0, "msg":Lcom/disney/emagine/sdk/marshal/EMTRadioMessage;
    if-eqz v0, :cond_0

    const/4 v1, 0x1

    invoke-virtual {v0, p1, p2, v1}, Lcom/disney/emagine/sdk/marshal/EMTRadioMessage;->initialize(SSZ)Z

    move-result v1

    if-nez v1, :cond_0

    .line 109
    const/4 v0, 0x0

    .line 112
    .end local v0    # "msg":Lcom/disney/emagine/sdk/marshal/EMTRadioMessage;
    :cond_0
    return-object v0
.end method

.method public allocateNoCopy(S[BS)Lcom/disney/emagine/sdk/marshal/EMTRadioMessage;
    .locals 2
    .param p1, "address"    # S
    .param p2, "data"    # [B
    .param p3, "size"    # S

    .prologue
    .line 89
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/marshal/EMTRadioMessage;->getFreeMessage()Lcom/disney/emagine/sdk/marshal/EMTRadioMessage;

    move-result-object v0

    .line 91
    .local v0, "msg":Lcom/disney/emagine/sdk/marshal/EMTRadioMessage;
    if-eqz v0, :cond_0

    const/4 v1, 0x0

    invoke-virtual {v0, p1, p3, v1}, Lcom/disney/emagine/sdk/marshal/EMTRadioMessage;->initialize(SSZ)Z

    move-result v1

    if-nez v1, :cond_0

    .line 93
    const/4 v0, 0x0

    .line 98
    :cond_0
    iput-object p2, v0, Lcom/disney/emagine/sdk/marshal/EMTRadioMessage;->data:[B

    .line 100
    return-object v0
.end method

.method public freeNoDeallocate()V
    .locals 1

    .prologue
    .line 311
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/disney/emagine/sdk/marshal/EMTRadioMessage;->data:[B

    .line 312
    return-void
.end method

.method getAddress()S
    .locals 1

    .prologue
    .line 212
    iget-short v0, p0, Lcom/disney/emagine/sdk/marshal/EMTRadioMessage;->address:S

    return v0
.end method

.method public getBytesRemaining()S
    .locals 2

    .prologue
    .line 233
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/marshal/EMTRadioMessage;->getSize()S

    move-result v0

    iget-short v1, p0, Lcom/disney/emagine/sdk/marshal/EMTRadioMessage;->position:S

    sub-int/2addr v0, v1

    int-to-short v0, v0

    return v0
.end method

.method public getCurrentData()[B
    .locals 3

    .prologue
    .line 128
    iget-object v0, p0, Lcom/disney/emagine/sdk/marshal/EMTRadioMessage;->data:[B

    iget-short v1, p0, Lcom/disney/emagine/sdk/marshal/EMTRadioMessage;->position:S

    iget-object v2, p0, Lcom/disney/emagine/sdk/marshal/EMTRadioMessage;->data:[B

    array-length v2, v2

    invoke-static {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTData;->copyOfRange([BII)[B

    move-result-object v0

    return-object v0
.end method

.method public getFreeMessage()Lcom/disney/emagine/sdk/marshal/EMTRadioMessage;
    .locals 2

    .prologue
    .line 269
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    const/16 v1, 0x1e

    if-ge v0, v1, :cond_1

    .line 271
    sget-object v1, Lcom/disney/emagine/sdk/marshal/EMTRadioMessage;->messagePool:[Lcom/disney/emagine/sdk/marshal/EMTRadioMessage;

    aget-object v1, v1, v0

    invoke-virtual {v1}, Lcom/disney/emagine/sdk/marshal/EMTRadioMessage;->isAllocated()Z

    move-result v1

    if-nez v1, :cond_0

    .line 273
    sget-object v1, Lcom/disney/emagine/sdk/marshal/EMTRadioMessage;->messagePool:[Lcom/disney/emagine/sdk/marshal/EMTRadioMessage;

    aget-object v1, v1, v0

    .line 277
    :goto_1
    return-object v1

    .line 269
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 277
    :cond_1
    const/4 v1, 0x0

    goto :goto_1
.end method

.method public getSize()S
    .locals 1

    .prologue
    .line 120
    iget-short v0, p0, Lcom/disney/emagine/sdk/marshal/EMTRadioMessage;->size:S

    return v0
.end method

.method public getTimeSinceLastActivity()J
    .locals 4

    .prologue
    const-wide/16 v0, 0x0

    .line 165
    iget-wide v2, p0, Lcom/disney/emagine/sdk/marshal/EMTRadioMessage;->activityTimestamp:J

    cmp-long v2, v2, v0

    if-lez v2, :cond_0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/disney/emagine/sdk/marshal/EMTRadioMessage;->activityTimestamp:J

    sub-long/2addr v0, v2

    :cond_0
    return-wide v0
.end method

.method public initialize(SSZ)Z
    .locals 4
    .param p1, "address1"    # S
    .param p2, "size1"    # S
    .param p3, "newbuffer"    # Z

    .prologue
    const/4 v0, 0x0

    .line 282
    if-eqz p3, :cond_0

    .line 284
    iget-short v1, p0, Lcom/disney/emagine/sdk/marshal/EMTRadioMessage;->size:S

    new-array v1, v1, [B

    iput-object v1, p0, Lcom/disney/emagine/sdk/marshal/EMTRadioMessage;->data:[B

    .line 286
    iget-object v1, p0, Lcom/disney/emagine/sdk/marshal/EMTRadioMessage;->data:[B

    if-nez v1, :cond_0

    .line 306
    :goto_0
    return v0

    .line 292
    :cond_0
    iput-byte v0, p0, Lcom/disney/emagine/sdk/marshal/EMTRadioMessage;->frameCounter:B

    .line 293
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/disney/emagine/sdk/marshal/EMTRadioMessage;->txCallback:Lcom/disney/emagine/sdk/marshal/EMTRadioCallback;

    .line 294
    iput-short p1, p0, Lcom/disney/emagine/sdk/marshal/EMTRadioMessage;->address:S

    .line 295
    iput-short v0, p0, Lcom/disney/emagine/sdk/marshal/EMTRadioMessage;->targetAddress:S

    .line 296
    iput-short v0, p0, Lcom/disney/emagine/sdk/marshal/EMTRadioMessage;->senderAddress:S

    .line 297
    iput-short p2, p0, Lcom/disney/emagine/sdk/marshal/EMTRadioMessage;->size:S

    .line 298
    iput-short v0, p0, Lcom/disney/emagine/sdk/marshal/EMTRadioMessage;->position:S

    .line 299
    iput-short v0, p0, Lcom/disney/emagine/sdk/marshal/EMTRadioMessage;->nextPositionDelta:S

    .line 300
    iput-byte v0, p0, Lcom/disney/emagine/sdk/marshal/EMTRadioMessage;->sequenceNumber:B

    .line 301
    iput-short v0, p0, Lcom/disney/emagine/sdk/marshal/EMTRadioMessage;->numRequested:S

    .line 302
    const-wide/16 v2, 0x0

    iput-wide v2, p0, Lcom/disney/emagine/sdk/marshal/EMTRadioMessage;->activityTimestamp:J

    .line 303
    iput-byte v0, p0, Lcom/disney/emagine/sdk/marshal/EMTRadioMessage;->retries:B

    .line 304
    iput-byte v0, p0, Lcom/disney/emagine/sdk/marshal/EMTRadioMessage;->msgId:B

    .line 306
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public isAllocated()Z
    .locals 1

    .prologue
    .line 217
    iget-object v0, p0, Lcom/disney/emagine/sdk/marshal/EMTRadioMessage;->data:[B

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isCompleted()Z
    .locals 2

    .prologue
    .line 225
    iget-short v0, p0, Lcom/disney/emagine/sdk/marshal/EMTRadioMessage;->position:S

    invoke-virtual {p0}, Lcom/disney/emagine/sdk/marshal/EMTRadioMessage;->getSize()S

    move-result v1

    if-lt v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public notifySender(Z)V
    .locals 1
    .param p1, "sent"    # Z

    .prologue
    .line 250
    iget-object v0, p0, Lcom/disney/emagine/sdk/marshal/EMTRadioMessage;->txCallback:Lcom/disney/emagine/sdk/marshal/EMTRadioCallback;

    if-eqz v0, :cond_0

    .line 252
    iget-object v0, p0, Lcom/disney/emagine/sdk/marshal/EMTRadioMessage;->txCallback:Lcom/disney/emagine/sdk/marshal/EMTRadioCallback;

    iget-short v0, p0, Lcom/disney/emagine/sdk/marshal/EMTRadioMessage;->address:S

    invoke-static {v0, p1}, Lcom/disney/emagine/sdk/marshal/EMTRadioCallback;->run(SZ)V

    .line 254
    :cond_0
    return-void
.end method

.method public reset()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 261
    iput-byte v0, p0, Lcom/disney/emagine/sdk/marshal/EMTRadioMessage;->sequenceNumber:B

    .line 263
    invoke-virtual {p0, v0}, Lcom/disney/emagine/sdk/marshal/EMTRadioMessage;->setCurrentPosition(S)V

    .line 264
    invoke-virtual {p0, v0}, Lcom/disney/emagine/sdk/marshal/EMTRadioMessage;->setNextPosition(S)V

    .line 265
    return-void
.end method

.method public setCurrentPosition(S)V
    .locals 0
    .param p1, "position1"    # S

    .prologue
    .line 136
    iput-short p1, p0, Lcom/disney/emagine/sdk/marshal/EMTRadioMessage;->position:S

    .line 137
    return-void
.end method

.method public setNextPosition(S)V
    .locals 0
    .param p1, "length"    # S

    .prologue
    .line 184
    iput-short p1, p0, Lcom/disney/emagine/sdk/marshal/EMTRadioMessage;->nextPositionDelta:S

    .line 186
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/marshal/EMTRadioMessage;->updateActivityTimestamp()V

    .line 187
    return-void
.end method

.method public setNumberOfRequestedBytes(S)V
    .locals 0
    .param p1, "requested"    # S

    .prologue
    .line 144
    iput-short p1, p0, Lcom/disney/emagine/sdk/marshal/EMTRadioMessage;->numRequested:S

    .line 146
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/marshal/EMTRadioMessage;->updateActivityTimestamp()V

    .line 147
    return-void
.end method

.method public setRadioMessagePool()V
    .locals 1

    .prologue
    .line 68
    const/16 v0, 0x1e

    new-array v0, v0, [Lcom/disney/emagine/sdk/marshal/EMTRadioMessage;

    sput-object v0, Lcom/disney/emagine/sdk/marshal/EMTRadioMessage;->messagePool:[Lcom/disney/emagine/sdk/marshal/EMTRadioMessage;

    .line 69
    return-void
.end method

.method public setTxCallback(Lcom/disney/emagine/sdk/marshal/EMTRadioCallback;)V
    .locals 0
    .param p1, "callback"    # Lcom/disney/emagine/sdk/marshal/EMTRadioCallback;

    .prologue
    .line 241
    iput-object p1, p0, Lcom/disney/emagine/sdk/marshal/EMTRadioMessage;->txCallback:Lcom/disney/emagine/sdk/marshal/EMTRadioCallback;

    .line 242
    return-void
.end method

.method updateActivityTimestamp()V
    .locals 2

    .prologue
    .line 173
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/disney/emagine/sdk/marshal/EMTRadioMessage;->activityTimestamp:J

    .line 174
    return-void
.end method
