.class public Lorg/jboss/netty/handler/codec/string/StringDecoder;
.super Lorg/jboss/netty/handler/codec/oneone/OneToOneDecoder;
.source "StringDecoder.java"


# annotations
.annotation runtime Lorg/jboss/netty/channel/ChannelHandler$Sharable;
.end annotation


# instance fields
.field private final charset:Ljava/nio/charset/Charset;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 68
    invoke-static {}, Ljava/nio/charset/Charset;->defaultCharset()Ljava/nio/charset/Charset;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/jboss/netty/handler/codec/string/StringDecoder;-><init>(Ljava/nio/charset/Charset;)V

    .line 69
    return-void
.end method

.method public constructor <init>(Ljava/nio/charset/Charset;)V
    .locals 2
    .param p1, "charset"    # Ljava/nio/charset/Charset;

    .prologue
    .line 74
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/oneone/OneToOneDecoder;-><init>()V

    .line 75
    if-nez p1, :cond_0

    .line 76
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "charset"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 78
    :cond_0
    iput-object p1, p0, Lorg/jboss/netty/handler/codec/string/StringDecoder;->charset:Ljava/nio/charset/Charset;

    .line 79
    return-void
.end method


# virtual methods
.method protected decode(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p3, "msg"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 84
    instance-of v0, p3, Lorg/jboss/netty/buffer/ChannelBuffer;

    if-nez v0, :cond_0

    .line 87
    .end local p3    # "msg":Ljava/lang/Object;
    :goto_0
    return-object p3

    .restart local p3    # "msg":Ljava/lang/Object;
    :cond_0
    check-cast p3, Lorg/jboss/netty/buffer/ChannelBuffer;

    .end local p3    # "msg":Ljava/lang/Object;
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/string/StringDecoder;->charset:Ljava/nio/charset/Charset;

    invoke-interface {p3, v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->toString(Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object p3

    goto :goto_0
.end method
