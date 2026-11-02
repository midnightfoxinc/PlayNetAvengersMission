.class public Lorg/jboss/netty/handler/codec/frame/LengthFieldPrepender;
.super Lorg/jboss/netty/handler/codec/oneone/OneToOneEncoder;
.source "LengthFieldPrepender.java"


# annotations
.annotation runtime Lorg/jboss/netty/channel/ChannelHandler$Sharable;
.end annotation


# instance fields
.field private final lengthFieldLength:I

.field private final lengthIncludesLengthFieldLength:Z


# direct methods
.method public constructor <init>(I)V
    .locals 1
    .param p1, "lengthFieldLength"    # I

    .prologue
    .line 73
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/jboss/netty/handler/codec/frame/LengthFieldPrepender;-><init>(IZ)V

    .line 74
    return-void
.end method

.method public constructor <init>(IZ)V
    .locals 3
    .param p1, "lengthFieldLength"    # I
    .param p2, "lengthIncludesLengthFieldLength"    # Z

    .prologue
    .line 90
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/oneone/OneToOneEncoder;-><init>()V

    .line 91
    const/4 v0, 0x1

    if-eq p1, v0, :cond_0

    const/4 v0, 0x2

    if-eq p1, v0, :cond_0

    const/4 v0, 0x3

    if-eq p1, v0, :cond_0

    const/4 v0, 0x4

    if-eq p1, v0, :cond_0

    const/16 v0, 0x8

    if-eq p1, v0, :cond_0

    .line 94
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "lengthFieldLength must be either 1, 2, 3, 4, or 8: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 99
    :cond_0
    iput p1, p0, Lorg/jboss/netty/handler/codec/frame/LengthFieldPrepender;->lengthFieldLength:I

    .line 100
    iput-boolean p2, p0, Lorg/jboss/netty/handler/codec/frame/LengthFieldPrepender;->lengthIncludesLengthFieldLength:Z

    .line 101
    return-void
.end method


# virtual methods
.method protected encode(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p3, "msg"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 106
    instance-of v3, p3, Lorg/jboss/netty/buffer/ChannelBuffer;

    if-nez v3, :cond_0

    .line 146
    .end local p3    # "msg":Ljava/lang/Object;
    :goto_0
    return-object p3

    .restart local p3    # "msg":Ljava/lang/Object;
    :cond_0
    move-object v0, p3

    .line 110
    check-cast v0, Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 111
    .local v0, "body":Lorg/jboss/netty/buffer/ChannelBuffer;
    invoke-interface {p2}, Lorg/jboss/netty/channel/Channel;->getConfig()Lorg/jboss/netty/channel/ChannelConfig;

    move-result-object v3

    invoke-interface {v3}, Lorg/jboss/netty/channel/ChannelConfig;->getBufferFactory()Lorg/jboss/netty/buffer/ChannelBufferFactory;

    move-result-object v3

    invoke-interface {v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->order()Ljava/nio/ByteOrder;

    move-result-object v4

    iget v5, p0, Lorg/jboss/netty/handler/codec/frame/LengthFieldPrepender;->lengthFieldLength:I

    invoke-interface {v3, v4, v5}, Lorg/jboss/netty/buffer/ChannelBufferFactory;->getBuffer(Ljava/nio/ByteOrder;I)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v1

    .line 113
    .local v1, "header":Lorg/jboss/netty/buffer/ChannelBuffer;
    iget-boolean v3, p0, Lorg/jboss/netty/handler/codec/frame/LengthFieldPrepender;->lengthIncludesLengthFieldLength:Z

    if-eqz v3, :cond_1

    invoke-interface {v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v3

    iget v4, p0, Lorg/jboss/netty/handler/codec/frame/LengthFieldPrepender;->lengthFieldLength:I

    add-int v2, v3, v4

    .line 115
    .local v2, "length":I
    :goto_1
    iget v3, p0, Lorg/jboss/netty/handler/codec/frame/LengthFieldPrepender;->lengthFieldLength:I

    packed-switch v3, :pswitch_data_0

    .line 144
    :pswitch_0
    new-instance v3, Ljava/lang/Error;

    const-string v4, "should not reach here"

    invoke-direct {v3, v4}, Ljava/lang/Error;-><init>(Ljava/lang/String;)V

    throw v3

    .line 113
    .end local v2    # "length":I
    :cond_1
    invoke-interface {v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v2

    goto :goto_1

    .line 117
    .restart local v2    # "length":I
    :pswitch_1
    const/16 v3, 0x100

    if-lt v2, v3, :cond_2

    .line 118
    new-instance v3, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "length does not fit into a byte: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 121
    :cond_2
    int-to-byte v3, v2

    invoke-interface {v1, v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeByte(I)V

    .line 146
    :goto_2
    const/4 v3, 0x2

    new-array v3, v3, [Lorg/jboss/netty/buffer/ChannelBuffer;

    const/4 v4, 0x0

    aput-object v1, v3, v4

    const/4 v4, 0x1

    aput-object v0, v3, v4

    invoke-static {v3}, Lorg/jboss/netty/buffer/ChannelBuffers;->wrappedBuffer([Lorg/jboss/netty/buffer/ChannelBuffer;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object p3

    goto :goto_0

    .line 124
    :pswitch_2
    const/high16 v3, 0x10000

    if-lt v2, v3, :cond_3

    .line 125
    new-instance v3, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "length does not fit into a short integer: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 128
    :cond_3
    int-to-short v3, v2

    invoke-interface {v1, v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeShort(I)V

    goto :goto_2

    .line 131
    :pswitch_3
    const/high16 v3, 0x1000000

    if-lt v2, v3, :cond_4

    .line 132
    new-instance v3, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "length does not fit into a medium integer: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 135
    :cond_4
    invoke-interface {v1, v2}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeMedium(I)V

    goto :goto_2

    .line 138
    :pswitch_4
    invoke-interface {v1, v2}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeInt(I)V

    goto :goto_2

    .line 141
    :pswitch_5
    int-to-long v4, v2

    invoke-interface {v1, v4, v5}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeLong(J)V

    goto :goto_2

    .line 115
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_5
    .end packed-switch
.end method
