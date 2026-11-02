.class public Lorg/jboss/netty/handler/codec/serialization/ObjectEncoder;
.super Lorg/jboss/netty/handler/codec/oneone/OneToOneEncoder;
.source "ObjectEncoder.java"


# annotations
.annotation runtime Lorg/jboss/netty/channel/ChannelHandler$Sharable;
.end annotation


# static fields
.field private static final LENGTH_PLACEHOLDER:[B


# instance fields
.field private final estimatedLength:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 43
    const/4 v0, 0x4

    new-array v0, v0, [B

    sput-object v0, Lorg/jboss/netty/handler/codec/serialization/ObjectEncoder;->LENGTH_PLACEHOLDER:[B

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 51
    const/16 v0, 0x200

    invoke-direct {p0, v0}, Lorg/jboss/netty/handler/codec/serialization/ObjectEncoder;-><init>(I)V

    .line 52
    return-void
.end method

.method public constructor <init>(I)V
    .locals 3
    .param p1, "estimatedLength"    # I

    .prologue
    .line 65
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/oneone/OneToOneEncoder;-><init>()V

    .line 66
    if-gez p1, :cond_0

    .line 67
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "estimatedLength: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 70
    :cond_0
    iput p1, p0, Lorg/jboss/netty/handler/codec/serialization/ObjectEncoder;->estimatedLength:I

    .line 71
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
    .line 75
    new-instance v0, Lorg/jboss/netty/buffer/ChannelBufferOutputStream;

    iget v3, p0, Lorg/jboss/netty/handler/codec/serialization/ObjectEncoder;->estimatedLength:I

    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v4

    invoke-interface {v4}, Lorg/jboss/netty/channel/Channel;->getConfig()Lorg/jboss/netty/channel/ChannelConfig;

    move-result-object v4

    invoke-interface {v4}, Lorg/jboss/netty/channel/ChannelConfig;->getBufferFactory()Lorg/jboss/netty/buffer/ChannelBufferFactory;

    move-result-object v4

    invoke-static {v3, v4}, Lorg/jboss/netty/buffer/ChannelBuffers;->dynamicBuffer(ILorg/jboss/netty/buffer/ChannelBufferFactory;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v3

    invoke-direct {v0, v3}, Lorg/jboss/netty/buffer/ChannelBufferOutputStream;-><init>(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    .line 78
    .local v0, "bout":Lorg/jboss/netty/buffer/ChannelBufferOutputStream;
    sget-object v3, Lorg/jboss/netty/handler/codec/serialization/ObjectEncoder;->LENGTH_PLACEHOLDER:[B

    invoke-virtual {v0, v3}, Lorg/jboss/netty/buffer/ChannelBufferOutputStream;->write([B)V

    .line 79
    new-instance v2, Lorg/jboss/netty/handler/codec/serialization/CompactObjectOutputStream;

    invoke-direct {v2, v0}, Lorg/jboss/netty/handler/codec/serialization/CompactObjectOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 80
    .local v2, "oout":Ljava/io/ObjectOutputStream;
    invoke-virtual {v2, p3}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 81
    invoke-virtual {v2}, Ljava/io/ObjectOutputStream;->flush()V

    .line 82
    invoke-virtual {v2}, Ljava/io/ObjectOutputStream;->close()V

    .line 84
    invoke-virtual {v0}, Lorg/jboss/netty/buffer/ChannelBufferOutputStream;->buffer()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v1

    .line 85
    .local v1, "encoded":Lorg/jboss/netty/buffer/ChannelBuffer;
    const/4 v3, 0x0

    invoke-interface {v1}, Lorg/jboss/netty/buffer/ChannelBuffer;->writerIndex()I

    move-result v4

    add-int/lit8 v4, v4, -0x4

    invoke-interface {v1, v3, v4}, Lorg/jboss/netty/buffer/ChannelBuffer;->setInt(II)V

    .line 86
    return-object v1
.end method
