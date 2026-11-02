.class public abstract Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;
.super Lorg/jboss/netty/handler/codec/frame/FrameDecoder;
.source "ReplayingDecoder.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Enum",
        "<TT;>;>",
        "Lorg/jboss/netty/handler/codec/frame/FrameDecoder;"
    }
.end annotation


# instance fields
.field private checkpoint:I

.field private needsCleanup:Z

.field private final replayable:Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;

.field private state:Ljava/lang/Enum;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field


# direct methods
.method protected constructor <init>()V
    .locals 1

    .prologue
    .line 295
    .local p0, "this":Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;, "Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder<TT;>;"
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;-><init>(Ljava/lang/Enum;)V

    .line 296
    return-void
.end method

.method protected constructor <init>(Ljava/lang/Enum;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 306
    .local p0, "this":Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;, "Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder<TT;>;"
    .local p1, "initialState":Ljava/lang/Enum;, "TT;"
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;-><init>(Ljava/lang/Enum;Z)V

    .line 307
    return-void
.end method

.method protected constructor <init>(Ljava/lang/Enum;Z)V
    .locals 1
    .param p2, "unfold"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;Z)V"
        }
    .end annotation

    .prologue
    .line 310
    .local p0, "this":Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;, "Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder<TT;>;"
    .local p1, "initialState":Ljava/lang/Enum;, "TT;"
    invoke-direct {p0, p2}, Lorg/jboss/netty/handler/codec/frame/FrameDecoder;-><init>(Z)V

    .line 286
    new-instance v0, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;

    invoke-direct {v0, p0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;-><init>(Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;)V

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;->replayable:Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;

    .line 311
    iput-object p1, p0, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;->state:Ljava/lang/Enum;

    .line 312
    return-void
.end method

.method protected constructor <init>(Z)V
    .locals 1
    .param p1, "unfold"    # Z

    .prologue
    .line 299
    .local p0, "this":Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;, "Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder<TT;>;"
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;-><init>(Ljava/lang/Enum;Z)V

    .line 300
    return-void
.end method

.method private callDecode(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/buffer/ChannelBuffer;Lorg/jboss/netty/buffer/ChannelBuffer;Ljava/net/SocketAddress;)V
    .locals 8
    .param p1, "context"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p3, "input"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p4, "replayableInput"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p5, "remoteAddress"    # Ljava/net/SocketAddress;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 495
    .local p0, "this":Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;, "Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder<TT;>;"
    :cond_0
    :goto_0
    invoke-interface {p3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readable()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 496
    invoke-interface {p3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v1

    iput v1, p0, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;->checkpoint:I

    .line 497
    .local v1, "oldReaderIndex":I
    const/4 v4, 0x0

    .line 498
    .local v4, "result":Ljava/lang/Object;
    iget-object v2, p0, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;->state:Ljava/lang/Enum;

    .line 500
    .local v2, "oldState":Ljava/lang/Enum;, "TT;"
    :try_start_0
    iget-object v5, p0, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;->state:Ljava/lang/Enum;

    invoke-virtual {p0, p1, p2, p4, v5}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;->decode(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/buffer/ChannelBuffer;Ljava/lang/Enum;)Ljava/lang/Object;

    move-result-object v4

    .line 501
    if-nez v4, :cond_1

    .line 502
    invoke-interface {p3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v5

    if-ne v1, v5, :cond_0

    iget-object v5, p0, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;->state:Ljava/lang/Enum;

    if-ne v2, v5, :cond_0

    .line 503
    new-instance v5, Ljava/lang/IllegalStateException;

    const-string v6, "null cannot be returned if no data is consumed and state didn\'t change."

    invoke-direct {v5, v6}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v5
    :try_end_0
    .catch Lorg/jboss/netty/handler/codec/replay/ReplayError; {:try_start_0 .. :try_end_0} :catch_0

    .line 511
    .end local v4    # "result":Ljava/lang/Object;
    :catch_0
    move-exception v3

    .line 513
    .local v3, "replay":Lorg/jboss/netty/handler/codec/replay/ReplayError;
    iget v0, p0, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;->checkpoint:I

    .line 514
    .local v0, "checkpoint":I
    if-ltz v0, :cond_1

    .line 515
    invoke-interface {p3, v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex(I)V

    .line 522
    .end local v0    # "checkpoint":I
    .end local v3    # "replay":Lorg/jboss/netty/handler/codec/replay/ReplayError;
    :cond_1
    if-nez v4, :cond_3

    .line 538
    .end local v1    # "oldReaderIndex":I
    .end local v2    # "oldState":Ljava/lang/Enum;, "TT;"
    :cond_2
    return-void

    .line 528
    .restart local v1    # "oldReaderIndex":I
    .restart local v2    # "oldState":Ljava/lang/Enum;, "TT;"
    :cond_3
    invoke-interface {p3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v5

    if-ne v1, v5, :cond_4

    iget-object v5, p0, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;->state:Ljava/lang/Enum;

    if-ne v2, v5, :cond_4

    .line 529
    new-instance v5, Ljava/lang/IllegalStateException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "decode() method must consume at least one byte if it returned a decoded message (caused by: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    const/16 v7, 0x29

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 536
    :cond_4
    invoke-virtual {p0, p1, p5, v4}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;->unfoldAndFireMessageReceived(Lorg/jboss/netty/channel/ChannelHandlerContext;Ljava/net/SocketAddress;Ljava/lang/Object;)V

    goto :goto_0
.end method


# virtual methods
.method protected checkpoint()V
    .locals 2

    .prologue
    .line 323
    .local p0, "this":Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;, "Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder<TT;>;"
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;->cumulation:Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 324
    .local v0, "cumulation":Lorg/jboss/netty/buffer/ChannelBuffer;
    if-eqz v0, :cond_0

    .line 325
    invoke-interface {v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v1

    iput v1, p0, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;->checkpoint:I

    .line 329
    :goto_0
    return-void

    .line 327
    :cond_0
    const/4 v1, -0x1

    iput v1, p0, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;->checkpoint:I

    goto :goto_0
.end method

.method protected checkpoint(Ljava/lang/Enum;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 336
    .local p0, "this":Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;, "Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder<TT;>;"
    .local p1, "state":Ljava/lang/Enum;, "TT;"
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;->checkpoint()V

    .line 337
    invoke-virtual {p0, p1}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;->setState(Ljava/lang/Enum;)Ljava/lang/Enum;

    .line 338
    return-void
.end method

.method protected cleanup(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelStateEvent;)V
    .locals 7
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "e"    # Lorg/jboss/netty/channel/ChannelStateEvent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 544
    .local p0, "this":Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;, "Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder<TT;>;"
    :try_start_0
    iget-object v3, p0, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;->cumulation:Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 545
    .local v3, "cumulation":Lorg/jboss/netty/buffer/ChannelBuffer;
    iget-boolean v0, p0, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;->needsCleanup:Z
    :try_end_0
    .catch Lorg/jboss/netty/handler/codec/replay/ReplayError; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v0, :cond_1

    .line 570
    .end local v3    # "cumulation":Lorg/jboss/netty/buffer/ChannelBuffer;
    :cond_0
    :goto_0
    invoke-interface {p1, p2}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendUpstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 572
    return-void

    .line 549
    .restart local v3    # "cumulation":Lorg/jboss/netty/buffer/ChannelBuffer;
    :cond_1
    const/4 v0, 0x0

    :try_start_1
    iput-boolean v0, p0, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;->needsCleanup:Z

    .line 550
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;->replayable:Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;

    invoke-virtual {v0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;->terminate()V

    .line 552
    if-eqz v3, :cond_2

    invoke-interface {v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readable()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 554
    invoke-interface {p2}, Lorg/jboss/netty/channel/ChannelStateEvent;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v2

    iget-object v4, p0, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;->replayable:Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;->callDecode(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/buffer/ChannelBuffer;Lorg/jboss/netty/buffer/ChannelBuffer;Ljava/net/SocketAddress;)V

    .line 560
    :cond_2
    invoke-interface {p2}, Lorg/jboss/netty/channel/ChannelStateEvent;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v0

    iget-object v1, p0, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;->replayable:Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;

    iget-object v2, p0, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;->state:Ljava/lang/Enum;

    invoke-virtual {p0, p1, v0, v1, v2}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;->decodeLast(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/buffer/ChannelBuffer;Ljava/lang/Enum;)Ljava/lang/Object;

    move-result-object v6

    .line 562
    .local v6, "partiallyDecoded":Ljava/lang/Object;
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;->cumulation:Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 564
    if-eqz v6, :cond_0

    .line 565
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0, v6}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;->unfoldAndFireMessageReceived(Lorg/jboss/netty/channel/ChannelHandlerContext;Ljava/net/SocketAddress;Ljava/lang/Object;)V
    :try_end_1
    .catch Lorg/jboss/netty/handler/codec/replay/ReplayError; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 567
    .end local v3    # "cumulation":Lorg/jboss/netty/buffer/ChannelBuffer;
    .end local v6    # "partiallyDecoded":Ljava/lang/Object;
    :catch_0
    move-exception v0

    goto :goto_0

    .line 570
    :catchall_0
    move-exception v0

    invoke-interface {p1, p2}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendUpstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    throw v0
.end method

.method protected final decode(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/buffer/ChannelBuffer;)Ljava/lang/Object;
    .locals 1
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p3, "buffer"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 400
    .local p0, "this":Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;, "Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder<TT;>;"
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;->state:Ljava/lang/Enum;

    invoke-virtual {p0, p1, p2, p3, v0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;->decode(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/buffer/ChannelBuffer;Ljava/lang/Enum;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method protected abstract decode(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/buffer/ChannelBuffer;Ljava/lang/Enum;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jboss/netty/channel/ChannelHandlerContext;",
            "Lorg/jboss/netty/channel/Channel;",
            "Lorg/jboss/netty/buffer/ChannelBuffer;",
            "TT;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method

.method protected final decodeLast(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/buffer/ChannelBuffer;)Ljava/lang/Object;
    .locals 1
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p3, "buffer"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 406
    .local p0, "this":Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;, "Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder<TT;>;"
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;->state:Ljava/lang/Enum;

    invoke-virtual {p0, p1, p2, p3, v0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;->decodeLast(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/buffer/ChannelBuffer;Ljava/lang/Enum;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method protected decodeLast(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/buffer/ChannelBuffer;Ljava/lang/Enum;)Ljava/lang/Object;
    .locals 1
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p3, "buffer"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jboss/netty/channel/ChannelHandlerContext;",
            "Lorg/jboss/netty/channel/Channel;",
            "Lorg/jboss/netty/buffer/ChannelBuffer;",
            "TT;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 390
    .local p0, "this":Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;, "Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder<TT;>;"
    .local p4, "state":Ljava/lang/Enum;, "TT;"
    invoke-virtual {p0, p1, p2, p3, p4}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;->decode(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/buffer/ChannelBuffer;Ljava/lang/Enum;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method protected getState()Ljava/lang/Enum;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 345
    .local p0, "this":Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;, "Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder<TT;>;"
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;->state:Ljava/lang/Enum;

    return-object v0
.end method

.method protected internalBuffer()Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 1

    .prologue
    .line 316
    .local p0, "this":Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;, "Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder<TT;>;"
    invoke-super {p0}, Lorg/jboss/netty/handler/codec/frame/FrameDecoder;->internalBuffer()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    return-object v0
.end method

.method public messageReceived(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/MessageEvent;)V
    .locals 14
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "e"    # Lorg/jboss/netty/channel/MessageEvent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 413
    .local p0, "this":Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;, "Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder<TT;>;"
    invoke-interface/range {p2 .. p2}, Lorg/jboss/netty/channel/MessageEvent;->getMessage()Ljava/lang/Object;

    move-result-object v11

    .line 414
    .local v11, "m":Ljava/lang/Object;
    instance-of v0, v11, Lorg/jboss/netty/buffer/ChannelBuffer;

    if-nez v0, :cond_1

    .line 415
    invoke-interface/range {p1 .. p2}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendUpstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 490
    :cond_0
    :goto_0
    return-void

    :cond_1
    move-object v3, v11

    .line 419
    check-cast v3, Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 420
    .local v3, "input":Lorg/jboss/netty/buffer/ChannelBuffer;
    invoke-interface {v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readable()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 424
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;->needsCleanup:Z

    .line 426
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;->cumulation:Lorg/jboss/netty/buffer/ChannelBuffer;

    if-nez v0, :cond_3

    .line 429
    iput-object v3, p0, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;->cumulation:Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 431
    invoke-interface {v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v12

    .line 432
    .local v12, "oldReaderIndex":I
    invoke-interface {v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v10

    .line 435
    .local v10, "inputSize":I
    :try_start_0
    invoke-interface/range {p2 .. p2}, Lorg/jboss/netty/channel/MessageEvent;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v2

    iget-object v4, p0, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;->replayable:Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;

    invoke-interface/range {p2 .. p2}, Lorg/jboss/netty/channel/MessageEvent;->getRemoteAddress()Ljava/net/SocketAddress;

    move-result-object v5

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;->callDecode(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/buffer/ChannelBuffer;Lorg/jboss/netty/buffer/ChannelBuffer;Ljava/net/SocketAddress;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 440
    invoke-interface {v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v13

    .line 441
    .local v13, "readableBytes":I
    if-lez v13, :cond_a

    .line 442
    invoke-interface {v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->capacity()I

    move-result v9

    .line 445
    .local v9, "inputCapacity":I
    if-eq v13, v9, :cond_b

    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;->getMaxCumulationBufferCapacity()I

    move-result v0

    if-le v9, v0, :cond_b

    const/4 v7, 0x1

    .line 453
    .local v7, "copy":Z
    :goto_1
    iget v0, p0, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;->checkpoint:I

    if-lez v0, :cond_c

    .line 454
    iget v0, p0, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;->checkpoint:I

    sub-int/2addr v0, v12

    sub-int v6, v10, v0

    .line 455
    .local v6, "bytesToPreserve":I
    if-eqz v7, :cond_d

    .line 456
    invoke-virtual {p0, p1, v6}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;->newCumulationBuffer(Lorg/jboss/netty/channel/ChannelHandlerContext;I)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v8

    .local v8, "cumulation":Lorg/jboss/netty/buffer/ChannelBuffer;
    iput-object v8, p0, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;->cumulation:Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 457
    iget v0, p0, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;->checkpoint:I

    invoke-interface {v8, v3, v0, v6}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeBytes(Lorg/jboss/netty/buffer/ChannelBuffer;II)V

    goto :goto_0

    .line 479
    .end local v6    # "bytesToPreserve":I
    .end local v7    # "copy":Z
    .end local v8    # "cumulation":Lorg/jboss/netty/buffer/ChannelBuffer;
    .end local v9    # "inputCapacity":I
    :cond_2
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;->cumulation:Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 440
    :goto_2
    throw v0

    .line 483
    .end local v10    # "inputSize":I
    .end local v12    # "oldReaderIndex":I
    .end local v13    # "readableBytes":I
    :cond_3
    invoke-virtual {p0, v3}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;->appendToCumulation(Lorg/jboss/netty/buffer/ChannelBuffer;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v3

    .line 485
    :try_start_1
    invoke-interface/range {p2 .. p2}, Lorg/jboss/netty/channel/MessageEvent;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v2

    iget-object v4, p0, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;->replayable:Lorg/jboss/netty/handler/codec/replay/ReplayingDecoderBuffer;

    invoke-interface/range {p2 .. p2}, Lorg/jboss/netty/channel/MessageEvent;->getRemoteAddress()Ljava/net/SocketAddress;

    move-result-object v5

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;->callDecode(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/buffer/ChannelBuffer;Lorg/jboss/netty/buffer/ChannelBuffer;Ljava/net/SocketAddress;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 487
    invoke-virtual {p0, p1, v3}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;->updateCumulation(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/buffer/ChannelBuffer;)Lorg/jboss/netty/buffer/ChannelBuffer;

    goto :goto_0

    :catchall_0
    move-exception v0

    invoke-virtual {p0, p1, v3}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;->updateCumulation(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/buffer/ChannelBuffer;)Lorg/jboss/netty/buffer/ChannelBuffer;

    throw v0

    .line 440
    .restart local v10    # "inputSize":I
    .restart local v12    # "oldReaderIndex":I
    :catchall_1
    move-exception v0

    invoke-interface {v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v13

    .line 441
    .restart local v13    # "readableBytes":I
    if-lez v13, :cond_2

    .line 442
    invoke-interface {v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->capacity()I

    move-result v9

    .line 445
    .restart local v9    # "inputCapacity":I
    if-eq v13, v9, :cond_4

    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;->getMaxCumulationBufferCapacity()I

    move-result v1

    if-le v9, v1, :cond_4

    const/4 v7, 0x1

    .line 453
    .restart local v7    # "copy":Z
    :goto_3
    iget v1, p0, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;->checkpoint:I

    if-lez v1, :cond_5

    .line 454
    iget v1, p0, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;->checkpoint:I

    sub-int/2addr v1, v12

    sub-int v6, v10, v1

    .line 455
    .restart local v6    # "bytesToPreserve":I
    if-eqz v7, :cond_6

    .line 456
    invoke-virtual {p0, p1, v6}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;->newCumulationBuffer(Lorg/jboss/netty/channel/ChannelHandlerContext;I)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v8

    .restart local v8    # "cumulation":Lorg/jboss/netty/buffer/ChannelBuffer;
    iput-object v8, p0, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;->cumulation:Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 457
    iget v1, p0, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;->checkpoint:I

    invoke-interface {v8, v3, v1, v6}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeBytes(Lorg/jboss/netty/buffer/ChannelBuffer;II)V

    goto :goto_2

    .line 445
    .end local v6    # "bytesToPreserve":I
    .end local v7    # "copy":Z
    .end local v8    # "cumulation":Lorg/jboss/netty/buffer/ChannelBuffer;
    :cond_4
    const/4 v7, 0x0

    goto :goto_3

    .line 461
    .restart local v7    # "copy":Z
    :cond_5
    iget v1, p0, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;->checkpoint:I

    if-nez v1, :cond_7

    .line 462
    if-eqz v7, :cond_8

    .line 463
    invoke-virtual {p0, p1, v10}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;->newCumulationBuffer(Lorg/jboss/netty/channel/ChannelHandlerContext;I)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v8

    .restart local v8    # "cumulation":Lorg/jboss/netty/buffer/ChannelBuffer;
    iput-object v8, p0, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;->cumulation:Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 464
    invoke-interface {v8, v3, v12, v10}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeBytes(Lorg/jboss/netty/buffer/ChannelBuffer;II)V

    .line 465
    invoke-interface {v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v1

    invoke-interface {v8, v1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex(I)V

    goto :goto_2

    .line 459
    .end local v8    # "cumulation":Lorg/jboss/netty/buffer/ChannelBuffer;
    .restart local v6    # "bytesToPreserve":I
    :cond_6
    iget v1, p0, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;->checkpoint:I

    invoke-interface {v3, v1, v6}, Lorg/jboss/netty/buffer/ChannelBuffer;->slice(II)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v1

    iput-object v1, p0, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;->cumulation:Lorg/jboss/netty/buffer/ChannelBuffer;

    goto :goto_2

    .line 471
    .end local v6    # "bytesToPreserve":I
    :cond_7
    if-eqz v7, :cond_9

    .line 472
    invoke-interface {v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v1

    invoke-virtual {p0, p1, v1}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;->newCumulationBuffer(Lorg/jboss/netty/channel/ChannelHandlerContext;I)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v8

    .restart local v8    # "cumulation":Lorg/jboss/netty/buffer/ChannelBuffer;
    iput-object v8, p0, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;->cumulation:Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 473
    invoke-interface {v8, v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeBytes(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    goto :goto_2

    .line 467
    .end local v8    # "cumulation":Lorg/jboss/netty/buffer/ChannelBuffer;
    :cond_8
    invoke-interface {v3, v12, v10}, Lorg/jboss/netty/buffer/ChannelBuffer;->slice(II)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v8

    .restart local v8    # "cumulation":Lorg/jboss/netty/buffer/ChannelBuffer;
    iput-object v8, p0, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;->cumulation:Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 468
    invoke-interface {v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v1

    invoke-interface {v8, v1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex(I)V

    goto/16 :goto_2

    .line 475
    .end local v8    # "cumulation":Lorg/jboss/netty/buffer/ChannelBuffer;
    :cond_9
    iput-object v3, p0, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;->cumulation:Lorg/jboss/netty/buffer/ChannelBuffer;

    goto/16 :goto_2

    .line 479
    .end local v7    # "copy":Z
    .end local v9    # "inputCapacity":I
    :cond_a
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;->cumulation:Lorg/jboss/netty/buffer/ChannelBuffer;

    goto/16 :goto_0

    .line 445
    .restart local v9    # "inputCapacity":I
    :cond_b
    const/4 v7, 0x0

    goto/16 :goto_1

    .line 461
    .restart local v7    # "copy":Z
    :cond_c
    iget v0, p0, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;->checkpoint:I

    if-nez v0, :cond_e

    .line 462
    if-eqz v7, :cond_f

    .line 463
    invoke-virtual {p0, p1, v10}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;->newCumulationBuffer(Lorg/jboss/netty/channel/ChannelHandlerContext;I)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v8

    .restart local v8    # "cumulation":Lorg/jboss/netty/buffer/ChannelBuffer;
    iput-object v8, p0, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;->cumulation:Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 464
    invoke-interface {v8, v3, v12, v10}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeBytes(Lorg/jboss/netty/buffer/ChannelBuffer;II)V

    .line 465
    invoke-interface {v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v0

    invoke-interface {v8, v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex(I)V

    goto/16 :goto_0

    .line 459
    .end local v8    # "cumulation":Lorg/jboss/netty/buffer/ChannelBuffer;
    .restart local v6    # "bytesToPreserve":I
    :cond_d
    iget v0, p0, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;->checkpoint:I

    invoke-interface {v3, v0, v6}, Lorg/jboss/netty/buffer/ChannelBuffer;->slice(II)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;->cumulation:Lorg/jboss/netty/buffer/ChannelBuffer;

    goto/16 :goto_0

    .line 471
    .end local v6    # "bytesToPreserve":I
    :cond_e
    if-eqz v7, :cond_10

    .line 472
    invoke-interface {v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v0

    invoke-virtual {p0, p1, v0}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;->newCumulationBuffer(Lorg/jboss/netty/channel/ChannelHandlerContext;I)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v8

    .restart local v8    # "cumulation":Lorg/jboss/netty/buffer/ChannelBuffer;
    iput-object v8, p0, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;->cumulation:Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 473
    invoke-interface {v8, v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeBytes(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    goto/16 :goto_0

    .line 467
    .end local v8    # "cumulation":Lorg/jboss/netty/buffer/ChannelBuffer;
    :cond_f
    invoke-interface {v3, v12, v10}, Lorg/jboss/netty/buffer/ChannelBuffer;->slice(II)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v8

    .restart local v8    # "cumulation":Lorg/jboss/netty/buffer/ChannelBuffer;
    iput-object v8, p0, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;->cumulation:Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 468
    invoke-interface {v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v0

    invoke-interface {v8, v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex(I)V

    goto/16 :goto_0

    .line 475
    .end local v8    # "cumulation":Lorg/jboss/netty/buffer/ChannelBuffer;
    :cond_10
    iput-object v3, p0, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;->cumulation:Lorg/jboss/netty/buffer/ChannelBuffer;

    goto/16 :goto_0
.end method

.method protected setState(Ljava/lang/Enum;)Ljava/lang/Enum;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)TT;"
        }
    .end annotation

    .prologue
    .line 353
    .local p0, "this":Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;, "Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder<TT;>;"
    .local p1, "newState":Ljava/lang/Enum;, "TT;"
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;->state:Ljava/lang/Enum;

    .line 354
    .local v0, "oldState":Ljava/lang/Enum;, "TT;"
    iput-object p1, p0, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;->state:Ljava/lang/Enum;

    .line 355
    return-object v0
.end method
