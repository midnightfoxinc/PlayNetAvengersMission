.class public Lcom/disney/emagine/sdk/marshal/EMTSerializer;
.super Ljava/lang/Object;
.source "EMTSerializer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/disney/emagine/sdk/marshal/EMTSerializer$PMPData;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private currentChunkIndex:I

.field public mConsole:Lcom/disney/emagine/sdk/EMTConsole;

.field private marshaller:Lcom/disney/emagine/sdk/marshal/EMTMarshalMessage;

.field private serializerDebug:Z

.field private unmarshaller:Lcom/disney/emagine/sdk/marshal/EMTUnmarshalMessage;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 25
    const-class v0, Lcom/disney/emagine/sdk/marshal/EMTSerializer;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/disney/emagine/sdk/marshal/EMTSerializer;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    iput v0, p0, Lcom/disney/emagine/sdk/marshal/EMTSerializer;->currentChunkIndex:I

    .line 38
    iput-boolean v0, p0, Lcom/disney/emagine/sdk/marshal/EMTSerializer;->serializerDebug:Z

    .line 44
    new-instance v0, Lcom/disney/emagine/sdk/marshal/EMTMarshalMessage;

    invoke-direct {v0}, Lcom/disney/emagine/sdk/marshal/EMTMarshalMessage;-><init>()V

    iput-object v0, p0, Lcom/disney/emagine/sdk/marshal/EMTSerializer;->marshaller:Lcom/disney/emagine/sdk/marshal/EMTMarshalMessage;

    .line 45
    new-instance v0, Lcom/disney/emagine/sdk/marshal/EMTUnmarshalMessage;

    invoke-direct {v0}, Lcom/disney/emagine/sdk/marshal/EMTUnmarshalMessage;-><init>()V

    iput-object v0, p0, Lcom/disney/emagine/sdk/marshal/EMTSerializer;->unmarshaller:Lcom/disney/emagine/sdk/marshal/EMTUnmarshalMessage;

    .line 46
    invoke-static {}, Lcom/disney/emagine/sdk/EMTConsole;->sharedInstance()Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v0

    iput-object v0, p0, Lcom/disney/emagine/sdk/marshal/EMTSerializer;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    .line 47
    return-void
.end method


