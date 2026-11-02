.class public Lorg/jboss/netty/handler/codec/spdy/SpdyHttpDecoder;
.super Lorg/jboss/netty/handler/codec/oneone/OneToOneDecoder;
.source "SpdyHttpDecoder.java"


# instance fields
.field private final maxContentLength:I

.field private final messageMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "Lorg/jboss/netty/handler/codec/http/HttpMessage;",
            ">;"
        }
    .end annotation
.end field

.field private final spdyVersion:I


# direct methods
.method public constructor <init>(Lorg/jboss/netty/handler/codec/spdy/SpdyVersion;I)V
    .locals 1
    .param p1, "spdyVersion"    # Lorg/jboss/netty/handler/codec/spdy/SpdyVersion;
    .param p2, "maxContentLength"    # I

    .prologue
    .line 59
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    invoke-direct {p0, p1, p2, v0}, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpDecoder;-><init>(Lorg/jboss/netty/handler/codec/spdy/SpdyVersion;ILjava/util/Map;)V

    .line 60
    return-void
.end method

.method protected constructor <init>(Lorg/jboss/netty/handler/codec/spdy/SpdyVersion;ILjava/util/Map;)V
    .locals 3
    .param p1, "spdyVersion"    # Lorg/jboss/netty/handler/codec/spdy/SpdyVersion;
    .param p2, "maxContentLength"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jboss/netty/handler/codec/spdy/SpdyVersion;",
            "I",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/Integer;",
            "Lorg/jboss/netty/handler/codec/http/HttpMessage;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 71
    .local p3, "messageMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/Integer;Lorg/jboss/netty/handler/codec/http/HttpMessage;>;"
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/oneone/OneToOneDecoder;-><init>()V

    .line 72
    if-nez p1, :cond_0

    .line 73
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "spdyVersion"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 75
    :cond_0
    if-gtz p2, :cond_1

    .line 76
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "maxContentLength must be a positive integer: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 79
    :cond_1
    invoke-virtual {p1}, Lorg/jboss/netty/handler/codec/spdy/SpdyVersion;->getVersion()I

    move-result v0

    iput v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpDecoder;->spdyVersion:I

    .line 80
    iput p2, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpDecoder;->maxContentLength:I

    .line 81
    iput-object p3, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpDecoder;->messageMap:Ljava/util/Map;

    .line 82
    return-void
.end method

