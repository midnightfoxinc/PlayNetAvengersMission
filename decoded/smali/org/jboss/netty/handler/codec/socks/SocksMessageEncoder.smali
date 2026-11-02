.class public Lorg/jboss/netty/handler/codec/socks/SocksMessageEncoder;
.super Lorg/jboss/netty/handler/codec/oneone/OneToOneEncoder;
.source "SocksMessageEncoder.java"


# annotations
.annotation runtime Lorg/jboss/netty/channel/ChannelHandler$Sharable;
.end annotation


# static fields
.field private static final DEFAULT_ENCODER_BUFFER_SIZE:I = 0x400


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 32
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/oneone/OneToOneEncoder;-><init>()V

    return-void
.end method


# virtual methods
.method protected encode(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p3, "msg"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 37
    const/4 v0, 0x0

    .line 38
    .local v0, "buffer":Lorg/jboss/netty/buffer/ChannelBuffer;
    instance-of v1, p3, Lorg/jboss/netty/handler/codec/socks/SocksMessage;

    if-eqz v1, :cond_0

    .line 39
    const/16 v1, 0x400

    invoke-static {v1}, Lorg/jboss/netty/buffer/ChannelBuffers;->buffer(I)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    .line 40
    check-cast p3, Lorg/jboss/netty/handler/codec/socks/SocksMessage;

    .end local p3    # "msg":Ljava/lang/Object;
    invoke-virtual {p3, v0}, Lorg/jboss/netty/handler/codec/socks/SocksMessage;->encodeAsByteBuf(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    .line 42
    :cond_0
    return-object v0
.end method