# virtual methods
.method public JsonFromPMP([B)Ljava/lang/String;
    .locals 2
    .param p1, "pmp"    # [B

    .prologue
    .line 63
    invoke-virtual {p0, p1}, Lcom/disney/emagine/sdk/marshal/EMTSerializer;->deserializeWithData([B)Ljava/lang/Object;

    move-result-object v1

    .line 65
    .local v1, "obj":Ljava/lang/Object;
    if-nez v1, :cond_0

    .line 67
    const/4 v0, 0x0

    .line 72
    :goto_0
    return-object v0

    .line 70
    :cond_0
    invoke-virtual {p0, v1}, Lcom/disney/emagine/sdk/marshal/EMTSerializer;->jsonStringFromObject(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 72
    .local v0, "json":Ljava/lang/String;
    goto :goto_0
.end method

.method public ObjectFromJsonString(Ljava/lang/String;)Ljava/lang/Object;
    .locals 3
    .param p1, "jsonString"    # Ljava/lang/String;

    .prologue
    .line 103
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    invoke-static {v2}, Lcom/disney/emagine/sdk/EMTData;->bytesToUTF8String([B)Ljava/lang/String;

    move-result-object v0

    .line 104
    .local v0, "json":Ljava/lang/String;
    invoke-static {v0}, Lcom/disney/emagine/sdk/json/EMTJson;->javaObjectFromJsonString(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 106
    .local v1, "jsonObject":Ljava/lang/Object;
    return-object v1
.end method

.method public PMPFromJson(Ljava/lang/String;)Lcom/disney/emagine/sdk/marshal/EMTSerializer$PMPData;
    .locals 2
    .param p1, "jsonString"    # Ljava/lang/String;

    .prologue
    .line 52
    invoke-static {p1}, Lcom/disney/emagine/sdk/json/EMTJson;->javaObjectFromJsonString(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 54
    .local v1, "jObject":Ljava/lang/Object;
    invoke-virtual {p0, v1}, Lcom/disney/emagine/sdk/marshal/EMTSerializer;->PMPFromJsonObject(Ljava/lang/Object;)V

    .line 56
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/marshal/EMTSerializer;->serialize()Lcom/disney/emagine/sdk/marshal/EMTSerializer$PMPData;

    move-result-object v0

    .line 58
    .local v0, "data":Lcom/disney/emagine/sdk/marshal/EMTSerializer$PMPData;
    return-object v0
.end method

.method public PMPFromJsonObject(Ljava/lang/Object;)V
    .locals 7
    .param p1, "javaObject"    # Ljava/lang/Object;

    .prologue
    .line 149
    instance-of v5, p1, Ljava/util/List;

    if-eqz v5, :cond_0

    move-object v5, p1

    .line 151
    check-cast v5, Ljava/util/List;

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v0

    .line 153
    .local v0, "count":I
    iget-object v5, p0, Lcom/disney/emagine/sdk/marshal/EMTSerializer;->marshaller:Lcom/disney/emagine/sdk/marshal/EMTMarshalMessage;

    invoke-virtual {v5}, Lcom/disney/emagine/sdk/marshal/EMTMarshalMessage;->addArray()I

    .line 154
    iget-object v5, p0, Lcom/disney/emagine/sdk/marshal/EMTSerializer;->marshaller:Lcom/disney/emagine/sdk/marshal/EMTMarshalMessage;

    iget-object v6, p0, Lcom/disney/emagine/sdk/marshal/EMTSerializer;->marshaller:Lcom/disney/emagine/sdk/marshal/EMTMarshalMessage;

    invoke-virtual {v6}, Lcom/disney/emagine/sdk/marshal/EMTMarshalMessage;->length()I

    move-result v6

    add-int/lit8 v6, v6, -0x1

    invoke-virtual {v5, v6, v0}, Lcom/disney/emagine/sdk/marshal/EMTMarshalMessage;->updateChunkLengthAtPos(II)I

    .line 156
    check-cast p1, Ljava/util/List;

    .end local p1    # "javaObject":Ljava/lang/Object;
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    .line 158
    .local v4, "value":Ljava/lang/Object;
    invoke-virtual {p0, v4}, Lcom/disney/emagine/sdk/marshal/EMTSerializer;->serializeChunk(Ljava/lang/Object;)V

    goto :goto_0

    .line 161
    .end local v0    # "count":I
    .end local v4    # "value":Ljava/lang/Object;
    .restart local p1    # "javaObject":Ljava/lang/Object;
    :cond_0
    instance-of v5, p1, Ljava/util/Map;

    if-eqz v5, :cond_3

    .line 163
    iget-object v5, p0, Lcom/disney/emagine/sdk/marshal/EMTSerializer;->marshaller:Lcom/disney/emagine/sdk/marshal/EMTMarshalMessage;

    invoke-virtual {v5}, Lcom/disney/emagine/sdk/marshal/EMTMarshalMessage;->addMap()I

    .line 165
    iget-object v5, p0, Lcom/disney/emagine/sdk/marshal/EMTSerializer;->marshaller:Lcom/disney/emagine/sdk/marshal/EMTMarshalMessage;

    invoke-virtual {v5}, Lcom/disney/emagine/sdk/marshal/EMTMarshalMessage;->length()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    int-to-long v2, v5

    .line 166
    .local v2, "pos":J
    const/4 v0, 0x0

    .restart local v0    # "count":I
    move-object v5, p1

    .line 168
    check-cast v5, Ljava/util/Map;

    invoke-interface {v5}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_1
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    .local v1, "key":Ljava/lang/Object;
    move-object v5, p1

    .line 170
    check-cast v5, Ljava/util/Map;

    invoke-interface {v5, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .line 172
    .restart local v4    # "value":Ljava/lang/Object;
    invoke-virtual {p0, v1}, Lcom/disney/emagine/sdk/marshal/EMTSerializer;->serializeChunk(Ljava/lang/Object;)V

    .line 173
    invoke-virtual {p0, v4}, Lcom/disney/emagine/sdk/marshal/EMTSerializer;->serializeChunk(Ljava/lang/Object;)V

    .line 175
    add-int/lit8 v0, v0, 0x1

    .line 176
    goto :goto_1

    .line 178
    .end local v1    # "key":Ljava/lang/Object;
    .end local v4    # "value":Ljava/lang/Object;
    :cond_1
    iget-object v5, p0, Lcom/disney/emagine/sdk/marshal/EMTSerializer;->marshaller:Lcom/disney/emagine/sdk/marshal/EMTMarshalMessage;

    long-to-int v6, v2

    invoke-virtual {v5, v6, v0}, Lcom/disney/emagine/sdk/marshal/EMTMarshalMessage;->updateChunkLengthAtPos(II)I

    .line 185
    .end local v0    # "count":I
    .end local v2    # "pos":J
    .end local p1    # "javaObject":Ljava/lang/Object;
    :cond_2
    :goto_2
    return-void

    .line 180
    .restart local p1    # "javaObject":Ljava/lang/Object;
    :cond_3
    instance-of v5, p1, [B

    if-eqz v5, :cond_2

    .line 182
    iget-object v5, p0, Lcom/disney/emagine/sdk/marshal/EMTSerializer;->marshaller:Lcom/disney/emagine/sdk/marshal/EMTMarshalMessage;

    check-cast p1, [B

    .end local p1    # "javaObject":Ljava/lang/Object;
    check-cast p1, [B

    invoke-virtual {v5, p1}, Lcom/disney/emagine/sdk/marshal/EMTMarshalMessage;->addBinary([B)I

    goto :goto_2
.end method

.method public PMPFromObject(Ljava/lang/Object;)Lcom/disney/emagine/sdk/marshal/EMTSerializer$PMPData;
    .locals 1
    .param p1, "object"    # Ljava/lang/Object;

    .prologue
    .line 111
    invoke-virtual {p0, p1}, Lcom/disney/emagine/sdk/marshal/EMTSerializer;->PMPFromJsonObject(Ljava/lang/Object;)V

    .line 113
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/marshal/EMTSerializer;->serialize()Lcom/disney/emagine/sdk/marshal/EMTSerializer$PMPData;

    move-result-object v0

    .line 115
    .local v0, "data":Lcom/disney/emagine/sdk/marshal/EMTSerializer$PMPData;
    return-object v0
.end method

.method public deserializeArray(Lcom/disney/emagine/sdk/marshal/EMTDataChunk;)Ljava/lang/Object;
    .locals 4
    .param p1, "chunk"    # Lcom/disney/emagine/sdk/marshal/EMTDataChunk;

    .prologue
    .line 374
    invoke-virtual {p1}, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->getLength()I

    move-result v2

    .line 376
    .local v2, "len":I
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 379
    .local v0, "array":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Object;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v2, :cond_1

    .line 384
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/marshal/EMTSerializer;->deserializeChunk()Ljava/lang/Object;

    move-result-object v3

    .line 386
    .local v3, "obj":Ljava/lang/Object;
    if-eqz v3, :cond_0

    .line 388
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 379
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 392
    .end local v3    # "obj":Ljava/lang/Object;
    :cond_1
    return-object v0
.end method

.method public deserializeBinary(Lcom/disney/emagine/sdk/marshal/EMTDataChunk;)Ljava/lang/Object;
    .locals 4
    .param p1, "chunk"    # Lcom/disney/emagine/sdk/marshal/EMTDataChunk;

    .prologue
    .line 442
    invoke-virtual {p1}, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->getDataAsBinary()[B

    move-result-object v0

    .line 443
    .local v0, "chunkData":[B
    invoke-virtual {p1}, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->getLength()I

    move-result v2

    .line 445
    .local v2, "len":I
    invoke-static {v2}, Lcom/disney/emagine/sdk/EMTData;->intToBytes(I)[B

    move-result-object v3

    invoke-static {v3}, Lcom/disney/emagine/sdk/EMTData;->reverse([B)[B

    move-result-object v1

    .line 447
    .local v1, "data":[B
    invoke-static {v1, v0}, Lcom/disney/emagine/sdk/EMTData;->append([B[B)[B

    move-result-object v1

    .line 451
    return-object v1
.end method

.method public deserializeChunk()Ljava/lang/Object;
    .locals 5

    .prologue
    .line 245
    const/4 v1, 0x0

    .line 247
    .local v1, "obj":Ljava/lang/Object;
    iget v2, p0, Lcom/disney/emagine/sdk/marshal/EMTSerializer;->currentChunkIndex:I

    iget-object v3, p0, Lcom/disney/emagine/sdk/marshal/EMTSerializer;->unmarshaller:Lcom/disney/emagine/sdk/marshal/EMTUnmarshalMessage;

    invoke-virtual {v3}, Lcom/disney/emagine/sdk/marshal/EMTUnmarshalMessage;->length()I

    move-result v3

    if-lt v2, v3, :cond_0

    .line 249
    iget-object v2, p0, Lcom/disney/emagine/sdk/marshal/EMTSerializer;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v3, Lcom/disney/emagine/sdk/marshal/EMTSerializer;->TAG:Ljava/lang/String;

    const-string v4, "Current index out of buffer array bounds"

    invoke-virtual {v2, v3, v4}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 252
    :cond_0
    iget-object v2, p0, Lcom/disney/emagine/sdk/marshal/EMTSerializer;->unmarshaller:Lcom/disney/emagine/sdk/marshal/EMTUnmarshalMessage;

    iget v3, p0, Lcom/disney/emagine/sdk/marshal/EMTSerializer;->currentChunkIndex:I

    add-int/lit8 v4, v3, 0x1

    iput v4, p0, Lcom/disney/emagine/sdk/marshal/EMTSerializer;->currentChunkIndex:I

    invoke-virtual {v2, v3}, Lcom/disney/emagine/sdk/marshal/EMTUnmarshalMessage;->chunkAt(I)Lcom/disney/emagine/sdk/marshal/EMTDataChunk;

    move-result-object v0

    .line 254
    .local v0, "chunk":Lcom/disney/emagine/sdk/marshal/EMTDataChunk;
    invoke-virtual {v0}, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->getType()S

    move-result v2

    packed-switch v2, :pswitch_data_0

    .line 287
    .end local v1    # "obj":Ljava/lang/Object;
    :goto_0
    :pswitch_0
    return-object v1

    .line 260
    .restart local v1    # "obj":Ljava/lang/Object;
    :pswitch_1
    invoke-virtual {p0, v0}, Lcom/disney/emagine/sdk/marshal/EMTSerializer;->toNumber(Lcom/disney/emagine/sdk/marshal/EMTDataChunk;)Ljava/lang/Object;

    move-result-object v1

    .line 261
    goto :goto_0

    .line 264
    :pswitch_2
    invoke-virtual {p0, v0}, Lcom/disney/emagine/sdk/marshal/EMTSerializer;->toString(Lcom/disney/emagine/sdk/marshal/EMTDataChunk;)Ljava/lang/Object;

    move-result-object v1

    .line 265
    goto :goto_0

    .line 268
    :pswitch_3
    invoke-virtual {p0, v0}, Lcom/disney/emagine/sdk/marshal/EMTSerializer;->toBoolean(Lcom/disney/emagine/sdk/marshal/EMTDataChunk;)Ljava/lang/Object;

    move-result-object v1

    .line 269
    goto :goto_0

    .line 272
    :pswitch_4
    invoke-virtual {p0, v0}, Lcom/disney/emagine/sdk/marshal/EMTSerializer;->deserializeArray(Lcom/disney/emagine/sdk/marshal/EMTDataChunk;)Ljava/lang/Object;

    move-result-object v1

    .line 273
    goto :goto_0

    .line 276
    :pswitch_5
    invoke-virtual {p0, v0}, Lcom/disney/emagine/sdk/marshal/EMTSerializer;->deserializeMap(Lcom/disney/emagine/sdk/marshal/EMTDataChunk;)Ljava/lang/Object;

    move-result-object v1

    .line 277
    goto :goto_0

    .line 280
    :pswitch_6
    invoke-virtual {p0, v0}, Lcom/disney/emagine/sdk/marshal/EMTSerializer;->deserializeBinary(Lcom/disney/emagine/sdk/marshal/EMTDataChunk;)Ljava/lang/Object;

    move-result-object v1

    .line 281
    goto :goto_0

    .line 254
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_2
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_0
        :pswitch_0
        :pswitch_3
    .end packed-switch
.end method

.method public deserializeMap(Lcom/disney/emagine/sdk/marshal/EMTDataChunk;)Ljava/lang/Object;
    .locals 9
    .param p1, "chunk"    # Lcom/disney/emagine/sdk/marshal/EMTDataChunk;

    .prologue
    .line 403
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 404
    .local v0, "dict":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-virtual {p1}, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->getLength()I

    move-result v4

    .line 407
    .local v4, "len":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v4, :cond_2

    .line 413
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/marshal/EMTSerializer;->deserializeChunk()Ljava/lang/Object;

    move-result-object v3

    .line 415
    .local v3, "keyValue":Ljava/lang/Object;
    instance-of v6, v3, Ljava/lang/Number;

    if-eqz v6, :cond_1

    .line 417
    check-cast v3, Ljava/lang/Number;

    .end local v3    # "keyValue":Ljava/lang/Object;
    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    .line 425
    :cond_0
    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    .line 426
    .local v2, "key":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/marshal/EMTSerializer;->deserializeChunk()Ljava/lang/Object;

    move-result-object v5

    .line 428
    .local v5, "valueObj":Ljava/lang/Object;
    invoke-virtual {v0, v2, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 407
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 419
    .end local v2    # "key":Ljava/lang/String;
    .end local v5    # "valueObj":Ljava/lang/Object;
    .restart local v3    # "keyValue":Ljava/lang/Object;
    :cond_1
    instance-of v6, v3, Ljava/lang/String;

    if-nez v6, :cond_0

    .line 421
    iget-object v6, p0, Lcom/disney/emagine/sdk/marshal/EMTSerializer;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v7, Lcom/disney/emagine/sdk/marshal/EMTSerializer;->TAG:Ljava/lang/String;

    const-string v8, "Problem deserializing key, aborting."

    invoke-virtual {v6, v7, v8}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 422
    const/4 v0, 0x0

    .line 431
    .end local v0    # "dict":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    .end local v3    # "keyValue":Ljava/lang/Object;
    :cond_2
    return-object v0
.end method

.method public deserializeWithData([B)Ljava/lang/Object;
    .locals 5
    .param p1, "data"    # [B

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 202
    new-array v1, v3, [B

    .line 204
    .local v1, "rawBytes":[B
    invoke-static {v1, p1}, Lcom/disney/emagine/sdk/EMTData;->append([B[B)[B

    move-result-object v1

    .line 206
    const/4 v0, 0x0

    .line 208
    .local v0, "jsonObject":Ljava/lang/Object;
    array-length v2, v1

    if-ge v2, v4, :cond_2

    .line 210
    iget-object v2, p0, Lcom/disney/emagine/sdk/marshal/EMTSerializer;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v3, Lcom/disney/emagine/sdk/marshal/EMTSerializer;->TAG:Ljava/lang/String;

    const-string v4, "Message was empty."

    invoke-virtual {v2, v3, v4}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 229
    .end local v0    # "jsonObject":Ljava/lang/Object;
    :cond_0
    :goto_0
    if-nez v0, :cond_1

    .line 231
    iget-object v2, p0, Lcom/disney/emagine/sdk/marshal/EMTSerializer;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v3, Lcom/disney/emagine/sdk/marshal/EMTSerializer;->TAG:Ljava/lang/String;

    const-string v4, "Failed to deserialize message contents."

    invoke-virtual {v2, v3, v4}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 234
    :cond_1
    return-object v0

    .line 212
    .restart local v0    # "jsonObject":Ljava/lang/Object;
    :cond_2
    iget-object v2, p0, Lcom/disney/emagine/sdk/marshal/EMTSerializer;->unmarshaller:Lcom/disney/emagine/sdk/marshal/EMTUnmarshalMessage;

    invoke-virtual {v2, v1}, Lcom/disney/emagine/sdk/marshal/EMTUnmarshalMessage;->unmarshall([B)Z

    move-result v2

    if-ne v2, v4, :cond_0

    .line 216
    iput v3, p0, Lcom/disney/emagine/sdk/marshal/EMTSerializer;->currentChunkIndex:I

    .line 218
    .end local v0    # "jsonObject":Ljava/lang/Object;
    :cond_3
    iget v2, p0, Lcom/disney/emagine/sdk/marshal/EMTSerializer;->currentChunkIndex:I

    iget-object v3, p0, Lcom/disney/emagine/sdk/marshal/EMTSerializer;->unmarshaller:Lcom/disney/emagine/sdk/marshal/EMTUnmarshalMessage;

    invoke-virtual {v3}, Lcom/disney/emagine/sdk/marshal/EMTUnmarshalMessage;->length()I

    move-result v3

    if-ge v2, v3, :cond_0

    .line 220
    invoke-virtual {p0}, Lcom/disney/emagine/sdk/marshal/EMTSerializer;->deserializeChunk()Ljava/lang/Object;

    move-result-object v0

    .line 222
    .restart local v0    # "jsonObject":Ljava/lang/Object;
    if-nez v0, :cond_3

    goto :goto_0
.end method

.method public jsonStringFromObject(Ljava/lang/Object;)Ljava/lang/String;
    .locals 7
    .param p1, "javaObject"    # Ljava/lang/Object;

    .prologue
    .line 79
    const/4 v1, 0x0

    .line 82
    .local v1, "jsonString":Ljava/lang/String;
    instance-of v3, p1, [B

    if-nez v3, :cond_0

    .line 84
    iget-object v3, p0, Lcom/disney/emagine/sdk/marshal/EMTSerializer;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v4, Lcom/disney/emagine/sdk/marshal/EMTSerializer;->TAG:Ljava/lang/String;

    const-string v5, "Error: not able to convert from PMP to JSON. Data is not byte array"

    invoke-virtual {v3, v4, v5}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 85
    const/4 v3, 0x0

    .line 98
    .end local p1    # "javaObject":Ljava/lang/Object;
    :goto_0
    return-object v3

    .line 88
    .restart local p1    # "javaObject":Ljava/lang/Object;
    :cond_0
    check-cast p1, [B

    .end local p1    # "javaObject":Ljava/lang/Object;
    move-object v2, p1

    check-cast v2, [B

    .line 91
    .local v2, "objAsByteArray":[B
    :try_start_0
    invoke-static {v2}, Lcom/disney/emagine/sdk/EMTData;->bytesToUTF8String([B)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    :goto_1
    move-object v3, v1

    .line 98
    goto :goto_0

    .line 93
    :catch_0
    move-exception v0

    .line 95
    .local v0, "ex":Ljava/lang/Exception;
    iget-object v3, p0, Lcom/disney/emagine/sdk/marshal/EMTSerializer;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v4, Lcom/disney/emagine/sdk/marshal/EMTSerializer;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Error: not able to convert from PMP to JSON. Error = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v0}, Ljava/lang/Exception;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1
.end method

.method public serialize()Lcom/disney/emagine/sdk/marshal/EMTSerializer$PMPData;
    .locals 2

    .prologue
    .line 190
    new-instance v0, Lcom/disney/emagine/sdk/marshal/EMTSerializer$PMPData;

    invoke-direct {v0, p0}, Lcom/disney/emagine/sdk/marshal/EMTSerializer$PMPData;-><init>(Lcom/disney/emagine/sdk/marshal/EMTSerializer;)V

    .line 192
    .local v0, "pmp":Lcom/disney/emagine/sdk/marshal/EMTSerializer$PMPData;
    iget-object v1, p0, Lcom/disney/emagine/sdk/marshal/EMTSerializer;->marshaller:Lcom/disney/emagine/sdk/marshal/EMTMarshalMessage;

    invoke-virtual {v1}, Lcom/disney/emagine/sdk/marshal/EMTMarshalMessage;->tostream()[B

    move-result-object v1

    iput-object v1, v0, Lcom/disney/emagine/sdk/marshal/EMTSerializer$PMPData;->data:[B

    .line 193
    iget-object v1, p0, Lcom/disney/emagine/sdk/marshal/EMTSerializer;->marshaller:Lcom/disney/emagine/sdk/marshal/EMTMarshalMessage;

    invoke-virtual {v1}, Lcom/disney/emagine/sdk/marshal/EMTMarshalMessage;->length()I

    move-result v1

    iput v1, v0, Lcom/disney/emagine/sdk/marshal/EMTSerializer$PMPData;->numChunks:I

    .line 195
    return-object v0
.end method

.method public serializeChunk(Ljava/lang/Object;)V
    .locals 3
    .param p1, "javaObject"    # Ljava/lang/Object;

    .prologue
    .line 120
    if-nez p1, :cond_1

    .line 122
    iget-object v1, p0, Lcom/disney/emagine/sdk/marshal/EMTSerializer;->marshaller:Lcom/disney/emagine/sdk/marshal/EMTMarshalMessage;

    invoke-virtual {v1}, Lcom/disney/emagine/sdk/marshal/EMTMarshalMessage;->addNull()I

    .line 143
    .end local p1    # "javaObject":Ljava/lang/Object;
    :cond_0
    :goto_0
    return-void

    .line 124
    .restart local p1    # "javaObject":Ljava/lang/Object;
    :cond_1
    instance-of v1, p1, Ljava/util/List;

    if-nez v1, :cond_2

    instance-of v1, p1, Ljava/util/Map;

    if-nez v1, :cond_2

    instance-of v1, p1, [B

    if-eqz v1, :cond_3

    .line 126
    :cond_2
    invoke-virtual {p0, p1}, Lcom/disney/emagine/sdk/marshal/EMTSerializer;->PMPFromJsonObject(Ljava/lang/Object;)V

    goto :goto_0

    .line 128
    :cond_3
    instance-of v1, p1, Ljava/lang/String;

    if-eqz v1, :cond_4

    .line 130
    check-cast p1, Ljava/lang/String;

    .end local p1    # "javaObject":Ljava/lang/Object;
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    invoke-static {v1}, Lcom/disney/emagine/sdk/EMTData;->bytesToUTF8String([B)Ljava/lang/String;

    move-result-object v0

    .line 132
    .local v0, "str":Ljava/lang/String;
    iget-object v1, p0, Lcom/disney/emagine/sdk/marshal/EMTSerializer;->marshaller:Lcom/disney/emagine/sdk/marshal/EMTMarshalMessage;

    invoke-virtual {v1, v0}, Lcom/disney/emagine/sdk/marshal/EMTMarshalMessage;->add(Ljava/lang/String;)I

    goto :goto_0

    .line 134
    .end local v0    # "str":Ljava/lang/String;
    .restart local p1    # "javaObject":Ljava/lang/Object;
    :cond_4
    instance-of v1, p1, Ljava/lang/Boolean;

    if-eqz v1, :cond_5

    .line 136
    iget-object v1, p0, Lcom/disney/emagine/sdk/marshal/EMTSerializer;->marshaller:Lcom/disney/emagine/sdk/marshal/EMTMarshalMessage;

    check-cast p1, Ljava/lang/Boolean;

    .end local p1    # "javaObject":Ljava/lang/Object;
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    invoke-virtual {v1, v2}, Lcom/disney/emagine/sdk/marshal/EMTMarshalMessage;->addBool(Z)I

    goto :goto_0

    .line 138
    .restart local p1    # "javaObject":Ljava/lang/Object;
    :cond_5
    instance-of v1, p1, Ljava/lang/Number;

    if-eqz v1, :cond_0

    .line 140
    iget-object v1, p0, Lcom/disney/emagine/sdk/marshal/EMTSerializer;->marshaller:Lcom/disney/emagine/sdk/marshal/EMTMarshalMessage;

    check-cast p1, Ljava/lang/Integer;

    .end local p1    # "javaObject":Ljava/lang/Object;
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/disney/emagine/sdk/marshal/EMTMarshalMessage;->add(I)I

    goto :goto_0
.end method

.method public toBoolean(Lcom/disney/emagine/sdk/marshal/EMTDataChunk;)Ljava/lang/Object;
    .locals 8
    .param p1, "chunk"    # Lcom/disney/emagine/sdk/marshal/EMTDataChunk;

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 357
    invoke-virtual {p1}, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->getData()[B

    move-result-object v4

    invoke-static {v4}, Lcom/disney/emagine/sdk/EMTData;->bytesToByte([B)B

    move-result v4

    if-lez v4, :cond_1

    move v0, v2

    .line 359
    .local v0, "b":I
    :goto_0
    iget-boolean v4, p0, Lcom/disney/emagine/sdk/marshal/EMTSerializer;->serializerDebug:Z

    if-eqz v4, :cond_0

    .line 360
    iget-object v4, p0, Lcom/disney/emagine/sdk/marshal/EMTSerializer;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v5, Lcom/disney/emagine/sdk/marshal/EMTSerializer;->TAG:Ljava/lang/String;

    const-string v6, "BOOLEAN: %d"

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v2, v3

    invoke-static {v6, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v4, v5, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 362
    :cond_0
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 363
    .local v1, "boolVal":Ljava/lang/Number;
    return-object v1

    .end local v0    # "b":I
    .end local v1    # "boolVal":Ljava/lang/Number;
    :cond_1
    move v0, v3

    .line 357
    goto :goto_0
.end method

.method public toNumber(Lcom/disney/emagine/sdk/marshal/EMTDataChunk;)Ljava/lang/Object;
    .locals 8
    .param p1, "chunk"    # Lcom/disney/emagine/sdk/marshal/EMTDataChunk;

    .prologue
    const/4 v5, 0x0

    .line 310
    invoke-virtual {p1}, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->getData()[B

    move-result-object v0

    .line 311
    .local v0, "data":[B
    const/4 v1, 0x0

    .line 313
    .local v1, "number":Ljava/lang/Number;
    invoke-virtual {p1}, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->getType()S

    move-result v4

    packed-switch v4, :pswitch_data_0

    .line 340
    new-instance v4, Lcom/disney/emagine/sdk/apple/NSAssert;

    const/4 v5, 0x1

    const-string v6, "The number type is not supported."

    invoke-direct {v4, v5, v6}, Lcom/disney/emagine/sdk/apple/NSAssert;-><init>(ZLjava/lang/String;)V

    .line 344
    :goto_0
    iget-boolean v4, p0, Lcom/disney/emagine/sdk/marshal/EMTSerializer;->serializerDebug:Z

    if-eqz v4, :cond_0

    .line 345
    iget-object v4, p0, Lcom/disney/emagine/sdk/marshal/EMTSerializer;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    sget-object v5, Lcom/disney/emagine/sdk/marshal/EMTSerializer;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "NUMBER: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 347
    :cond_0
    return-object v1

    .line 317
    :pswitch_0
    invoke-static {v0}, Lcom/disney/emagine/sdk/EMTData;->bytesToByte([B)B

    move-result v2

    .line 318
    .local v2, "i":B
    int-to-short v4, v2

    invoke-static {v4}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v1

    .line 319
    goto :goto_0

    .line 323
    .end local v2    # "i":B
    :pswitch_1
    const/4 v4, 0x2

    invoke-static {v0, v5, v4}, Lcom/disney/emagine/sdk/EMTData;->copyOfRange([BII)[B

    move-result-object v4

    invoke-static {v4}, Lcom/disney/emagine/sdk/EMTData;->reverse([B)[B

    move-result-object v4

    invoke-static {v4}, Lcom/disney/emagine/sdk/EMTData;->bytesToShort([B)S

    move-result v2

    .line 324
    .local v2, "i":S
    invoke-static {v2}, Ljava/lang/Short;->valueOf(S)Ljava/lang/Short;

    move-result-object v1

    .line 325
    goto :goto_0

    .line 329
    .end local v2    # "i":S
    :pswitch_2
    const/4 v4, 0x4

    invoke-static {v0, v5, v4}, Lcom/disney/emagine/sdk/EMTData;->copyOfRange([BII)[B

    move-result-object v4

    invoke-static {v4}, Lcom/disney/emagine/sdk/EMTData;->reverse([B)[B

    move-result-object v4

    invoke-static {v4}, Lcom/disney/emagine/sdk/EMTData;->bytesToInt([B)I

    move-result v2

    .line 330
    .local v2, "i":I
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    .line 331
    goto :goto_0

    .line 335
    .end local v2    # "i":I
    :pswitch_3
    const/16 v4, 0x8

    invoke-static {v0, v5, v4}, Lcom/disney/emagine/sdk/EMTData;->copyOfRange([BII)[B

    move-result-object v4

    invoke-static {v4}, Lcom/disney/emagine/sdk/EMTData;->reverse([B)[B

    move-result-object v4

    invoke-static {v4}, Lcom/disney/emagine/sdk/EMTData;->bytesToLong([B)J

    move-result-wide v2

    .line 336
    .local v2, "i":J
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    .line 337
    goto :goto_0

    .line 313
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method public toString(Lcom/disney/emagine/sdk/marshal/EMTDataChunk;)Ljava/lang/Object;
    .locals 2
    .param p1, "chunk"    # Lcom/disney/emagine/sdk/marshal/EMTDataChunk;

    .prologue
    .line 297
    invoke-virtual {p1}, Lcom/disney/emagine/sdk/marshal/EMTDataChunk;->getData()[B

    move-result-object v0

    .line 298
    .local v0, "data":[B
    invoke-static {v0}, Lcom/disney/emagine/sdk/EMTData;->bytesToString([B)Ljava/lang/String;

    move-result-object v1

    .line 300
    .local v1, "str":Ljava/lang/String;
    return-object v1
.end method
