.class public abstract Lorg/jboss/netty/handler/codec/frame/FrameDecoder;
.super Lorg/jboss/netty/channel/SimpleChannelUpstreamHandler;
.source "FrameDecoder.java"

# interfaces
.implements Lorg/jboss/netty/channel/LifeCycleAwareChannelHandler;


# static fields
.field static final synthetic $assertionsDisabled:Z

.field public static final DEFAULT_MAX_COMPOSITEBUFFER_COMPONENTS:I = 0x400


# instance fields
.field private copyThreshold:I

.field private volatile ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

.field protected cumulation:Lorg/jboss/netty/buffer/ChannelBuffer;

.field private maxCumulationBufferComponents:I

.field private unfold:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 180
    const-class v0, Lorg/jboss/netty/handler/codec/frame/FrameDecoder;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lorg/jboss/netty/handler/codec/frame/FrameDecoder;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected constructor <init>()V
    .locals 1

    .prologue
    .line 191
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lorg/jboss/netty/handler/codec/frame/FrameDecoder;-><init>(Z)V

    .line 192
    return-void
.end method

.method protected constructor <init>(Z)V
    .locals 1
    .param p1, "unfold"    # Z

    .prologue
    .line 194
    invoke-direct {p0}, Lorg/jboss/netty/channel/SimpleChannelUpstreamHandler;-><init>()V

    .line 188
    const/16 v0, 0x400

    iput v0, p0, Lorg/jboss/netty/handler/codec/frame/FrameDecoder;->maxCumulationBufferComponents:I

    .line 195
    iput-boolean p1, p0, Lorg/jboss/netty/handler/codec/frame/FrameDecoder;->unfold:Z

    .line 196
    return-void
.end method

