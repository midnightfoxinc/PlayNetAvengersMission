.class public Lcom/disneymobile/mocha/NSData;
.super Lcom/disneymobile/mocha/NSObject;
.source "NSData.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/disneymobile/mocha/NSData$NSDataInputStream;,
        Lcom/disneymobile/mocha/NSData$Chunk;
    }
.end annotation


# static fields
.field private static final CHUNK_SIZE:I = 0x8000

.field private static final serialVersionUID:J = 0x1L


# instance fields
.field protected final chunks:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Lcom/disneymobile/mocha/NSData$Chunk;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method protected constructor <init>()V
    .locals 1

    .prologue
    .line 73
    invoke-direct {p0}, Lcom/disneymobile/mocha/NSObject;-><init>()V

    .line 40
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/disneymobile/mocha/NSData;->chunks:Ljava/util/LinkedList;

    .line 74
    return-void
.end method

.method private MD5HashBytes()[B
    .locals 7

    .prologue
    .line 191
    :try_start_0
    const-string v4, "MD5"

    invoke-static {v4}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v3

    .line 192
    .local v3, "md":Ljava/security/MessageDigest;
    iget-object v4, p0, Lcom/disneymobile/mocha/NSData;->chunks:Ljava/util/LinkedList;

    invoke-virtual {v4}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/disneymobile/mocha/NSData$Chunk;

    .line 193
    .local v0, "chunk":Lcom/disneymobile/mocha/NSData$Chunk;
    iget-object v4, v0, Lcom/disneymobile/mocha/NSData$Chunk;->data:[B

    const/4 v5, 0x0

    iget v6, v0, Lcom/disneymobile/mocha/NSData$Chunk;->length:I

    invoke-virtual {v3, v4, v5, v6}, Ljava/security/MessageDigest;->update([BII)V
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 195
    .end local v0    # "chunk":Lcom/disneymobile/mocha/NSData$Chunk;
    .end local v2    # "i$":Ljava/util/Iterator;
    .end local v3    # "md":Ljava/security/MessageDigest;
    :catch_0
    move-exception v1

    .line 196
    .local v1, "e":Ljava/security/NoSuchAlgorithmException;
    const-string v4, "NSData"

    const-string v5, "MD5 is not available"

    invoke-static {v4, v5, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 197
    const/4 v4, 0x0

    .end local v1    # "e":Ljava/security/NoSuchAlgorithmException;
    :goto_1
    return-object v4

    .line 194
    .restart local v2    # "i$":Ljava/util/Iterator;
    .restart local v3    # "md":Ljava/security/MessageDigest;
    :cond_0
    :try_start_1
    invoke-virtual {v3}, Ljava/security/MessageDigest;->digest()[B
    :try_end_1
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v4

    goto :goto_1
.end method

.method public static data()Lcom/disneymobile/mocha/NSData;
    .locals 1

    .prologue
    .line 43
    new-instance v0, Lcom/disneymobile/mocha/NSData;

    invoke-direct {v0}, Lcom/disneymobile/mocha/NSData;-><init>()V

    return-object v0
.end method

.method public static dataWithBytesNoCopy([B)Lcom/disneymobile/mocha/NSData;
    .locals 2
    .param p0, "bytes"    # [B

    .prologue
    .line 47
    new-instance v0, Lcom/disneymobile/mocha/NSData;

    invoke-direct {v0}, Lcom/disneymobile/mocha/NSData;-><init>()V

    array-length v1, p0

    invoke-virtual {v0, p0, v1}, Lcom/disneymobile/mocha/NSData;->initWithBytesAndLengthByReference([BI)Lcom/disneymobile/mocha/NSData;

    move-result-object v0

    return-object v0
.end method

.method public static dataWithContentsOfFile(Ljava/lang/String;)Lcom/disneymobile/mocha/NSData;
    .locals 2
    .param p0, "fileName"    # Ljava/lang/String;

    .prologue
    .line 52
    :try_start_0
    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, p0}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    invoke-static {v1}, Lcom/disneymobile/mocha/NSData;->dataWithContentsOfStream(Ljava/io/InputStream;)Lcom/disneymobile/mocha/NSData;
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 54
    :goto_0
    return-object v1

    .line 53
    :catch_0
    move-exception v0

    .line 54
    .local v0, "e":Ljava/io/FileNotFoundException;
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static dataWithContentsOfStream(Ljava/io/InputStream;)Lcom/disneymobile/mocha/NSData;
    .locals 1
    .param p0, "inputStream"    # Ljava/io/InputStream;

    .prologue
    .line 70
    new-instance v0, Lcom/disneymobile/mocha/NSData;

    invoke-direct {v0}, Lcom/disneymobile/mocha/NSData;-><init>()V

    invoke-direct {v0, p0}, Lcom/disneymobile/mocha/NSData;->initWithContentsOfStream(Ljava/io/InputStream;)Lcom/disneymobile/mocha/NSData;

    move-result-object v0

    return-object v0
.end method

.method public static dataWithContentsOfURL(Lcom/disneymobile/mocha/NSURL;Lcom/disneymobile/mocha/support/Out;)Lcom/disneymobile/mocha/NSData;
    .locals 4
    .param p0, "url"    # Lcom/disneymobile/mocha/NSURL;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/disneymobile/mocha/NSURL;",
            "Lcom/disneymobile/mocha/support/Out",
            "<",
            "Lcom/disneymobile/mocha/NSError;",
            ">;)",
            "Lcom/disneymobile/mocha/NSData;"
        }
    .end annotation

    .prologue
    .local p1, "outError":Lcom/disneymobile/mocha/support/Out;, "Lcom/disneymobile/mocha/support/Out<Lcom/disneymobile/mocha/NSError;>;"
    const/4 v2, 0x0

    .line 59
    if-nez p0, :cond_0

    .line 66
    :goto_0
    return-object v2

    .line 63
    :cond_0
    new-instance v1, Lcom/disneymobile/mocha/support/Out;

    invoke-direct {v1}, Lcom/disneymobile/mocha/support/Out;-><init>()V

    .line 64
    .local v1, "response":Lcom/disneymobile/mocha/support/Out;, "Lcom/disneymobile/mocha/support/Out<Lcom/disneymobile/mocha/NSURLResponse;>;"
    invoke-static {p0}, Lcom/disneymobile/mocha/NSURLRequest;->requestWithURL(Lcom/disneymobile/mocha/NSURL;)Lcom/disneymobile/mocha/NSURLRequest;

    move-result-object v3

    invoke-static {v3, v1, p1}, Lcom/disneymobile/mocha/NSURLConnection;->sendSynchronousRequestReturningResponseAndError(Lcom/disneymobile/mocha/NSURLRequest;Lcom/disneymobile/mocha/support/Out;Lcom/disneymobile/mocha/support/Out;)Lcom/disneymobile/mocha/NSData;

    move-result-object v0

    .line 66
    .local v0, "data":Lcom/disneymobile/mocha/NSData;
    invoke-virtual {p1}, Lcom/disneymobile/mocha/support/Out;->hasValue()Z

    move-result v3

    if-nez v3, :cond_1

    .end local v0    # "data":Lcom/disneymobile/mocha/NSData;
    :goto_1
    move-object v2, v0

    goto :goto_0

    .restart local v0    # "data":Lcom/disneymobile/mocha/NSData;
    :cond_1
    move-object v0, v2

    goto :goto_1
.end method

.method private initWithContentsOfStream(Ljava/io/InputStream;)Lcom/disneymobile/mocha/NSData;
    .locals 5
    .param p1, "inputStream"    # Ljava/io/InputStream;

    .prologue
    .line 84
    :goto_0
    const v3, 0x8000

    :try_start_0
    new-array v0, v3, [B

    .line 85
    .local v0, "block":[B
    invoke-virtual {p1, v0}, Ljava/io/InputStream;->read([B)I

    move-result v1

    .line 86
    .local v1, "bytesRead":I
    const/4 v3, -0x1

    if-ne v1, v3, :cond_0

    .line 95
    .end local v0    # "block":[B
    .end local v1    # "bytesRead":I
    .end local p0    # "this":Lcom/disneymobile/mocha/NSData;
    :goto_1
    return-object p0

    .line 88
    .restart local v0    # "block":[B
    .restart local v1    # "bytesRead":I
    .restart local p0    # "this":Lcom/disneymobile/mocha/NSData;
    :cond_0
    new-instance v3, Lcom/disneymobile/mocha/NSData$Chunk;

    invoke-direct {v3, v0, v1}, Lcom/disneymobile/mocha/NSData$Chunk;-><init>([BI)V

    invoke-virtual {p0, v3}, Lcom/disneymobile/mocha/NSData;->addChunkByReference(Lcom/disneymobile/mocha/NSData$Chunk;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 90
    .end local v0    # "block":[B
    .end local v1    # "bytesRead":I
    :catch_0
    move-exception v2

    .line 91
    .local v2, "e":Ljava/io/IOException;
    const-string v3, "NSData"

    const-string v4, "initWithContentsOfStream failed"

    invoke-static {v3, v4, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 92
    const/4 p0, 0x0

    goto :goto_1
.end method


# virtual methods
.method public MD5Hash()Ljava/lang/String;
    .locals 1

    .prologue
    .line 186
    invoke-direct {p0}, Lcom/disneymobile/mocha/NSData;->MD5HashBytes()[B

    move-result-object v0

    invoke-static {v0}, Lcom/disneymobile/mocha/support/HexUtility;->toHexString([B)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected addChunkByCopy([BI)V
    .locals 5
    .param p1, "data"    # [B
    .param p2, "length"    # I

    .prologue
    const/4 v4, 0x0

    .line 211
    iget-object v2, p0, Lcom/disneymobile/mocha/NSData;->chunks:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->size()I

    move-result v2

    if-lez v2, :cond_0

    .line 213
    iget-object v2, p0, Lcom/disneymobile/mocha/NSData;->chunks:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->getLast()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/disneymobile/mocha/NSData$Chunk;

    .line 214
    .local v1, "lastChunk":Lcom/disneymobile/mocha/NSData$Chunk;
    iget v2, v1, Lcom/disneymobile/mocha/NSData$Chunk;->length:I

    add-int/2addr v2, p2

    iget-object v3, v1, Lcom/disneymobile/mocha/NSData$Chunk;->data:[B

    array-length v3, v3

    if-gt v2, v3, :cond_0

    .line 215
    iget-object v2, v1, Lcom/disneymobile/mocha/NSData$Chunk;->data:[B

    iget v3, v1, Lcom/disneymobile/mocha/NSData$Chunk;->length:I

    invoke-static {p1, v4, v2, v3, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 216
    iget v2, v1, Lcom/disneymobile/mocha/NSData$Chunk;->length:I

    add-int/2addr v2, p2

    iput v2, v1, Lcom/disneymobile/mocha/NSData$Chunk;->length:I

    .line 224
    .end local v1    # "lastChunk":Lcom/disneymobile/mocha/NSData$Chunk;
    :goto_0
    return-void

    .line 221
    :cond_0
    new-array v0, p2, [B

    .line 222
    .local v0, "dataCopy":[B
    invoke-static {p1, v4, v0, v4, p2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 223
    iget-object v2, p0, Lcom/disneymobile/mocha/NSData;->chunks:Ljava/util/LinkedList;

    new-instance v3, Lcom/disneymobile/mocha/NSData$Chunk;

    array-length v4, v0

    invoke-direct {v3, v0, v4}, Lcom/disneymobile/mocha/NSData$Chunk;-><init>([BI)V

    invoke-virtual {v2, v3}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method protected addChunkByReference(Lcom/disneymobile/mocha/NSData$Chunk;)V
    .locals 1
    .param p1, "chunk"    # Lcom/disneymobile/mocha/NSData$Chunk;

    .prologue
    .line 204
    iget-object v0, p0, Lcom/disneymobile/mocha/NSData;->chunks:Ljava/util/LinkedList;

    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 205
    return-void
.end method

.method public base64Encoding()Ljava/lang/String;
    .locals 2

    .prologue
    .line 263
    invoke-virtual {p0}, Lcom/disneymobile/mocha/NSData;->length()I

    move-result v1

    new-array v0, v1, [B

    .line 264
    .local v0, "data":[B
    array-length v1, v0

    invoke-virtual {p0, v0, v1}, Lcom/disneymobile/mocha/NSData;->getBytesLength([BI)Lcom/disneymobile/mocha/NSError;

    .line 265
    invoke-static {v0}, Lcom/disneymobile/mocha/support/Base64Coder;->encode([B)[C

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf([C)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public bytes()[B
    .locals 4

    .prologue
    .line 132
    invoke-virtual {p0}, Lcom/disneymobile/mocha/NSData;->length()I

    move-result v2

    .line 135
    .local v2, "length":I
    if-nez v2, :cond_1

    .line 136
    const/4 v3, 0x0

    new-array v0, v3, [B

    .line 142
    :cond_0
    :goto_0
    return-object v0

    .line 139
    :cond_1
    new-array v0, v2, [B

    .line 140
    .local v0, "bytes":[B
    invoke-virtual {p0, v0, v2}, Lcom/disneymobile/mocha/NSData;->getBytesLength([BI)Lcom/disneymobile/mocha/NSError;

    move-result-object v1

    .line 142
    .local v1, "error":Lcom/disneymobile/mocha/NSError;
    if-eqz v1, :cond_0

    const/4 v0, 0x0

    goto :goto_0
.end method

.method public description()Ljava/lang/String;
    .locals 6

    .prologue
    .line 234
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 235
    .local v1, "description":Ljava/lang/StringBuilder;
    iget-object v3, p0, Lcom/disneymobile/mocha/NSData;->chunks:Ljava/util/LinkedList;

    invoke-virtual {v3}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/disneymobile/mocha/NSData$Chunk;

    .line 236
    .local v0, "chunk":Lcom/disneymobile/mocha/NSData$Chunk;
    iget-object v3, v0, Lcom/disneymobile/mocha/NSData$Chunk;->data:[B

    const/4 v4, 0x0

    iget v5, v0, Lcom/disneymobile/mocha/NSData$Chunk;->length:I

    invoke-static {v3, v4, v5}, Lcom/disneymobile/mocha/support/HexUtility;->toHexString([BII)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 237
    .end local v0    # "chunk":Lcom/disneymobile/mocha/NSData$Chunk;
    :cond_0
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method public getBytesLength([BI)Lcom/disneymobile/mocha/NSError;
    .locals 10
    .param p1, "data"    # [B
    .param p2, "length"    # I

    .prologue
    const/16 v9, -0x3e8

    .line 146
    const/4 v3, 0x0

    .line 147
    .local v3, "outError":Lcom/disneymobile/mocha/NSError;
    const/4 v4, 0x0

    .line 152
    .local v4, "position":I
    invoke-virtual {p0}, Lcom/disneymobile/mocha/NSData;->length()I

    move-result v7

    if-nez v7, :cond_1

    .line 153
    const/4 p2, 0x0

    .line 182
    .end local v3    # "outError":Lcom/disneymobile/mocha/NSError;
    :cond_0
    :goto_0
    return-object v3

    .line 155
    .restart local v3    # "outError":Lcom/disneymobile/mocha/NSError;
    :cond_1
    if-nez p1, :cond_2

    .line 156
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 157
    .local v6, "userInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v7, "kNSErrorLocalizedFailureReasonErrorKey"

    const-string v8, "The parameter data is null."

    invoke-virtual {v6, v7, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 158
    const-string v7, "kMochaDomain"

    invoke-static {v7, v9, v6}, Lcom/disneymobile/mocha/NSError;->errorWithDomainCodeAndUserInfo(Ljava/lang/String;ILjava/util/HashMap;)Lcom/disneymobile/mocha/NSError;

    move-result-object v3

    goto :goto_0

    .line 159
    .end local v6    # "userInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_2
    if-gtz p2, :cond_3

    .line 160
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 161
    .restart local v6    # "userInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v7, "kNSErrorLocalizedFailureReasonErrorKey"

    const-string v8, "The parameter length is less than or equal to zero."

    invoke-virtual {v6, v7, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 162
    const-string v7, "kMochaDomain"

    invoke-static {v7, v9, v6}, Lcom/disneymobile/mocha/NSError;->errorWithDomainCodeAndUserInfo(Ljava/lang/String;ILjava/util/HashMap;)Lcom/disneymobile/mocha/NSError;

    move-result-object v3

    goto :goto_0

    .line 165
    .end local v6    # "userInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_3
    iget-object v7, p0, Lcom/disneymobile/mocha/NSData;->chunks:Ljava/util/LinkedList;

    invoke-virtual {v7}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_4
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/disneymobile/mocha/NSData$Chunk;

    .line 166
    .local v0, "chunk":Lcom/disneymobile/mocha/NSData$Chunk;
    sub-int v7, p2, v4

    iget v8, v0, Lcom/disneymobile/mocha/NSData$Chunk;->length:I

    invoke-static {v7, v8}, Ljava/lang/Math;->min(II)I

    move-result v5

    .line 169
    .local v5, "toCopy":I
    :try_start_0
    iget-object v7, v0, Lcom/disneymobile/mocha/NSData$Chunk;->data:[B

    const/4 v8, 0x0

    invoke-static {v7, v8, p1, v4, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 176
    add-int/2addr v4, v5

    .line 177
    if-lt v4, p2, :cond_4

    goto :goto_0

    .line 170
    :catch_0
    move-exception v1

    .line 171
    .local v1, "e":Ljava/lang/Exception;
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 172
    .restart local v6    # "userInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v7, "kNSErrorLocalizedFailureReasonErrorKey"

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 173
    const-string v7, "kMochaDomain"

    const/16 v8, -0x3e9

    invoke-static {v7, v8, v6}, Lcom/disneymobile/mocha/NSError;->errorWithDomainCodeAndUserInfo(Ljava/lang/String;ILjava/util/HashMap;)Lcom/disneymobile/mocha/NSError;

    move-result-object v3

    goto :goto_0
.end method

.method public getInputStream()Ljava/io/InputStream;
    .locals 1

    .prologue
    .line 128
    new-instance v0, Lcom/disneymobile/mocha/NSData$NSDataInputStream;

    invoke-direct {v0, p0}, Lcom/disneymobile/mocha/NSData$NSDataInputStream;-><init>(Lcom/disneymobile/mocha/NSData;)V

    return-object v0
.end method

.method public initWithBytesAndLengthByReference([BI)Lcom/disneymobile/mocha/NSData;
    .locals 1
    .param p1, "bytes"    # [B
    .param p2, "length"    # I

    .prologue
    .line 77
    new-instance v0, Lcom/disneymobile/mocha/NSData$Chunk;

    invoke-direct {v0, p1, p2}, Lcom/disneymobile/mocha/NSData$Chunk;-><init>([BI)V

    invoke-virtual {p0, v0}, Lcom/disneymobile/mocha/NSData;->addChunkByReference(Lcom/disneymobile/mocha/NSData$Chunk;)V

    .line 78
    return-object p0
.end method

.method public length()I
    .locals 4

    .prologue
    .line 227
    const/4 v2, 0x0

    .line 228
    .local v2, "length":I
    iget-object v3, p0, Lcom/disneymobile/mocha/NSData;->chunks:Ljava/util/LinkedList;

    invoke-virtual {v3}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/disneymobile/mocha/NSData$Chunk;

    .line 229
    .local v0, "chunk":Lcom/disneymobile/mocha/NSData$Chunk;
    iget v3, v0, Lcom/disneymobile/mocha/NSData$Chunk;->length:I

    add-int/2addr v2, v3

    goto :goto_0

    .line 230
    .end local v0    # "chunk":Lcom/disneymobile/mocha/NSData$Chunk;
    :cond_0
    return v2
.end method

.method public toString()Ljava/lang/String;
    .locals 7

    .prologue
    .line 242
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 243
    .local v1, "description":Ljava/lang/StringBuilder;
    iget-object v3, p0, Lcom/disneymobile/mocha/NSData;->chunks:Ljava/util/LinkedList;

    invoke-virtual {v3}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/disneymobile/mocha/NSData$Chunk;

    .line 244
    .local v0, "chunk":Lcom/disneymobile/mocha/NSData$Chunk;
    new-instance v3, Ljava/lang/String;

    iget-object v4, v0, Lcom/disneymobile/mocha/NSData$Chunk;->data:[B

    const/4 v5, 0x0

    iget v6, v0, Lcom/disneymobile/mocha/NSData$Chunk;->length:I

    invoke-direct {v3, v4, v5, v6}, Ljava/lang/String;-><init>([BII)V

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 245
    .end local v0    # "chunk":Lcom/disneymobile/mocha/NSData$Chunk;
    :cond_0
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method public writeToFileAtomically(Ljava/lang/String;Z)Z
    .locals 8
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "atomically"    # Z

    .prologue
    const/4 v4, 0x0

    .line 250
    :try_start_0
    new-instance v3, Ljava/io/FileOutputStream;

    invoke-direct {v3, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    .line 251
    .local v3, "out":Ljava/io/OutputStream;
    iget-object v5, p0, Lcom/disneymobile/mocha/NSData;->chunks:Ljava/util/LinkedList;

    invoke-virtual {v5}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/disneymobile/mocha/NSData$Chunk;

    .line 252
    .local v0, "chunk":Lcom/disneymobile/mocha/NSData$Chunk;
    iget-object v5, v0, Lcom/disneymobile/mocha/NSData$Chunk;->data:[B

    const/4 v6, 0x0

    iget v7, v0, Lcom/disneymobile/mocha/NSData$Chunk;->length:I

    invoke-virtual {v3, v5, v6, v7}, Ljava/io/OutputStream;->write([BII)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 256
    .end local v0    # "chunk":Lcom/disneymobile/mocha/NSData$Chunk;
    .end local v2    # "i$":Ljava/util/Iterator;
    .end local v3    # "out":Ljava/io/OutputStream;
    :catch_0
    move-exception v1

    .line 257
    .local v1, "e":Ljava/io/IOException;
    const-string v5, "NSData"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Error writing to file: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 258
    .end local v1    # "e":Ljava/io/IOException;
    :goto_1
    return v4

    .line 254
    .restart local v2    # "i$":Ljava/util/Iterator;
    .restart local v3    # "out":Ljava/io/OutputStream;
    :cond_0
    :try_start_1
    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 255
    const/4 v4, 0x1

    goto :goto_1
.end method
