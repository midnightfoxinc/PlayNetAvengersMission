.class public Lcom/disney/emagine/sdk/marshal/EMTMarshalMessage;
.super Ljava/lang/Object;
.source "EMTMarshalMessage.java"


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private buffer:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/disney/emagine/sdk/marshal/EMTDataChunk;",
            ">;"
        }
    .end annotation
.end field

.field public mConsole:Lcom/disney/emagine/sdk/EMTConsole;

.field private message:[B


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 19
    const-class v0, Lcom/disney/emagine/sdk/marshal/EMTMarshalMessage;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/disney/emagine/sdk/marshal/EMTMarshalMessage;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/disney/emagine/sdk/marshal/EMTMarshalMessage;->buffer:Ljava/util/ArrayList;

    .line 29
    invoke-static {}, Lcom/disney/emagine/sdk/EMTConsole;->sharedInstance()Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v0

    iput-object v0, p0, Lcom/disney/emagine/sdk/marshal/EMTMarshalMessage;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    .line 30
    return-void
.end method


# virtual methods
.method public add(I)I
    .locals 1
    .param p1, "val"    # I

    .prologue
    .line 40
    new-instance v0, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;

    invoke-direct {v0, p1}, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;-><init>(I)V

    invoke-virtual {p0, v0}, Lcom/disney/emagine/sdk/marshal/EMTMarshalMessage;->add(Lcom/disney/emagine/sdk/marshal/EMTDataChunk;)I

    move-result v0

    return v0
.end method

.method public add(Lcom/disney/emagine/sdk/marshal/EMTDataChunk;)I
    .locals 2
    .param p1, "chunk"    # Lcom/disney/emagine/sdk/marshal/EMTDataChunk;

    .prologue
    .line 373
    iget-object v1, p0, Lcom/disney/emagine/sdk/marshal/EMTMarshalMessage;->buffer:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 375
    .local v0, "index":I
    iget-object v1, p0, Lcom/disney/emagine/sdk/marshal/EMTMarshalMessage;->buffer:Ljava/util/ArrayList;

    invoke-virtual {v1, v0, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 377
    return v0
.end method

.method public add(Ljava/lang/String;)I
    .locals 1
    .param p1, "val"    # Ljava/lang/String;

    .prologue
    .line 131
    new-instance v0, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;

    invoke-direct {v0, p1}, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/disney/emagine/sdk/marshal/EMTMarshalMessage;->add(Lcom/disney/emagine/sdk/marshal/EMTDataChunk;)I

    move-result v0

    return v0
.end method

.method public addArray()I
    .locals 2

    .prologue
    .line 144
    new-instance v0, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;

    const/4 v1, 0x5

    invoke-direct {v0, v1}, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;-><init>(S)V

    invoke-virtual {p0, v0}, Lcom/disney/emagine/sdk/marshal/EMTMarshalMessage;->add(Lcom/disney/emagine/sdk/marshal/EMTDataChunk;)I

    move-result v0

    return v0
.end method

.method public addArray(I)I
    .locals 1
    .param p1, "length"    # I

    .prologue
    .line 155
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/marshal/EMTMarshalMessage;->addArray()I

    move-result v0

    .line 157
    .local v0, "index":I
    invoke-virtual {p0, v0, p1}, Lcom/disney/emagine/sdk/marshal/EMTMarshalMessage;->updateChunkLengthAtPos(II)I

    .line 159
    return v0
.end method

.method public addBinary([B)I
    .locals 2
    .param p1, "blob"    # [B

    .prologue
    .line 192
    array-length v0, p1

    .line 194
    .local v0, "len":I
    const/16 v1, 0xff

    if-gt v0, v1, :cond_0

    .line 196
    invoke-virtual {p0, p1}, Lcom/disney/emagine/sdk/marshal/EMTMarshalMessage;->addShortBinary([B)I

    move-result v1

    .line 207
    :goto_0
    return v1

    .line 198
    :cond_0
    const v1, 0xffff

    if-gt v0, v1, :cond_1

    .line 200
    invoke-virtual {p0, p1}, Lcom/disney/emagine/sdk/marshal/EMTMarshalMessage;->addMediumBinary([B)I

    move-result v1

    goto :goto_0

    .line 202
    :cond_1
    const v1, 0xffffff

    if-gt v0, v1, :cond_2

    .line 204
    invoke-virtual {p0, p1}, Lcom/disney/emagine/sdk/marshal/EMTMarshalMessage;->addLongBinary([B)I

    move-result v1

    goto :goto_0

    .line 207
    :cond_2
    const/4 v1, -0x1

    goto :goto_0
.end method

.method public addBool(Z)I
    .locals 2
    .param p1, "val"    # Z

    .prologue
    .line 115
    new-instance v0, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;

    const/16 v1, 0xa

    invoke-direct {v0, v1}, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;-><init>(S)V

    .line 117
    .local v0, "chunk":Lcom/disney/emagine/sdk/marshal/EMTDataChunk;
    invoke-virtual {v0, p1}, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->setDataBool(Z)V

    .line 118
    iget-object v1, v0, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->m_data:[B

    array-length v1, v1

    invoke-virtual {v0, v1}, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->setLength(I)V

    .line 120
    invoke-virtual {p0, v0}, Lcom/disney/emagine/sdk/marshal/EMTMarshalMessage;->add(Lcom/disney/emagine/sdk/marshal/EMTDataChunk;)I

    move-result v1

    return v1
.end method

.method public addLongBinary([B)I
    .locals 2
    .param p1, "blob"    # [B

    .prologue
    .line 230
    new-instance v0, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;

    const/16 v1, 0x9

    invoke-direct {v0, v1}, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;-><init>(S)V

    .line 232
    .local v0, "chunk":Lcom/disney/emagine/sdk/marshal/EMTDataChunk;
    invoke-virtual {v0, p1}, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->setDataBinary([B)V

    .line 234
    invoke-virtual {p0, v0}, Lcom/disney/emagine/sdk/marshal/EMTMarshalMessage;->add(Lcom/disney/emagine/sdk/marshal/EMTDataChunk;)I

    move-result v1

    return v1
.end method

.method public addMap()I
    .locals 2

    .prologue
    .line 172
    new-instance v0, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;

    const/4 v1, 0x6

    invoke-direct {v0, v1}, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;-><init>(S)V

    invoke-virtual {p0, v0}, Lcom/disney/emagine/sdk/marshal/EMTMarshalMessage;->add(Lcom/disney/emagine/sdk/marshal/EMTDataChunk;)I

    move-result v0

    return v0
.end method

.method public addMap(I)I
    .locals 1
    .param p1, "length"    # I

    .prologue
    .line 183
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/marshal/EMTMarshalMessage;->addMap()I

    move-result v0

    .line 185
    .local v0, "index":I
    invoke-virtual {p0, v0, p1}, Lcom/disney/emagine/sdk/marshal/EMTMarshalMessage;->updateChunkLengthAtPos(II)I

    .line 187
    return v0
.end method

.method public addMediumBinary([B)I
    .locals 2
    .param p1, "blob"    # [B

    .prologue
    .line 221
    new-instance v0, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;

    const/16 v1, 0x8

    invoke-direct {v0, v1}, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;-><init>(S)V

    .line 223
    .local v0, "chunk":Lcom/disney/emagine/sdk/marshal/EMTDataChunk;
    invoke-virtual {v0, p1}, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->setDataBinary([B)V

    .line 225
    invoke-virtual {p0, v0}, Lcom/disney/emagine/sdk/marshal/EMTMarshalMessage;->add(Lcom/disney/emagine/sdk/marshal/EMTDataChunk;)I

    move-result v1

    return v1
.end method

.method public addNull()I
    .locals 2

    .prologue
    .line 244
    new-instance v0, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;

    const/16 v1, 0xb

    invoke-direct {v0, v1}, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;-><init>(S)V

    invoke-virtual {p0, v0}, Lcom/disney/emagine/sdk/marshal/EMTMarshalMessage;->add(Lcom/disney/emagine/sdk/marshal/EMTDataChunk;)I

    move-result v0

    return v0
.end method

.method public addShortBinary([B)I
    .locals 2
    .param p1, "blob"    # [B

    .prologue
    .line 212
    new-instance v0, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;

    const/4 v1, 0x7

    invoke-direct {v0, v1}, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;-><init>(S)V

    .line 214
    .local v0, "chunk":Lcom/disney/emagine/sdk/marshal/EMTDataChunk;
    invoke-virtual {v0, p1}, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->setDataBinary([B)V

    .line 216
    invoke-virtual {p0, v0}, Lcom/disney/emagine/sdk/marshal/EMTMarshalMessage;->add(Lcom/disney/emagine/sdk/marshal/EMTDataChunk;)I

    move-result v1

    return v1
.end method

.method public addU16(S)I
    .locals 2
    .param p1, "val"    # S

    .prologue
    .line 67
    new-instance v0, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;-><init>(S)V

    .line 69
    .local v0, "chunk":Lcom/disney/emagine/sdk/marshal/EMTDataChunk;
    invoke-virtual {v0, p1}, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->setDataU16(S)V

    .line 70
    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->setLength(I)V

    .line 72
    invoke-virtual {p0, v0}, Lcom/disney/emagine/sdk/marshal/EMTMarshalMessage;->add(Lcom/disney/emagine/sdk/marshal/EMTDataChunk;)I

    move-result v1

    return v1
.end method

.method public addU32(I)I
    .locals 2
    .param p1, "val"    # I

    .prologue
    .line 83
    new-instance v0, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;-><init>(S)V

    .line 85
    .local v0, "chunk":Lcom/disney/emagine/sdk/marshal/EMTDataChunk;
    invoke-virtual {v0, p1}, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->setDataU32(I)V

    .line 86
    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->setLength(I)V

    .line 88
    invoke-virtual {p0, v0}, Lcom/disney/emagine/sdk/marshal/EMTMarshalMessage;->add(Lcom/disney/emagine/sdk/marshal/EMTDataChunk;)I

    move-result v1

    return v1
.end method

.method public addU64(J)I
    .locals 3
    .param p1, "val"    # J

    .prologue
    .line 99
    new-instance v0, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;-><init>(S)V

    .line 101
    .local v0, "chunk":Lcom/disney/emagine/sdk/marshal/EMTDataChunk;
    invoke-virtual {v0, p1, p2}, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->setDataU64(J)V

    .line 102
    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->setLength(I)V

    .line 104
    invoke-virtual {p0, v0}, Lcom/disney/emagine/sdk/marshal/EMTMarshalMessage;->add(Lcom/disney/emagine/sdk/marshal/EMTDataChunk;)I

    move-result v1

    return v1
.end method

.method public addU8(B)I
    .locals 2
    .param p1, "val"    # B

    .prologue
    .line 51
    new-instance v0, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;-><init>(S)V

    .line 53
    .local v0, "chunk":Lcom/disney/emagine/sdk/marshal/EMTDataChunk;
    invoke-virtual {v0, p1}, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->setDataU8(B)V

    .line 54
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->setLength(I)V

    .line 56
    invoke-virtual {p0, v0}, Lcom/disney/emagine/sdk/marshal/EMTMarshalMessage;->add(Lcom/disney/emagine/sdk/marshal/EMTDataChunk;)I

    move-result v1

    return v1
.end method

.method public at(I)Lcom/disney/emagine/sdk/marshal/EMTDataChunk;
    .locals 6
    .param p1, "pos"    # I

    .prologue
    .line 323
    iget-object v0, p0, Lcom/disney/emagine/sdk/marshal/EMTMarshalMessage;->buffer:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lt p1, v0, :cond_0

    .line 325
    iget-object v0, p0, Lcom/disney/emagine/sdk/marshal/EMTMarshalMessage;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/marshal/EMTMarshalMessage;->TAG:Ljava/lang/String;

    const-string v2, "Requested position is not valid buffer size. Requested: %d | Size: %d"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    const/4 v4, 0x1

    iget-object v5, p0, Lcom/disney/emagine/sdk/marshal/EMTMarshalMessage;->buffer:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 327
    invoke-static {}, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->InvalidDataChunk()Lcom/disney/emagine/sdk/marshal/EMTDataChunk;

    move-result-object v0

    .line 330
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/disney/emagine/sdk/marshal/EMTMarshalMessage;->buffer:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;

    goto :goto_0
.end method

.method public length()I
    .locals 1

    .prologue
    .line 361
    iget-object v0, p0, Lcom/disney/emagine/sdk/marshal/EMTMarshalMessage;->buffer:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public tostream()[B
    .locals 14

    .prologue
    const/4 v13, 0x0

    .line 254
    new-array v7, v13, [B

    iput-object v7, p0, Lcom/disney/emagine/sdk/marshal/EMTMarshalMessage;->message:[B

    .line 257
    iget-object v7, p0, Lcom/disney/emagine/sdk/marshal/EMTMarshalMessage;->buffer:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_0
    :pswitch_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_1

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;

    .line 259
    .local v3, "chunk":Lcom/disney/emagine/sdk/marshal/EMTDataChunk;
    invoke-virtual {v3}, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->getType()S

    move-result v8

    int-to-byte v6, v8

    .line 261
    .local v6, "type":B
    iget-object v8, p0, Lcom/disney/emagine/sdk/marshal/EMTMarshalMessage;->message:[B

    invoke-static {v6}, Lcom/disney/emagine/sdk/EMTData;->byteToBytes(B)[B

    move-result-object v9

    invoke-static {v8, v9}, Lcom/disney/emagine/sdk/EMTData;->append([B[B)[B

    move-result-object v8

    iput-object v8, p0, Lcom/disney/emagine/sdk/marshal/EMTMarshalMessage;->message:[B

    .line 264
    invoke-virtual {v3}, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->getSizeofLength()I

    move-result v8

    if-lez v8, :cond_0

    .line 266
    invoke-virtual {v3}, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->getLength()I

    move-result v5

    .line 267
    .local v5, "length":I
    invoke-static {v5}, Lcom/disney/emagine/sdk/EMTData;->intToBytes(I)[B

    move-result-object v0

    .line 268
    .local v0, "buf":[B
    invoke-static {v0}, Lcom/disney/emagine/sdk/EMTData;->reverse([B)[B

    move-result-object v1

    .line 269
    .local v1, "buf2":[B
    invoke-virtual {v3}, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->getSizeofLength()I

    move-result v8

    invoke-static {v1, v13, v8}, Lcom/disney/emagine/sdk/EMTData;->copyOfRange([BII)[B

    move-result-object v2

    .line 271
    .local v2, "buf3":[B
    iget-object v8, p0, Lcom/disney/emagine/sdk/marshal/EMTMarshalMessage;->message:[B

    invoke-static {v8, v2}, Lcom/disney/emagine/sdk/EMTData;->append([B[B)[B

    move-result-object v8

    iput-object v8, p0, Lcom/disney/emagine/sdk/marshal/EMTMarshalMessage;->message:[B

    .line 274
    .end local v0    # "buf":[B
    .end local v1    # "buf2":[B
    .end local v2    # "buf3":[B
    .end local v5    # "length":I
    :cond_0
    invoke-virtual {v3}, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->getType()S

    move-result v8

    packed-switch v8, :pswitch_data_0

    .line 304
    iget-object v8, p0, Lcom/disney/emagine/sdk/marshal/EMTMarshalMessage;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v9, Lcom/disney/emagine/sdk/marshal/EMTMarshalMessage;->TAG:Ljava/lang/String;

    const-string v10, "Specified data type [%d] for data chunk is not supported. Skipping this data chunk."

    const/4 v11, 0x1

    new-array v11, v11, [Ljava/lang/Object;

    invoke-virtual {v3}, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->getType()S

    move-result v12

    invoke-static {v12}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v12

    aput-object v12, v11, v13

    invoke-static {v10, v11}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v8, v9, v10}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 296
    :pswitch_1
    invoke-virtual {v3}, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->getData()[B

    move-result-object v4

    .line 298
    .local v4, "data":[B
    iget-object v8, p0, Lcom/disney/emagine/sdk/marshal/EMTMarshalMessage;->message:[B

    invoke-static {v8, v4}, Lcom/disney/emagine/sdk/EMTData;->append([B[B)[B

    move-result-object v8

    iput-object v8, p0, Lcom/disney/emagine/sdk/marshal/EMTMarshalMessage;->message:[B

    goto :goto_0

    .line 310
    .end local v3    # "chunk":Lcom/disney/emagine/sdk/marshal/EMTDataChunk;
    .end local v4    # "data":[B
    .end local v6    # "type":B
    :cond_1
    iget-object v7, p0, Lcom/disney/emagine/sdk/marshal/EMTMarshalMessage;->message:[B

    return-object v7

    .line 274
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public updateChunkLengthAtPos(II)I
    .locals 1
    .param p1, "pos"    # I
    .param p2, "len"    # I

    .prologue
    .line 344
    iget-object v0, p0, Lcom/disney/emagine/sdk/marshal/EMTMarshalMessage;->buffer:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge p1, v0, :cond_0

    .line 346
    iget-object v0, p0, Lcom/disney/emagine/sdk/marshal/EMTMarshalMessage;->buffer:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;

    invoke-virtual {v0, p2}, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->setLength(I)V

    .line 348
    const/4 v0, 0x1

    .line 351
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
