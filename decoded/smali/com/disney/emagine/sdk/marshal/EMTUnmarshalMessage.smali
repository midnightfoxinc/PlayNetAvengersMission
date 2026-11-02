.class public Lcom/disney/emagine/sdk/marshal/EMTUnmarshalMessage;
.super Ljava/lang/Object;
.source "EMTUnmarshalMessage.java"


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


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 27
    const-class v0, Lcom/disney/emagine/sdk/marshal/EMTUnmarshalMessage;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/disney/emagine/sdk/marshal/EMTUnmarshalMessage;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    invoke-static {}, Lcom/disney/emagine/sdk/EMTConsole;->sharedInstance()Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v0

    iput-object v0, p0, Lcom/disney/emagine/sdk/marshal/EMTUnmarshalMessage;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    .line 36
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/disney/emagine/sdk/marshal/EMTUnmarshalMessage;->buffer:Ljava/util/ArrayList;

    .line 37
    return-void
.end method


# virtual methods
.method public chunkAt(I)Lcom/disney/emagine/sdk/marshal/EMTDataChunk;
    .locals 3
    .param p1, "i"    # I

    .prologue
    .line 70
    iget-object v0, p0, Lcom/disney/emagine/sdk/marshal/EMTUnmarshalMessage;->buffer:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge p1, v0, :cond_0

    .line 72
    iget-object v0, p0, Lcom/disney/emagine/sdk/marshal/EMTUnmarshalMessage;->buffer:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;

    .line 77
    :goto_0
    return-object v0

    .line 75
    :cond_0
    iget-object v0, p0, Lcom/disney/emagine/sdk/marshal/EMTUnmarshalMessage;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v1, Lcom/disney/emagine/sdk/marshal/EMTUnmarshalMessage;->TAG:Ljava/lang/String;

    const-string v2, "Attempting to read DataChunk from buffer that is out of buffer bounds"

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 77
    invoke-static {}, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->InvalidDataChunk()Lcom/disney/emagine/sdk/marshal/EMTDataChunk;

    move-result-object v0

    goto :goto_0
.end method

