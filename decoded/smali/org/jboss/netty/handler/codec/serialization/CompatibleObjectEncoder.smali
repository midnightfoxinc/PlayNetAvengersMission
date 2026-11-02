.class public Lorg/jboss/netty/handler/codec/serialization/CompatibleObjectEncoder;
.super Lorg/jboss/netty/handler/codec/oneone/OneToOneEncoder;
.source "CompatibleObjectEncoder.java"


# instance fields
.field private final buffer:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<",
            "Lorg/jboss/netty/buffer/ChannelBuffer;",
            ">;"
        }
    .end annotation
.end field

.field private volatile oout:Ljava/io/ObjectOutputStream;

.field private final resetInterval:I

.field private writtenObjects:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 50
    const/16 v0, 0x10

    invoke-direct {p0, v0}, Lorg/jboss/netty/handler/codec/serialization/CompatibleObjectEncoder;-><init>(I)V

    .line 51
    return-void
.end method

.method public constructor <init>(I)V
    .locals 3
    .param p1, "resetInterval"    # I

    .prologue
    .line 62
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/oneone/OneToOneEncoder;-><init>()V

    .line 40
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/serialization/CompatibleObjectEncoder;->buffer:Ljava/util/concurrent/atomic/AtomicReference;

    .line 63
    if-gez p1, :cond_0

    .line 64
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "resetInterval: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 67
    :cond_0
    iput p1, p0, Lorg/jboss/netty/handler/codec/serialization/CompatibleObjectEncoder;->resetInterval:I

    .line 68
    return-void
.end method

.method private buffer(Lorg/jboss/netty/channel/ChannelHandlerContext;)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 5
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 101
    iget-object v3, p0, Lorg/jboss/netty/handler/codec/serialization/CompatibleObjectEncoder;->buffer:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 102
    .local v0, "buf":Lorg/jboss/netty/buffer/ChannelBuffer;
    if-nez v0, :cond_0

    .line 103
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v3

    invoke-interface {v3}, Lorg/jboss/netty/channel/Channel;->getConfig()Lorg/jboss/netty/channel/ChannelConfig;

    move-result-object v3

    invoke-interface {v3}, Lorg/jboss/netty/channel/ChannelConfig;->getBufferFactory()Lorg/jboss/netty/buffer/ChannelBufferFactory;

    move-result-object v1

    .line 104
    .local v1, "factory":Lorg/jboss/netty/buffer/ChannelBufferFactory;
    invoke-static {v1}, Lorg/jboss/netty/buffer/ChannelBuffers;->dynamicBuffer(Lorg/jboss/netty/buffer/ChannelBufferFactory;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    .line 105
    iget-object v3, p0, Lorg/jboss/netty/handler/codec/serialization/CompatibleObjectEncoder;->buffer:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v3, v4, v0}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 106
    const/4 v2, 0x0

    .line 108
    .local v2, "success":Z
    :try_start_0
    new-instance v3, Lorg/jboss/netty/buffer/ChannelBufferOutputStream;

    invoke-direct {v3, v0}, Lorg/jboss/netty/buffer/ChannelBufferOutputStream;-><init>(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    invoke-virtual {p0, v3}, Lorg/jboss/netty/handler/codec/serialization/CompatibleObjectEncoder;->newObjectOutputStream(Ljava/io/OutputStream;)Ljava/io/ObjectOutputStream;

    move-result-object v3

    iput-object v3, p0, Lorg/jboss/netty/handler/codec/serialization/CompatibleObjectEncoder;->oout:Ljava/io/ObjectOutputStream;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 109
    const/4 v2, 0x1

    .line 111
    if-nez v2, :cond_0

    .line 112
    iput-object v4, p0, Lorg/jboss/netty/handler/codec/serialization/CompatibleObjectEncoder;->oout:Ljava/io/ObjectOutputStream;

    .line 119
    .end local v1    # "factory":Lorg/jboss/netty/buffer/ChannelBufferFactory;
    .end local v2    # "success":Z
    :cond_0
    :goto_0
    return-object v0

    .line 111
    .restart local v1    # "factory":Lorg/jboss/netty/buffer/ChannelBufferFactory;
    .restart local v2    # "success":Z
    :catchall_0
    move-exception v3

    if-nez v2, :cond_1

    .line 112
    iput-object v4, p0, Lorg/jboss/netty/handler/codec/serialization/CompatibleObjectEncoder;->oout:Ljava/io/ObjectOutputStream;

    .line 111
    :cond_1
    throw v3

    .line 116
    .end local v2    # "success":Z
    :cond_2
    iget-object v3, p0, Lorg/jboss/netty/handler/codec/serialization/CompatibleObjectEncoder;->buffer:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "buf":Lorg/jboss/netty/buffer/ChannelBuffer;
    check-cast v0, Lorg/jboss/netty/buffer/ChannelBuffer;

    .restart local v0    # "buf":Lorg/jboss/netty/buffer/ChannelBuffer;
    goto :goto_0
.end method


# virtual methods
.method protected encode(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5
    .param p1, "context"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p3, "msg"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 81
    invoke-direct {p0, p1}, Lorg/jboss/netty/handler/codec/serialization/CompatibleObjectEncoder;->buffer(Lorg/jboss/netty/channel/ChannelHandlerContext;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    .line 82
    .local v0, "buffer":Lorg/jboss/netty/buffer/ChannelBuffer;
    iget-object v2, p0, Lorg/jboss/netty/handler/codec/serialization/CompatibleObjectEncoder;->oout:Ljava/io/ObjectOutputStream;

    .line 83
    .local v2, "oout":Ljava/io/ObjectOutputStream;
    iget v3, p0, Lorg/jboss/netty/handler/codec/serialization/CompatibleObjectEncoder;->resetInterval:I

    if-eqz v3, :cond_0

    .line 85
    iget v3, p0, Lorg/jboss/netty/handler/codec/serialization/CompatibleObjectEncoder;->writtenObjects:I

    add-int/lit8 v3, v3, 0x1

    iput v3, p0, Lorg/jboss/netty/handler/codec/serialization/CompatibleObjectEncoder;->writtenObjects:I

    .line 86
    iget v3, p0, Lorg/jboss/netty/handler/codec/serialization/CompatibleObjectEncoder;->writtenObjects:I

    iget v4, p0, Lorg/jboss/netty/handler/codec/serialization/CompatibleObjectEncoder;->resetInterval:I

    rem-int/2addr v3, v4

    if-nez v3, :cond_0

    .line 87
    invoke-virtual {v2}, Ljava/io/ObjectOutputStream;->reset()V

    .line 90
    invoke-interface {v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->discardReadBytes()V

    .line 93
    :cond_0
    invoke-virtual {v2, p3}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 94
    invoke-virtual {v2}, Ljava/io/ObjectOutputStream;->flush()V

    .line 96
    invoke-interface {v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v3

    invoke-interface {v0, v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readBytes(I)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v1

    .line 97
    .local v1, "encoded":Lorg/jboss/netty/buffer/ChannelBuffer;
    return-object v1
.end method

.method protected newObjectOutputStream(Ljava/io/OutputStream;)Ljava/io/ObjectOutputStream;
    .locals 1
    .param p1, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 76
    new-instance v0, Ljava/io/ObjectOutputStream;

    invoke-direct {v0, p1}, Ljava/io/ObjectOutputStream;-><init>(Ljava/io/OutputStream;)V

    return-object v0
.end method
