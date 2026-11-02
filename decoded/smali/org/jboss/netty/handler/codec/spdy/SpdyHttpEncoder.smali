.class public Lorg/jboss/netty/handler/codec/spdy/SpdyHttpEncoder;
.super Ljava/lang/Object;
.source "SpdyHttpEncoder.java"

# interfaces
.implements Lorg/jboss/netty/channel/ChannelDownstreamHandler;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jboss/netty/handler/codec/spdy/SpdyHttpEncoder$SpdyFrameWriter;
    }
.end annotation


# instance fields
.field private volatile currentStreamId:I

.field private final spdyVersion:I


# direct methods
.method public constructor <init>(Lorg/jboss/netty/handler/codec/spdy/SpdyVersion;)V
    .locals 2
    .param p1, "spdyVersion"    # Lorg/jboss/netty/handler/codec/spdy/SpdyVersion;

    .prologue
    .line 139
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 140
    if-nez p1, :cond_0

    .line 141
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "spdyVersion"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 143
    :cond_0
    invoke-virtual {p1}, Lorg/jboss/netty/handler/codec/spdy/SpdyVersion;->getVersion()I

    move-result v0

    iput v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpEncoder;->spdyVersion:I

    .line 144
    return-void
.end method

.method private createSpdyDataFrames(ILorg/jboss/netty/buffer/ChannelBuffer;)[Lorg/jboss/netty/handler/codec/spdy/SpdyDataFrame;
    .locals 8
    .param p1, "streamId"    # I
    .param p2, "content"    # Lorg/jboss/netty/buffer/ChannelBuffer;

    .prologue
    const v7, 0xffffff

    .line 369
    invoke-interface {p2}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v3

    .line 370
    .local v3, "readableBytes":I
    div-int v0, v3, v7

    .line 371
    .local v0, "count":I
    rem-int v6, v3, v7

    if-lez v6, :cond_0

    .line 372
    add-int/lit8 v0, v0, 0x1

    .line 374
    :cond_0
    new-array v5, v0, [Lorg/jboss/netty/handler/codec/spdy/SpdyDataFrame;

    .line 375
    .local v5, "spdyDataFrames":[Lorg/jboss/netty/handler/codec/spdy/SpdyDataFrame;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    if-ge v2, v0, :cond_1

    .line 376
    new-instance v4, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyDataFrame;

    invoke-direct {v4, p1}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyDataFrame;-><init>(I)V

    .line 377
    .local v4, "spdyDataFrame":Lorg/jboss/netty/handler/codec/spdy/SpdyDataFrame;
    invoke-interface {p2}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v6

    invoke-static {v6, v7}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 378
    .local v1, "dataSize":I
    invoke-interface {p2, v1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readSlice(I)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v6

    invoke-interface {v4, v6}, Lorg/jboss/netty/handler/codec/spdy/SpdyDataFrame;->setData(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    .line 379
    aput-object v4, v5, v2

    .line 375
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 381
    .end local v1    # "dataSize":I
    .end local v4    # "spdyDataFrame":Lorg/jboss/netty/handler/codec/spdy/SpdyDataFrame;
    :cond_1
    return-object v5
.end method

.method private createSynReplyFrame(Lorg/jboss/netty/handler/codec/http/HttpResponse;)Lorg/jboss/netty/handler/codec/spdy/SpdySynReplyFrame;
    .locals 8
    .param p1, "httpResponse"    # Lorg/jboss/netty/handler/codec/http/HttpResponse;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 340
    invoke-interface {p1}, Lorg/jboss/netty/handler/codec/http/HttpResponse;->isChunked()Z

    move-result v0

    .line 343
    .local v0, "chunked":Z
    invoke-static {p1}, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpHeaders;->getStreamId(Lorg/jboss/netty/handler/codec/http/HttpMessage;)I

    move-result v4

    .line 344
    .local v4, "streamId":I
    invoke-static {p1}, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpHeaders;->removeStreamId(Lorg/jboss/netty/handler/codec/http/HttpMessage;)V

    .line 348
    invoke-interface {p1}, Lorg/jboss/netty/handler/codec/http/HttpResponse;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v5

    const-string v6, "Connection"

    invoke-virtual {v5, v6}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->remove(Ljava/lang/String;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .line 349
    invoke-interface {p1}, Lorg/jboss/netty/handler/codec/http/HttpResponse;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v5

    const-string v6, "Keep-Alive"

    invoke-virtual {v5, v6}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->remove(Ljava/lang/String;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .line 350
    invoke-interface {p1}, Lorg/jboss/netty/handler/codec/http/HttpResponse;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v5

    const-string v6, "Proxy-Connection"

    invoke-virtual {v5, v6}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->remove(Ljava/lang/String;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .line 351
    invoke-interface {p1}, Lorg/jboss/netty/handler/codec/http/HttpResponse;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v5

    const-string v6, "Transfer-Encoding"

    invoke-virtual {v5, v6}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->remove(Ljava/lang/String;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .line 353
    new-instance v3, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdySynReplyFrame;

    invoke-direct {v3, v4}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdySynReplyFrame;-><init>(I)V

    .line 354
    .local v3, "spdySynReplyFrame":Lorg/jboss/netty/handler/codec/spdy/SpdySynReplyFrame;
    if-nez v0, :cond_0

    invoke-interface {p1}, Lorg/jboss/netty/handler/codec/http/HttpResponse;->getContent()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v5

    invoke-interface {v5}, Lorg/jboss/netty/buffer/ChannelBuffer;->readable()Z

    move-result v5

    if-nez v5, :cond_0

    const/4 v5, 0x1

    :goto_0
    invoke-interface {v3, v5}, Lorg/jboss/netty/handler/codec/spdy/SpdySynReplyFrame;->setLast(Z)V

    .line 357
    iget v5, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpEncoder;->spdyVersion:I

    invoke-interface {p1}, Lorg/jboss/netty/handler/codec/http/HttpResponse;->getStatus()Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;

    move-result-object v6

    invoke-static {v5, v3, v6}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;->setStatus(ILorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;)V

    .line 358
    iget v5, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpEncoder;->spdyVersion:I

    invoke-interface {p1}, Lorg/jboss/netty/handler/codec/http/HttpResponse;->getProtocolVersion()Lorg/jboss/netty/handler/codec/http/HttpVersion;

    move-result-object v6

    invoke-static {v5, v3, v6}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;->setVersion(ILorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;Lorg/jboss/netty/handler/codec/http/HttpVersion;)V

    .line 361
    invoke-interface {p1}, Lorg/jboss/netty/handler/codec/http/HttpResponse;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v5

    invoke-virtual {v5}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 362
    .local v1, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v3}, Lorg/jboss/netty/handler/codec/spdy/SpdySynReplyFrame;->headers()Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;

    move-result-object v6

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v6, v5, v7}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;->add(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;

    goto :goto_1

    .line 354
    .end local v1    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v2    # "i$":Ljava/util/Iterator;
    :cond_0
    const/4 v5, 0x0

    goto :goto_0

    .line 365
    .restart local v2    # "i$":Ljava/util/Iterator;
    :cond_1
    return-object v3
.end method

.method private createSynStreamFrame(Lorg/jboss/netty/handler/codec/http/HttpMessage;)Lorg/jboss/netty/handler/codec/spdy/SpdySynStreamFrame;
    .locals 16
    .param p1, "httpMessage"    # Lorg/jboss/netty/handler/codec/http/HttpMessage;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 279
    invoke-interface/range {p1 .. p1}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->isChunked()Z

    move-result v3

    .line 282
    .local v3, "chunked":Z
    invoke-static/range {p1 .. p1}, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpHeaders;->getStreamId(Lorg/jboss/netty/handler/codec/http/HttpMessage;)I

    move-result v12

    .line 283
    .local v12, "streamId":I
    invoke-static/range {p1 .. p1}, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpHeaders;->getAssociatedToStreamId(Lorg/jboss/netty/handler/codec/http/HttpMessage;)I

    move-result v2

    .line 284
    .local v2, "associatedToStreamId":I
    invoke-static/range {p1 .. p1}, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpHeaders;->getPriority(Lorg/jboss/netty/handler/codec/http/HttpMessage;)B

    move-result v9

    .line 285
    .local v9, "priority":B
    invoke-static/range {p1 .. p1}, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpHeaders;->getUrl(Lorg/jboss/netty/handler/codec/http/HttpMessage;)Ljava/lang/String;

    move-result-object v1

    .line 286
    .local v1, "URL":Ljava/lang/String;
    invoke-static/range {p1 .. p1}, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpHeaders;->getScheme(Lorg/jboss/netty/handler/codec/http/HttpMessage;)Ljava/lang/String;

    move-result-object v10

    .line 287
    .local v10, "scheme":Ljava/lang/String;
    invoke-static/range {p1 .. p1}, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpHeaders;->removeStreamId(Lorg/jboss/netty/handler/codec/http/HttpMessage;)V

    .line 288
    invoke-static/range {p1 .. p1}, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpHeaders;->removeAssociatedToStreamId(Lorg/jboss/netty/handler/codec/http/HttpMessage;)V

    .line 289
    invoke-static/range {p1 .. p1}, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpHeaders;->removePriority(Lorg/jboss/netty/handler/codec/http/HttpMessage;)V

    .line 290
    invoke-static/range {p1 .. p1}, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpHeaders;->removeUrl(Lorg/jboss/netty/handler/codec/http/HttpMessage;)V

    .line 291
    invoke-static/range {p1 .. p1}, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpHeaders;->removeScheme(Lorg/jboss/netty/handler/codec/http/HttpMessage;)V

    .line 295
    invoke-interface/range {p1 .. p1}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v13

    const-string v14, "Connection"

    invoke-virtual {v13, v14}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->remove(Ljava/lang/String;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .line 296
    invoke-interface/range {p1 .. p1}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v13

    const-string v14, "Keep-Alive"

    invoke-virtual {v13, v14}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->remove(Ljava/lang/String;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .line 297
    invoke-interface/range {p1 .. p1}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v13

    const-string v14, "Proxy-Connection"

    invoke-virtual {v13, v14}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->remove(Ljava/lang/String;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .line 298
    invoke-interface/range {p1 .. p1}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v13

    const-string v14, "Transfer-Encoding"

    invoke-virtual {v13, v14}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->remove(Ljava/lang/String;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .line 300
    new-instance v11, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdySynStreamFrame;

    invoke-direct {v11, v12, v2, v9}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdySynStreamFrame;-><init>(IIB)V

    .line 302
    .local v11, "spdySynStreamFrame":Lorg/jboss/netty/handler/codec/spdy/SpdySynStreamFrame;
    if-nez v3, :cond_3

    invoke-interface/range {p1 .. p1}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->getContent()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v13

    invoke-interface {v13}, Lorg/jboss/netty/buffer/ChannelBuffer;->readable()Z

    move-result v13

    if-nez v13, :cond_3

    const/4 v13, 0x1

    :goto_0
    invoke-interface {v11, v13}, Lorg/jboss/netty/handler/codec/spdy/SpdySynStreamFrame;->setLast(Z)V

    .line 305
    move-object/from16 v0, p1

    instance-of v13, v0, Lorg/jboss/netty/handler/codec/http/HttpRequest;

    if-eqz v13, :cond_0

    move-object/from16 v6, p1

    .line 306
    check-cast v6, Lorg/jboss/netty/handler/codec/http/HttpRequest;

    .line 307
    .local v6, "httpRequest":Lorg/jboss/netty/handler/codec/http/HttpRequest;
    move-object/from16 v0, p0

    iget v13, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpEncoder;->spdyVersion:I

    invoke-interface {v6}, Lorg/jboss/netty/handler/codec/http/HttpRequest;->getMethod()Lorg/jboss/netty/handler/codec/http/HttpMethod;

    move-result-object v14

    invoke-static {v13, v11, v14}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;->setMethod(ILorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;Lorg/jboss/netty/handler/codec/http/HttpMethod;)V

    .line 308
    move-object/from16 v0, p0

    iget v13, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpEncoder;->spdyVersion:I

    invoke-interface {v6}, Lorg/jboss/netty/handler/codec/http/HttpRequest;->getUri()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v11, v14}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;->setUrl(ILorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;Ljava/lang/String;)V

    .line 309
    move-object/from16 v0, p0

    iget v13, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpEncoder;->spdyVersion:I

    invoke-interface/range {p1 .. p1}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->getProtocolVersion()Lorg/jboss/netty/handler/codec/http/HttpVersion;

    move-result-object v14

    invoke-static {v13, v11, v14}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;->setVersion(ILorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;Lorg/jboss/netty/handler/codec/http/HttpVersion;)V

    .line 311
    .end local v6    # "httpRequest":Lorg/jboss/netty/handler/codec/http/HttpRequest;
    :cond_0
    move-object/from16 v0, p1

    instance-of v13, v0, Lorg/jboss/netty/handler/codec/http/HttpResponse;

    if-eqz v13, :cond_1

    move-object/from16 v7, p1

    .line 312
    check-cast v7, Lorg/jboss/netty/handler/codec/http/HttpResponse;

    .line 313
    .local v7, "httpResponse":Lorg/jboss/netty/handler/codec/http/HttpResponse;
    move-object/from16 v0, p0

    iget v13, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpEncoder;->spdyVersion:I

    invoke-interface {v7}, Lorg/jboss/netty/handler/codec/http/HttpResponse;->getStatus()Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;

    move-result-object v14

    invoke-static {v13, v11, v14}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;->setStatus(ILorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;)V

    .line 314
    move-object/from16 v0, p0

    iget v13, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpEncoder;->spdyVersion:I

    invoke-static {v13, v11, v1}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;->setUrl(ILorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;Ljava/lang/String;)V

    .line 315
    move-object/from16 v0, p0

    iget v13, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpEncoder;->spdyVersion:I

    invoke-interface/range {p1 .. p1}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->getProtocolVersion()Lorg/jboss/netty/handler/codec/http/HttpVersion;

    move-result-object v14

    invoke-static {v13, v11, v14}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;->setVersion(ILorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;Lorg/jboss/netty/handler/codec/http/HttpVersion;)V

    .line 316
    const/4 v13, 0x1

    invoke-interface {v11, v13}, Lorg/jboss/netty/handler/codec/spdy/SpdySynStreamFrame;->setUnidirectional(Z)V

    .line 320
    .end local v7    # "httpResponse":Lorg/jboss/netty/handler/codec/http/HttpResponse;
    :cond_1
    invoke-static/range {p1 .. p1}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->getHost(Lorg/jboss/netty/handler/codec/http/HttpMessage;)Ljava/lang/String;

    move-result-object v5

    .line 321
    .local v5, "host":Ljava/lang/String;
    invoke-interface/range {p1 .. p1}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v13

    const-string v14, "Host"

    invoke-virtual {v13, v14}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->remove(Ljava/lang/String;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .line 322
    invoke-static {v11, v5}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;->setHost(Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;Ljava/lang/String;)V

    .line 325
    if-nez v10, :cond_2

    .line 326
    const-string v10, "https"

    .line 328
    :cond_2
    move-object/from16 v0, p0

    iget v13, v0, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpEncoder;->spdyVersion:I

    invoke-static {v13, v11, v10}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;->setScheme(ILorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;Ljava/lang/String;)V

    .line 331
    invoke-interface/range {p1 .. p1}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v13

    invoke-virtual {v13}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .local v8, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_4

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map$Entry;

    .line 332
    .local v4, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v11}, Lorg/jboss/netty/handler/codec/spdy/SpdySynStreamFrame;->headers()Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;

    move-result-object v14

    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/String;

    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v15

    invoke-virtual {v14, v13, v15}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;->add(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;

    goto :goto_1

    .line 302
    .end local v4    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v5    # "host":Ljava/lang/String;
    .end local v8    # "i$":Ljava/util/Iterator;
    :cond_3
    const/4 v13, 0x0

    goto/16 :goto_0

    .line 335
    .restart local v5    # "host":Ljava/lang/String;
    .restart local v8    # "i$":Ljava/util/Iterator;
    :cond_4
    return-object v11
.end method

.method private static getDataFuture(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelFuture;[Lorg/jboss/netty/handler/codec/spdy/SpdyDataFrame;Ljava/net/SocketAddress;)Lorg/jboss/netty/channel/ChannelFuture;
    .locals 6
    .param p0, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p1, "future"    # Lorg/jboss/netty/channel/ChannelFuture;
    .param p2, "spdyDataFrames"    # [Lorg/jboss/netty/handler/codec/spdy/SpdyDataFrame;
    .param p3, "remoteAddress"    # Ljava/net/SocketAddress;

    .prologue
    .line 246
    move-object v0, p1

    .line 247
    .local v0, "dataFuture":Lorg/jboss/netty/channel/ChannelFuture;
    array-length v1, p2

    .local v1, "i":I
    :goto_0
    add-int/lit8 v1, v1, -0x1

    if-ltz v1, :cond_0

    .line 248
    invoke-interface {p0}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v2

    invoke-static {v2}, Lorg/jboss/netty/channel/Channels;->future(Lorg/jboss/netty/channel/Channel;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object p1

    .line 249
    new-instance v2, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpEncoder$SpdyFrameWriter;

    new-instance v3, Lorg/jboss/netty/channel/DownstreamMessageEvent;

    invoke-interface {p0}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v4

    aget-object v5, p2, v1

    invoke-direct {v3, v4, v0, v5, p3}, Lorg/jboss/netty/channel/DownstreamMessageEvent;-><init>(Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/channel/ChannelFuture;Ljava/lang/Object;Ljava/net/SocketAddress;)V

    invoke-direct {v2, p0, v3}, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpEncoder$SpdyFrameWriter;-><init>(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/MessageEvent;)V

    invoke-interface {p1, v2}, Lorg/jboss/netty/channel/ChannelFuture;->addListener(Lorg/jboss/netty/channel/ChannelFutureListener;)V

    .line 251
    move-object v0, p1

    goto :goto_0

    .line 253
    :cond_0
    return-object v0
.end method

.method private getMessageFuture(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/MessageEvent;ILorg/jboss/netty/handler/codec/http/HttpMessage;)Lorg/jboss/netty/channel/ChannelFuture;
    .locals 3
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "e"    # Lorg/jboss/netty/channel/MessageEvent;
    .param p3, "streamId"    # I
    .param p4, "httpMessage"    # Lorg/jboss/netty/handler/codec/http/HttpMessage;

    .prologue
    .line 229
    invoke-interface {p4}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->getContent()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v1

    invoke-interface {v1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readable()Z

    move-result v1

    if-nez v1, :cond_0

    .line 230
    invoke-interface {p2}, Lorg/jboss/netty/channel/MessageEvent;->getFuture()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v1

    .line 239
    :goto_0
    return-object v1

    .line 234
    :cond_0
    invoke-interface {p4}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->getContent()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v1

    invoke-direct {p0, p3, v1}, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpEncoder;->createSpdyDataFrames(ILorg/jboss/netty/buffer/ChannelBuffer;)[Lorg/jboss/netty/handler/codec/spdy/SpdyDataFrame;

    move-result-object v0

    .line 235
    .local v0, "spdyDataFrames":[Lorg/jboss/netty/handler/codec/spdy/SpdyDataFrame;
    array-length v1, v0

    if-lez v1, :cond_1

    .line 236
    array-length v1, v0

    add-int/lit8 v1, v1, -0x1

    aget-object v1, v0, v1

    const/4 v2, 0x1

    invoke-interface {v1, v2}, Lorg/jboss/netty/handler/codec/spdy/SpdyDataFrame;->setLast(Z)V

    .line 239
    :cond_1
    invoke-interface {p2}, Lorg/jboss/netty/channel/MessageEvent;->getFuture()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v1

    invoke-interface {p2}, Lorg/jboss/netty/channel/MessageEvent;->getRemoteAddress()Ljava/net/SocketAddress;

    move-result-object v2

    invoke-static {p1, v1, v0, v2}, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpEncoder;->getDataFuture(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelFuture;[Lorg/jboss/netty/handler/codec/spdy/SpdyDataFrame;Ljava/net/SocketAddress;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v1

    goto :goto_0
.end method


# virtual methods
.method public handleDownstream(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelEvent;)V
    .locals 13
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "evt"    # Lorg/jboss/netty/channel/ChannelEvent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 148
    instance-of v0, p2, Lorg/jboss/netty/channel/MessageEvent;

    if-nez v0, :cond_0

    .line 149
    invoke-interface {p1, p2}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendDownstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 187
    :goto_0
    return-void

    :cond_0
    move-object v6, p2

    .line 153
    check-cast v6, Lorg/jboss/netty/channel/MessageEvent;

    .line 154
    .local v6, "e":Lorg/jboss/netty/channel/MessageEvent;
    invoke-interface {v6}, Lorg/jboss/netty/channel/MessageEvent;->getMessage()Ljava/lang/Object;

    move-result-object v10

    .line 156
    .local v10, "msg":Ljava/lang/Object;
    instance-of v0, v10, Lorg/jboss/netty/handler/codec/http/HttpRequest;

    if-eqz v0, :cond_1

    move-object v8, v10

    .line 158
    check-cast v8, Lorg/jboss/netty/handler/codec/http/HttpRequest;

    .line 159
    .local v8, "httpRequest":Lorg/jboss/netty/handler/codec/http/HttpRequest;
    invoke-direct {p0, v8}, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpEncoder;->createSynStreamFrame(Lorg/jboss/netty/handler/codec/http/HttpMessage;)Lorg/jboss/netty/handler/codec/spdy/SpdySynStreamFrame;

    move-result-object v12

    .line 160
    .local v12, "spdySynStreamFrame":Lorg/jboss/netty/handler/codec/spdy/SpdySynStreamFrame;
    invoke-interface {v12}, Lorg/jboss/netty/handler/codec/spdy/SpdySynStreamFrame;->getStreamId()I

    move-result v0

    iput v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpEncoder;->currentStreamId:I

    .line 161
    iget v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpEncoder;->currentStreamId:I

    invoke-direct {p0, p1, v6, v0, v8}, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpEncoder;->getMessageFuture(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/MessageEvent;ILorg/jboss/netty/handler/codec/http/HttpMessage;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v7

    .line 162
    .local v7, "future":Lorg/jboss/netty/channel/ChannelFuture;
    invoke-interface {v6}, Lorg/jboss/netty/channel/MessageEvent;->getRemoteAddress()Ljava/net/SocketAddress;

    move-result-object v0

    invoke-static {p1, v7, v12, v0}, Lorg/jboss/netty/channel/Channels;->write(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelFuture;Ljava/lang/Object;Ljava/net/SocketAddress;)V

    goto :goto_0

    .line 164
    .end local v7    # "future":Lorg/jboss/netty/channel/ChannelFuture;
    .end local v8    # "httpRequest":Lorg/jboss/netty/handler/codec/http/HttpRequest;
    .end local v12    # "spdySynStreamFrame":Lorg/jboss/netty/handler/codec/spdy/SpdySynStreamFrame;
    :cond_1
    instance-of v0, v10, Lorg/jboss/netty/handler/codec/http/HttpResponse;

    if-eqz v0, :cond_3

    move-object v9, v10

    .line 166
    check-cast v9, Lorg/jboss/netty/handler/codec/http/HttpResponse;

    .line 167
    .local v9, "httpResponse":Lorg/jboss/netty/handler/codec/http/HttpResponse;
    invoke-interface {v9}, Lorg/jboss/netty/handler/codec/http/HttpResponse;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v0

    const-string v1, "X-SPDY-Associated-To-Stream-ID"

    invoke-virtual {v0, v1}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->contains(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 168
    invoke-direct {p0, v9}, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpEncoder;->createSynStreamFrame(Lorg/jboss/netty/handler/codec/http/HttpMessage;)Lorg/jboss/netty/handler/codec/spdy/SpdySynStreamFrame;

    move-result-object v12

    .line 169
    .restart local v12    # "spdySynStreamFrame":Lorg/jboss/netty/handler/codec/spdy/SpdySynStreamFrame;
    invoke-interface {v12}, Lorg/jboss/netty/handler/codec/spdy/SpdySynStreamFrame;->getStreamId()I

    move-result v0

    iput v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpEncoder;->currentStreamId:I

    .line 170
    iget v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpEncoder;->currentStreamId:I

    invoke-direct {p0, p1, v6, v0, v9}, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpEncoder;->getMessageFuture(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/MessageEvent;ILorg/jboss/netty/handler/codec/http/HttpMessage;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v7

    .line 171
    .restart local v7    # "future":Lorg/jboss/netty/channel/ChannelFuture;
    invoke-interface {v6}, Lorg/jboss/netty/channel/MessageEvent;->getRemoteAddress()Ljava/net/SocketAddress;

    move-result-object v0

    invoke-static {p1, v7, v12, v0}, Lorg/jboss/netty/channel/Channels;->write(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelFuture;Ljava/lang/Object;Ljava/net/SocketAddress;)V

    goto :goto_0

    .line 173
    .end local v7    # "future":Lorg/jboss/netty/channel/ChannelFuture;
    .end local v12    # "spdySynStreamFrame":Lorg/jboss/netty/handler/codec/spdy/SpdySynStreamFrame;
    :cond_2
    invoke-direct {p0, v9}, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpEncoder;->createSynReplyFrame(Lorg/jboss/netty/handler/codec/http/HttpResponse;)Lorg/jboss/netty/handler/codec/spdy/SpdySynReplyFrame;

    move-result-object v11

    .line 174
    .local v11, "spdySynReplyFrame":Lorg/jboss/netty/handler/codec/spdy/SpdySynReplyFrame;
    invoke-interface {v11}, Lorg/jboss/netty/handler/codec/spdy/SpdySynReplyFrame;->getStreamId()I

    move-result v0

    iput v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpEncoder;->currentStreamId:I

    .line 175
    iget v0, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpEncoder;->currentStreamId:I

    invoke-direct {p0, p1, v6, v0, v9}, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpEncoder;->getMessageFuture(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/MessageEvent;ILorg/jboss/netty/handler/codec/http/HttpMessage;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v7

    .line 176
    .restart local v7    # "future":Lorg/jboss/netty/channel/ChannelFuture;
    invoke-interface {v6}, Lorg/jboss/netty/channel/MessageEvent;->getRemoteAddress()Ljava/net/SocketAddress;

    move-result-object v0

    invoke-static {p1, v7, v11, v0}, Lorg/jboss/netty/channel/Channels;->write(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelFuture;Ljava/lang/Object;Ljava/net/SocketAddress;)V

    goto :goto_0

    .line 179
    .end local v7    # "future":Lorg/jboss/netty/channel/ChannelFuture;
    .end local v9    # "httpResponse":Lorg/jboss/netty/handler/codec/http/HttpResponse;
    .end local v11    # "spdySynReplyFrame":Lorg/jboss/netty/handler/codec/spdy/SpdySynReplyFrame;
    :cond_3
    instance-of v0, v10, Lorg/jboss/netty/handler/codec/http/HttpChunk;

    if-eqz v0, :cond_4

    move-object v4, v10

    .line 181
    check-cast v4, Lorg/jboss/netty/handler/codec/http/HttpChunk;

    .line 182
    .local v4, "chunk":Lorg/jboss/netty/handler/codec/http/HttpChunk;
    invoke-interface {v6}, Lorg/jboss/netty/channel/MessageEvent;->getFuture()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v2

    iget v3, p0, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpEncoder;->currentStreamId:I

    invoke-interface {v6}, Lorg/jboss/netty/channel/MessageEvent;->getRemoteAddress()Ljava/net/SocketAddress;

    move-result-object v5

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpEncoder;->writeChunk(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelFuture;ILorg/jboss/netty/handler/codec/http/HttpChunk;Ljava/net/SocketAddress;)V

    goto :goto_0

    .line 185
    .end local v4    # "chunk":Lorg/jboss/netty/handler/codec/http/HttpChunk;
    :cond_4
    invoke-interface {p1, p2}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendDownstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    goto/16 :goto_0
.end method

.method protected writeChunk(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelFuture;ILorg/jboss/netty/handler/codec/http/HttpChunk;Ljava/net/SocketAddress;)V
    .locals 12
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "future"    # Lorg/jboss/netty/channel/ChannelFuture;
    .param p3, "streamId"    # I
    .param p4, "chunk"    # Lorg/jboss/netty/handler/codec/http/HttpChunk;
    .param p5, "remoteAddress"    # Ljava/net/SocketAddress;

    .prologue
    .line 196
    invoke-interface/range {p4 .. p4}, Lorg/jboss/netty/handler/codec/http/HttpChunk;->isLast()Z

    move-result v9

    if-eqz v9, :cond_3

    .line 197
    move-object/from16 v0, p4

    instance-of v9, v0, Lorg/jboss/netty/handler/codec/http/HttpChunkTrailer;

    if-eqz v9, :cond_2

    move-object/from16 v7, p4

    .line 198
    check-cast v7, Lorg/jboss/netty/handler/codec/http/HttpChunkTrailer;

    .line 199
    .local v7, "trailer":Lorg/jboss/netty/handler/codec/http/HttpChunkTrailer;
    invoke-interface {v7}, Lorg/jboss/netty/handler/codec/http/HttpChunkTrailer;->trailingHeaders()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v8

    .line 200
    .local v8, "trailers":Lorg/jboss/netty/handler/codec/http/HttpHeaders;
    invoke-virtual {v8}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->isEmpty()Z

    move-result v9

    if-eqz v9, :cond_0

    .line 201
    new-instance v4, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyDataFrame;

    invoke-direct {v4, p3}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyDataFrame;-><init>(I)V

    .line 202
    .local v4, "spdyDataFrame":Lorg/jboss/netty/handler/codec/spdy/SpdyDataFrame;
    const/4 v9, 0x1

    invoke-interface {v4, v9}, Lorg/jboss/netty/handler/codec/spdy/SpdyDataFrame;->setLast(Z)V

    .line 203
    move-object/from16 v0, p5

    invoke-static {p1, p2, v4, v0}, Lorg/jboss/netty/channel/Channels;->write(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelFuture;Ljava/lang/Object;Ljava/net/SocketAddress;)V

    .line 225
    .end local v4    # "spdyDataFrame":Lorg/jboss/netty/handler/codec/spdy/SpdyDataFrame;
    .end local v7    # "trailer":Lorg/jboss/netty/handler/codec/http/HttpChunkTrailer;
    .end local v8    # "trailers":Lorg/jboss/netty/handler/codec/http/HttpHeaders;
    :goto_0
    return-void

    .line 206
    .restart local v7    # "trailer":Lorg/jboss/netty/handler/codec/http/HttpChunkTrailer;
    .restart local v8    # "trailers":Lorg/jboss/netty/handler/codec/http/HttpHeaders;
    :cond_0
    new-instance v6, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeadersFrame;

    invoke-direct {v6, p3}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeadersFrame;-><init>(I)V

    .line 207
    .local v6, "spdyHeadersFrame":Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;
    const/4 v9, 0x1

    invoke-interface {v6, v9}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;->setLast(Z)V

    .line 208
    invoke-virtual {v8}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 209
    .local v2, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v6}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;->headers()Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;

    move-result-object v10

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v11

    invoke-virtual {v10, v9, v11}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;->add(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;

    goto :goto_1

    .line 211
    .end local v2    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_1
    move-object/from16 v0, p5

    invoke-static {p1, p2, v6, v0}, Lorg/jboss/netty/channel/Channels;->write(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelFuture;Ljava/lang/Object;Ljava/net/SocketAddress;)V

    goto :goto_0

    .line 214
    .end local v3    # "i$":Ljava/util/Iterator;
    .end local v6    # "spdyHeadersFrame":Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;
    .end local v7    # "trailer":Lorg/jboss/netty/handler/codec/http/HttpChunkTrailer;
    .end local v8    # "trailers":Lorg/jboss/netty/handler/codec/http/HttpHeaders;
    :cond_2
    new-instance v4, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyDataFrame;

    invoke-direct {v4, p3}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyDataFrame;-><init>(I)V

    .line 215
    .restart local v4    # "spdyDataFrame":Lorg/jboss/netty/handler/codec/spdy/SpdyDataFrame;
    const/4 v9, 0x1

    invoke-interface {v4, v9}, Lorg/jboss/netty/handler/codec/spdy/SpdyDataFrame;->setLast(Z)V

    .line 216
    move-object/from16 v0, p5

    invoke-static {p1, p2, v4, v0}, Lorg/jboss/netty/channel/Channels;->write(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelFuture;Ljava/lang/Object;Ljava/net/SocketAddress;)V

    goto :goto_0

    .line 219
    .end local v4    # "spdyDataFrame":Lorg/jboss/netty/handler/codec/spdy/SpdyDataFrame;
    :cond_3
    invoke-interface/range {p4 .. p4}, Lorg/jboss/netty/handler/codec/http/HttpChunk;->getContent()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v9

    invoke-direct {p0, p3, v9}, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpEncoder;->createSpdyDataFrames(ILorg/jboss/netty/buffer/ChannelBuffer;)[Lorg/jboss/netty/handler/codec/spdy/SpdyDataFrame;

    move-result-object v5

    .line 220
    .local v5, "spdyDataFrames":[Lorg/jboss/netty/handler/codec/spdy/SpdyDataFrame;
    move-object/from16 v0, p5

    invoke-static {p1, p2, v5, v0}, Lorg/jboss/netty/handler/codec/spdy/SpdyHttpEncoder;->getDataFuture(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelFuture;[Lorg/jboss/netty/handler/codec/spdy/SpdyDataFrame;Ljava/net/SocketAddress;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v1

    .line 223
    .local v1, "dataFuture":Lorg/jboss/netty/channel/ChannelFuture;
    invoke-interface {v1}, Lorg/jboss/netty/channel/ChannelFuture;->setSuccess()Z

    goto :goto_0
.end method
