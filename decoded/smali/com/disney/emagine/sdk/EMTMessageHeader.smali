.class public Lcom/disney/emagine/sdk/EMTMessageHeader;
.super Ljava/lang/Object;
.source "EMTMessageHeader.java"


# static fields
.field public static final BLE_STATUS_CONNECTED:I = 0x1

.field public static final BLE_STATUS_DISCONNECTED:I = 0x0

.field public static final MAX_BLE_PAYLOAD_SIZE:I = 0x14

.field public static final MAX_BLE_SEND_PAYLOAD_SIZE:I = 0x50

.field public static final MAX_PAYLOAD_SIZE:I = 0x80

.field public static final MAX_RADIO_ERR_PAYLOAD_SIZE:I = 0x10

.field public static final MAX_VERSION_SIZE:I = 0x30

.field public static final NUM_RADIO_CHANNELS:I = 0x4

.field public static final RADIO_BLE_ADDRESS:I = 0xfffe

.field public static final RADIO_BROADCAST_ADDRESS:I = 0xffff

.field public static final RADIO_INVALID_ADDRESS:I = 0x0

.field public static final RADIO_KEY_FACTORY:I = 0x1

.field public static final RADIO_KEY_NONE:I = 0x0

.field public static final RADIO_KEY_OWNER:I = 0x2

.field public static final RADIO_KEY_SESSION:I = 0x3

.field public static final RADIO_NUM_KEY_SLOTS:I = 0x4

.field public static final RADIO_PAN_COORD_ADDRESS:I = 0x1