.method private static createHttpRequest(ILorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;)Lorg/jboss/netty/handler/codec/http/HttpRequest;
    .locals 10
    .param p0, "spdyVersion"    # I
    .param p1, "requestFrame"    # Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 330
    invoke-static {p0, p1}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;->getMethod(ILorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;)Lorg/jboss/netty/handler/codec/http/HttpMethod;

    move-result-object v5

    .line 331
    .local v5, "method":Lorg/jboss/netty/handler/codec/http/HttpMethod;
    invoke-static {p0, p1}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;->getUrl(ILorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;)Ljava/lang/String;

    move-result-object v6

    .line 332
    .local v6, "url":Ljava/lang/String;
    invoke-static {p0, p1}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;->getVersion(ILorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;)Lorg/jboss/netty/handler/codec/http/HttpVersion;

    move-result-object v3

    .line 333
    .local v3, "httpVersion":Lorg/jboss/netty/handler/codec/http/HttpVersion;
    invoke-static {p0, p1}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;->removeMethod(ILorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;)V

    .line 334
    invoke-static {p0, p1}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;->removeUrl(ILorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;)V

    .line 335
    invoke-static {p0, p1}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;->removeVersion(ILorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;)V

    .line 337
    new-instance v2, Lorg/jboss/netty/handler/codec/http/DefaultHttpRequest;

    invoke-direct {v2, v3, v5, v6}, Lorg/jboss/netty/handler/codec/http/DefaultHttpRequest;-><init>(Lorg/jboss/netty/handler/codec/http/HttpVersion;Lorg/jboss/netty/handler/codec/http/HttpMethod;Ljava/lang/String;)V

    .line 340
    .local v2, "httpRequest":Lorg/jboss/netty/handler/codec/http/HttpRequest;
    invoke-static {p0, p1}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;->removeScheme(ILorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;)V

    .line 343
    invoke-static {p1}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;->getHost(Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;)Ljava/lang/String;

    move-result-object v1

    .line 344
    .local v1, "host":Ljava/lang/String;
    invoke-static {p1}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;->removeHost(Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;)V

    .line 345
    invoke-static {v2, v1}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->setHost(Lorg/jboss/netty/handler/codec/http/HttpMessage;Ljava/lang/String;)V

    .line 347
    invoke-interface {p1}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;->headers()Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;

    move-result-object v7

    invoke-virtual {v7}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_0

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 348
    .local v0, "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v2}, Lorg/jboss/netty/handler/codec/http/HttpRequest;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v8

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v9

    invoke-virtual {v8, v7, v9}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->add(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    goto :goto_0

    .line 352
    .end local v0    # "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_0
    const/4 v7, 0x1

    invoke-static {v2, v7}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->setKeepAlive(Lorg/jboss/netty/handler/codec/http/HttpMessage;Z)V

    .line 355
    invoke-interface {v2}, Lorg/jboss/netty/handler/codec/http/HttpRequest;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v7

    const-string v8, "Transfer-Encoding"

    invoke-virtual {v7, v8}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->remove(Ljava/lang/String;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .line 357
    return-object v2
.end method

.method private static createHttpResponse(ILorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;)Lorg/jboss/netty/handler/codec/http/HttpResponse;
    .locals 8
    .param p0, "spdyVersion"    # I
    .param p1, "responseFrame"    # Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 363
    invoke-static {p0, p1}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;->getStatus(ILorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;)Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;

    move-result-object v3

    .line 364
    .local v3, "status":Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;
    invoke-static {p0, p1}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;->getVersion(ILorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;)Lorg/jboss/netty/handler/codec/http/HttpVersion;

    move-result-object v4

    .line 365
    .local v4, "version":Lorg/jboss/netty/handler/codec/http/HttpVersion;
    invoke-static {p0, p1}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;->removeStatus(ILorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;)V

    .line 366
    invoke-static {p0, p1}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;->removeVersion(ILorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;)V

    .line 368
    new-instance v1, Lorg/jboss/netty/handler/codec/http/DefaultHttpResponse;

    invoke-direct {v1, v4, v3}, Lorg/jboss/netty/handler/codec/http/DefaultHttpResponse;-><init>(Lorg/jboss/netty/handler/codec/http/HttpVersion;Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;)V

    .line 369
    .local v1, "httpResponse":Lorg/jboss/netty/handler/codec/http/HttpResponse;
    invoke-interface {p1}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;->headers()Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;

    move-result-object v5

    invoke-virtual {v5}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 370
    .local v0, "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v1}, Lorg/jboss/netty/handler/codec/http/HttpResponse;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v6

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v6, v5, v7}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->add(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    goto :goto_0

    .line 374
    .end local v0    # "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_0
    const/4 v5, 0x1

    invoke-static {v1, v5}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->setKeepAlive(Lorg/jboss/netty/handler/codec/http/HttpMessage;Z)V

    .line 377
    invoke-interface {v1}, Lorg/jboss/netty/handler/codec/http/HttpResponse;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v5

    const-string v6, "Transfer-Encoding"

    invoke-virtual {v5, v6}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->remove(Ljava/lang/String;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .line 378
    invoke-interface {v1}, Lorg/jboss/netty/handler/codec/http/HttpResponse;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v5

    const-string v6, "Trailer"

    invoke-virtual {v5, v6}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->remove(Ljava/lang/String;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .line 380
    return-object v1
.end method


# virtual methods
.method protected decode(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 21
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p3, "msg"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 100
    move-object/from16 v0, p3

    instance-of v0, v0, Lorg/jboss/netty/handler/codec/spdy/SpdySynStreamFrame;

    move/from16 v18, v0

    if-eqz v18, :cond_7

    move-object/from16 v16, p3

    .line 103
    check-cast v16, Lorg/jboss/netty/handler/codec/spdy/SpdySynStreamFrame;

    .line 104
    .local v16, "spdySynStreamFrame":Lorg/jboss/netty/handler/codec/spdy/SpdySynStreamFrame;
    invoke-interface/range {v16 .. v16}, Lorg/jboss/netty/handler/codec/spdy/SpdySynStreamFrame;->getStreamId()I

    move-result v17

    .line 106
    .local v17, "streamId":I
    invoke-static/range {v17 .. v17}, Lorg/jboss/netty/handler/codec/spdy/SpdyCodecUtil;->isServerId(I)Z

    move-result v18

    if-eqz v18, :cond_4

    .line 108
    invoke-interface/range {v16 .. v16}, Lorg/jboss/netty/handler/codec/spdy/SpdySynStreamFrame;->getAssociatedToStreamId()I

    move-result v4

    .line 112
    .local v4, "associatedToStreamId":I
    if-nez v4, :cond_0

    .line 113
    new-instance v14, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyRstStreamFrame;

    sget-object v18, Lorg/jboss/netty/handler/codec/spdy/SpdyStreamStatus;->INVALID_STREAM:Lorg/jboss/netty/handler/codec/spdy/SpdyStreamStatus;

    move/from16 v0, v17

    move-object/from16 v1, v18

    invoke-direct {v14, v0, v1}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyRstStreamFrame;-><init>(ILorg/jboss/netty/handler/codec/spdy/SpdyStreamStatus;)V

    .line 115
    .local v14, "spdyRstStreamFrame":Lorg/jboss/netty/handler/codec/spdy/SpdyRstStreamFrame;
    invoke-static/range {p2 .. p2}, Lorg/jboss/netty/channel/Channels;->future(Lorg/jboss/netty/channel/Channel;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v18

    move-object/from16 v0, p1

    move-object/from16 v1, v18

    invoke-static {v0, v1, v14}, Lorg/jboss/netty/channel/Channels;->write(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelFuture;Ljava/lang/Object;)V

    .line 116
    const/4 v8, 0x0

    .line 324
    .end local v4    # "associatedToStreamId":I
    .end local v14    # "spdyRstStreamFrame":Lorg/jboss/netty/handler/codec/spdy/SpdyRstStreamFrame;
    .end local v16    # "spdySynStreamFrame":Lorg/jboss/netty/handler/codec/spdy/SpdySynStreamFrame;
    .end local v17    # "streamId":I
    :goto_0
    return-object v8

    .line 122
    .restart local v4    # "associatedToStreamId":I
    .restart local v16    # "spdySynStreamFrame":Lorg/jboss/netty/handler/codec/spdy/SpdySynStreamFrame;
    .restart local v17    # "streamId":I
    :cond_0
    invoke-interface/range {v16 .. v16}, Lorg/jboss/netty/handler/codec/spdy/SpdySynStreamFrame;->isLast()Z

    move-result v18

    if-eqz v18, :cond_1

    .line 123
    new-instance v14, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyRstStreamFrame;

    sget-object v18, Lorg/jboss/netty/handler/codec/spdy/SpdyStreamStatus;->PROTOCOL_ERROR:Lorg/jboss/netty/handler/codec/spdy/SpdyStreamStatus;

    move/from16 v0, v17

    move-object/from16 v1, v18

    invoke-direct {v14, v0, v1}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyRstStreamFrame;-><init>(ILorg/jboss/netty/handler/codec/spdy/SpdyStreamStatus;)V

    .line 125
    .restart local v14    # "spdyRstStreamFrame":Lorg/jboss/netty/handler/codec/spdy/SpdyRstStreamFrame;
    invoke-static/range {p2 .. p2}, Lorg/jboss/netty/channel/Channels;->future(Lorg/jboss/netty/channel/Channel;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v18

    move-object/from16 v0, p1

    move-object/from16 v1, v18

    invoke-static {v0, v1, v14}, Lorg/jboss/netty/channel/Channels;->write(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelFuture;Ljava/lang/Object;)V

    .line 126
    const/4 v8, 0x0

    goto :goto_0

    .line 131
    .end local v14    # "spdyRstStreamFrame":Lorg/jboss/netty/handler/codec/spdy/SpdyRstStreamFrame;
    :cond_1
    invoke-interface/range {v16 .. v16}, Lorg/jboss/netty/handler/codec/spdy/SpdySynStreamFrame;->isTruncated()Z

    move-result v18

    if-eqz v18, :cond_2

    .line 132
    new-instance v14, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyRstStreamFrame;

    sget-object v18, Lorg/jboss/netty/handler/codec/spdy/SpdyStreamStatus;->INTERNAL_ERROR:Lorg/jboss/netty/handler/codec/spdy/SpdyStreamStatus;

    move/from16 v0, v17

    move-object/from16 v1, v18

    invoke-direct {v14, v0, v1}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyRstStreamFrame;-><init>(ILorg/jboss/netty/handler/codec/spdy/SpdyStreamStatus;)V

    .line 134
    .restart local v14    # "spdyRstStreamFrame":Lorg/jboss/netty/handler/codec/spdy/SpdyRstStreamFrame;
    invoke-static/range {p2 .. p2}, Lorg/jboss/netty/channel/Channels;->future(Lorg/jboss/netty/channel/Channel;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v18

    move-object/from16 v0, p1

    move-object/from16 v1, v18

    invoke-static {v0, v1, v14}, Lorg/jboss/netty/channel/Channels;->write(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelFuture;Ljava/lang/Object;)V

    .line 135
    const/4 v8, 0x0

    goto :goto_0

    .line 139
    .end local v14    # "spdyRstStreamFrame":Lorg/jboss/netty/handler/codec/spdy/SpdyRstStreamFrame;
    :cond_2
    :try_start_0
    move-object/from16 v0, p0

    iget v0, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpDecoder;->spdyVersion:I

    move/from16 v18, v0

    move/from16 v0, v18

    move-object/from16 v1, v16

    invoke-static {v0, v1}, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpDecoder;->createHttpRequest(ILorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;)Lorg/jboss/netty/handler/codec/http/HttpRequest;

    move-result-object v9

    .line 142
    .local v9, "httpRequest":Lorg/jboss/netty/handler/codec/http/HttpRequest;
    move/from16 v0, v17

    invoke-static {v9, v0}, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpHeaders;->setStreamId(Lorg/jboss/netty/handler/codec/http/HttpMessage;I)V

    .line 143
    invoke-static {v9, v4}, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpHeaders;->setAssociatedToStreamId(Lorg/jboss/netty/handler/codec/http/HttpMessage;I)V

    .line 144
    invoke-interface/range {v16 .. v16}, Lorg/jboss/netty/handler/codec/spdy/SpdySynStreamFrame;->getPriority()B

    move-result v18

    move/from16 v0, v18

    invoke-static {v9, v0}, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpHeaders;->setPriority(Lorg/jboss/netty/handler/codec/http/HttpMessage;B)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-object v8, v9

    .line 146
    goto :goto_0

    .line 148
    .end local v9    # "httpRequest":Lorg/jboss/netty/handler/codec/http/HttpRequest;
    :catch_0
    move-exception v6

    .line 149
    .local v6, "e":Ljava/lang/Exception;
    new-instance v14, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyRstStreamFrame;

    sget-object v18, Lorg/jboss/netty/handler/codec/spdy/SpdyStreamStatus;->PROTOCOL_ERROR:Lorg/jboss/netty/handler/codec/spdy/SpdyStreamStatus;

    move/from16 v0, v17

    move-object/from16 v1, v18

    invoke-direct {v14, v0, v1}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyRstStreamFrame;-><init>(ILorg/jboss/netty/handler/codec/spdy/SpdyStreamStatus;)V

    .line 151
    .restart local v14    # "spdyRstStreamFrame":Lorg/jboss/netty/handler/codec/spdy/SpdyRstStreamFrame;
    invoke-static/range {p2 .. p2}, Lorg/jboss/netty/channel/Channels;->future(Lorg/jboss/netty/channel/Channel;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v18

    move-object/from16 v0, p1

    move-object/from16 v1, v18

    invoke-static {v0, v1, v14}, Lorg/jboss/netty/channel/Channels;->write(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelFuture;Ljava/lang/Object;)V

    .line 324
    .end local v4    # "associatedToStreamId":I
    .end local v6    # "e":Ljava/lang/Exception;
    .end local v14    # "spdyRstStreamFrame":Lorg/jboss/netty/handler/codec/spdy/SpdyRstStreamFrame;
    .end local v16    # "spdySynStreamFrame":Lorg/jboss/netty/handler/codec/spdy/SpdySynStreamFrame;
    .end local v17    # "streamId":I
    :cond_3
    :goto_1
    const/4 v8, 0x0

    goto :goto_0

    .line 158
    .restart local v16    # "spdySynStreamFrame":Lorg/jboss/netty/handler/codec/spdy/SpdySynStreamFrame;
    .restart local v17    # "streamId":I
    :cond_4
    invoke-interface/range {v16 .. v16}, Lorg/jboss/netty/handler/codec/spdy/SpdySynStreamFrame;->isTruncated()Z

    move-result v18

    if-eqz v18, :cond_5

    .line 159
    new-instance v15, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdySynReplyFrame;

    move/from16 v0, v17

    invoke-direct {v15, v0}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdySynReplyFrame;-><init>(I)V

    .line 160
    .local v15, "spdySynReplyFrame":Lorg/jboss/netty/handler/codec/spdy/SpdySynReplyFrame;
    const/16 v18, 0x1

    move/from16 v0, v18

    invoke-interface {v15, v0}, Lorg/jboss/netty/handler/codec/spdy/SpdySynReplyFrame;->setLast(Z)V

    .line 161
    move-object/from16 v0, p0

    iget v0, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpDecoder;->spdyVersion:I

    move/from16 v18, v0

    sget-object v19, Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;->REQUEST_HEADER_FIELDS_TOO_LARGE:Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;

    move/from16 v0, v18

    move-object/from16 v1, v19

    invoke-static {v0, v15, v1}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;->setStatus(ILorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;)V

    .line 164
    move-object/from16 v0, p0

    iget v0, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpDecoder;->spdyVersion:I

    move/from16 v18, v0

    sget-object v19, Lorg/jboss/netty/handler/codec/http/HttpVersion;->HTTP_1_0:Lorg/jboss/netty/handler/codec/http/HttpVersion;

    move/from16 v0, v18

    move-object/from16 v1, v19

    invoke-static {v0, v15, v1}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;->setVersion(ILorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;Lorg/jboss/netty/handler/codec/http/HttpVersion;)V

    .line 165
    invoke-static/range {p2 .. p2}, Lorg/jboss/netty/channel/Channels;->future(Lorg/jboss/netty/channel/Channel;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v18

    move-object/from16 v0, p1

    move-object/from16 v1, v18

    invoke-static {v0, v1, v15}, Lorg/jboss/netty/channel/Channels;->write(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelFuture;Ljava/lang/Object;)V

    .line 166
    const/4 v8, 0x0

    goto/16 :goto_0

    .line 170
    .end local v15    # "spdySynReplyFrame":Lorg/jboss/netty/handler/codec/spdy/SpdySynReplyFrame;
    :cond_5
    :try_start_1
    move-object/from16 v0, p0

    iget v0, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpDecoder;->spdyVersion:I

    move/from16 v18, v0

    move/from16 v0, v18

    move-object/from16 v1, v16

    invoke-static {v0, v1}, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpDecoder;->createHttpRequest(ILorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;)Lorg/jboss/netty/handler/codec/http/HttpRequest;

    move-result-object v9

    .line 173
    .restart local v9    # "httpRequest":Lorg/jboss/netty/handler/codec/http/HttpRequest;
    move/from16 v0, v17

    invoke-static {v9, v0}, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpHeaders;->setStreamId(Lorg/jboss/netty/handler/codec/http/HttpMessage;I)V

    .line 175
    invoke-interface/range {v16 .. v16}, Lorg/jboss/netty/handler/codec/spdy/SpdySynStreamFrame;->isLast()Z

    move-result v18

    if-eqz v18, :cond_6

    move-object v8, v9

    .line 176
    goto/16 :goto_0

    .line 179
    :cond_6
    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1, v9}, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpDecoder;->putMessage(ILorg/jboss/netty/handler/codec/http/HttpMessage;)Lorg/jboss/netty/handler/codec/http/HttpMessage;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    .line 181
    .end local v9    # "httpRequest":Lorg/jboss/netty/handler/codec/http/HttpRequest;
    :catch_1
    move-exception v6

    .line 185
    .restart local v6    # "e":Ljava/lang/Exception;
    new-instance v15, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdySynReplyFrame;

    move/from16 v0, v17

    invoke-direct {v15, v0}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdySynReplyFrame;-><init>(I)V

    .line 186
    .restart local v15    # "spdySynReplyFrame":Lorg/jboss/netty/handler/codec/spdy/SpdySynReplyFrame;
    const/16 v18, 0x1

    move/from16 v0, v18

    invoke-interface {v15, v0}, Lorg/jboss/netty/handler/codec/spdy/SpdySynReplyFrame;->setLast(Z)V

    .line 187
    move-object/from16 v0, p0

    iget v0, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpDecoder;->spdyVersion:I

    move/from16 v18, v0

    sget-object v19, Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;->BAD_REQUEST:Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;

    move/from16 v0, v18

    move-object/from16 v1, v19

    invoke-static {v0, v15, v1}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;->setStatus(ILorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;)V

    .line 188
    move-object/from16 v0, p0

    iget v0, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpDecoder;->spdyVersion:I

    move/from16 v18, v0

    sget-object v19, Lorg/jboss/netty/handler/codec/http/HttpVersion;->HTTP_1_0:Lorg/jboss/netty/handler/codec/http/HttpVersion;

    move/from16 v0, v18

    move-object/from16 v1, v19

    invoke-static {v0, v15, v1}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;->setVersion(ILorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;Lorg/jboss/netty/handler/codec/http/HttpVersion;)V

    .line 189
    invoke-static/range {p2 .. p2}, Lorg/jboss/netty/channel/Channels;->future(Lorg/jboss/netty/channel/Channel;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v18

    move-object/from16 v0, p1

    move-object/from16 v1, v18

    invoke-static {v0, v1, v15}, Lorg/jboss/netty/channel/Channels;->write(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelFuture;Ljava/lang/Object;)V

    goto/16 :goto_1

    .line 193
    .end local v6    # "e":Ljava/lang/Exception;
    .end local v15    # "spdySynReplyFrame":Lorg/jboss/netty/handler/codec/spdy/SpdySynReplyFrame;
    .end local v16    # "spdySynStreamFrame":Lorg/jboss/netty/handler/codec/spdy/SpdySynStreamFrame;
    .end local v17    # "streamId":I
    :cond_7
    move-object/from16 v0, p3

    instance-of v0, v0, Lorg/jboss/netty/handler/codec/spdy/SpdySynReplyFrame;

    move/from16 v18, v0

    if-eqz v18, :cond_a

    move-object/from16 v15, p3

    .line 195
    check-cast v15, Lorg/jboss/netty/handler/codec/spdy/SpdySynReplyFrame;

    .line 196
    .restart local v15    # "spdySynReplyFrame":Lorg/jboss/netty/handler/codec/spdy/SpdySynReplyFrame;
    invoke-interface {v15}, Lorg/jboss/netty/handler/codec/spdy/SpdySynReplyFrame;->getStreamId()I

    move-result v17

    .line 200
    .restart local v17    # "streamId":I
    invoke-interface {v15}, Lorg/jboss/netty/handler/codec/spdy/SpdySynReplyFrame;->isTruncated()Z

    move-result v18

    if-eqz v18, :cond_8

    .line 201
    new-instance v14, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyRstStreamFrame;

    sget-object v18, Lorg/jboss/netty/handler/codec/spdy/SpdyStreamStatus;->INTERNAL_ERROR:Lorg/jboss/netty/handler/codec/spdy/SpdyStreamStatus;

    move/from16 v0, v17

    move-object/from16 v1, v18

    invoke-direct {v14, v0, v1}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyRstStreamFrame;-><init>(ILorg/jboss/netty/handler/codec/spdy/SpdyStreamStatus;)V

    .line 203
    .restart local v14    # "spdyRstStreamFrame":Lorg/jboss/netty/handler/codec/spdy/SpdyRstStreamFrame;
    invoke-static/range {p2 .. p2}, Lorg/jboss/netty/channel/Channels;->future(Lorg/jboss/netty/channel/Channel;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v18

    move-object/from16 v0, p1

    move-object/from16 v1, v18

    invoke-static {v0, v1, v14}, Lorg/jboss/netty/channel/Channels;->write(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelFuture;Ljava/lang/Object;)V

    .line 204
    const/4 v8, 0x0

    goto/16 :goto_0

    .line 208
    .end local v14    # "spdyRstStreamFrame":Lorg/jboss/netty/handler/codec/spdy/SpdyRstStreamFrame;
    :cond_8
    :try_start_2
    move-object/from16 v0, p0

    iget v0, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpDecoder;->spdyVersion:I

    move/from16 v18, v0

    move/from16 v0, v18

    invoke-static {v0, v15}, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpDecoder;->createHttpResponse(ILorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;)Lorg/jboss/netty/handler/codec/http/HttpResponse;

    move-result-object v10

    .line 211
    .local v10, "httpResponse":Lorg/jboss/netty/handler/codec/http/HttpResponse;
    move/from16 v0, v17

    invoke-static {v10, v0}, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpHeaders;->setStreamId(Lorg/jboss/netty/handler/codec/http/HttpMessage;I)V

    .line 213
    invoke-interface {v15}, Lorg/jboss/netty/handler/codec/spdy/SpdySynReplyFrame;->isLast()Z

    move-result v18

    if-eqz v18, :cond_9

    .line 214
    const-wide/16 v18, 0x0

    move-wide/from16 v0, v18

    invoke-static {v10, v0, v1}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->setContentLength(Lorg/jboss/netty/handler/codec/http/HttpMessage;J)V

    move-object v8, v10

    .line 215
    goto/16 :goto_0

    .line 218
    :cond_9
    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1, v10}, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpDecoder;->putMessage(ILorg/jboss/netty/handler/codec/http/HttpMessage;)Lorg/jboss/netty/handler/codec/http/HttpMessage;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    goto/16 :goto_1

    .line 220
    .end local v10    # "httpResponse":Lorg/jboss/netty/handler/codec/http/HttpResponse;
    :catch_2
    move-exception v6

    .line 223
    .restart local v6    # "e":Ljava/lang/Exception;
    new-instance v14, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyRstStreamFrame;

    sget-object v18, Lorg/jboss/netty/handler/codec/spdy/SpdyStreamStatus;->PROTOCOL_ERROR:Lorg/jboss/netty/handler/codec/spdy/SpdyStreamStatus;

    move/from16 v0, v17

    move-object/from16 v1, v18

    invoke-direct {v14, v0, v1}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyRstStreamFrame;-><init>(ILorg/jboss/netty/handler/codec/spdy/SpdyStreamStatus;)V

    .line 225
    .restart local v14    # "spdyRstStreamFrame":Lorg/jboss/netty/handler/codec/spdy/SpdyRstStreamFrame;
    invoke-static/range {p2 .. p2}, Lorg/jboss/netty/channel/Channels;->future(Lorg/jboss/netty/channel/Channel;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v18

    move-object/from16 v0, p1

    move-object/from16 v1, v18

    invoke-static {v0, v1, v14}, Lorg/jboss/netty/channel/Channels;->write(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelFuture;Ljava/lang/Object;)V

    goto/16 :goto_1

    .line 228
    .end local v6    # "e":Ljava/lang/Exception;
    .end local v14    # "spdyRstStreamFrame":Lorg/jboss/netty/handler/codec/spdy/SpdyRstStreamFrame;
    .end local v15    # "spdySynReplyFrame":Lorg/jboss/netty/handler/codec/spdy/SpdySynReplyFrame;
    .end local v17    # "streamId":I
    :cond_a
    move-object/from16 v0, p3

    instance-of v0, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;

    move/from16 v18, v0

    if-eqz v18, :cond_10

    move-object/from16 v13, p3

    .line 230
    check-cast v13, Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;

    .line 231
    .local v13, "spdyHeadersFrame":Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;
    invoke-interface {v13}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;->getStreamId()I

    move-result v17

    .line 232
    .restart local v17    # "streamId":I
    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpDecoder;->getMessage(I)Lorg/jboss/netty/handler/codec/http/HttpMessage;

    move-result-object v8

    .line 234
    .local v8, "httpMessage":Lorg/jboss/netty/handler/codec/http/HttpMessage;
    if-nez v8, :cond_e

    .line 236
    invoke-static/range {v17 .. v17}, Lorg/jboss/netty/handler/codec/spdy/SpdyCodecUtil;->isServerId(I)Z

    move-result v18

    if-eqz v18, :cond_d

    .line 240
    invoke-interface {v13}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;->isTruncated()Z

    move-result v18

    if-eqz v18, :cond_b

    .line 241
    new-instance v14, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyRstStreamFrame;

    sget-object v18, Lorg/jboss/netty/handler/codec/spdy/SpdyStreamStatus;->INTERNAL_ERROR:Lorg/jboss/netty/handler/codec/spdy/SpdyStreamStatus;

    move/from16 v0, v17

    move-object/from16 v1, v18

    invoke-direct {v14, v0, v1}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyRstStreamFrame;-><init>(ILorg/jboss/netty/handler/codec/spdy/SpdyStreamStatus;)V

    .line 243
    .restart local v14    # "spdyRstStreamFrame":Lorg/jboss/netty/handler/codec/spdy/SpdyRstStreamFrame;
    invoke-static/range {p2 .. p2}, Lorg/jboss/netty/channel/Channels;->future(Lorg/jboss/netty/channel/Channel;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v18

    move-object/from16 v0, p1

    move-object/from16 v1, v18

    invoke-static {v0, v1, v14}, Lorg/jboss/netty/channel/Channels;->write(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelFuture;Ljava/lang/Object;)V

    .line 244
    const/4 v8, 0x0

    goto/16 :goto_0

    .line 248
    .end local v14    # "spdyRstStreamFrame":Lorg/jboss/netty/handler/codec/spdy/SpdyRstStreamFrame;
    :cond_b
    :try_start_3
    move-object/from16 v0, p0

    iget v0, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpDecoder;->spdyVersion:I

    move/from16 v18, v0

    move/from16 v0, v18

    invoke-static {v0, v13}, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpDecoder;->createHttpResponse(ILorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;)Lorg/jboss/netty/handler/codec/http/HttpResponse;

    move-result-object v8

    .line 251
    move/from16 v0, v17

    invoke-static {v8, v0}, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpHeaders;->setStreamId(Lorg/jboss/netty/handler/codec/http/HttpMessage;I)V

    .line 253
    invoke-interface {v13}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;->isLast()Z

    move-result v18

    if-eqz v18, :cond_c

    .line 254
    const-wide/16 v18, 0x0

    move-wide/from16 v0, v18

    invoke-static {v8, v0, v1}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->setContentLength(Lorg/jboss/netty/handler/codec/http/HttpMessage;J)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3

    goto/16 :goto_0

    .line 260
    :catch_3
    move-exception v6

    .line 263
    .restart local v6    # "e":Ljava/lang/Exception;
    new-instance v14, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyRstStreamFrame;

    sget-object v18, Lorg/jboss/netty/handler/codec/spdy/SpdyStreamStatus;->PROTOCOL_ERROR:Lorg/jboss/netty/handler/codec/spdy/SpdyStreamStatus;

    move/from16 v0, v17

    move-object/from16 v1, v18

    invoke-direct {v14, v0, v1}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyRstStreamFrame;-><init>(ILorg/jboss/netty/handler/codec/spdy/SpdyStreamStatus;)V

    .line 265
    .restart local v14    # "spdyRstStreamFrame":Lorg/jboss/netty/handler/codec/spdy/SpdyRstStreamFrame;
    invoke-static/range {p2 .. p2}, Lorg/jboss/netty/channel/Channels;->future(Lorg/jboss/netty/channel/Channel;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v18

    move-object/from16 v0, p1

    move-object/from16 v1, v18

    invoke-static {v0, v1, v14}, Lorg/jboss/netty/channel/Channels;->write(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelFuture;Ljava/lang/Object;)V

    .line 266
    const/4 v8, 0x0

    goto/16 :goto_0

    .line 258
    .end local v6    # "e":Ljava/lang/Exception;
    .end local v14    # "spdyRstStreamFrame":Lorg/jboss/netty/handler/codec/spdy/SpdyRstStreamFrame;
    :cond_c
    :try_start_4
    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1, v8}, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpDecoder;->putMessage(ILorg/jboss/netty/handler/codec/http/HttpMessage;)Lorg/jboss/netty/handler/codec/http/HttpMessage;
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3

    .line 269
    :cond_d
    const/4 v8, 0x0

    goto/16 :goto_0

    .line 273
    :cond_e
    invoke-interface {v13}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;->isTruncated()Z

    move-result v18

    if-nez v18, :cond_f

    .line 274
    invoke-interface {v13}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;->headers()Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;->iterator()Ljava/util/Iterator;

    move-result-object v11

    .local v11, "i$":Ljava/util/Iterator;
    :goto_2
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v18

    if-eqz v18, :cond_f

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/Map$Entry;

    .line 275
    .local v7, "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v8}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v19

    invoke-interface {v7}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Ljava/lang/String;

    invoke-interface {v7}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v20

    move-object/from16 v0, v19

    move-object/from16 v1, v18

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->add(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    goto :goto_2

    .line 279
    .end local v7    # "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v11    # "i$":Ljava/util/Iterator;
    :cond_f
    invoke-interface {v13}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;->isLast()Z

    move-result v18

    if-eqz v18, :cond_3

    .line 280
    invoke-interface {v8}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->getContent()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v18

    invoke-interface/range {v18 .. v18}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v18

    move/from16 v0, v18

    int-to-long v0, v0

    move-wide/from16 v18, v0

    move-wide/from16 v0, v18

    invoke-static {v8, v0, v1}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->setContentLength(Lorg/jboss/netty/handler/codec/http/HttpMessage;J)V

    .line 281
    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpDecoder;->removeMessage(I)Lorg/jboss/netty/handler/codec/http/HttpMessage;

    goto/16 :goto_0

    .line 285
    .end local v8    # "httpMessage":Lorg/jboss/netty/handler/codec/http/HttpMessage;
    .end local v13    # "spdyHeadersFrame":Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;
    .end local v17    # "streamId":I
    :cond_10
    move-object/from16 v0, p3

    instance-of v0, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyDataFrame;

    move/from16 v18, v0

    if-eqz v18, :cond_14

    move-object/from16 v12, p3

    .line 287
    check-cast v12, Lorg/jboss/netty/handler/codec/spdy/SpdyDataFrame;

    .line 288
    .local v12, "spdyDataFrame":Lorg/jboss/netty/handler/codec/spdy/SpdyDataFrame;
    invoke-interface {v12}, Lorg/jboss/netty/handler/codec/spdy/SpdyDataFrame;->getStreamId()I

    move-result v17

    .line 289
    .restart local v17    # "streamId":I
    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpDecoder;->getMessage(I)Lorg/jboss/netty/handler/codec/http/HttpMessage;

    move-result-object v8

    .line 292
    .restart local v8    # "httpMessage":Lorg/jboss/netty/handler/codec/http/HttpMessage;
    if-nez v8, :cond_11

    .line 293
    const/4 v8, 0x0

    goto/16 :goto_0

    .line 296
    :cond_11
    invoke-interface {v8}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->getContent()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v5

    .line 297
    .local v5, "content":Lorg/jboss/netty/buffer/ChannelBuffer;
    invoke-interface {v5}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v18

    move-object/from16 v0, p0

    iget v0, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpDecoder;->maxContentLength:I

    move/from16 v19, v0

    invoke-interface {v12}, Lorg/jboss/netty/handler/codec/spdy/SpdyDataFrame;->getData()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v20

    invoke-interface/range {v20 .. v20}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v20

    sub-int v19, v19, v20

    move/from16 v0, v18

    move/from16 v1, v19

    if-le v0, v1, :cond_12

    .line 298
    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpDecoder;->removeMessage(I)Lorg/jboss/netty/handler/codec/http/HttpMessage;

    .line 299
    new-instance v18, Lorg/jboss/netty/handler/codec/frame/TooLongFrameException;

    new-instance v19, Ljava/lang/StringBuilder;

    invoke-direct/range {v19 .. v19}, Ljava/lang/StringBuilder;-><init>()V

    const-string v20, "HTTP content length exceeded "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, p0

    iget v0, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpDecoder;->maxContentLength:I

    move/from16 v20, v0

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, " bytes."

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-direct/range {v18 .. v19}, Lorg/jboss/netty/handler/codec/frame/TooLongFrameException;-><init>(Ljava/lang/String;)V

    throw v18

    .line 303
    :cond_12
    sget-object v18, Lorg/jboss/netty/buffer/ChannelBuffers;->EMPTY_BUFFER:Lorg/jboss/netty/buffer/ChannelBuffer;

    move-object/from16 v0, v18

    if-ne v5, v0, :cond_13

    .line 304
    invoke-interface/range {p2 .. p2}, Lorg/jboss/netty/channel/Channel;->getConfig()Lorg/jboss/netty/channel/ChannelConfig;

    move-result-object v18

    invoke-interface/range {v18 .. v18}, Lorg/jboss/netty/channel/ChannelConfig;->getBufferFactory()Lorg/jboss/netty/buffer/ChannelBufferFactory;

    move-result-object v18

    invoke-static/range {v18 .. v18}, Lorg/jboss/netty/buffer/ChannelBuffers;->dynamicBuffer(Lorg/jboss/netty/buffer/ChannelBufferFactory;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v5

    .line 305
    invoke-interface {v12}, Lorg/jboss/netty/handler/codec/spdy/SpdyDataFrame;->getData()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-interface {v5, v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeBytes(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    .line 306
    invoke-interface {v8, v5}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->setContent(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    .line 311
    :goto_3
    invoke-interface {v12}, Lorg/jboss/netty/handler/codec/spdy/SpdyDataFrame;->isLast()Z

    move-result v18

    if-eqz v18, :cond_3

    .line 312
    invoke-interface {v5}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v18

    move/from16 v0, v18

    int-to-long v0, v0

    move-wide/from16 v18, v0

    move-wide/from16 v0, v18

    invoke-static {v8, v0, v1}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->setContentLength(Lorg/jboss/netty/handler/codec/http/HttpMessage;J)V

    .line 313
    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpDecoder;->removeMessage(I)Lorg/jboss/netty/handler/codec/http/HttpMessage;

    goto/16 :goto_0

    .line 308
    :cond_13
    invoke-interface {v12}, Lorg/jboss/netty/handler/codec/spdy/SpdyDataFrame;->getData()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-interface {v5, v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeBytes(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    goto :goto_3

    .line 317
    .end local v5    # "content":Lorg/jboss/netty/buffer/ChannelBuffer;
    .end local v8    # "httpMessage":Lorg/jboss/netty/handler/codec/http/HttpMessage;
    .end local v12    # "spdyDataFrame":Lorg/jboss/netty/handler/codec/spdy/SpdyDataFrame;
    .end local v17    # "streamId":I
    :cond_14
    move-object/from16 v0, p3

    instance-of v0, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyRstStreamFrame;

    move/from16 v18, v0

    if-eqz v18, :cond_3

    move-object/from16 v14, p3

    .line 319
    check-cast v14, Lorg/jboss/netty/handler/codec/spdy/SpdyRstStreamFrame;

    .line 320
    .restart local v14    # "spdyRstStreamFrame":Lorg/jboss/netty/handler/codec/spdy/SpdyRstStreamFrame;
    invoke-interface {v14}, Lorg/jboss/netty/handler/codec/spdy/SpdyRstStreamFrame;->getStreamId()I

    move-result v17

    .line 321
    .restart local v17    # "streamId":I
    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpDecoder;->removeMessage(I)Lorg/jboss/netty/handler/codec/http/HttpMessage;

    goto/16 :goto_1
.end method

.method protected getMessage(I)Lorg/jboss/netty/handler/codec/http/HttpMessage;
    .locals 2
    .param p1, "streamId"    # I

    .prologue
    .line 89
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpDecoder;->messageMap:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/handler/codec/http/HttpMessage;

    return-object v0
.end method

.method protected putMessage(ILorg/jboss/netty/handler/codec/http/HttpMessage;)Lorg/jboss/netty/handler/codec/http/HttpMessage;
    .locals 2
    .param p1, "streamId"    # I
    .param p2, "message"    # Lorg/jboss/netty/handler/codec/http/HttpMessage;

    .prologue
    .line 85
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpDecoder;->messageMap:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/handler/codec/http/HttpMessage;

    return-object v0
.end method

.method protected removeMessage(I)Lorg/jboss/netty/handler/codec/http/HttpMessage;
    .locals 2
    .param p1, "streamId"    # I

    .prologue
    .line 93
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpDecoder;->messageMap:Ljava/util/Map;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/handler/codec/http/HttpMessage;

    return-object v0
.end method
