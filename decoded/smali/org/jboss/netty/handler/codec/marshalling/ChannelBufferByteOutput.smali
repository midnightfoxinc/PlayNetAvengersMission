.class Lorg/jboss/netty/handler/codec/marshalling/ChannelBufferByteOutput;
.super Ljava/lang/Object;
.source "ChannelBufferByteOutput.java"

# interfaces
.implements Lorg/jboss/marshalling/ByteOutput;


# instance fields
.field private final buffer:Lorg/jboss/netty/buffer/ChannelBuffer;


# direct methods
.method public constructor <init>(Lorg/jboss/netty/buffer/ChannelBuffer;)V
    .locals 0
    .param p1, "buffer"    # Lorg/jboss/netty/buffer/ChannelBuffer;

    .prologue
    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    iput-object p1, p0, Lorg/jboss/netty/handler/codec/marshalling/ChannelBufferByteOutput;->buffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 39
    return-void
.end method

.method public constructor <init>(Lorg/jboss/netty/buffer/ChannelBufferFactory;I)V
    .locals 1
    .param p1, "factory"    # Lorg/jboss/netty/buffer/ChannelBufferFactory;
    .param p2, "estimatedLength"    # I

    .prologue
    .line 45
    invoke-static {p2, p1}, Lorg/jboss/netty/buffer/ChannelBuffers;->dynamicBuffer(ILorg/jboss/netty/buffer/ChannelBufferFactory;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/jboss/netty/handler/codec/marshalling/ChannelBufferByteOutput;-><init>(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    .line 46
    return-void
.end method


# virtual methods
.method public close()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 50
    return-void
.end method

.method public flush()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 54
    return-void
.end method

.method public getBuffer()Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 1

    .prologue
    .line 73
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/marshalling/ChannelBufferByteOutput;->buffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    return-object v0
.end method

.method public write(I)V
    .locals 1
    .param p1, "b"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 57
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/marshalling/ChannelBufferByteOutput;->buffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v0, p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeByte(I)V

    .line 58
    return-void
.end method

.method public write([B)V
    .locals 1
    .param p1, "bytes"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 61
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/marshalling/ChannelBufferByteOutput;->buffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v0, p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeBytes([B)V

    .line 62
    return-void
.end method

.method public write([BII)V
    .locals 1
    .param p1, "bytes"    # [B
    .param p2, "srcIndex"    # I
    .param p3, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 65
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/marshalling/ChannelBufferByteOutput;->buffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v0, p1, p2, p3}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeBytes([BII)V

    .line 66
    return-void
.end method
