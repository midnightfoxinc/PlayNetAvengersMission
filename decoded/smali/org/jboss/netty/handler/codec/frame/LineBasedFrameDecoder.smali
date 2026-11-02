.class public Lorg/jboss/netty/handler/codec/frame/LineBasedFrameDecoder;
.super Lorg/jboss/netty/handler/codec/frame/FrameDecoder;
.source "LineBasedFrameDecoder.java"


# instance fields
.field private discardedBytes:I

.field private discarding:Z

.field private final failFast:Z

.field private final maxLength:I

.field private final stripDelimiter:Z


# direct methods
.method public constructor <init>(I)V
    .locals 2
    .param p1, "maxLength"    # I

    .prologue
    .line 48
    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lorg/jboss/netty/handler/codec/frame/LineBasedFrameDecoder;-><init>(IZZ)V

    .line 49
    return-void
.end method

.method public constructor <init>(IZZ)V
    .locals 0
    .param p1, "maxLength"    # I
    .param p2, "stripDelimiter"    # Z
    .param p3, "failFast"    # Z

    .prologue
    .line 66
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/frame/FrameDecoder;-><init>()V

    .line 67
    iput p1, p0, Lorg/jboss/netty/handler/codec/frame/LineBasedFrameDecoder;->maxLength:I

    .line 68
    iput-boolean p3, p0, Lorg/jboss/netty/handler/codec/frame/LineBasedFrameDecoder;->failFast:Z

    .line 69
    iput-boolean p2, p0, Lorg/jboss/netty/handler/codec/frame/LineBasedFrameDecoder;->stripDelimiter:Z

    .line 70
    return-void
.end method

.method private fail(Lorg/jboss/netty/channel/ChannelHandlerContext;I)V
    .locals 1
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "length"    # I

    .prologue
    .line 130
    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lorg/jboss/netty/handler/codec/frame/LineBasedFrameDecoder;->fail(Lorg/jboss/netty/channel/ChannelHandlerContext;Ljava/lang/String;)V

    .line 131
    return-void
.end method

.method private fail(Lorg/jboss/netty/channel/ChannelHandlerContext;Ljava/lang/String;)V
    .locals 4
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "length"    # Ljava/lang/String;

    .prologue
    .line 134
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v0

    new-instance v1, Lorg/jboss/netty/handler/codec/frame/TooLongFrameException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "frame length ("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ") exceeds the allowed maximum ("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lorg/jboss/netty/handler/codec/frame/LineBasedFrameDecoder;->maxLength:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const/16 v3, 0x29

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/jboss/netty/handler/codec/frame/TooLongFrameException;-><init>(Ljava/lang/String;)V

    invoke-static {v0, v1}, Lorg/jboss/netty/channel/Channels;->fireExceptionCaught(Lorg/jboss/netty/channel/Channel;Ljava/lang/Throwable;)V

    .line 138
    return-void
.end method

