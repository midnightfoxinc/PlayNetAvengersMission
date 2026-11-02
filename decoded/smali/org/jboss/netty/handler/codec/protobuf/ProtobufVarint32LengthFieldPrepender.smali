.class public Lorg/jboss/netty/handler/codec/protobuf/ProtobufVarint32LengthFieldPrepender;
.super Lorg/jboss/netty/handler/codec/oneone/OneToOneEncoder;
.source "ProtobufVarint32LengthFieldPrepender.java"


# annotations
.annotation runtime Lorg/jboss/netty/channel/ChannelHandler$Sharable;
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 44
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/oneone/OneToOneEncoder;-><init>()V

    return-void
.end method


# virtual methods
.method protected encode(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 7
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p3, "msg"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 49
    instance-of v4, p3, Lorg/jboss/netty/buffer/ChannelBuffer;

    if-nez v4, :cond_0

    .line 63
    .end local p3    # "msg":Ljava/lang/Object;
    :goto_0
    return-object p3

    .restart local p3    # "msg":Ljava/lang/Object;
    :cond_0
    move-object v0, p3

    .line 53
    check-cast v0, Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 54
    .local v0, "body":Lorg/jboss/netty/buffer/ChannelBuffer;
    invoke-interface {v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v3

    .line 55
    .local v3, "length":I
    invoke-interface {p2}, Lorg/jboss/netty/channel/Channel;->getConfig()Lorg/jboss/netty/channel/ChannelConfig;

    move-result-object v4

    invoke-interface {v4}, Lorg/jboss/netty/channel/ChannelConfig;->getBufferFactory()Lorg/jboss/netty/buffer/ChannelBufferFactory;

    move-result-object v4

    invoke-interface {v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->order()Ljava/nio/ByteOrder;

    move-result-object v5

    invoke-static {v3}, Lcom/google/protobuf/CodedOutputStream;->computeRawVarint32Size(I)I

    move-result v6

    invoke-interface {v4, v5, v6}, Lorg/jboss/netty/buffer/ChannelBufferFactory;->getBuffer(Ljava/nio/ByteOrder;I)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v2

    .line 59
    .local v2, "header":Lorg/jboss/netty/buffer/ChannelBuffer;
    new-instance v4, Lorg/jboss/netty/buffer/ChannelBufferOutputStream;

    invoke-direct {v4, v2}, Lorg/jboss/netty/buffer/ChannelBufferOutputStream;-><init>(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    invoke-static {v4}, Lcom/google/protobuf/CodedOutputStream;->newInstance(Ljava/io/OutputStream;)Lcom/google/protobuf/CodedOutputStream;

    move-result-object v1

    .line 61
    .local v1, "codedOutputStream":Lcom/google/protobuf/CodedOutputStream;
    invoke-virtual {v1, v3}, Lcom/google/protobuf/CodedOutputStream;->writeRawVarint32(I)V

    .line 62
    invoke-virtual {v1}, Lcom/google/protobuf/CodedOutputStream;->flush()V

    .line 63
    const/4 v4, 0x2

    new-array v4, v4, [Lorg/jboss/netty/buffer/ChannelBuffer;

    const/4 v5, 0x0

    aput-object v2, v4, v5

    const/4 v5, 0x1

    aput-object v0, v4, v5

    invoke-static {v4}, Lorg/jboss/netty/buffer/ChannelBuffers;->wrappedBuffer([Lorg/jboss/netty/buffer/ChannelBuffer;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object p3

    goto :goto_0
.end method
