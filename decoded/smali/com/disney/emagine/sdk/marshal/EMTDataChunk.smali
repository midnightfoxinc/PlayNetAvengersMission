.class public Lcom/disney/emagine/sdk/marshal/EMTDataChunk;
.super Ljava/lang/Object;
.source "EMTDataChunk.java"


# instance fields
.field public m_data:[B

.field public m_length:I

.field public m_offset:I

.field public m_type:S

.field public m_valid:Z


# direct methods
.method public constructor <init>(I)V
    .locals 2
    .param p1, "i"    # I

    .prologue
    const/4 v1, 0x0

    .line 51
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    const/16 v0, 0xb

    iput-short v0, p0, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->m_type:S

    .line 25
    iput v1, p0, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->m_length:I

    .line 26
    iput-boolean v1, p0, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->m_valid:Z

    .line 28
    iput v1, p0, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->m_offset:I

    .line 52
    const/4 v0, 0x2

    iput-short v0, p0, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->m_type:S

    .line 53
    const/4 v0, 0x4

    iput v0, p0, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->m_length:I

    .line 54
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->m_valid:Z

    .line 56
    invoke-virtual {p0, p1}, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->setData(I)V

    .line 58
    iput v1, p0, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->m_offset:I

    .line 59
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 3
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    const/16 v1, 0xb

    iput-short v1, p0, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->m_type:S

    .line 25
    iput v2, p0, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->m_length:I

    .line 26
    iput-boolean v2, p0, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->m_valid:Z

    .line 28
    iput v2, p0, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->m_offset:I

    .line 40
    const/4 v1, 0x4

    iput-short v1, p0, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->m_type:S

    .line 41
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    iput v1, p0, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->m_length:I

    .line 42
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->m_valid:Z

    .line 43
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 45
    .local v0, "nullString":Ljava/lang/String;
    invoke-virtual {p0, v0}, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->setData(Ljava/lang/String;)V

    .line 47
    iput v2, p0, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->m_offset:I

    .line 48
    return-void
.end method

.method public constructor <init>(S)V
    .locals 2
    .param p1, "type"    # S

    .prologue
    const/4 v1, 0x0

    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    const/16 v0, 0xb

    iput-short v0, p0, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->m_type:S

    .line 25
    iput v1, p0, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->m_length:I

    .line 26
    iput-boolean v1, p0, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->m_valid:Z

    .line 28
    iput v1, p0, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->m_offset:I

    .line 63
    iput-short p1, p0, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->m_type:S

    .line 64
    iput v1, p0, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->m_length:I

    .line 65
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->m_valid:Z

    .line 66
    iput v1, p0, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->m_offset:I

    .line 67
    return-void
.end method

.method public static InvalidDataChunk()Lcom/disney/emagine/sdk/marshal/EMTDataChunk;
    .locals 2

    .prologue
    .line 35
    new-instance v0, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;

    const/16 v1, 0xb

    invoke-direct {v0, v1}, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;-><init>(S)V

    return-object v0
.end method

.method public static getMinSize()I
    .locals 1

    .prologue
    .line 152
    const/4 v0, 0x2

    return v0
.end method


# virtual methods
.method public getData()[B
    .locals 1

    .prologue
    .line 106
    iget-object v0, p0, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->m_data:[B

    return-object v0
.end method

.method public getDataAsBinary()[B
    .locals 1

    .prologue
    .line 182
    iget-object v0, p0, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->m_data:[B

    invoke-virtual {v0}, [B->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [B

    return-object v0
.end method

.method public getDataAsString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 157
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->getData()[B

    move-result-object v0

    invoke-static {v0}, Lcom/disney/emagine/sdk/EMTData;->bytesToString([B)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getDataAsUInt16()S
    .locals 1

    .prologue
    .line 167
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->getData()[B

    move-result-object v0

    invoke-static {v0}, Lcom/disney/emagine/sdk/EMTData;->bytesToShort([B)S

    move-result v0

    return v0
.end method

.method public getDataAsUInt32()I
    .locals 1

    .prologue
    .line 172
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->getData()[B

    move-result-object v0

    invoke-static {v0}, Lcom/disney/emagine/sdk/EMTData;->bytesToInt([B)I

    move-result v0

    return v0
.end method

.method public getDataAsUInt64()J
    .locals 2

    .prologue
    .line 177
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->getData()[B

    move-result-object v0

    invoke-static {v0}, Lcom/disney/emagine/sdk/EMTData;->bytesToLong([B)J

    move-result-wide v0

    return-wide v0
.end method

.method public getDataAsUInt8()B
    .locals 1

    .prologue
    .line 162
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->getData()[B

    move-result-object v0

    invoke-static {v0}, Lcom/disney/emagine/sdk/EMTData;->bytesToByte([B)B

    move-result v0

    return v0
.end method

.method public getLength()I
    .locals 1

    .prologue
    .line 86
    iget v0, p0, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->m_length:I

    return v0
.end method

.method public getOffset()I
    .locals 1

    .prologue
    .line 91
    iget v0, p0, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->m_offset:I

    return v0
.end method

.method public getSizeofLength()I
    .locals 2

    .prologue
    const/4 v0, 0x0

    .line 118
    iget-short v1, p0, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->m_type:S

    packed-switch v1, :pswitch_data_0

    .line 141
    :goto_0
    :pswitch_0
    return v0

    .line 132
    :pswitch_1
    const/4 v0, 0x1

    goto :goto_0

    .line 135
    :pswitch_2
    const/4 v0, 0x2

    goto :goto_0

    .line 138
    :pswitch_3
    const/4 v0, 0x3

    goto :goto_0

    .line 118
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public getType()S
    .locals 1

    .prologue
    .line 71
    iget-short v0, p0, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->m_type:S

    return v0
.end method

.method public isValid()Z
    .locals 1

    .prologue
    .line 76
    iget-boolean v0, p0, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->m_valid:Z

    return v0
.end method

.method public isValidArray()Z
    .locals 1

    .prologue
    .line 273
    const/4 v0, 0x5

    invoke-virtual {p0, v0}, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->isValidByType(S)Z

    move-result v0

    return v0
.end method

.method public isValidBoolean()Z
    .locals 1

    .prologue
    .line 318
    const/16 v0, 0xa

    invoke-virtual {p0, v0}, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->isValidByType(S)Z

    move-result v0

    return v0
.end method

.method public isValidByType(S)Z
    .locals 1
    .param p1, "type"    # S

    .prologue
    .line 263
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->isValid()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->getType()S

    move-result v0

    if-ne v0, p1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isValidLongBinary()Z
    .locals 1

    .prologue
    .line 313
    const/16 v0, 0x9

    invoke-virtual {p0, v0}, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->isValidByType(S)Z

    move-result v0

    return v0
.end method

.method public isValidMap()Z
    .locals 1

    .prologue
    .line 268
    const/4 v0, 0x6

    invoke-virtual {p0, v0}, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->isValidByType(S)Z

    move-result v0

    return v0
.end method

.method public isValidMediumBinary()Z
    .locals 1

    .prologue
    .line 308
    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->isValidByType(S)Z

    move-result v0

    return v0
.end method

.method public isValidNil()Z
    .locals 1

    .prologue
    .line 323
    const/16 v0, 0xb

    invoke-virtual {p0, v0}, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->isValidByType(S)Z

    move-result v0

    return v0
.end method

.method public isValidNum16()Z
    .locals 1

    .prologue
    .line 288
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->isValidByType(S)Z

    move-result v0

    return v0
.end method

.method public isValidNum32()Z
    .locals 1

    .prologue
    .line 293
    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->isValidByType(S)Z

    move-result v0

    return v0
.end method

.method public isValidNum64()Z
    .locals 1

    .prologue
    .line 298
    const/4 v0, 0x3

    invoke-virtual {p0, v0}, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->isValidByType(S)Z

    move-result v0

    return v0
.end method

.method public isValidNum8()Z
    .locals 1

    .prologue
    .line 283
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->isValidByType(S)Z

    move-result v0

    return v0
.end method

.method public isValidShortBinary()Z
    .locals 1

    .prologue
    .line 303
    const/4 v0, 0x7

    invoke-virtual {p0, v0}, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->isValidByType(S)Z

    move-result v0

    return v0
.end method

.method public isValidString()Z
    .locals 1

    .prologue
    .line 278
    const/4 v0, 0x4

    invoke-virtual {p0, v0}, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->isValidByType(S)Z

    move-result v0

    return v0
.end method

.method public setData(I)V
    .locals 1
    .param p1, "i"    # I

    .prologue
    .line 192
    invoke-static {p1}, Lcom/disney/emagine/sdk/EMTData;->intToBytes(I)[B

    move-result-object v0

    invoke-static {v0}, Lcom/disney/emagine/sdk/EMTData;->reverse([B)[B

    move-result-object v0

    iput-object v0, p0, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->m_data:[B

    .line 193
    return-void
.end method

.method public setData(Ljava/lang/String;)V
    .locals 1
    .param p1, "str"    # Ljava/lang/String;

    .prologue
    .line 187
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    iput-object v0, p0, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->m_data:[B

    .line 188
    return-void
.end method

.method public setDataBinary([B)V
    .locals 2
    .param p1, "data"    # [B

    .prologue
    .line 223
    iget-short v0, p0, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->m_type:S

    packed-switch v0, :pswitch_data_0

    .line 259
    :cond_0
    :goto_0
    return-void

    .line 226
    :pswitch_0
    array-length v0, p1

    const/16 v1, 0xff

    if-gt v0, v1, :cond_0

    .line 253
    :cond_1
    array-length v0, p1

    invoke-virtual {p0, v0}, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->setLength(I)V

    .line 255
    if-eqz p1, :cond_0

    .line 257
    iput-object p1, p0, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->m_data:[B

    goto :goto_0

    .line 234
    :pswitch_1
    array-length v0, p1

    const v1, 0xffff

    if-le v0, v1, :cond_1

    goto :goto_0

    .line 242
    :pswitch_2
    array-length v0, p1

    const v1, 0xffffff

    if-le v0, v1, :cond_1

    goto :goto_0

    .line 223
    :pswitch_data_0
    .packed-switch 0x7
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public setDataBool(Z)V
    .locals 3
    .param p1, "b"    # Z

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 218
    new-array v2, v0, [B

    if-eqz p1, :cond_0

    :goto_0
    int-to-byte v0, v0

    aput-byte v0, v2, v1

    iput-object v2, p0, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->m_data:[B

    .line 219
    return-void

    :cond_0
    move v0, v1

    .line 218
    goto :goto_0
.end method

.method public setDataU16(S)V
    .locals 1
    .param p1, "i"    # S

    .prologue
    .line 202
    invoke-static {p1}, Lcom/disney/emagine/sdk/EMTData;->shortToBytes(S)[B

    move-result-object v0

    invoke-static {v0}, Lcom/disney/emagine/sdk/EMTData;->reverse([B)[B

    move-result-object v0

    iput-object v0, p0, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->m_data:[B

    .line 203
    return-void
.end method

.method public setDataU32(I)V
    .locals 1
    .param p1, "i"    # I

    .prologue
    .line 207
    invoke-static {p1}, Lcom/disney/emagine/sdk/EMTData;->intToBytes(I)[B

    move-result-object v0

    invoke-static {v0}, Lcom/disney/emagine/sdk/EMTData;->reverse([B)[B

    move-result-object v0

    iput-object v0, p0, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->m_data:[B

    .line 208
    return-void
.end method

.method public setDataU64(J)V
    .locals 1
    .param p1, "i"    # J

    .prologue
    .line 212
    invoke-static {p1, p2}, Lcom/disney/emagine/sdk/EMTData;->longToBytes(J)[B

    move-result-object v0

    invoke-static {v0}, Lcom/disney/emagine/sdk/EMTData;->reverse([B)[B

    move-result-object v0

    iput-object v0, p0, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->m_data:[B

    .line 213
    return-void
.end method

.method public setDataU8(B)V
    .locals 1
    .param p1, "i"    # B

    .prologue
    .line 197
    invoke-static {p1}, Lcom/disney/emagine/sdk/EMTData;->byteToBytes(B)[B

    move-result-object v0

    iput-object v0, p0, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->m_data:[B

    .line 198
    return-void
.end method

.method public setLength(I)V
    .locals 0
    .param p1, "length"    # I

    .prologue
    .line 96
    iput p1, p0, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->m_length:I

    .line 97
    return-void
.end method

.method public setOffset(I)V
    .locals 0
    .param p1, "offset"    # I

    .prologue
    .line 101
    iput p1, p0, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->m_offset:I

    .line 102
    return-void
.end method

.method public setType(S)V
    .locals 0
    .param p1, "type"    # S

    .prologue
    .line 81
    iput-short p1, p0, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->m_type:S

    .line 82
    return-void
.end method