.method private static findEndOfLine(Lorg/jboss/netty/buffer/ChannelBuffer;)I
    .locals 5
    .param p0, "buffer"    # Lorg/jboss/netty/buffer/ChannelBuffer;

    .prologue
    const/16 v4, 0xa

    .line 145
    invoke-interface {p0}, Lorg/jboss/netty/buffer/ChannelBuffer;->writerIndex()I

    move-result v2

    .line 146
    .local v2, "n":I
    invoke-interface {p0}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v1

    .local v1, "i":I
    :goto_0
    if-ge v1, v2, :cond_3

    .line 147
    invoke-interface {p0, v1}, Lorg/jboss/netty/buffer/ChannelBuffer;->getByte(I)B

    move-result v0

    .line 148
    .local v0, "b":B
    if-ne v0, v4, :cond_1

    .line 154
    .end local v0    # "b":B
    .end local v1    # "i":I
    :cond_0
    :goto_1
    return v1

    .line 150
    .restart local v0    # "b":B
    .restart local v1    # "i":I
    :cond_1
    const/16 v3, 0xd

    if-ne v0, v3, :cond_2

    add-int/lit8 v3, v2, -0x1

    if-ge v1, v3, :cond_2

    add-int/lit8 v3, v1, 0x1

    invoke-interface {p0, v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->getByte(I)B

    move-result v3

    if-eq v3, v4, :cond_0

    .line 146
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 154
    .end local v0    # "b":B
    :cond_3
    const/4 v1, -0x1

    goto :goto_1
.end method


# virtual methods
.method protected decode(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/buffer/ChannelBuffer;)Ljava/lang/Object;
    .locals 9
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p3, "buffer"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/16 v8, 0xd

    const/4 v0, 0x2

    const/4 v7, 0x0

    const/4 v2, 0x0

    const/4 v4, 0x1

    .line 76
    invoke-static {p3}, Lorg/jboss/netty/handler/codec/frame/LineBasedFrameDecoder;->findEndOfLine(Lorg/jboss/netty/buffer/ChannelBuffer;)I

    move-result v1

    .line 77
    .local v1, "eol":I
    iget-boolean v5, p0, Lorg/jboss/netty/handler/codec/frame/LineBasedFrameDecoder;->discarding:Z

    if-nez v5, :cond_5

    .line 78
    if-ltz v1, :cond_4

    .line 80
    invoke-interface {p3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v5

    sub-int v3, v1, v5

    .line 81
    .local v3, "length":I
    invoke-interface {p3, v1}, Lorg/jboss/netty/buffer/ChannelBuffer;->getByte(I)B

    move-result v5

    if-ne v5, v8, :cond_1

    .line 83
    .local v0, "delimLength":I
    :goto_0
    iget v4, p0, Lorg/jboss/netty/handler/codec/frame/LineBasedFrameDecoder;->maxLength:I

    if-le v3, v4, :cond_2

    .line 84
    add-int v4, v1, v0

    invoke-interface {p3, v4}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex(I)V

    .line 85
    invoke-direct {p0, p1, v3}, Lorg/jboss/netty/handler/codec/frame/LineBasedFrameDecoder;->fail(Lorg/jboss/netty/channel/ChannelHandlerContext;I)V

    .line 125
    .end local v0    # "delimLength":I
    .end local v3    # "length":I
    :cond_0
    :goto_1
    return-object v2

    .restart local v3    # "length":I
    :cond_1
    move v0, v4

    .line 81
    goto :goto_0

    .line 90
    .restart local v0    # "delimLength":I
    :cond_2
    :try_start_0
    iget-boolean v4, p0, Lorg/jboss/netty/handler/codec/frame/LineBasedFrameDecoder;->stripDelimiter:Z

    if-eqz v4, :cond_3

    .line 91
    invoke-interface {p3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v4

    invoke-virtual {p0, p3, v4, v3}, Lorg/jboss/netty/handler/codec/frame/LineBasedFrameDecoder;->extractFrame(Lorg/jboss/netty/buffer/ChannelBuffer;II)Lorg/jboss/netty/buffer/ChannelBuffer;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v2

    .line 96
    .local v2, "frame":Lorg/jboss/netty/buffer/ChannelBuffer;
    :goto_2
    add-int v4, v3, v0

    invoke-interface {p3, v4}, Lorg/jboss/netty/buffer/ChannelBuffer;->skipBytes(I)V

    goto :goto_1

    .line 93
    .end local v2    # "frame":Lorg/jboss/netty/buffer/ChannelBuffer;
    :cond_3
    :try_start_1
    invoke-interface {p3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v4

    add-int v5, v3, v0

    invoke-virtual {p0, p3, v4, v5}, Lorg/jboss/netty/handler/codec/frame/LineBasedFrameDecoder;->extractFrame(Lorg/jboss/netty/buffer/ChannelBuffer;II)Lorg/jboss/netty/buffer/ChannelBuffer;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v2

    .restart local v2    # "frame":Lorg/jboss/netty/buffer/ChannelBuffer;
    goto :goto_2

    .line 96
    .end local v2    # "frame":Lorg/jboss/netty/buffer/ChannelBuffer;
    :catchall_0
    move-exception v4

    add-int v5, v3, v0

    invoke-interface {p3, v5}, Lorg/jboss/netty/buffer/ChannelBuffer;->skipBytes(I)V

    throw v4

    .line 100
    .end local v0    # "delimLength":I
    .end local v3    # "length":I
    :cond_4
    invoke-interface {p3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v3

    .line 101
    .restart local v3    # "length":I
    iget v5, p0, Lorg/jboss/netty/handler/codec/frame/LineBasedFrameDecoder;->maxLength:I

    if-le v3, v5, :cond_0

    .line 102
    iput v3, p0, Lorg/jboss/netty/handler/codec/frame/LineBasedFrameDecoder;->discardedBytes:I

    .line 103
    invoke-interface {p3}, Lorg/jboss/netty/buffer/ChannelBuffer;->writerIndex()I

    move-result v5

    invoke-interface {p3, v5}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex(I)V

    .line 104
    iput-boolean v4, p0, Lorg/jboss/netty/handler/codec/frame/LineBasedFrameDecoder;->discarding:Z

    .line 105
    iget-boolean v4, p0, Lorg/jboss/netty/handler/codec/frame/LineBasedFrameDecoder;->failFast:Z

    if-eqz v4, :cond_0

    .line 106
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "over "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Lorg/jboss/netty/handler/codec/frame/LineBasedFrameDecoder;->discardedBytes:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, p1, v4}, Lorg/jboss/netty/handler/codec/frame/LineBasedFrameDecoder;->fail(Lorg/jboss/netty/channel/ChannelHandlerContext;Ljava/lang/String;)V

    goto :goto_1

    .line 112
    .end local v3    # "length":I
    :cond_5
    if-ltz v1, :cond_7

    .line 113
    iget v5, p0, Lorg/jboss/netty/handler/codec/frame/LineBasedFrameDecoder;->discardedBytes:I

    add-int/2addr v5, v1

    invoke-interface {p3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v6

    sub-int v3, v5, v6

    .line 114
    .restart local v3    # "length":I
    invoke-interface {p3, v1}, Lorg/jboss/netty/buffer/ChannelBuffer;->getByte(I)B

    move-result v5

    if-ne v5, v8, :cond_6

    .line 115
    .restart local v0    # "delimLength":I
    :goto_3
    add-int v4, v1, v0

    invoke-interface {p3, v4}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex(I)V

    .line 116
    iput v7, p0, Lorg/jboss/netty/handler/codec/frame/LineBasedFrameDecoder;->discardedBytes:I

    .line 117
    iput-boolean v7, p0, Lorg/jboss/netty/handler/codec/frame/LineBasedFrameDecoder;->discarding:Z

    .line 118
    iget-boolean v4, p0, Lorg/jboss/netty/handler/codec/frame/LineBasedFrameDecoder;->failFast:Z

    if-nez v4, :cond_0

    .line 119
    invoke-direct {p0, p1, v3}, Lorg/jboss/netty/handler/codec/frame/LineBasedFrameDecoder;->fail(Lorg/jboss/netty/channel/ChannelHandlerContext;I)V

    goto :goto_1

    .end local v0    # "delimLength":I
    :cond_6
    move v0, v4

    .line 114
    goto :goto_3

    .line 122
    .end local v3    # "length":I
    :cond_7
    invoke-interface {p3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v4

    iput v4, p0, Lorg/jboss/netty/handler/codec/frame/LineBasedFrameDecoder;->discardedBytes:I

    .line 123
    invoke-interface {p3}, Lorg/jboss/netty/buffer/ChannelBuffer;->writerIndex()I

    move-result v4

    invoke-interface {p3, v4}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex(I)V

    goto/16 :goto_1
.end method
