.class public Lorg/jboss/netty/handler/codec/marshalling/MarshallingEncoder;
.super Lorg/jboss/netty/handler/codec/oneone/OneToOneEncoder;
.source "MarshallingEncoder.java"


# annotations
.annotation runtime Lorg/jboss/netty/channel/ChannelHandler$Sharable;
.end annotation


# static fields
.field private static final LENGTH_PLACEHOLDER:[B


# instance fields
.field private final estimatedLength:I

.field private final provider:Lorg/jboss/netty/handler/codec/marshalling/MarshallerProvider;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 39
    const/4 v0, 0x4

    new-array v0, v0, [B

    sput-object v0, Lorg/jboss/netty/handler/codec/marshalling/MarshallingEncoder;->LENGTH_PLACEHOLDER:[B

    return-void
.end method

.method public constructor <init>(Lorg/jboss/netty/handler/codec/marshalling/MarshallerProvider;)V
    .locals 1
    .param p1, "provider"    # Lorg/jboss/netty/handler/codec/marshalling/MarshallerProvider;

    .prologue
    .line 50
    const/16 v0, 0x200

    invoke-direct {p0, p1, v0}, Lorg/jboss/netty/handler/codec/marshalling/MarshallingEncoder;-><init>(Lorg/jboss/netty/handler/codec/marshalling/MarshallerProvider;I)V

    .line 51
    return-void
.end method

.method public constructor <init>(Lorg/jboss/netty/handler/codec/marshalling/MarshallerProvider;I)V
    .locals 3
    .param p1, "provider"    # Lorg/jboss/netty/handler/codec/marshalling/MarshallerProvider;
    .param p2, "estimatedLength"    # I

    .prologue
    .line 66
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/oneone/OneToOneEncoder;-><init>()V

    .line 67
    if-gez p2, :cond_0

    .line 68
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "estimatedLength: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 71
    :cond_0
    iput p2, p0, Lorg/jboss/netty/handler/codec/marshalling/MarshallingEncoder;->estimatedLength:I

    .line 72
    iput-object p1, p0, Lorg/jboss/netty/handler/codec/marshalling/MarshallingEncoder;->provider:Lorg/jboss/netty/handler/codec/marshalling/MarshallerProvider;

    .line 73
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
    .line 77
    iget-object v3, p0, Lorg/jboss/netty/handler/codec/marshalling/MarshallingEncoder;->provider:Lorg/jboss/netty/handler/codec/marshalling/MarshallerProvider;

    invoke-interface {v3, p1}, Lorg/jboss/netty/handler/codec/marshalling/MarshallerProvider;->getMarshaller(Lorg/jboss/netty/channel/ChannelHandlerContext;)Lorg/jboss/marshalling/Marshaller;

    move-result-object v1

    .line 78
    .local v1, "marshaller":Lorg/jboss/marshalling/Marshaller;
    new-instance v2, Lorg/jboss/netty/handler/codec/marshalling/ChannelBufferByteOutput;

    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v3

    invoke-interface {v3}, Lorg/jboss/netty/channel/Channel;->getConfig()Lorg/jboss/netty/channel/ChannelConfig;

    move-result-object v3

    invoke-interface {v3}, Lorg/jboss/netty/channel/ChannelConfig;->getBufferFactory()Lorg/jboss/netty/buffer/ChannelBufferFactory;

    move-result-object v3

    iget v4, p0, Lorg/jboss/netty/handler/codec/marshalling/MarshallingEncoder;->estimatedLength:I

    invoke-direct {v2, v3, v4}, Lorg/jboss/netty/handler/codec/marshalling/ChannelBufferByteOutput;-><init>(Lorg/jboss/netty/buffer/ChannelBufferFactory;I)V

    .line 80
    .local v2, "output":Lorg/jboss/netty/handler/codec/marshalling/ChannelBufferByteOutput;
    invoke-virtual {v2}, Lorg/jboss/netty/handler/codec/marshalling/ChannelBufferByteOutput;->getBuffer()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v3

    sget-object v4, Lorg/jboss/netty/handler/codec/marshalling/MarshallingEncoder;->LENGTH_PLACEHOLDER:[B

    invoke-interface {v3, v4}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeBytes([B)V

    .line 81
    invoke-interface {v1, v2}, Lorg/jboss/marshalling/Marshaller;->start(Lorg/jboss/marshalling/ByteOutput;)V

    .line 82
    invoke-interface {v1, p3}, Lorg/jboss/marshalling/Marshaller;->writeObject(Ljava/lang/Object;)V

    .line 83
    invoke-interface {v1}, Lorg/jboss/marshalling/Marshaller;->finish()V

    .line 84
    invoke-interface {v1}, Lorg/jboss/marshalling/Marshaller;->close()V

    .line 86
    invoke-virtual {v2}, Lorg/jboss/netty/handler/codec/marshalling/ChannelBufferByteOutput;->getBuffer()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    .line 87
    .local v0, "encoded":Lorg/jboss/netty/buffer/ChannelBuffer;
    const/4 v3, 0x0

    invoke-interface {v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->writerIndex()I

    move-result v4

    add-int/lit8 v4, v4, -0x4

    invoke-interface {v0, v3, v4}, Lorg/jboss/netty/buffer/ChannelBuffer;->setInt(II)V

    .line 89
    return-object v0
.end method