.method public length()I
    .locals 1

    .prologue
    .line 87
    iget-object v0, p0, Lcom/disney/emagine/sdk/marshal/EMTUnmarshalMessage;->buffer:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public parseChunk([BI)I
    .locals 16
    .param p1, "msg"    # [B
    .param p2, "index"    # I

    .prologue
    .line 104
    move-object/from16 v0, p1

    array-length v10, v0

    invoke-static {}, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->getMinSize()I

    move-result v11

    add-int/2addr v10, v11

    move/from16 v0, p2

    if-ge v10, v0, :cond_0

    .line 106
    const/4 v10, -0x1

    .line 253
    :goto_0
    return v10

    .line 113
    :cond_0
    aget-byte v10, p1, p2

    and-int/lit16 v10, v10, 0xff

    int-to-short v9, v10

    .line 115
    .local v9, "type":S
    new-instance v3, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;

    invoke-direct {v3, v9}, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;-><init>(S)V

    .line 117
    .local v3, "chunk":Lcom/disney/emagine/sdk/marshal/EMTDataChunk;
    add-int/lit8 p2, p2, 0x1

    .line 119
    const/4 v5, 0x0

    .line 122
    .local v5, "length":I
    invoke-virtual {v3}, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->getType()S

    move-result v10

    packed-switch v10, :pswitch_data_0

    .line 159
    :goto_1
    invoke-virtual {v3, v5}, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->setLength(I)V

    .line 161
    invoke-virtual {v3}, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->getSizeofLength()I

    move-result v10

    add-int p2, p2, v10

    .line 163
    move/from16 v0, p2

    invoke-virtual {v3, v0}, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->setOffset(I)V

    .line 166
    move-object/from16 v0, p1

    array-length v10, v0

    invoke-virtual {v3}, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->getLength()I

    move-result v11

    add-int v11, v11, p2

    if-ge v10, v11, :cond_1

    .line 168
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/disney/emagine/sdk/marshal/EMTUnmarshalMessage;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v11, Lcom/disney/emagine/sdk/marshal/EMTUnmarshalMessage;->TAG:Ljava/lang/String;

    const-string v12, "Unable to parse next chunk.  Remaining message is shorter than specified length [%d]."

    const/4 v13, 0x1

    new-array v13, v13, [Ljava/lang/Object;

    const/4 v14, 0x0

    invoke-virtual {v3}, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->getLength()I

    move-result v15

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    aput-object v15, v13, v14

    invoke-static {v12, v13}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v10, v11, v12}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 169
    const/4 v10, -0x1

    goto :goto_0

    .line 125
    :pswitch_0
    const/4 v5, 0x1

    .line 126
    goto :goto_1

    .line 129
    :pswitch_1
    const/4 v5, 0x2

    .line 130
    goto :goto_1

    .line 133
    :pswitch_2
    const/4 v5, 0x4

    .line 134
    goto :goto_1

    .line 137
    :pswitch_3
    const/16 v5, 0x8

    .line 138
    goto :goto_1

    .line 147
    :pswitch_4
    invoke-virtual {v3}, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->getSizeofLength()I

    move-result v10

    add-int v10, v10, p2

    move-object/from16 v0, p1

    move/from16 v1, p2

    invoke-static {v0, v1, v10}, Lcom/disney/emagine/sdk/EMTData;->copyOfRange([BII)[B

    move-result-object v10

    invoke-static {v10}, Lcom/disney/emagine/sdk/EMTData;->reverseBytesToInt([B)I

    move-result v5

    .line 148
    goto :goto_1

    .line 151
    :pswitch_5
    const/4 v5, 0x1

    .line 152
    goto :goto_1

    .line 155
    :pswitch_6
    const/4 v5, 0x0

    goto :goto_1

    .line 172
    :cond_1
    invoke-virtual {v3}, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->getType()S

    move-result v10

    packed-switch v10, :pswitch_data_1

    .line 241
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/disney/emagine/sdk/marshal/EMTUnmarshalMessage;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v11, Lcom/disney/emagine/sdk/marshal/EMTUnmarshalMessage;->TAG:Ljava/lang/String;

    const-string v12, "Unable to parse next chunk.  Specified type [%d] is not supported."

    const/4 v13, 0x1

    new-array v13, v13, [Ljava/lang/Object;

    const/4 v14, 0x0

    invoke-virtual {v3}, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->getType()S

    move-result v15

    invoke-static {v15}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v15

    aput-object v15, v13, v14

    invoke-static {v12, v13}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v10, v11, v12}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 242
    const/4 v10, -0x1

    goto/16 :goto_0

    .line 184
    :pswitch_7
    aget-byte v6, p1, p2

    .line 185
    .local v6, "i":B
    add-int/lit8 p2, p2, 0x1

    .line 186
    invoke-virtual {v3, v6}, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->setDataU8(B)V

    .line 245
    .end local v6    # "i":B
    :goto_2
    :pswitch_8
    move-object/from16 v0, p0

    iget-object v10, v0, Lcom/disney/emagine/sdk/marshal/EMTUnmarshalMessage;->buffer:Ljava/util/ArrayList;

    move-object/from16 v0, p0

    iget-object v11, v0, Lcom/disney/emagine/sdk/marshal/EMTUnmarshalMessage;->buffer:Ljava/util/ArrayList;

    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v11

    invoke-virtual {v10, v11, v3}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 248
    move-object/from16 v0, p1

    array-length v10, v0

    move/from16 v0, p2

    if-le v10, v0, :cond_3

    move/from16 v10, p2

    .line 250
    goto/16 :goto_0

    .line 192
    :pswitch_9
    add-int/lit8 v10, p2, 0x2

    move-object/from16 v0, p1

    move/from16 v1, p2

    invoke-static {v0, v1, v10}, Lcom/disney/emagine/sdk/EMTData;->copyOfRange([BII)[B

    move-result-object v10

    invoke-static {v10}, Lcom/disney/emagine/sdk/EMTData;->reverse([B)[B

    move-result-object v10

    invoke-static {v10}, Lcom/disney/emagine/sdk/EMTData;->bytesToShort([B)S

    move-result v6

    .line 193
    .local v6, "i":S
    add-int/lit8 p2, p2, 0x2

    .line 194
    invoke-virtual {v3, v6}, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->setDataU16(S)V

    goto :goto_2

    .line 200
    .end local v6    # "i":S
    :pswitch_a
    add-int/lit8 v10, p2, 0x4

    move-object/from16 v0, p1

    move/from16 v1, p2

    invoke-static {v0, v1, v10}, Lcom/disney/emagine/sdk/EMTData;->copyOfRange([BII)[B

    move-result-object v10

    invoke-static {v10}, Lcom/disney/emagine/sdk/EMTData;->reverse([B)[B

    move-result-object v10

    invoke-static {v10}, Lcom/disney/emagine/sdk/EMTData;->bytesToInt([B)I

    move-result v6

    .line 201
    .local v6, "i":I
    add-int/lit8 p2, p2, 0x4

    .line 202
    invoke-virtual {v3, v6}, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->setDataU32(I)V

    goto :goto_2

    .line 208
    .end local v6    # "i":I
    :pswitch_b
    add-int/lit8 v10, p2, 0x8

    move-object/from16 v0, p1

    move/from16 v1, p2

    invoke-static {v0, v1, v10}, Lcom/disney/emagine/sdk/EMTData;->copyOfRange([BII)[B

    move-result-object v10

    invoke-static {v10}, Lcom/disney/emagine/sdk/EMTData;->reverse([B)[B

    move-result-object v10

    invoke-static {v10}, Lcom/disney/emagine/sdk/EMTData;->bytesToInt([B)I

    move-result v10

    int-to-long v6, v10

    .line 209
    .local v6, "i":J
    add-int/lit8 p2, p2, 0x8

    .line 210
    invoke-virtual {v3, v6, v7}, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->setDataU64(J)V

    goto :goto_2

    .line 216
    .end local v6    # "i":J
    :pswitch_c
    aget-byte v10, p1, p2

    if-eqz v10, :cond_2

    const/4 v2, 0x1

    .line 217
    .local v2, "b":Z
    :goto_3
    add-int/lit8 p2, p2, 0x1

    .line 218
    invoke-virtual {v3, v2}, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->setDataBool(Z)V

    goto :goto_2

    .line 216
    .end local v2    # "b":Z
    :cond_2
    const/4 v2, 0x0

    goto :goto_3

    .line 224
    :pswitch_d
    invoke-virtual {v3}, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->getLength()I

    move-result v10

    add-int v10, v10, p2

    move-object/from16 v0, p1

    move/from16 v1, p2

    invoke-static {v0, v1, v10}, Lcom/disney/emagine/sdk/EMTData;->copyOfRange([BII)[B

    move-result-object v10

    invoke-static {v10}, Lcom/disney/emagine/sdk/EMTData;->bytesToString([B)Ljava/lang/String;

    move-result-object v8

    .line 225
    .local v8, "str":Ljava/lang/String;
    invoke-virtual {v3, v8}, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->setData(Ljava/lang/String;)V

    .line 226
    invoke-virtual {v3}, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->getLength()I

    move-result v10

    add-int/lit8 v10, v10, 0x1

    add-int p2, p2, v10

    .line 227
    goto/16 :goto_2

    .line 234
    .end local v8    # "str":Ljava/lang/String;
    :pswitch_e
    invoke-virtual {v3}, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->getLength()I

    move-result v10

    add-int v10, v10, p2

    move-object/from16 v0, p1

    move/from16 v1, p2

    invoke-static {v0, v1, v10}, Lcom/disney/emagine/sdk/EMTData;->copyOfRange([BII)[B

    move-result-object v4

    .line 235
    .local v4, "data":[B
    invoke-virtual {v3, v4}, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->setDataBinary([B)V

    .line 236
    invoke-virtual {v3}, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->getLength()I

    move-result v10

    add-int p2, p2, v10

    .line 237
    goto/16 :goto_2

    .line 253
    .end local v4    # "data":[B
    :cond_3
    const/4 v10, 0x0

    goto/16 :goto_0

    .line 122
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_4
        :pswitch_5
        :pswitch_6
    .end packed-switch

    .line 172
    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_7
        :pswitch_9
        :pswitch_a
        :pswitch_b
        :pswitch_d
        :pswitch_8
        :pswitch_8
        :pswitch_e
        :pswitch_e
        :pswitch_e
        :pswitch_c
        :pswitch_8
    .end packed-switch
.end method

.method public unmarshall([B)Z
    .locals 3
    .param p1, "msg"    # [B

    .prologue
    .line 52
    const/4 v0, 0x0

    .line 53
    .local v0, "index":I
    const/4 v1, 0x0

    .line 55
    .local v1, "next":I
    :cond_0
    move v0, v1

    .line 56
    invoke-virtual {p0, p1, v0}, Lcom/disney/emagine/sdk/marshal/EMTUnmarshalMessage;->parseChunk([BI)I

    move-result v1

    .line 57
    if-gtz v1, :cond_0

    .line 59
    if-nez v1, :cond_1

    const/4 v2, 0x1

    :goto_0
    return v2

    :cond_1
    const/4 v2, 0x0

    goto :goto_0
.end method
