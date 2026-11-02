.class public Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameEncoder;
.super Lorg/jboss/netty/handler/codec/oneone/OneToOneEncoder;
.source "WebSocket08FrameEncoder.java"


# static fields
.field private static final OPCODE_BINARY:B = 0x2t

.field private static final OPCODE_CLOSE:B = 0x8t

.field private static final OPCODE_CONT:B = 0x0t

.field private static final OPCODE_PING:B = 0x9t

.field private static final OPCODE_PONG:B = 0xat

.field private static final OPCODE_TEXT:B = 0x1t

.field private static final logger:Lorg/jboss/netty/logging/InternalLogger;


# instance fields
.field private final maskPayload:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 75
    const-class v0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameEncoder;

    invoke-static {v0}, Lorg/jboss/netty/logging/InternalLoggerFactory;->getInstance(Ljava/lang/Class;)Lorg/jboss/netty/logging/InternalLogger;

    move-result-object v0

    sput-object v0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameEncoder;->logger:Lorg/jboss/netty/logging/InternalLogger;

    return-void
.end method

.method public constructor <init>(Z)V
    .locals 0
    .param p1, "maskPayload"    # Z

    .prologue
    .line 93
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/oneone/OneToOneEncoder;-><init>()V

    .line 94
    iput-boolean p1, p0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameEncoder;->maskPayload:Z

    .line 95
    return-void
.end method


