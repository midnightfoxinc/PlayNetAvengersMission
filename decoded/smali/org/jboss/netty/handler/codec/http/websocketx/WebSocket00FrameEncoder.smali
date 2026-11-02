.class public Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket00FrameEncoder;
.super Lorg/jboss/netty/handler/codec/oneone/OneToOneEncoder;
.source "WebSocket00FrameEncoder.java"


# annotations
.annotation runtime Lorg/jboss/netty/channel/ChannelHandler$Sharable;
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 34
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/oneone/OneToOneEncoder;-><init>()V

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
    .line 38
    instance-of v8, p3, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketFrame;

    if-eqz v8, :cond_5

    move-object v7, p3

    .line 39
    check-cast v7, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketFrame;

    .line 40
    .local v7, "frame":Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketFrame;
    instance-of v8, v7, Lorg/jboss/netty/handler/codec/http/websocketx/TextWebSocketFrame;

    if-eqz v8, :cond_0

    .line 42
    invoke-virtual {v7}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketFrame;->getBinaryData()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v4

    .line 43
    .local v4, "data":Lorg/jboss/netty/buffer/ChannelBuffer;
    invoke-interface {p2}, Lorg/jboss/netty/channel/Channel;->getConfig()Lorg/jboss/netty/channel/ChannelConfig;

    move-result-object v8

    invoke-interface {v8}, Lorg/jboss/netty/channel/ChannelConfig;->getBufferFactory()Lorg/jboss/netty/buffer/ChannelBufferFactory;

    move-result-object v8

    invoke-interface {v4}, Lorg/jboss/netty/buffer/ChannelBuffer;->order()Ljava/nio/ByteOrder;

    move-result-object v9

    invoke-interface {v4}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v10

    add-int/lit8 v10, v10, 0x2

    invoke-interface {v8, v9, v10}, Lorg/jboss/netty/buffer/ChannelBufferFactory;->getBuffer(Ljava/nio/ByteOrder;I)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v6

    .line 45
    .local v6, "encoded":Lorg/jboss/netty/buffer/ChannelBuffer;
    const/4 v8, 0x0

    invoke-interface {v6, v8}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeByte(I)V

    .line 46
    invoke-interface {v4}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v8

    invoke-interface {v4}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v9

    invoke-interface {v6, v4, v8, v9}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeBytes(Lorg/jboss/netty/buffer/ChannelBuffer;II)V

    .line 47
    const/4 v8, -0x1

    invoke-interface {v6, v8}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeByte(I)V

    .line 95
    .end local v4    # "data":Lorg/jboss/netty/buffer/ChannelBuffer;
    .end local v6    # "encoded":Lorg/jboss/netty/buffer/ChannelBuffer;
    .end local v7    # "frame":Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketFrame;
    :goto_0
    return-object v6

    .line 49
    .restart local v7    # "frame":Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketFrame;
    :cond_0
    instance-of v8, v7, Lorg/jboss/netty/handler/codec/http/websocketx/CloseWebSocketFrame;

    if-eqz v8, :cond_1

    .line 51
    invoke-virtual {v7}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketFrame;->getBinaryData()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v4

    .line 52
    .restart local v4    # "data":Lorg/jboss/netty/buffer/ChannelBuffer;
    invoke-interface {p2}, Lorg/jboss/netty/channel/Channel;->getConfig()Lorg/jboss/netty/channel/ChannelConfig;

    move-result-object v8

    invoke-interface {v8}, Lorg/jboss/netty/channel/ChannelConfig;->getBufferFactory()Lorg/jboss/netty/buffer/ChannelBufferFactory;

    move-result-object v8

    invoke-interface {v4}, Lorg/jboss/netty/buffer/ChannelBuffer;->order()Ljava/nio/ByteOrder;

    move-result-object v9

    const/4 v10, 0x2

    invoke-interface {v8, v9, v10}, Lorg/jboss/netty/buffer/ChannelBufferFactory;->getBuffer(Ljava/nio/ByteOrder;I)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v6

    .line 53
    .restart local v6    # "encoded":Lorg/jboss/netty/buffer/ChannelBuffer;
    const/4 v8, -0x1

    invoke-interface {v6, v8}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeByte(I)V

    .line 54
    const/4 v8, 0x0

    invoke-interface {v6, v8}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeByte(I)V

    goto :goto_0

    .line 58
    .end local v4    # "data":Lorg/jboss/netty/buffer/ChannelBuffer;
    .end local v6    # "encoded":Lorg/jboss/netty/buffer/ChannelBuffer;
    :cond_1
    invoke-virtual {v7}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketFrame;->getBinaryData()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v4

    .line 59
    .restart local v4    # "data":Lorg/jboss/netty/buffer/ChannelBuffer;
    invoke-interface {v4}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v5

    .line 60
    .local v5, "dataLen":I
    invoke-interface {p2}, Lorg/jboss/netty/channel/Channel;->getConfig()Lorg/jboss/netty/channel/ChannelConfig;

    move-result-object v8

    invoke-interface {v8}, Lorg/jboss/netty/channel/ChannelConfig;->getBufferFactory()Lorg/jboss/netty/buffer/ChannelBufferFactory;

    move-result-object v8

    invoke-interface {v4}, Lorg/jboss/netty/buffer/ChannelBuffer;->order()Ljava/nio/ByteOrder;

    move-result-object v9

    add-int/lit8 v10, v5, 0x5

    invoke-interface {v8, v9, v10}, Lorg/jboss/netty/buffer/ChannelBufferFactory;->getBuffer(Ljava/nio/ByteOrder;I)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v6

    .line 63
    .restart local v6    # "encoded":Lorg/jboss/netty/buffer/ChannelBuffer;
    const/16 v8, -0x80

    invoke-interface {v6, v8}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeByte(I)V

    .line 66
    ushr-int/lit8 v8, v5, 0x1c

    and-int/lit8 v0, v8, 0x7f

    .line 67
    .local v0, "b1":I
    ushr-int/lit8 v8, v5, 0xe

    and-int/lit8 v1, v8, 0x7f

    .line 68
    .local v1, "b2":I
    ushr-int/lit8 v8, v5, 0x7

    and-int/lit8 v2, v8, 0x7f

    .line 69
    .local v2, "b3":I
    and-int/lit8 v3, v5, 0x7f

    .line 70
    .local v3, "b4":I
    if-nez v0, :cond_4

    .line 71
    if-nez v1, :cond_3

    .line 72
    if-nez v2, :cond_2

    .line 73
    invoke-interface {v6, v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeByte(I)V

    .line 91
    :goto_1
    invoke-interface {v4}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v8

    invoke-interface {v6, v4, v8, v5}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeBytes(Lorg/jboss/netty/buffer/ChannelBuffer;II)V

    goto :goto_0

    .line 75
    :cond_2
    or-int/lit16 v8, v2, 0x80

    invoke-interface {v6, v8}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeByte(I)V

    .line 76
    invoke-interface {v6, v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeByte(I)V

    goto :goto_1

    .line 79
    :cond_3
    or-int/lit16 v8, v1, 0x80

    invoke-interface {v6, v8}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeByte(I)V

    .line 80
    or-int/lit16 v8, v2, 0x80

    invoke-interface {v6, v8}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeByte(I)V

    .line 81
    invoke-interface {v6, v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeByte(I)V

    goto :goto_1

    .line 84
    :cond_4
    or-int/lit16 v8, v0, 0x80

    invoke-interface {v6, v8}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeByte(I)V

    .line 85
    or-int/lit16 v8, v1, 0x80

    invoke-interface {v6, v8}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeByte(I)V

    .line 86
    or-int/lit16 v8, v2, 0x80

    invoke-interface {v6, v8}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeByte(I)V

    .line 87
    invoke-interface {v6, v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeByte(I)V

    goto :goto_1

    .end local v0    # "b1":I
    .end local v1    # "b2":I
    .end local v2    # "b3":I
    .end local v3    # "b4":I
    .end local v4    # "data":Lorg/jboss/netty/buffer/ChannelBuffer;
    .end local v5    # "dataLen":I
    .end local v6    # "encoded":Lorg/jboss/netty/buffer/ChannelBuffer;
    .end local v7    # "frame":Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketFrame;
    :cond_5
    move-object v6, p3

    .line 95
    goto/16 :goto_0
.end method
