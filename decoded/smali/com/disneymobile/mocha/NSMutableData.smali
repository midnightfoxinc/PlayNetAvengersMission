.class public Lcom/disneymobile/mocha/NSMutableData;
.super Lcom/disneymobile/mocha/NSData;
.source "NSMutableData.java"


# static fields
.field private static final serialVersionUID:J = 0x1L


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 20
    invoke-direct {p0}, Lcom/disneymobile/mocha/NSData;-><init>()V

    .line 21
    return-void
.end method

.method public static init()Lcom/disneymobile/mocha/NSMutableData;
    .locals 1

    .prologue
    .line 17
    new-instance v0, Lcom/disneymobile/mocha/NSMutableData;

    invoke-direct {v0}, Lcom/disneymobile/mocha/NSMutableData;-><init>()V

    return-object v0
.end method


# virtual methods
.method public appendDataByReference(Lcom/disneymobile/mocha/NSData;)V
    .locals 3
    .param p1, "data"    # Lcom/disneymobile/mocha/NSData;

    .prologue
    .line 28
    iget-object v2, p1, Lcom/disneymobile/mocha/NSData;->chunks:Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/disneymobile/mocha/NSData$Chunk;

    .line 29
    .local v0, "chunk":Lcom/disneymobile/mocha/NSData$Chunk;
    invoke-virtual {p0, v0}, Lcom/disneymobile/mocha/NSMutableData;->addChunkByReference(Lcom/disneymobile/mocha/NSData$Chunk;)V

    goto :goto_0

    .line 31
    .end local v0    # "chunk":Lcom/disneymobile/mocha/NSData$Chunk;
    :cond_0
    return-void
.end method

.method public appendDataByReference([B)V
    .locals 2
    .param p1, "data"    # [B

    .prologue
    .line 24
    new-instance v0, Lcom/disneymobile/mocha/NSData$Chunk;

    array-length v1, p1

    invoke-direct {v0, p1, v1}, Lcom/disneymobile/mocha/NSData$Chunk;-><init>([BI)V

    invoke-virtual {p0, v0}, Lcom/disneymobile/mocha/NSMutableData;->addChunkByReference(Lcom/disneymobile/mocha/NSData$Chunk;)V

    .line 25
    return-void
.end method

.method public setLength(I)V
    .locals 1
    .param p1, "i"    # I

    .prologue
    .line 46
    if-eqz p1, :cond_0

    .line 47
    new-instance v0, Lorg/apache/commons/lang/NotImplementedException;

    invoke-direct {v0}, Lorg/apache/commons/lang/NotImplementedException;-><init>()V

    throw v0

    .line 49
    :cond_0
    iget-object v0, p0, Lcom/disneymobile/mocha/NSMutableData;->chunks:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->clear()V

    .line 50
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .prologue
    .line 36
    :try_start_0
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 37
    .local v1, "out":Ljava/io/ByteArrayOutputStream;
    invoke-virtual {p0}, Lcom/disneymobile/mocha/NSMutableData;->getInputStream()Ljava/io/InputStream;

    move-result-object v2

    invoke-static {v2, v1}, Lcom/disneymobile/mocha/support/StreamUtil;->copy(Ljava/io/InputStream;Ljava/io/OutputStream;)V

    .line 38
    const-string v2, "UTF-8"

    invoke-virtual {v1, v2}, Ljava/io/ByteArrayOutputStream;->toString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 42
    .end local v1    # "out":Ljava/io/ByteArrayOutputStream;
    :goto_0
    return-object v2

    .line 39
    :catch_0
    move-exception v0

    .line 40
    .local v0, "e":Ljava/io/IOException;
    invoke-virtual {p0}, Lcom/disneymobile/mocha/NSMutableData;->getLogPrefix()Ljava/lang/String;

    move-result-object v2

    const-string v3, "NSMutableData: Failed to convert data to string"

    invoke-static {v2, v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 42
    const-string v2, ""

    goto :goto_0
.end method
