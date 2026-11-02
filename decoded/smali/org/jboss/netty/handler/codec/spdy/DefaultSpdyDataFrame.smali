.class public Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyDataFrame;
.super Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyStreamFrame;
.source "DefaultSpdyDataFrame.java"

# interfaces
.implements Lorg/jboss/netty/handler/codec/spdy/SpdyDataFrame;


# instance fields
.field private data:Lorg/jboss/netty/buffer/ChannelBuffer;


# direct methods
.method public constructor <init>(I)V
    .locals 1
    .param p1, "streamId"    # I

    .prologue
    .line 35
    invoke-direct {p0, p1}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyStreamFrame;-><init>(I)V

    .line 27
    sget-object v0, Lorg/jboss/netty/buffer/ChannelBuffers;->EMPTY_BUFFER:Lorg/jboss/netty/buffer/ChannelBuffer;

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyDataFrame;->data:Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 36
    return-void
.end method


# virtual methods
.method public getData()Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 1

    .prologue
    .line 39
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyDataFrame;->data:Lorg/jboss/netty/buffer/ChannelBuffer;

    return-object v0
.end method

.method public setData(Lorg/jboss/netty/buffer/ChannelBuffer;)V
    .locals 2
    .param p1, "data"    # Lorg/jboss/netty/buffer/ChannelBuffer;

    .prologue
    .line 43
    if-nez p1, :cond_0

    .line 44
    sget-object p1, Lorg/jboss/netty/buffer/ChannelBuffers;->EMPTY_BUFFER:Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 46
    :cond_0
    invoke-interface {p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v0

    const v1, 0xffffff

    if-le v0, v1, :cond_1

    .line 47
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "data payload cannot exceed 16777215 bytes"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 50
    :cond_1
    iput-object p1, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyDataFrame;->data:Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 51
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 55
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 56
    .local v0, "buf":Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    const-string v1, "(last: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyDataFrame;->isLast()Z

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 59
    const/16 v1, 0x29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 60
    sget-object v1, Lorg/jboss/netty/util/internal/StringUtil;->NEWLINE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    const-string v1, "--> Stream-ID = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyDataFrame;->getStreamId()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 63
    sget-object v1, Lorg/jboss/netty/util/internal/StringUtil;->NEWLINE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    const-string v1, "--> Size = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyDataFrame;->getData()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v1

    invoke-interface {v1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 66
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
