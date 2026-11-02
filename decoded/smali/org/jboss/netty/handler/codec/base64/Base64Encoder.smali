.class public Lorg/jboss/netty/handler/codec/base64/Base64Encoder;
.super Lorg/jboss/netty/handler/codec/oneone/OneToOneEncoder;
.source "Base64Encoder.java"


# annotations
.annotation runtime Lorg/jboss/netty/channel/ChannelHandler$Sharable;
.end annotation


# instance fields
.field private final breakLines:Z

.field private final dialect:Lorg/jboss/netty/handler/codec/base64/Base64Dialect;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 50
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lorg/jboss/netty/handler/codec/base64/Base64Encoder;-><init>(Z)V

    .line 51
    return-void
.end method

.method public constructor <init>(Z)V
    .locals 1
    .param p1, "breakLines"    # Z

    .prologue
    .line 54
    sget-object v0, Lorg/jboss/netty/handler/codec/base64/Base64Dialect;->STANDARD:Lorg/jboss/netty/handler/codec/base64/Base64Dialect;

    invoke-direct {p0, p1, v0}, Lorg/jboss/netty/handler/codec/base64/Base64Encoder;-><init>(ZLorg/jboss/netty/handler/codec/base64/Base64Dialect;)V

    .line 55
    return-void
.end method

.method public constructor <init>(ZLorg/jboss/netty/handler/codec/base64/Base64Dialect;)V
    .locals 2
    .param p1, "breakLines"    # Z
    .param p2, "dialect"    # Lorg/jboss/netty/handler/codec/base64/Base64Dialect;

    .prologue
    .line 57
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/oneone/OneToOneEncoder;-><init>()V

    .line 58
    if-nez p2, :cond_0

    .line 59
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "dialect"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 62
    :cond_0
    iput-boolean p1, p0, Lorg/jboss/netty/handler/codec/base64/Base64Encoder;->breakLines:Z

    .line 63
    iput-object p2, p0, Lorg/jboss/netty/handler/codec/base64/Base64Encoder;->dialect:Lorg/jboss/netty/handler/codec/base64/Base64Dialect;

    .line 64
    return-void
.end method


# virtual methods
.method protected encode(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p3, "msg"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 69
    instance-of v1, p3, Lorg/jboss/netty/buffer/ChannelBuffer;

    if-nez v1, :cond_0

    .line 74
    .end local p3    # "msg":Ljava/lang/Object;
    :goto_0
    return-object p3

    .restart local p3    # "msg":Ljava/lang/Object;
    :cond_0
    move-object v0, p3

    .line 73
    check-cast v0, Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 74
    .local v0, "src":Lorg/jboss/netty/buffer/ChannelBuffer;
    invoke-interface {v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v1

    invoke-interface {v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v2

    iget-boolean v3, p0, Lorg/jboss/netty/handler/codec/base64/Base64Encoder;->breakLines:Z

    iget-object v4, p0, Lorg/jboss/netty/handler/codec/base64/Base64Encoder;->dialect:Lorg/jboss/netty/handler/codec/base64/Base64Dialect;

    invoke-static {v0, v1, v2, v3, v4}, Lorg/jboss/netty/handler/codec/base64/Base64;->encode(Lorg/jboss/netty/buffer/ChannelBuffer;IIZLorg/jboss/netty/handler/codec/base64/Base64Dialect;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object p3

    goto :goto_0
.end method