.method private callDecode(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/buffer/ChannelBuffer;Ljava/net/SocketAddress;)V
    .locals 5
    .param p1, "context"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p3, "cumulation"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p4, "remoteAddress"    # Ljava/net/SocketAddress;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 423
    :cond_0
    :goto_0
    invoke-interface {p3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readable()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 424
    invoke-interface {p3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v1

    .line 425
    .local v1, "oldReaderIndex":I
    invoke-virtual {p0, p1, p2, p3}, Lorg/jboss/netty/handler/codec/frame/FrameDecoder;->decode(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/buffer/ChannelBuffer;)Ljava/lang/Object;

    move-result-object v0

    .line 426
    .local v0, "frame":Ljava/lang/Object;
    if-nez v0, :cond_2

    .line 427
    invoke-interface {p3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v2

    if-ne v1, v2, :cond_0

    .line 445
    .end local v0    # "frame":Ljava/lang/Object;
    .end local v1    # "oldReaderIndex":I
    :cond_1
    return-void

    .line 437
    .restart local v0    # "frame":Ljava/lang/Object;
    .restart local v1    # "oldReaderIndex":I
    :cond_2
    invoke-interface {p3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v2

    if-ne v1, v2, :cond_3

    .line 438
    new-instance v2, Ljava/lang/IllegalStateException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "decode() method must read at least one byte if it returned a frame (caused by: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const/16 v4, 0x29

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 443
    :cond_3
    invoke-virtual {p0, p1, p4, v0}, Lorg/jboss/netty/handler/codec/frame/FrameDecoder;->unfoldAndFireMessageReceived(Lorg/jboss/netty/channel/ChannelHandlerContext;Ljava/net/SocketAddress;Ljava/lang/Object;)V

    goto :goto_0
.end method


# virtual methods
.method protected actualReadableBytes()I
    .locals 1

    .prologue
    .line 540
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/frame/FrameDecoder;->internalBuffer()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    invoke-interface {v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v0

    return v0
.end method

.method public afterAdd(Lorg/jboss/netty/channel/ChannelHandlerContext;)V
    .locals 0
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 577
    return-void
.end method

.method public afterRemove(Lorg/jboss/netty/channel/ChannelHandlerContext;)V
    .locals 0
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 585
    return-void
.end method

.method protected appendToCumulation(Lorg/jboss/netty/buffer/ChannelBuffer;)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 4
    .param p1, "input"    # Lorg/jboss/netty/buffer/ChannelBuffer;

    .prologue
    .line 318
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/frame/FrameDecoder;->cumulation:Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 319
    .local v1, "cumulation":Lorg/jboss/netty/buffer/ChannelBuffer;
    sget-boolean v2, Lorg/jboss/netty/handler/codec/frame/FrameDecoder;->$assertionsDisabled:Z

    if-nez v2, :cond_0

    invoke-interface {v1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readable()Z

    move-result v2

    if-nez v2, :cond_0

    new-instance v2, Ljava/lang/AssertionError;

    invoke-direct {v2}, Ljava/lang/AssertionError;-><init>()V

    throw v2

    .line 320
    :cond_0
    instance-of v2, v1, Lorg/jboss/netty/buffer/CompositeChannelBuffer;

    if-eqz v2, :cond_1

    move-object v0, v1

    .line 322
    check-cast v0, Lorg/jboss/netty/buffer/CompositeChannelBuffer;

    .line 323
    .local v0, "composite":Lorg/jboss/netty/buffer/CompositeChannelBuffer;
    invoke-virtual {v0}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->numComponents()I

    move-result v2

    iget v3, p0, Lorg/jboss/netty/handler/codec/frame/FrameDecoder;->maxCumulationBufferComponents:I

    if-lt v2, v3, :cond_1

    .line 324
    invoke-virtual {v0}, Lorg/jboss/netty/buffer/CompositeChannelBuffer;->copy()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v1

    .line 328
    .end local v0    # "composite":Lorg/jboss/netty/buffer/CompositeChannelBuffer;
    :cond_1
    const/4 v2, 0x2

    new-array v2, v2, [Lorg/jboss/netty/buffer/ChannelBuffer;

    const/4 v3, 0x0

    aput-object v1, v2, v3

    const/4 v3, 0x1

    aput-object p1, v2, v3

    invoke-static {v2}, Lorg/jboss/netty/buffer/ChannelBuffers;->wrappedBuffer([Lorg/jboss/netty/buffer/ChannelBuffer;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object p1

    iput-object p1, p0, Lorg/jboss/netty/handler/codec/frame/FrameDecoder;->cumulation:Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 329
    return-object p1
.end method

.method public beforeAdd(Lorg/jboss/netty/channel/ChannelHandlerContext;)V
    .locals 0
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 572
    iput-object p1, p0, Lorg/jboss/netty/handler/codec/frame/FrameDecoder;->ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

    .line 573
    return-void
.end method

.method public beforeRemove(Lorg/jboss/netty/channel/ChannelHandlerContext;)V
    .locals 0
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 581
    return-void
.end method

.method public channelClosed(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelStateEvent;)V
    .locals 0
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "e"    # Lorg/jboss/netty/channel/ChannelStateEvent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 371
    invoke-virtual {p0, p1, p2}, Lorg/jboss/netty/handler/codec/frame/FrameDecoder;->cleanup(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelStateEvent;)V

    .line 372
    return-void
.end method

.method public channelDisconnected(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelStateEvent;)V
    .locals 0
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "e"    # Lorg/jboss/netty/channel/ChannelStateEvent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 365
    invoke-virtual {p0, p1, p2}, Lorg/jboss/netty/handler/codec/frame/FrameDecoder;->cleanup(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelStateEvent;)V

    .line 366
    return-void
.end method

.method protected cleanup(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelStateEvent;)V
    .locals 4
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "e"    # Lorg/jboss/netty/channel/ChannelStateEvent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 473
    :try_start_0
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/frame/FrameDecoder;->cumulation:Lorg/jboss/netty/buffer/ChannelBuffer;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 474
    .local v0, "cumulation":Lorg/jboss/netty/buffer/ChannelBuffer;
    if-nez v0, :cond_0

    .line 493
    invoke-interface {p1, p2}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendUpstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 495
    :goto_0
    return-void

    .line 478
    :cond_0
    const/4 v2, 0x0

    :try_start_1
    iput-object v2, p0, Lorg/jboss/netty/handler/codec/frame/FrameDecoder;->cumulation:Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 480
    invoke-interface {v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->readable()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 482
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v2

    const/4 v3, 0x0

    invoke-direct {p0, p1, v2, v0, v3}, Lorg/jboss/netty/handler/codec/frame/FrameDecoder;->callDecode(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/buffer/ChannelBuffer;Ljava/net/SocketAddress;)V

    .line 488
    :cond_1
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v2

    invoke-virtual {p0, p1, v2, v0}, Lorg/jboss/netty/handler/codec/frame/FrameDecoder;->decodeLast(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/buffer/ChannelBuffer;)Ljava/lang/Object;

    move-result-object v1

    .line 489
    .local v1, "partialFrame":Ljava/lang/Object;
    if-eqz v1, :cond_2

    .line 490
    const/4 v2, 0x0

    invoke-virtual {p0, p1, v2, v1}, Lorg/jboss/netty/handler/codec/frame/FrameDecoder;->unfoldAndFireMessageReceived(Lorg/jboss/netty/channel/ChannelHandlerContext;Ljava/net/SocketAddress;Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 493
    :cond_2
    invoke-interface {p1, p2}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendUpstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    goto :goto_0

    .end local v0    # "cumulation":Lorg/jboss/netty/buffer/ChannelBuffer;
    .end local v1    # "partialFrame":Ljava/lang/Object;
    :catchall_0
    move-exception v2

    invoke-interface {p1, p2}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendUpstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    throw v2
.end method

.method protected abstract decode(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/buffer/ChannelBuffer;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method

.method protected decodeLast(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/buffer/ChannelBuffer;)Ljava/lang/Object;
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
    .line 416
    invoke-virtual {p0, p1, p2, p3}, Lorg/jboss/netty/handler/codec/frame/FrameDecoder;->decode(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/buffer/ChannelBuffer;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public exceptionCaught(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ExceptionEvent;)V
    .locals 0
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "e"    # Lorg/jboss/netty/channel/ExceptionEvent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 377
    invoke-interface {p1, p2}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendUpstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 378
    return-void
.end method

.method protected extractFrame(Lorg/jboss/netty/buffer/ChannelBuffer;II)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 2
    .param p1, "buffer"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p2, "index"    # I
    .param p3, "length"    # I

    .prologue
    .line 566
    invoke-interface {p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->factory()Lorg/jboss/netty/buffer/ChannelBufferFactory;

    move-result-object v1

    invoke-interface {v1, p3}, Lorg/jboss/netty/buffer/ChannelBufferFactory;->getBuffer(I)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    .line 567
    .local v0, "frame":Lorg/jboss/netty/buffer/ChannelBuffer;
    invoke-interface {v0, p1, p2, p3}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeBytes(Lorg/jboss/netty/buffer/ChannelBuffer;II)V

    .line 568
    return-object v0
.end method

.method public final getMaxCumulationBufferCapacity()I
    .locals 1

    .prologue
    .line 216
    iget v0, p0, Lorg/jboss/netty/handler/codec/frame/FrameDecoder;->copyThreshold:I

    return v0
.end method

.method public final getMaxCumulationBufferComponents()I
    .locals 1

    .prologue
    .line 260
    iget v0, p0, Lorg/jboss/netty/handler/codec/frame/FrameDecoder;->maxCumulationBufferComponents:I

    return v0
.end method

.method protected internalBuffer()Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 1

    .prologue
    .line 549
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/frame/FrameDecoder;->cumulation:Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 550
    .local v0, "buf":Lorg/jboss/netty/buffer/ChannelBuffer;
    if-nez v0, :cond_0

    .line 551
    sget-object v0, Lorg/jboss/netty/buffer/ChannelBuffers;->EMPTY_BUFFER:Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 553
    .end local v0    # "buf":Lorg/jboss/netty/buffer/ChannelBuffer;
    :cond_0
    return-object v0
.end method

.method public final isUnfold()Z
    .locals 1

    .prologue
    .line 199
    iget-boolean v0, p0, Lorg/jboss/netty/handler/codec/frame/FrameDecoder;->unfold:Z

    return v0
.end method

.method public messageReceived(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/MessageEvent;)V
    .locals 4
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "e"    # Lorg/jboss/netty/channel/MessageEvent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 289
    invoke-interface {p2}, Lorg/jboss/netty/channel/MessageEvent;->getMessage()Ljava/lang/Object;

    move-result-object v1

    .line 290
    .local v1, "m":Ljava/lang/Object;
    instance-of v2, v1, Lorg/jboss/netty/buffer/ChannelBuffer;

    if-nez v2, :cond_1

    .line 291
    invoke-interface {p1, p2}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendUpstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 315
    :cond_0
    :goto_0
    return-void

    :cond_1
    move-object v0, v1

    .line 295
    check-cast v0, Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 296
    .local v0, "input":Lorg/jboss/netty/buffer/ChannelBuffer;
    invoke-interface {v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->readable()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 300
    iget-object v2, p0, Lorg/jboss/netty/handler/codec/frame/FrameDecoder;->cumulation:Lorg/jboss/netty/buffer/ChannelBuffer;

    if-nez v2, :cond_2

    .line 303
    :try_start_0
    invoke-interface {p2}, Lorg/jboss/netty/channel/MessageEvent;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v2

    invoke-interface {p2}, Lorg/jboss/netty/channel/MessageEvent;->getRemoteAddress()Ljava/net/SocketAddress;

    move-result-object v3

    invoke-direct {p0, p1, v2, v0, v3}, Lorg/jboss/netty/handler/codec/frame/FrameDecoder;->callDecode(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/buffer/ChannelBuffer;Ljava/net/SocketAddress;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 305
    invoke-virtual {p0, p1, v0}, Lorg/jboss/netty/handler/codec/frame/FrameDecoder;->updateCumulation(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/buffer/ChannelBuffer;)Lorg/jboss/netty/buffer/ChannelBuffer;

    goto :goto_0

    :catchall_0
    move-exception v2

    invoke-virtual {p0, p1, v0}, Lorg/jboss/netty/handler/codec/frame/FrameDecoder;->updateCumulation(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/buffer/ChannelBuffer;)Lorg/jboss/netty/buffer/ChannelBuffer;

    throw v2

    .line 308
    :cond_2
    invoke-virtual {p0, v0}, Lorg/jboss/netty/handler/codec/frame/FrameDecoder;->appendToCumulation(Lorg/jboss/netty/buffer/ChannelBuffer;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    .line 310
    :try_start_1
    invoke-interface {p2}, Lorg/jboss/netty/channel/MessageEvent;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v2

    invoke-interface {p2}, Lorg/jboss/netty/channel/MessageEvent;->getRemoteAddress()Ljava/net/SocketAddress;

    move-result-object v3

    invoke-direct {p0, p1, v2, v0, v3}, Lorg/jboss/netty/handler/codec/frame/FrameDecoder;->callDecode(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/buffer/ChannelBuffer;Ljava/net/SocketAddress;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 312
    invoke-virtual {p0, p1, v0}, Lorg/jboss/netty/handler/codec/frame/FrameDecoder;->updateCumulation(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/buffer/ChannelBuffer;)Lorg/jboss/netty/buffer/ChannelBuffer;

    goto :goto_0

    :catchall_1
    move-exception v2

    invoke-virtual {p0, p1, v0}, Lorg/jboss/netty/handler/codec/frame/FrameDecoder;->updateCumulation(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/buffer/ChannelBuffer;)Lorg/jboss/netty/buffer/ChannelBuffer;

    throw v2
.end method

.method protected newCumulationBuffer(Lorg/jboss/netty/channel/ChannelHandlerContext;I)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 2
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "minimumCapacity"    # I

    .prologue
    .line 506
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v1

    invoke-interface {v1}, Lorg/jboss/netty/channel/Channel;->getConfig()Lorg/jboss/netty/channel/ChannelConfig;

    move-result-object v1

    invoke-interface {v1}, Lorg/jboss/netty/channel/ChannelConfig;->getBufferFactory()Lorg/jboss/netty/buffer/ChannelBufferFactory;

    move-result-object v0

    .line 507
    .local v0, "factory":Lorg/jboss/netty/buffer/ChannelBufferFactory;
    const/16 v1, 0x100

    invoke-static {p2, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    invoke-interface {v0, v1}, Lorg/jboss/netty/buffer/ChannelBufferFactory;->getBuffer(I)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v1

    return-object v1
.end method

.method public replace(Ljava/lang/String;Lorg/jboss/netty/channel/ChannelHandler;)V
    .locals 4
    .param p1, "handlerName"    # Ljava/lang/String;
    .param p2, "handler"    # Lorg/jboss/netty/channel/ChannelHandler;

    .prologue
    .line 517
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/frame/FrameDecoder;->ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

    if-nez v1, :cond_0

    .line 518
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "Replace cann only be called once the FrameDecoder is added to the ChannelPipeline"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 521
    :cond_0
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/frame/FrameDecoder;->ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

    invoke-interface {v1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getPipeline()Lorg/jboss/netty/channel/ChannelPipeline;

    move-result-object v0

    .line 522
    .local v0, "pipeline":Lorg/jboss/netty/channel/ChannelPipeline;
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/frame/FrameDecoder;->ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

    invoke-interface {v1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p1, p2}, Lorg/jboss/netty/channel/ChannelPipeline;->addAfter(Ljava/lang/String;Ljava/lang/String;Lorg/jboss/netty/channel/ChannelHandler;)V

    .line 525
    :try_start_0
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/frame/FrameDecoder;->cumulation:Lorg/jboss/netty/buffer/ChannelBuffer;

    if-eqz v1, :cond_1

    .line 526
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/frame/FrameDecoder;->ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

    iget-object v2, p0, Lorg/jboss/netty/handler/codec/frame/FrameDecoder;->cumulation:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/frame/FrameDecoder;->actualReadableBytes()I

    move-result v3

    invoke-interface {v2, v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readBytes(I)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v2

    invoke-static {v1, v2}, Lorg/jboss/netty/channel/Channels;->fireMessageReceived(Lorg/jboss/netty/channel/ChannelHandlerContext;Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 529
    :cond_1
    invoke-interface {v0, p0}, Lorg/jboss/netty/channel/ChannelPipeline;->remove(Lorg/jboss/netty/channel/ChannelHandler;)V

    .line 531
    return-void

    .line 529
    :catchall_0
    move-exception v1

    invoke-interface {v0, p0}, Lorg/jboss/netty/channel/ChannelPipeline;->remove(Lorg/jboss/netty/channel/ChannelHandler;)V

    throw v1
.end method

.method public final setMaxCumulationBufferCapacity(I)V
    .locals 2
    .param p1, "copyThreshold"    # I

    .prologue
    .line 242
    if-gez p1, :cond_0

    .line 243
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "maxCumulationBufferCapacity must be >= 0"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 245
    :cond_0
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/frame/FrameDecoder;->ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

    if-nez v0, :cond_1

    .line 246
    iput p1, p0, Lorg/jboss/netty/handler/codec/frame/FrameDecoder;->copyThreshold:I

    .line 251
    return-void

    .line 248
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "decoder properties cannot be changed once the decoder is added to a pipeline."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final setMaxCumulationBufferComponents(I)V
    .locals 3
    .param p1, "maxCumulationBufferComponents"    # I

    .prologue
    .line 271
    const/4 v0, 0x2

    if-ge p1, v0, :cond_0

    .line 272
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "maxCumulationBufferComponents: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " (expected: >= 2)"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 277
    :cond_0
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/frame/FrameDecoder;->ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

    if-nez v0, :cond_1

    .line 278
    iput p1, p0, Lorg/jboss/netty/handler/codec/frame/FrameDecoder;->maxCumulationBufferComponents:I

    .line 283
    return-void

    .line 280
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "decoder properties cannot be changed once the decoder is added to a pipeline."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final setUnfold(Z)V
    .locals 2
    .param p1, "unfold"    # Z

    .prologue
    .line 203
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/frame/FrameDecoder;->ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

    if-nez v0, :cond_0

    .line 204
    iput-boolean p1, p0, Lorg/jboss/netty/handler/codec/frame/FrameDecoder;->unfold:Z

    .line 209
    return-void

    .line 206
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "decoder properties cannot be changed once the decoder is added to a pipeline."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method protected final unfoldAndFireMessageReceived(Lorg/jboss/netty/channel/ChannelHandlerContext;Ljava/net/SocketAddress;Ljava/lang/Object;)V
    .locals 5
    .param p1, "context"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "remoteAddress"    # Ljava/net/SocketAddress;
    .param p3, "result"    # Ljava/lang/Object;

    .prologue
    .line 449
    iget-boolean v4, p0, Lorg/jboss/netty/handler/codec/frame/FrameDecoder;->unfold:Z

    if-eqz v4, :cond_3

    .line 450
    instance-of v4, p3, [Ljava/lang/Object;

    if-eqz v4, :cond_0

    .line 451
    check-cast p3, [Ljava/lang/Object;

    .end local p3    # "result":Ljava/lang/Object;
    move-object v0, p3

    check-cast v0, [Ljava/lang/Object;

    .local v0, "arr$":[Ljava/lang/Object;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v2, :cond_2

    aget-object v3, v0, v1

    .line 452
    .local v3, "r":Ljava/lang/Object;
    invoke-static {p1, v3, p2}, Lorg/jboss/netty/channel/Channels;->fireMessageReceived(Lorg/jboss/netty/channel/ChannelHandlerContext;Ljava/lang/Object;Ljava/net/SocketAddress;)V

    .line 451
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 454
    .end local v0    # "arr$":[Ljava/lang/Object;
    .end local v1    # "i$":I
    .end local v2    # "len$":I
    .end local v3    # "r":Ljava/lang/Object;
    .restart local p3    # "result":Ljava/lang/Object;
    :cond_0
    instance-of v4, p3, Ljava/lang/Iterable;

    if-eqz v4, :cond_1

    .line 455
    check-cast p3, Ljava/lang/Iterable;

    .end local p3    # "result":Ljava/lang/Object;
    invoke-interface {p3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    .line 456
    .restart local v3    # "r":Ljava/lang/Object;
    invoke-static {p1, v3, p2}, Lorg/jboss/netty/channel/Channels;->fireMessageReceived(Lorg/jboss/netty/channel/ChannelHandlerContext;Ljava/lang/Object;Ljava/net/SocketAddress;)V

    goto :goto_1

    .line 459
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v3    # "r":Ljava/lang/Object;
    .restart local p3    # "result":Ljava/lang/Object;
    :cond_1
    invoke-static {p1, p3, p2}, Lorg/jboss/netty/channel/Channels;->fireMessageReceived(Lorg/jboss/netty/channel/ChannelHandlerContext;Ljava/lang/Object;Ljava/net/SocketAddress;)V

    .line 464
    .end local p3    # "result":Ljava/lang/Object;
    :cond_2
    :goto_2
    return-void

    .line 462
    .restart local p3    # "result":Ljava/lang/Object;
    :cond_3
    invoke-static {p1, p3, p2}, Lorg/jboss/netty/channel/Channels;->fireMessageReceived(Lorg/jboss/netty/channel/ChannelHandlerContext;Ljava/lang/Object;Ljava/net/SocketAddress;)V

    goto :goto_2
.end method

.method protected updateCumulation(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/buffer/ChannelBuffer;)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 4
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "input"    # Lorg/jboss/netty/buffer/ChannelBuffer;

    .prologue
    .line 334
    invoke-interface {p2}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v2

    .line 335
    .local v2, "readableBytes":I
    if-lez v2, :cond_2

    .line 336
    invoke-interface {p2}, Lorg/jboss/netty/buffer/ChannelBuffer;->capacity()I

    move-result v0

    .line 342
    .local v0, "inputCapacity":I
    if-ge v2, v0, :cond_0

    iget v3, p0, Lorg/jboss/netty/handler/codec/frame/FrameDecoder;->copyThreshold:I

    if-le v0, v3, :cond_0

    .line 345
    invoke-interface {p2}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v3

    invoke-virtual {p0, p1, v3}, Lorg/jboss/netty/handler/codec/frame/FrameDecoder;->newCumulationBuffer(Lorg/jboss/netty/channel/ChannelHandlerContext;I)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v1

    .local v1, "newCumulation":Lorg/jboss/netty/buffer/ChannelBuffer;
    iput-object v1, p0, Lorg/jboss/netty/handler/codec/frame/FrameDecoder;->cumulation:Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 346
    iget-object v3, p0, Lorg/jboss/netty/handler/codec/frame/FrameDecoder;->cumulation:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v3, p2}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeBytes(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    .line 359
    .end local v0    # "inputCapacity":I
    :goto_0
    return-object v1

    .line 350
    .end local v1    # "newCumulation":Lorg/jboss/netty/buffer/ChannelBuffer;
    .restart local v0    # "inputCapacity":I
    :cond_0
    invoke-interface {p2}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v3

    if-eqz v3, :cond_1

    .line 351
    invoke-interface {p2}, Lorg/jboss/netty/buffer/ChannelBuffer;->slice()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v1

    .restart local v1    # "newCumulation":Lorg/jboss/netty/buffer/ChannelBuffer;
    iput-object v1, p0, Lorg/jboss/netty/handler/codec/frame/FrameDecoder;->cumulation:Lorg/jboss/netty/buffer/ChannelBuffer;

    goto :goto_0

    .line 353
    .end local v1    # "newCumulation":Lorg/jboss/netty/buffer/ChannelBuffer;
    :cond_1
    move-object v1, p2

    .restart local v1    # "newCumulation":Lorg/jboss/netty/buffer/ChannelBuffer;
    iput-object p2, p0, Lorg/jboss/netty/handler/codec/frame/FrameDecoder;->cumulation:Lorg/jboss/netty/buffer/ChannelBuffer;

    goto :goto_0

    .line 357
    .end local v0    # "inputCapacity":I
    .end local v1    # "newCumulation":Lorg/jboss/netty/buffer/ChannelBuffer;
    :cond_2
    const/4 v1, 0x0

    .restart local v1    # "newCumulation":Lorg/jboss/netty/buffer/ChannelBuffer;
    iput-object v1, p0, Lorg/jboss/netty/handler/codec/frame/FrameDecoder;->cumulation:Lorg/jboss/netty/buffer/ChannelBuffer;

    goto :goto_0
.end method
