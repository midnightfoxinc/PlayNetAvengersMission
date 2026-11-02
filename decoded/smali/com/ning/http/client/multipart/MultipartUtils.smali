.class public Lcom/ning/http/client/multipart/MultipartUtils;
.super Ljava/lang/Object;
.source "MultipartUtils.java"


# static fields
.field private static final LOGGER:Lorg/slf4j/Logger;

.field private static MULTIPART_CHARS:[B = null

.field private static final MULTIPART_FORM_CONTENT_TYPE:Ljava/lang/String; = "multipart/form-data"


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 42
    const-class v0, Lcom/ning/http/client/multipart/MultipartUtils;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    sput-object v0, Lcom/ning/http/client/multipart/MultipartUtils;->LOGGER:Lorg/slf4j/Logger;

    .line 52
    const-string v0, "-_1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

    sget-object v1, Ljava/nio/charset/StandardCharsets;->US_ASCII:Ljava/nio/charset/Charset;

    invoke-virtual {v0, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    sput-object v0, Lcom/ning/http/client/multipart/MultipartUtils;->MULTIPART_CHARS:[B

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    return-void
.end method

.method private static computeContentType(Ljava/lang/String;[B)Ljava/lang/String;
    .locals 4
    .param p0, "base"    # Ljava/lang/String;
    .param p1, "multipartBoundary"    # [B

    .prologue
    .line 105
    invoke-static {}, Lcom/ning/http/util/StringUtils;->stringBuilder()Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 106
    .local v0, "buffer":Ljava/lang/StringBuilder;
    const-string v1, ";"

    invoke-virtual {p0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 107
    const/16 v1, 0x3b

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 108
    :cond_0
    const-string v1, " boundary="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    new-instance v2, Ljava/lang/String;

    sget-object v3, Ljava/nio/charset/StandardCharsets;->US_ASCII:Ljava/nio/charset/Charset;

    invoke-direct {v2, p1, v3}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private static generateMultipartBoundary()[B
    .locals 5

    .prologue
    .line 96
    new-instance v2, Ljava/util/Random;

    invoke-direct {v2}, Ljava/util/Random;-><init>()V

    .line 97
    .local v2, "rand":Ljava/util/Random;
    const/16 v3, 0xb

    invoke-virtual {v2, v3}, Ljava/util/Random;->nextInt(I)I

    move-result v3

    add-int/lit8 v3, v3, 0x1e

    new-array v0, v3, [B

    .line 98
    .local v0, "bytes":[B
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v3, v0

    if-ge v1, v3, :cond_0

    .line 99
    sget-object v3, Lcom/ning/http/client/multipart/MultipartUtils;->MULTIPART_CHARS:[B

    sget-object v4, Lcom/ning/http/client/multipart/MultipartUtils;->MULTIPART_CHARS:[B

    array-length v4, v4

    invoke-virtual {v2, v4}, Ljava/util/Random;->nextInt(I)I

    move-result v4

    aget-byte v3, v3, v4

    aput-byte v3, v0, v1

    .line 98
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 101
    :cond_0
    return-object v0
.end method

.method public static getLengthOfParts(Ljava/util/List;[B)J
    .locals 12
    .param p1, "partBoundary"    # [B
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/ning/http/client/multipart/Part;",
            ">;[B)J"
        }
    .end annotation

    .prologue
    .local p0, "parts":Ljava/util/List;, "Ljava/util/List<Lcom/ning/http/client/multipart/Part;>;"
    const-wide/16 v8, 0x0

    .line 181
    if-nez p0, :cond_0

    .line 182
    :try_start_0
    new-instance v5, Ljava/lang/NullPointerException;

    const-string v10, "parts"

    invoke-direct {v5, v10}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v5
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 197
    :catch_0
    move-exception v0

    .line 198
    .local v0, "e":Ljava/lang/Exception;
    sget-object v5, Lcom/ning/http/client/multipart/MultipartUtils;->LOGGER:Lorg/slf4j/Logger;

    const-string v10, "An exception occurred while getting the length of the parts"

    invoke-interface {v5, v10, v0}, Lorg/slf4j/Logger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    move-wide v6, v8

    .line 199
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_0
    return-wide v6

    .line 184
    :cond_0
    const-wide/16 v6, 0x0

    .line 185
    .local v6, "total":J
    :try_start_1
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/ning/http/client/multipart/Part;

    .line 186
    .local v4, "part":Lcom/ning/http/client/multipart/Part;
    invoke-interface {v4, p1}, Lcom/ning/http/client/multipart/Part;->length([B)J

    move-result-wide v2

    .line 187
    .local v2, "l":J
    cmp-long v5, v2, v8

    if-gez v5, :cond_1

    .line 188
    const-wide/16 v6, -0x1

    goto :goto_0

    .line 190
    :cond_1
    add-long/2addr v6, v2

    .line 191
    goto :goto_1

    .line 192
    .end local v2    # "l":J
    .end local v4    # "part":Lcom/ning/http/client/multipart/Part;
    :cond_2
    sget-object v5, Lcom/ning/http/client/multipart/Part;->EXTRA_BYTES:[B

    array-length v5, v5

    int-to-long v10, v5

    add-long/2addr v6, v10

    .line 193
    array-length v5, p1

    int-to-long v10, v5

    add-long/2addr v6, v10

    .line 194
    sget-object v5, Lcom/ning/http/client/multipart/Part;->EXTRA_BYTES:[B

    array-length v5, v5

    int-to-long v10, v5

    add-long/2addr v6, v10

    .line 195
    sget-object v5, Lcom/ning/http/client/multipart/Part;->CRLF_BYTES:[B

    array-length v5, v5
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    int-to-long v8, v5

    add-long/2addr v6, v8

    .line 196
    goto :goto_0
.end method

.method public static getMessageEnd([B)[B
    .locals 4
    .param p0, "partBoundary"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 165
    invoke-static {p0}, Lcom/ning/http/util/MiscUtils;->isNonEmpty([B)Z

    move-result v2

    if-nez v2, :cond_0

    .line 166
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "partBoundary may not be empty"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 168
    :cond_0
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 169
    .local v0, "out":Ljava/io/ByteArrayOutputStream;
    new-instance v1, Lcom/ning/http/client/multipart/OutputStreamPartVisitor;

    invoke-direct {v1, v0}, Lcom/ning/http/client/multipart/OutputStreamPartVisitor;-><init>(Ljava/io/OutputStream;)V

    .line 170
    .local v1, "visitor":Lcom/ning/http/client/multipart/OutputStreamPartVisitor;
    sget-object v2, Lcom/ning/http/client/multipart/Part;->EXTRA_BYTES:[B

    invoke-virtual {v1, v2}, Lcom/ning/http/client/multipart/OutputStreamPartVisitor;->withBytes([B)V

    .line 171
    invoke-virtual {v1, p0}, Lcom/ning/http/client/multipart/OutputStreamPartVisitor;->withBytes([B)V

    .line 172
    sget-object v2, Lcom/ning/http/client/multipart/Part;->EXTRA_BYTES:[B

    invoke-virtual {v1, v2}, Lcom/ning/http/client/multipart/OutputStreamPartVisitor;->withBytes([B)V

    .line 173
    sget-object v2, Lcom/ning/http/client/multipart/Part;->CRLF_BYTES:[B

    invoke-virtual {v1, v2}, Lcom/ning/http/client/multipart/OutputStreamPartVisitor;->withBytes([B)V

    .line 175
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v2

    return-object v2
.end method

.method public static newMultipartBody(Ljava/util/List;Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;)Lcom/ning/http/client/multipart/MultipartBody;
    .locals 8
    .param p1, "requestHeaders"    # Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/ning/http/client/multipart/Part;",
            ">;",
            "Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;",
            ")",
            "Lcom/ning/http/client/multipart/MultipartBody;"
        }
    .end annotation

    .prologue
    .line 65
    .local p0, "parts":Ljava/util/List;, "Ljava/util/List<Lcom/ning/http/client/multipart/Part;>;"
    if-nez p0, :cond_0

    .line 66
    new-instance v1, Ljava/lang/NullPointerException;

    const-string v2, "parts"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 72
    :cond_0
    const-string v1, "Content-Type"

    invoke-virtual {p1, v1}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->getFirstValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 73
    .local v7, "contentTypeHeader":Ljava/lang/String;
    invoke-static {v7}, Lcom/ning/http/util/MiscUtils;->isNonEmpty(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 74
    const-string v1, "boundary="

    invoke-virtual {v7, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 75
    .local v0, "boundaryLocation":I
    const/4 v1, -0x1

    if-eq v0, v1, :cond_1

    .line 77
    move-object v3, v7

    .line 78
    .local v3, "contentType":Ljava/lang/String;
    const-string v1, "boundary="

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    add-int/2addr v1, v0

    invoke-virtual {v7, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Ljava/nio/charset/StandardCharsets;->US_ASCII:Ljava/nio/charset/Charset;

    invoke-virtual {v1, v2}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v6

    .line 90
    .end local v0    # "boundaryLocation":I
    .local v6, "multipartBoundary":[B
    :goto_0
    invoke-static {p0, v6}, Lcom/ning/http/client/multipart/MultipartUtils;->getLengthOfParts(Ljava/util/List;[B)J

    move-result-wide v4

    .line 92
    .local v4, "contentLength":J
    new-instance v1, Lcom/ning/http/client/multipart/MultipartBody;

    move-object v2, p0

    invoke-direct/range {v1 .. v6}, Lcom/ning/http/client/multipart/MultipartBody;-><init>(Ljava/util/List;Ljava/lang/String;J[B)V

    return-object v1

    .line 82
    .end local v3    # "contentType":Ljava/lang/String;
    .end local v4    # "contentLength":J
    .end local v6    # "multipartBoundary":[B
    .restart local v0    # "boundaryLocation":I
    :cond_1
    invoke-static {}, Lcom/ning/http/client/multipart/MultipartUtils;->generateMultipartBoundary()[B

    move-result-object v6

    .line 83
    .restart local v6    # "multipartBoundary":[B
    invoke-static {v7, v6}, Lcom/ning/http/client/multipart/MultipartUtils;->computeContentType(Ljava/lang/String;[B)Ljava/lang/String;

    move-result-object v3

    .restart local v3    # "contentType":Ljava/lang/String;
    goto :goto_0

    .line 86
    .end local v0    # "boundaryLocation":I
    .end local v3    # "contentType":Ljava/lang/String;
    .end local v6    # "multipartBoundary":[B
    :cond_2
    invoke-static {}, Lcom/ning/http/client/multipart/MultipartUtils;->generateMultipartBoundary()[B

    move-result-object v6

    .line 87
    .restart local v6    # "multipartBoundary":[B
    const-string v1, "multipart/form-data"

    invoke-static {v1, v6}, Lcom/ning/http/client/multipart/MultipartUtils;->computeContentType(Ljava/lang/String;[B)Ljava/lang/String;

    move-result-object v3

    .restart local v3    # "contentType":Ljava/lang/String;
    goto :goto_0
.end method

.method public static writeBytesToChannel(Ljava/nio/channels/WritableByteChannel;[B)J
    .locals 17
    .param p0, "target"    # Ljava/nio/channels/WritableByteChannel;
    .param p1, "bytes"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 113
    const/4 v13, 0x0

    .line 114
    .local v13, "written":I
    const/4 v6, 0x0

    .line 115
    .local v6, "maxSpin":I
    invoke-static/range {p1 .. p1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v8

    .line 117
    .local v8, "message":Ljava/nio/ByteBuffer;
    move-object/from16 v0, p0

    instance-of v14, v0, Ljava/nio/channels/SocketChannel;

    if-eqz v14, :cond_5

    .line 118
    invoke-static {}, Ljava/nio/channels/Selector;->open()Ljava/nio/channels/Selector;

    move-result-object v12

    .line 120
    .local v12, "selector":Ljava/nio/channels/Selector;
    :try_start_0
    move-object/from16 v0, p0

    check-cast v0, Ljava/nio/channels/SocketChannel;

    move-object v2, v0

    .line 121
    .local v2, "channel":Ljava/nio/channels/SocketChannel;
    const/4 v14, 0x4

    invoke-virtual {v2, v12, v14}, Ljava/nio/channels/SocketChannel;->register(Ljava/nio/channels/Selector;I)Ljava/nio/channels/SelectionKey;

    .line 123
    :cond_0
    move-object/from16 v0, p1

    array-length v14, v0

    if-ge v13, v14, :cond_3

    .line 124
    const-wide/16 v14, 0x3e8

    invoke-virtual {v12, v14, v15}, Ljava/nio/channels/Selector;->select(J)I

    .line 125
    add-int/lit8 v6, v6, 0x1

    .line 126
    invoke-virtual {v12}, Ljava/nio/channels/Selector;->selectedKeys()Ljava/util/Set;

    move-result-object v9

    .line 128
    .local v9, "selectedKeys":Ljava/util/Set;, "Ljava/util/Set<Ljava/nio/channels/SelectionKey;>;"
    invoke-interface {v9}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "i$":Ljava/util/Iterator;
    :cond_1
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_2

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/nio/channels/SelectionKey;

    .line 129
    .local v5, "key":Ljava/nio/channels/SelectionKey;
    invoke-virtual {v5}, Ljava/nio/channels/SelectionKey;->isWritable()Z

    move-result v14

    if-eqz v14, :cond_1

    .line 130
    move-object/from16 v0, p0

    invoke-interface {v0, v8}, Ljava/nio/channels/WritableByteChannel;->write(Ljava/nio/ByteBuffer;)I

    move-result v14

    add-int/2addr v13, v14

    .line 131
    const/4 v6, 0x0

    goto :goto_0

    .line 134
    .end local v5    # "key":Ljava/nio/channels/SelectionKey;
    :cond_2
    const/16 v14, 0xa

    if-lt v6, v14, :cond_0

    .line 135
    new-instance v14, Ljava/io/IOException;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "Unable to write on channel "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move-object/from16 v0, p0

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v14, v15}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v14
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 139
    .end local v2    # "channel":Ljava/nio/channels/SocketChannel;
    .end local v4    # "i$":Ljava/util/Iterator;
    .end local v9    # "selectedKeys":Ljava/util/Set;, "Ljava/util/Set<Ljava/nio/channels/SelectionKey;>;"
    :catchall_0
    move-exception v14

    invoke-virtual {v12}, Ljava/nio/channels/Selector;->close()V

    throw v14

    .restart local v2    # "channel":Ljava/nio/channels/SocketChannel;
    :cond_3
    invoke-virtual {v12}, Ljava/nio/channels/Selector;->close()V

    .line 160
    .end local v2    # "channel":Ljava/nio/channels/SocketChannel;
    .end local v12    # "selector":Ljava/nio/channels/Selector;
    :cond_4
    int-to-long v14, v13

    return-wide v14

    .line 142
    :cond_5
    :goto_1
    invoke-interface/range {p0 .. p0}, Ljava/nio/channels/WritableByteChannel;->isOpen()Z

    move-result v14

    if-eqz v14, :cond_4

    move-object/from16 v0, p1

    array-length v14, v0

    if-ge v13, v14, :cond_4

    .line 143
    move-object/from16 v0, p0

    invoke-interface {v0, v8}, Ljava/nio/channels/WritableByteChannel;->write(Ljava/nio/ByteBuffer;)I

    move-result v14

    int-to-long v10, v14

    .line 144
    .local v10, "nWrite":J
    int-to-long v14, v13

    add-long/2addr v14, v10

    long-to-int v13, v14

    .line 145
    const-wide/16 v14, 0x0

    cmp-long v14, v10, v14

    if-nez v14, :cond_7

    add-int/lit8 v7, v6, 0x1

    .end local v6    # "maxSpin":I
    .local v7, "maxSpin":I
    const/16 v14, 0xa

    if-ge v6, v14, :cond_6

    .line 146
    sget-object v14, Lcom/ning/http/client/multipart/MultipartUtils;->LOGGER:Lorg/slf4j/Logger;

    const-string v15, "Waiting for writing..."

    invoke-interface {v14, v15}, Lorg/slf4j/Logger;->info(Ljava/lang/String;)V

    .line 148
    const-wide/16 v14, 0x3e8

    :try_start_1
    move-object/from16 v0, p1

    invoke-virtual {v0, v14, v15}, Ljava/lang/Object;->wait(J)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    move v6, v7

    .line 151
    .end local v7    # "maxSpin":I
    .restart local v6    # "maxSpin":I
    goto :goto_1

    .line 149
    .end local v6    # "maxSpin":I
    .restart local v7    # "maxSpin":I
    :catch_0
    move-exception v3

    .line 150
    .local v3, "e":Ljava/lang/InterruptedException;
    sget-object v14, Lcom/ning/http/client/multipart/MultipartUtils;->LOGGER:Lorg/slf4j/Logger;

    invoke-virtual {v3}, Ljava/lang/InterruptedException;->getMessage()Ljava/lang/String;

    move-result-object v15

    invoke-interface {v14, v15, v3}, Lorg/slf4j/Logger;->trace(Ljava/lang/String;Ljava/lang/Throwable;)V

    move v6, v7

    .line 151
    .end local v7    # "maxSpin":I
    .restart local v6    # "maxSpin":I
    goto :goto_1

    .end local v3    # "e":Ljava/lang/InterruptedException;
    .end local v6    # "maxSpin":I
    .restart local v7    # "maxSpin":I
    :cond_6
    move v6, v7

    .line 153
    .end local v7    # "maxSpin":I
    .restart local v6    # "maxSpin":I
    :cond_7
    const/16 v14, 0xa

    if-lt v6, v14, :cond_8

    .line 154
    new-instance v14, Ljava/io/IOException;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "Unable to write on channel "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move-object/from16 v0, p0

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-direct {v14, v15}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v14

    .line 156
    :cond_8
    const/4 v6, 0x0

    goto :goto_1
.end method
