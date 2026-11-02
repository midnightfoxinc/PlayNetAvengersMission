.class public abstract Lorg/jboss/netty/handler/codec/http/HttpMessageEncoder;
.super Lorg/jboss/netty/handler/codec/oneone/OneToOneEncoder;
.source "HttpMessageEncoder.java"


# static fields
.field private static final CRLF:[B

.field private static final LAST_CHUNK:Lorg/jboss/netty/buffer/ChannelBuffer;


# instance fields
.field private volatile transferEncodingChunked:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 48
    const/4 v0, 0x2

    new-array v0, v0, [B

    fill-array-data v0, :array_0

    sput-object v0, Lorg/jboss/netty/handler/codec/http/HttpMessageEncoder;->CRLF:[B

    .line 49
    const-string v0, "0\r\n\r\n"

    sget-object v1, Lorg/jboss/netty/util/CharsetUtil;->US_ASCII:Ljava/nio/charset/Charset;

    invoke-static {v0, v1}, Lorg/jboss/netty/buffer/ChannelBuffers;->copiedBuffer(Ljava/lang/CharSequence;Ljava/nio/charset/Charset;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    sput-object v0, Lorg/jboss/netty/handler/codec/http/HttpMessageEncoder;->LAST_CHUNK:Lorg/jboss/netty/buffer/ChannelBuffer;

    return-void

    .line 48
    nop

    :array_0
    .array-data 1
        0xdt
        0xat
    .end array-data
.end method

.method protected constructor <init>()V
    .locals 0

    .prologue
    .line 57
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/oneone/OneToOneEncoder;-><init>()V

    .line 58
    return-void
.end method

.method protected static encodeAscii(Ljava/lang/String;Lorg/jboss/netty/buffer/ChannelBuffer;)V
    .locals 2
    .param p0, "s"    # Ljava/lang/String;
    .param p1, "buf"    # Lorg/jboss/netty/buffer/ChannelBuffer;

    .prologue
    .line 173
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 174
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-interface {p1, v1}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeByte(I)V

    .line 173
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 176
    :cond_0
    return-void
.end method

.method private static encodeHeader(Lorg/jboss/netty/buffer/ChannelBuffer;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p0, "buf"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p1, "header"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    .prologue
    .line 164
    invoke-static {p1, p0}, Lorg/jboss/netty/handler/codec/http/HttpMessageEncoder;->encodeAscii(Ljava/lang/String;Lorg/jboss/netty/buffer/ChannelBuffer;)V

    .line 165
    const/16 v0, 0x3a

    invoke-interface {p0, v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeByte(I)V

    .line 166
    const/16 v0, 0x20

    invoke-interface {p0, v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeByte(I)V

    .line 167
    invoke-static {p2, p0}, Lorg/jboss/netty/handler/codec/http/HttpMessageEncoder;->encodeAscii(Ljava/lang/String;Lorg/jboss/netty/buffer/ChannelBuffer;)V

    .line 168
    const/16 v0, 0xd

    invoke-interface {p0, v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeByte(I)V

    .line 169
    const/16 v0, 0xa

    invoke-interface {p0, v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeByte(I)V

    .line 170
    return-void
.end method

.method private static encodeHeaders(Lorg/jboss/netty/buffer/ChannelBuffer;Lorg/jboss/netty/handler/codec/http/HttpMessage;)V
    .locals 5
    .param p0, "buf"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p1, "message"    # Lorg/jboss/netty/handler/codec/http/HttpMessage;

    .prologue
    .line 144
    :try_start_0
    invoke-interface {p1}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v3

    invoke-virtual {v3}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 145
    .local v1, "h":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-static {p0, v3, v4}, Lorg/jboss/netty/handler/codec/http/HttpMessageEncoder;->encodeHeader(Lorg/jboss/netty/buffer/ChannelBuffer;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 147
    .end local v1    # "h":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v2    # "i$":Ljava/util/Iterator;
    :catch_0
    move-exception v0

    .line 148
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v3, Ljava/lang/Error;

    invoke-direct {v3}, Ljava/lang/Error;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/Error;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    move-result-object v3

    check-cast v3, Ljava/lang/Error;

    throw v3

    .line 150
    .end local v0    # "e":Ljava/io/UnsupportedEncodingException;
    .restart local v2    # "i$":Ljava/util/Iterator;
    :cond_0
    return-void
.end method

.method private static encodeTrailingHeaders(Lorg/jboss/netty/buffer/ChannelBuffer;Lorg/jboss/netty/handler/codec/http/HttpChunkTrailer;)V
    .locals 5
    .param p0, "buf"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p1, "trailer"    # Lorg/jboss/netty/handler/codec/http/HttpChunkTrailer;

    .prologue
    .line 154
    :try_start_0
    invoke-interface {p1}, Lorg/jboss/netty/handler/codec/http/HttpChunkTrailer;->trailingHeaders()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v3

    invoke-virtual {v3}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 155
    .local v1, "h":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-static {p0, v3, v4}, Lorg/jboss/netty/handler/codec/http/HttpMessageEncoder;->encodeHeader(Lorg/jboss/netty/buffer/ChannelBuffer;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 157
    .end local v1    # "h":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v2    # "i$":Ljava/util/Iterator;
    :catch_0
    move-exception v0

    .line 158
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v3, Ljava/lang/Error;

    invoke-direct {v3}, Ljava/lang/Error;-><init>()V

    invoke-virtual {v3, v0}, Ljava/lang/Error;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    move-result-object v3

    check-cast v3, Ljava/lang/Error;

    throw v3

    .line 160
    .end local v0    # "e":Ljava/io/UnsupportedEncodingException;
    .restart local v2    # "i$":Ljava/util/Iterator;
    :cond_0
    return-void
.end method


# virtual methods
.method protected encode(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 11
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p3, "msg"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 62
    instance-of v7, p3, Lorg/jboss/netty/handler/codec/http/HttpMessage;

    if-eqz v7, :cond_5

    move-object v5, p3

    .line 63
    check-cast v5, Lorg/jboss/netty/handler/codec/http/HttpMessage;

    .line 65
    .local v5, "m":Lorg/jboss/netty/handler/codec/http/HttpMessage;
    invoke-interface {v5}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->isChunked()Z

    move-result v7

    if-eqz v7, :cond_2

    .line 67
    invoke-static {v5}, Lorg/jboss/netty/handler/codec/http/HttpCodecUtil;->isContentLengthSet(Lorg/jboss/netty/handler/codec/http/HttpMessage;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 68
    const/4 v3, 0x0

    .line 69
    .local v3, "contentMustBeEmpty":Z
    const/4 v7, 0x0

    iput-boolean v7, p0, Lorg/jboss/netty/handler/codec/http/HttpMessageEncoder;->transferEncodingChunked:Z

    .line 70
    invoke-static {v5}, Lorg/jboss/netty/handler/codec/http/HttpCodecUtil;->removeTransferEncodingChunked(Lorg/jboss/netty/handler/codec/http/HttpMessage;)V

    .line 84
    :goto_0
    invoke-interface {p2}, Lorg/jboss/netty/channel/Channel;->getConfig()Lorg/jboss/netty/channel/ChannelConfig;

    move-result-object v7

    invoke-interface {v7}, Lorg/jboss/netty/channel/ChannelConfig;->getBufferFactory()Lorg/jboss/netty/buffer/ChannelBufferFactory;

    move-result-object v7

    invoke-static {v7}, Lorg/jboss/netty/buffer/ChannelBuffers;->dynamicBuffer(Lorg/jboss/netty/buffer/ChannelBufferFactory;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v4

    .line 86
    .local v4, "header":Lorg/jboss/netty/buffer/ChannelBuffer;
    invoke-virtual {p0, v4, v5}, Lorg/jboss/netty/handler/codec/http/HttpMessageEncoder;->encodeInitialLine(Lorg/jboss/netty/buffer/ChannelBuffer;Lorg/jboss/netty/handler/codec/http/HttpMessage;)V

    .line 87
    invoke-static {v4, v5}, Lorg/jboss/netty/handler/codec/http/HttpMessageEncoder;->encodeHeaders(Lorg/jboss/netty/buffer/ChannelBuffer;Lorg/jboss/netty/handler/codec/http/HttpMessage;)V

    .line 88
    const/16 v7, 0xd

    invoke-interface {v4, v7}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeByte(I)V

    .line 89
    const/16 v7, 0xa

    invoke-interface {v4, v7}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeByte(I)V

    .line 91
    invoke-interface {v5}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->getContent()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v1

    .line 92
    .local v1, "content":Lorg/jboss/netty/buffer/ChannelBuffer;
    invoke-interface {v1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readable()Z

    move-result v7

    if-nez v7, :cond_3

    .line 139
    .end local v1    # "content":Lorg/jboss/netty/buffer/ChannelBuffer;
    .end local v3    # "contentMustBeEmpty":Z
    .end local v4    # "header":Lorg/jboss/netty/buffer/ChannelBuffer;
    .end local v5    # "m":Lorg/jboss/netty/handler/codec/http/HttpMessage;
    :goto_1
    return-object v4

    .line 74
    .restart local v5    # "m":Lorg/jboss/netty/handler/codec/http/HttpMessage;
    :cond_0
    invoke-static {v5}, Lorg/jboss/netty/handler/codec/http/HttpCodecUtil;->isTransferEncodingChunked(Lorg/jboss/netty/handler/codec/http/HttpMessage;)Z

    move-result v7

    if-nez v7, :cond_1

    .line 75
    invoke-interface {v5}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v7

    const-string v8, "Transfer-Encoding"

    const-string v9, "chunked"

    invoke-virtual {v7, v8, v9}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->add(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .line 77
    :cond_1
    const/4 v3, 0x1

    .line 78
    .restart local v3    # "contentMustBeEmpty":Z
    const/4 v7, 0x1

    iput-boolean v7, p0, Lorg/jboss/netty/handler/codec/http/HttpMessageEncoder;->transferEncodingChunked:Z

    goto :goto_0

    .line 81
    .end local v3    # "contentMustBeEmpty":Z
    :cond_2
    invoke-static {v5}, Lorg/jboss/netty/handler/codec/http/HttpCodecUtil;->isTransferEncodingChunked(Lorg/jboss/netty/handler/codec/http/HttpMessage;)Z

    move-result v3

    .restart local v3    # "contentMustBeEmpty":Z
    iput-boolean v3, p0, Lorg/jboss/netty/handler/codec/http/HttpMessageEncoder;->transferEncodingChunked:Z

    goto :goto_0

    .line 94
    .restart local v1    # "content":Lorg/jboss/netty/buffer/ChannelBuffer;
    .restart local v4    # "header":Lorg/jboss/netty/buffer/ChannelBuffer;
    :cond_3
    if-eqz v3, :cond_4

    .line 95
    new-instance v7, Ljava/lang/IllegalArgumentException;

    const-string v8, "HttpMessage.content must be empty if Transfer-Encoding is chunked."

    invoke-direct {v7, v8}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 99
    :cond_4
    const/4 v7, 0x2

    new-array v7, v7, [Lorg/jboss/netty/buffer/ChannelBuffer;

    const/4 v8, 0x0

    aput-object v4, v7, v8

    const/4 v8, 0x1

    aput-object v1, v7, v8

    invoke-static {v7}, Lorg/jboss/netty/buffer/ChannelBuffers;->wrappedBuffer([Lorg/jboss/netty/buffer/ChannelBuffer;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v4

    goto :goto_1

    .line 103
    .end local v1    # "content":Lorg/jboss/netty/buffer/ChannelBuffer;
    .end local v3    # "contentMustBeEmpty":Z
    .end local v4    # "header":Lorg/jboss/netty/buffer/ChannelBuffer;
    .end local v5    # "m":Lorg/jboss/netty/handler/codec/http/HttpMessage;
    :cond_5
    instance-of v7, p3, Lorg/jboss/netty/handler/codec/http/HttpChunk;

    if-eqz v7, :cond_9

    move-object v0, p3

    .line 104
    check-cast v0, Lorg/jboss/netty/handler/codec/http/HttpChunk;

    .line 105
    .local v0, "chunk":Lorg/jboss/netty/handler/codec/http/HttpChunk;
    iget-boolean v7, p0, Lorg/jboss/netty/handler/codec/http/HttpMessageEncoder;->transferEncodingChunked:Z

    if-eqz v7, :cond_8

    .line 106
    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/HttpChunk;->isLast()Z

    move-result v7

    if-eqz v7, :cond_7

    .line 107
    const/4 v7, 0x0

    iput-boolean v7, p0, Lorg/jboss/netty/handler/codec/http/HttpMessageEncoder;->transferEncodingChunked:Z

    .line 108
    instance-of v7, v0, Lorg/jboss/netty/handler/codec/http/HttpChunkTrailer;

    if-eqz v7, :cond_6

    .line 109
    invoke-interface {p2}, Lorg/jboss/netty/channel/Channel;->getConfig()Lorg/jboss/netty/channel/ChannelConfig;

    move-result-object v7

    invoke-interface {v7}, Lorg/jboss/netty/channel/ChannelConfig;->getBufferFactory()Lorg/jboss/netty/buffer/ChannelBufferFactory;

    move-result-object v7

    invoke-static {v7}, Lorg/jboss/netty/buffer/ChannelBuffers;->dynamicBuffer(Lorg/jboss/netty/buffer/ChannelBufferFactory;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v6

    .line 111
    .local v6, "trailer":Lorg/jboss/netty/buffer/ChannelBuffer;
    const/16 v7, 0x30

    invoke-interface {v6, v7}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeByte(I)V

    .line 112
    const/16 v7, 0xd

    invoke-interface {v6, v7}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeByte(I)V

    .line 113
    const/16 v7, 0xa

    invoke-interface {v6, v7}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeByte(I)V

    .line 114
    check-cast v0, Lorg/jboss/netty/handler/codec/http/HttpChunkTrailer;

    .end local v0    # "chunk":Lorg/jboss/netty/handler/codec/http/HttpChunk;
    invoke-static {v6, v0}, Lorg/jboss/netty/handler/codec/http/HttpMessageEncoder;->encodeTrailingHeaders(Lorg/jboss/netty/buffer/ChannelBuffer;Lorg/jboss/netty/handler/codec/http/HttpChunkTrailer;)V

    .line 115
    const/16 v7, 0xd

    invoke-interface {v6, v7}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeByte(I)V

    .line 116
    const/16 v7, 0xa

    invoke-interface {v6, v7}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeByte(I)V

    move-object v4, v6

    .line 117
    goto :goto_1

    .line 119
    .end local v6    # "trailer":Lorg/jboss/netty/buffer/ChannelBuffer;
    .restart local v0    # "chunk":Lorg/jboss/netty/handler/codec/http/HttpChunk;
    :cond_6
    sget-object v7, Lorg/jboss/netty/handler/codec/http/HttpMessageEncoder;->LAST_CHUNK:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v7}, Lorg/jboss/netty/buffer/ChannelBuffer;->duplicate()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v4

    goto :goto_1

    .line 122
    :cond_7
    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/HttpChunk;->getContent()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v1

    .line 123
    .restart local v1    # "content":Lorg/jboss/netty/buffer/ChannelBuffer;
    invoke-interface {v1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v2

    .line 125
    .local v2, "contentLength":I
    const/4 v7, 0x4

    new-array v7, v7, [Lorg/jboss/netty/buffer/ChannelBuffer;

    const/4 v8, 0x0

    invoke-static {v2}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v9

    sget-object v10, Lorg/jboss/netty/util/CharsetUtil;->US_ASCII:Ljava/nio/charset/Charset;

    invoke-static {v9, v10}, Lorg/jboss/netty/buffer/ChannelBuffers;->copiedBuffer(Ljava/lang/CharSequence;Ljava/nio/charset/Charset;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v9

    aput-object v9, v7, v8

    const/4 v8, 0x1

    sget-object v9, Lorg/jboss/netty/handler/codec/http/HttpMessageEncoder;->CRLF:[B

    invoke-static {v9}, Lorg/jboss/netty/buffer/ChannelBuffers;->wrappedBuffer([B)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v9

    aput-object v9, v7, v8

    const/4 v8, 0x2

    invoke-interface {v1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v9

    invoke-interface {v1, v9, v2}, Lorg/jboss/netty/buffer/ChannelBuffer;->slice(II)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v9

    aput-object v9, v7, v8

    const/4 v8, 0x3

    sget-object v9, Lorg/jboss/netty/handler/codec/http/HttpMessageEncoder;->CRLF:[B

    invoke-static {v9}, Lorg/jboss/netty/buffer/ChannelBuffers;->wrappedBuffer([B)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-static {v7}, Lorg/jboss/netty/buffer/ChannelBuffers;->wrappedBuffer([Lorg/jboss/netty/buffer/ChannelBuffer;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v4

    goto/16 :goto_1

    .line 134
    .end local v1    # "content":Lorg/jboss/netty/buffer/ChannelBuffer;
    .end local v2    # "contentLength":I
    :cond_8
    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/HttpChunk;->getContent()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v4

    goto/16 :goto_1

    .end local v0    # "chunk":Lorg/jboss/netty/handler/codec/http/HttpChunk;
    :cond_9
    move-object v4, p3

    .line 139
    goto/16 :goto_1
.end method

.method protected abstract encodeInitialLine(Lorg/jboss/netty/buffer/ChannelBuffer;Lorg/jboss/netty/handler/codec/http/HttpMessage;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method