# instance fields
.field private header:[B


# direct methods
.method public constructor <init>([B)V
    .locals 1
    .param p1, "data"    # [B

    .prologue
    .line 73
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 74
    invoke-virtual {p1}, [B->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    iput-object v0, p0, Lcom/disney/emagine/sdk/EMTMessageHeader;->header:[B

    .line 75
    return-void
.end method


# virtual methods
.method public frameCounter()I
    .locals 4

    .prologue
    .line 175
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/EMTMessageHeader;->isForwardFlagSet()Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v0, 0x7

    .line 176
    .local v0, "offset":I
    :goto_0
    iget-object v2, p0, Lcom/disney/emagine/sdk/EMTMessageHeader;->header:[B

    aget-byte v2, v2, v0

    and-int/lit16 v2, v2, 0xff

    shl-int/lit8 v1, v2, 0x18

    .line 178
    .local v1, "value":I
    iget-object v2, p0, Lcom/disney/emagine/sdk/EMTMessageHeader;->header:[B

    add-int/lit8 v3, v0, 0x1

    aget-byte v2, v2, v3

    and-int/lit16 v2, v2, 0xff

    shl-int/lit8 v2, v2, 0x10

    or-int/2addr v1, v2

    .line 179
    iget-object v2, p0, Lcom/disney/emagine/sdk/EMTMessageHeader;->header:[B

    add-int/lit8 v3, v0, 0x2

    aget-byte v2, v2, v3

    and-int/lit16 v2, v2, 0xff

    shl-int/lit8 v2, v2, 0x8

    or-int/2addr v1, v2

    .line 180
    iget-object v2, p0, Lcom/disney/emagine/sdk/EMTMessageHeader;->header:[B

    add-int/lit8 v3, v0, 0x3

    aget-byte v2, v2, v3

    and-int/lit16 v2, v2, 0xff

    or-int/2addr v1, v2

    .line 182
    return v1

    .line 175
    .end local v0    # "offset":I
    .end local v1    # "value":I
    :cond_0
    const/4 v0, 0x3

    goto :goto_0
.end method

.method public header()[B
    .locals 1

    .prologue
    .line 251
    iget-object v0, p0, Lcom/disney/emagine/sdk/EMTMessageHeader;->header:[B

    return-object v0
.end method

.method public headerLength(I)I
    .locals 3
    .param p1, "length"    # I

    .prologue
    const/4 v1, 0x0

    .line 206
    const/4 v0, 0x1

    .line 208
    .local v0, "size":I
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/EMTMessageHeader;->sequenceNumber()B

    move-result v2

    if-nez v2, :cond_3

    .line 212
    add-int/lit8 v0, v0, 0x2

    .line 215
    if-le v0, p1, :cond_1

    .line 246
    :cond_0
    :goto_0
    return v1

    .line 220
    :cond_1
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/EMTMessageHeader;->isForwardFlagSet()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 224
    add-int/lit8 v0, v0, 0x4

    .line 227
    if-gt v0, p1, :cond_0

    .line 233
    :cond_2
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/EMTMessageHeader;->isFrameCounterFlagSet()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 237
    add-int/lit8 v0, v0, 0x4

    .line 239
    if-gt v0, p1, :cond_0

    :cond_3
    move v1, v0

    .line 246
    goto :goto_0
.end method

.method public isForwardFlagSet()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 109
    iget-object v1, p0, Lcom/disney/emagine/sdk/EMTMessageHeader;->header:[B

    aget-byte v1, v1, v0

    and-int/lit8 v1, v1, 0x10

    if-eqz v1, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isFrameCounterFlagSet()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 167
    iget-object v1, p0, Lcom/disney/emagine/sdk/EMTMessageHeader;->header:[B

    aget-byte v1, v1, v0

    and-int/lit8 v1, v1, 0x8

    if-lez v1, :cond_0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public keySlot()B
    .locals 2

    .prologue
    .line 79
    iget-object v0, p0, Lcom/disney/emagine/sdk/EMTMessageHeader;->header:[B

    const/4 v1, 0x0

    aget-byte v0, v0, v1

    shr-int/lit8 v0, v0, 0x6

    and-int/lit8 v0, v0, 0x3

    int-to-byte v0, v0

    return v0
.end method

.method public messageSize()S
    .locals 4

    .prologue
    .line 121
    iget-object v2, p0, Lcom/disney/emagine/sdk/EMTMessageHeader;->header:[B

    const/4 v3, 0x2

    aget-byte v2, v2, v3

    and-int/lit16 v2, v2, 0xff

    int-to-short v1, v2

    .line 122
    .local v1, "size2":S
    iget-object v2, p0, Lcom/disney/emagine/sdk/EMTMessageHeader;->header:[B

    const/4 v3, 0x1

    aget-byte v2, v2, v3

    and-int/lit8 v2, v2, 0x3

    shl-int/lit8 v2, v2, 0x8

    int-to-short v0, v2

    .line 123
    .local v0, "size1":S
    add-int v2, v0, v1

    add-int/lit8 v2, v2, 0x1

    int-to-short v2, v2

    return v2
.end method

.method public protocolVersion()B
    .locals 2

    .prologue
    .line 99
    iget-object v0, p0, Lcom/disney/emagine/sdk/EMTMessageHeader;->header:[B

    const/4 v1, 0x1

    aget-byte v0, v0, v1

    shr-int/lit8 v0, v0, 0x5

    and-int/lit8 v0, v0, 0x7

    int-to-byte v0, v0

    return v0
.end method

.method public senderAddress()I
    .locals 3

    .prologue
    .line 153
    iget-object v0, p0, Lcom/disney/emagine/sdk/EMTMessageHeader;->header:[B

    const/4 v1, 0x5

    aget-byte v0, v0, v1

    shl-int/lit8 v0, v0, 0x8

    iget-object v1, p0, Lcom/disney/emagine/sdk/EMTMessageHeader;->header:[B

    const/4 v2, 0x6

    aget-byte v1, v1, v2

    or-int/2addr v0, v1

    return v0
.end method

.method public sequenceNumber()B
    .locals 2

    .prologue
    .line 89
    iget-object v0, p0, Lcom/disney/emagine/sdk/EMTMessageHeader;->header:[B

    const/4 v1, 0x0

    aget-byte v0, v0, v1

    and-int/lit8 v0, v0, 0x3f

    int-to-byte v0, v0

    return v0
.end method

.method public setForwardFlag()V
    .locals 3

    .prologue
    .line 114
    iget-object v0, p0, Lcom/disney/emagine/sdk/EMTMessageHeader;->header:[B

    const/4 v1, 0x1

    aget-byte v2, v0, v1

    or-int/lit8 v2, v2, 0x10

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 115
    return-void
.end method

.method public setFrameCounter(I)V
    .locals 4
    .param p1, "value"    # I

    .prologue
    .line 192
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/EMTMessageHeader;->isForwardFlagSet()Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x7

    .line 194
    .local v0, "offset":I
    :goto_0
    iget-object v1, p0, Lcom/disney/emagine/sdk/EMTMessageHeader;->header:[B

    add-int/lit8 v2, v0, 0x0

    shr-int/lit8 v3, p1, 0x18

    and-int/lit16 v3, v3, 0xff

    int-to-byte v3, v3

    aput-byte v3, v1, v2

    .line 195
    iget-object v1, p0, Lcom/disney/emagine/sdk/EMTMessageHeader;->header:[B

    add-int/lit8 v2, v0, 0x1

    shr-int/lit8 v3, p1, 0x10

    and-int/lit16 v3, v3, 0xff

    int-to-byte v3, v3

    aput-byte v3, v1, v2

    .line 196
    iget-object v1, p0, Lcom/disney/emagine/sdk/EMTMessageHeader;->header:[B

    add-int/lit8 v2, v0, 0x2

    shr-int/lit8 v3, p1, 0x8

    and-int/lit16 v3, v3, 0xff

    int-to-byte v3, v3

    aput-byte v3, v1, v2

    .line 197
    iget-object v1, p0, Lcom/disney/emagine/sdk/EMTMessageHeader;->header:[B

    add-int/lit8 v2, v0, 0x3

    shr-int/lit8 v3, p1, 0x0

    and-int/lit16 v3, v3, 0xff

    int-to-byte v3, v3

    aput-byte v3, v1, v2

    .line 200
    iget-object v1, p0, Lcom/disney/emagine/sdk/EMTMessageHeader;->header:[B

    const/4 v2, 0x1

    aget-byte v3, v1, v2

    or-int/lit8 v3, v3, 0x8

    int-to-byte v3, v3

    aput-byte v3, v1, v2

    .line 201
    return-void

    .line 192
    .end local v0    # "offset":I
    :cond_0
    const/4 v0, 0x3

    goto :goto_0
.end method

.method public setKeySlot(B)V
    .locals 4
    .param p1, "slot"    # B

    .prologue
    .line 84
    iget-object v0, p0, Lcom/disney/emagine/sdk/EMTMessageHeader;->header:[B

    const/4 v1, 0x0

    aget-byte v2, v0, v1

    shl-int/lit8 v3, p1, 0x6

    and-int/lit16 v3, v3, 0xc0

    or-int/2addr v2, v3

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 85
    return-void
.end method

.method public setMessageSize(S)V
    .locals 7
    .param p1, "size"    # S

    .prologue
    const/4 v6, 0x1

    .line 129
    add-int/lit8 v3, p1, -0x1

    int-to-short p1, v3

    .line 131
    invoke-static {p1}, Lcom/disney/emagine/sdk/EMTData;->shortToBytes(S)[B

    move-result-object v0

    .line 132
    .local v0, "bigEndianSize":[B
    const/4 v3, 0x0

    aget-byte v1, v0, v3

    .line 133
    .local v1, "bsize0":B
    aget-byte v2, v0, v6

    .line 135
    .local v2, "bsize1":B
    iget-object v3, p0, Lcom/disney/emagine/sdk/EMTMessageHeader;->header:[B

    aget-byte v4, v3, v6

    and-int/lit8 v4, v4, -0x4

    int-to-byte v4, v4

    aput-byte v4, v3, v6

    .line 136
    iget-object v3, p0, Lcom/disney/emagine/sdk/EMTMessageHeader;->header:[B

    aget-byte v4, v3, v6

    and-int/lit8 v5, v1, 0x3

    int-to-byte v5, v5

    or-int/2addr v4, v5

    int-to-byte v4, v4

    aput-byte v4, v3, v6

    .line 137
    iget-object v3, p0, Lcom/disney/emagine/sdk/EMTMessageHeader;->header:[B

    const/4 v4, 0x2

    aput-byte v2, v3, v4

    .line 138
    return-void
.end method

.method public setProtocolVersion(B)V
    .locals 4
    .param p1, "version"    # B

    .prologue
    .line 104
    iget-object v0, p0, Lcom/disney/emagine/sdk/EMTMessageHeader;->header:[B

    const/4 v1, 0x1

    aget-byte v2, v0, v1

    shl-int/lit8 v3, p1, 0x5

    or-int/2addr v2, v3

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 105
    return-void
.end method

.method public setSenderAddress(I)V
    .locals 3
    .param p1, "address"    # I

    .prologue
    .line 158
    iget-object v0, p0, Lcom/disney/emagine/sdk/EMTMessageHeader;->header:[B

    const/4 v1, 0x5

    shr-int/lit8 v2, p1, 0x8

    and-int/lit16 v2, v2, 0xff

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 159
    iget-object v0, p0, Lcom/disney/emagine/sdk/EMTMessageHeader;->header:[B

    const/4 v1, 0x6

    and-int/lit16 v2, p1, 0xff

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 160
    return-void
.end method

.method public setSequenceNumber(B)V
    .locals 4
    .param p1, "sequence"    # B

    .prologue
    .line 94
    iget-object v0, p0, Lcom/disney/emagine/sdk/EMTMessageHeader;->header:[B

    const/4 v1, 0x0

    aget-byte v2, v0, v1

    and-int/lit8 v3, p1, 0x3f

    or-int/2addr v2, v3

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 95
    return-void
.end method

.method public setTargetAddress(I)V
    .locals 3
    .param p1, "address"    # I

    .prologue
    .line 147
    iget-object v0, p0, Lcom/disney/emagine/sdk/EMTMessageHeader;->header:[B

    const/4 v1, 0x3

    shr-int/lit8 v2, p1, 0x8

    and-int/lit16 v2, v2, 0xff

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 148
    iget-object v0, p0, Lcom/disney/emagine/sdk/EMTMessageHeader;->header:[B

    const/4 v1, 0x4

    and-int/lit16 v2, p1, 0xff

    int-to-byte v2, v2

    aput-byte v2, v0, v1

    .line 149
    return-void
.end method

.method public targetAddress()I
    .locals 3

    .prologue
    .line 142
    iget-object v0, p0, Lcom/disney/emagine/sdk/EMTMessageHeader;->header:[B

    const/4 v1, 0x3

    aget-byte v0, v0, v1

    shl-int/lit8 v0, v0, 0x8

    iget-object v1, p0, Lcom/disney/emagine/sdk/EMTMessageHeader;->header:[B

    const/4 v2, 0x4

    aget-byte v1, v1, v2

    or-int/2addr v0, v1

    return v0
.end method