# virtual methods
.method protected encode(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 20
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p3, "msg"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 102
    move-object/from16 v0, p3

    instance-of v0, v0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketFrame;

    move/from16 v16, v0

    if-eqz v16, :cond_12

    move-object/from16 v9, p3

    .line 103
    check-cast v9, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketFrame;

    .line 104
    .local v9, "frame":Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketFrame;
    invoke-virtual {v9}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketFrame;->getBinaryData()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v8

    .line 105
    .local v8, "data":Lorg/jboss/netty/buffer/ChannelBuffer;
    if-nez v8, :cond_0

    .line 106
    sget-object v8, Lorg/jboss/netty/buffer/ChannelBuffers;->EMPTY_BUFFER:Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 110
    :cond_0
    instance-of v0, v9, Lorg/jboss/netty/handler/codec/http/websocketx/TextWebSocketFrame;

    move/from16 v16, v0

    if-eqz v16, :cond_3

    .line 111
    const/4 v14, 0x1

    .line 126
    .local v14, "opcode":B
    :goto_0
    invoke-interface {v8}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v11

    .line 128
    .local v11, "length":I
    sget-object v16, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameEncoder;->logger:Lorg/jboss/netty/logging/InternalLogger;

    invoke-interface/range {v16 .. v16}, Lorg/jboss/netty/logging/InternalLogger;->isDebugEnabled()Z

    move-result v16

    if-eqz v16, :cond_1

    .line 129
    sget-object v16, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameEncoder;->logger:Lorg/jboss/netty/logging/InternalLogger;

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "Encoding WebSocket Frame opCode="

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string v18, " length="

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-interface/range {v16 .. v17}, Lorg/jboss/netty/logging/InternalLogger;->debug(Ljava/lang/String;)V

    .line 132
    :cond_1
    const/4 v3, 0x0

    .line 133
    .local v3, "b0":I
    invoke-virtual {v9}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketFrame;->isFinalFragment()Z

    move-result v16

    if-eqz v16, :cond_2

    .line 134
    or-int/lit16 v3, v3, 0x80

    .line 136
    :cond_2
    invoke-virtual {v9}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketFrame;->getRsv()I

    move-result v16

    rem-int/lit8 v16, v16, 0x8

    shl-int/lit8 v16, v16, 0x4

    or-int v3, v3, v16

    .line 137
    rem-int/lit16 v0, v14, 0x80

    move/from16 v16, v0

    or-int v3, v3, v16

    .line 142
    const/16 v16, 0x9

    move/from16 v0, v16

    if-ne v14, v0, :cond_9

    const/16 v16, 0x7d

    move/from16 v0, v16

    if-le v11, v0, :cond_9

    .line 143
    new-instance v16, Lorg/jboss/netty/handler/codec/frame/TooLongFrameException;

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "invalid payload for PING (payload length must be <= 125, was "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-direct/range {v16 .. v17}, Lorg/jboss/netty/handler/codec/frame/TooLongFrameException;-><init>(Ljava/lang/String;)V

    throw v16

    .line 112
    .end local v3    # "b0":I
    .end local v11    # "length":I
    .end local v14    # "opcode":B
    :cond_3
    instance-of v0, v9, Lorg/jboss/netty/handler/codec/http/websocketx/PingWebSocketFrame;

    move/from16 v16, v0

    if-eqz v16, :cond_4

    .line 113
    const/16 v14, 0x9

    .restart local v14    # "opcode":B
    goto :goto_0

    .line 114
    .end local v14    # "opcode":B
    :cond_4
    instance-of v0, v9, Lorg/jboss/netty/handler/codec/http/websocketx/PongWebSocketFrame;

    move/from16 v16, v0

    if-eqz v16, :cond_5

    .line 115
    const/16 v14, 0xa

    .restart local v14    # "opcode":B
    goto/16 :goto_0

    .line 116
    .end local v14    # "opcode":B
    :cond_5
    instance-of v0, v9, Lorg/jboss/netty/handler/codec/http/websocketx/CloseWebSocketFrame;

    move/from16 v16, v0

    if-eqz v16, :cond_6

    .line 117
    const/16 v14, 0x8

    .restart local v14    # "opcode":B
    goto/16 :goto_0

    .line 118
    .end local v14    # "opcode":B
    :cond_6
    instance-of v0, v9, Lorg/jboss/netty/handler/codec/http/websocketx/BinaryWebSocketFrame;

    move/from16 v16, v0

    if-eqz v16, :cond_7

    .line 119
    const/4 v14, 0x2

    .restart local v14    # "opcode":B
    goto/16 :goto_0

    .line 120
    .end local v14    # "opcode":B
    :cond_7
    instance-of v0, v9, Lorg/jboss/netty/handler/codec/http/websocketx/ContinuationWebSocketFrame;

    move/from16 v16, v0

    if-eqz v16, :cond_8

    .line 121
    const/4 v14, 0x0

    .restart local v14    # "opcode":B
    goto/16 :goto_0

    .line 123
    .end local v14    # "opcode":B
    :cond_8
    new-instance v16, Ljava/lang/UnsupportedOperationException;

    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string v18, "Cannot encode frame of type: "

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-direct/range {v16 .. v17}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v16

    .line 147
    .restart local v3    # "b0":I
    .restart local v11    # "length":I
    .restart local v14    # "opcode":B
    :cond_9
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameEncoder;->maskPayload:Z

    move/from16 v16, v0

    if-eqz v16, :cond_a

    const/4 v13, 0x4

    .line 148
    .local v13, "maskLength":I
    :goto_1
    const/16 v16, 0x7d

    move/from16 v0, v16

    if-gt v11, v0, :cond_c

    .line 149
    add-int/lit8 v16, v13, 0x2

    invoke-static/range {v16 .. v16}, Lorg/jboss/netty/buffer/ChannelBuffers;->buffer(I)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v10

    .line 150
    .local v10, "header":Lorg/jboss/netty/buffer/ChannelBuffer;
    invoke-interface {v10, v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeByte(I)V

    .line 151
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameEncoder;->maskPayload:Z

    move/from16 v16, v0

    if-eqz v16, :cond_b

    int-to-byte v0, v11

    move/from16 v16, v0

    move/from16 v0, v16

    or-int/lit16 v0, v0, 0x80

    move/from16 v16, v0

    :goto_2
    move/from16 v0, v16

    int-to-byte v2, v0

    .line 152
    .local v2, "b":B
    invoke-interface {v10, v2}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeByte(I)V

    .line 167
    .end local v2    # "b":B
    :goto_3
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameEncoder;->maskPayload:Z

    move/from16 v16, v0

    if-eqz v16, :cond_10

    .line 168
    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v16

    const-wide v18, 0x41dfffffffc00000L    # 2.147483647E9

    mul-double v16, v16, v18

    move-wide/from16 v0, v16

    double-to-int v0, v0

    move/from16 v16, v0

    invoke-static/range {v16 .. v16}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    .line 169
    .local v15, "random":Ljava/lang/Integer;
    const/16 v16, 0x4

    invoke-static/range {v16 .. v16}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v16

    invoke-virtual {v15}, Ljava/lang/Integer;->intValue()I

    move-result v17

    invoke-virtual/range {v16 .. v17}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v12

    .line 170
    .local v12, "mask":[B
    invoke-interface {v10, v12}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeBytes([B)V

    .line 172
    invoke-static {v11}, Lorg/jboss/netty/buffer/ChannelBuffers;->buffer(I)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v4

    .line 173
    .local v4, "body":Lorg/jboss/netty/buffer/ChannelBuffer;
    const/4 v6, 0x0

    .line 174
    .local v6, "counter":I
    :goto_4
    invoke-interface {v8}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v16

    if-lez v16, :cond_11

    .line 175
    invoke-interface {v8}, Lorg/jboss/netty/buffer/ChannelBuffer;->readByte()B

    move-result v5

    .line 176
    .local v5, "byteData":B
    add-int/lit8 v7, v6, 0x1

    .end local v6    # "counter":I
    .local v7, "counter":I
    rem-int/lit8 v16, v6, 0x4

    aget-byte v16, v12, v16

    xor-int v16, v16, v5

    move/from16 v0, v16

    invoke-interface {v4, v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeByte(I)V

    move v6, v7

    .line 177
    .end local v7    # "counter":I
    .restart local v6    # "counter":I
    goto :goto_4

    .line 147
    .end local v4    # "body":Lorg/jboss/netty/buffer/ChannelBuffer;
    .end local v5    # "byteData":B
    .end local v6    # "counter":I
    .end local v10    # "header":Lorg/jboss/netty/buffer/ChannelBuffer;
    .end local v12    # "mask":[B
    .end local v13    # "maskLength":I
    .end local v15    # "random":Ljava/lang/Integer;
    :cond_a
    const/4 v13, 0x0

    goto :goto_1

    .line 151
    .restart local v10    # "header":Lorg/jboss/netty/buffer/ChannelBuffer;
    .restart local v13    # "maskLength":I
    :cond_b
    int-to-byte v0, v11

    move/from16 v16, v0

    goto :goto_2

    .line 153
    .end local v10    # "header":Lorg/jboss/netty/buffer/ChannelBuffer;
    :cond_c
    const v16, 0xffff

    move/from16 v0, v16

    if-gt v11, v0, :cond_e

    .line 154
    add-int/lit8 v16, v13, 0x4

    invoke-static/range {v16 .. v16}, Lorg/jboss/netty/buffer/ChannelBuffers;->buffer(I)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v10

    .line 155
    .restart local v10    # "header":Lorg/jboss/netty/buffer/ChannelBuffer;
    invoke-interface {v10, v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeByte(I)V

    .line 156
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameEncoder;->maskPayload:Z

    move/from16 v16, v0

    if-eqz v16, :cond_d

    const/16 v16, 0xfe

    :goto_5
    move/from16 v0, v16

    invoke-interface {v10, v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeByte(I)V

    .line 157
    ushr-int/lit8 v16, v11, 0x8

    move/from16 v0, v16

    and-int/lit16 v0, v0, 0xff

    move/from16 v16, v0

    move/from16 v0, v16

    invoke-interface {v10, v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeByte(I)V

    .line 158
    and-int/lit16 v0, v11, 0xff

    move/from16 v16, v0

    move/from16 v0, v16

    invoke-interface {v10, v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeByte(I)V

    goto/16 :goto_3

    .line 156
    :cond_d
    const/16 v16, 0x7e

    goto :goto_5

    .line 160
    .end local v10    # "header":Lorg/jboss/netty/buffer/ChannelBuffer;
    :cond_e
    add-int/lit8 v16, v13, 0xa

    invoke-static/range {v16 .. v16}, Lorg/jboss/netty/buffer/ChannelBuffers;->buffer(I)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v10

    .line 161
    .restart local v10    # "header":Lorg/jboss/netty/buffer/ChannelBuffer;
    invoke-interface {v10, v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeByte(I)V

    .line 162
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameEncoder;->maskPayload:Z

    move/from16 v16, v0

    if-eqz v16, :cond_f

    const/16 v16, 0xff

    :goto_6
    move/from16 v0, v16

    invoke-interface {v10, v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeByte(I)V

    .line 163
    int-to-long v0, v11

    move-wide/from16 v16, v0

    move-wide/from16 v0, v16

    invoke-interface {v10, v0, v1}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeLong(J)V

    goto/16 :goto_3

    .line 162
    :cond_f
    const/16 v16, 0x7f

    goto :goto_6

    .line 179
    :cond_10
    move-object v4, v8

    .line 181
    .restart local v4    # "body":Lorg/jboss/netty/buffer/ChannelBuffer;
    :cond_11
    const/16 v16, 0x2

    move/from16 v0, v16

    new-array v0, v0, [Lorg/jboss/netty/buffer/ChannelBuffer;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    aput-object v10, v16, v17

    const/16 v17, 0x1

    aput-object v4, v16, v17

    invoke-static/range {v16 .. v16}, Lorg/jboss/netty/buffer/ChannelBuffers;->wrappedBuffer([Lorg/jboss/netty/buffer/ChannelBuffer;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object p3

    .line 185
    .end local v3    # "b0":I
    .end local v4    # "body":Lorg/jboss/netty/buffer/ChannelBuffer;
    .end local v8    # "data":Lorg/jboss/netty/buffer/ChannelBuffer;
    .end local v9    # "frame":Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketFrame;
    .end local v10    # "header":Lorg/jboss/netty/buffer/ChannelBuffer;
    .end local v11    # "length":I
    .end local v13    # "maskLength":I
    .end local v14    # "opcode":B
    .end local p3    # "msg":Ljava/lang/Object;
    :cond_12
    return-object p3
.end method
