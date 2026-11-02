.class abstract Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder;
.super Ljava/lang/Object;
.source "AbstractCodecEmbedder.java"

# interfaces
.implements Lorg/jboss/netty/handler/codec/embedder/CodecEmbedder;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder$EmbeddedChannelPipeline;,
        Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder$EmbeddedChannelSink;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lorg/jboss/netty/handler/codec/embedder/CodecEmbedder",
        "<TE;>;"
    }
.end annotation


# instance fields
.field private final channel:Lorg/jboss/netty/channel/Channel;

.field private final pipeline:Lorg/jboss/netty/channel/ChannelPipeline;

.field final productQueue:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private final sink:Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder$EmbeddedChannelSink;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder",
            "<TE;>.EmbeddedChannelSink;"
        }
    .end annotation
.end field


# direct methods
.method protected varargs constructor <init>(Lorg/jboss/netty/buffer/ChannelBufferFactory;[Lorg/jboss/netty/channel/ChannelHandler;)V
    .locals 1
    .param p1, "bufferFactory"    # Lorg/jboss/netty/buffer/ChannelBufferFactory;
    .param p2, "handlers"    # [Lorg/jboss/netty/channel/ChannelHandler;

    .prologue
    .line 69
    .local p0, "this":Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder;, "Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder<TE;>;"
    invoke-direct {p0, p2}, Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder;-><init>([Lorg/jboss/netty/channel/ChannelHandler;)V

    .line 70
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v0

    invoke-interface {v0}, Lorg/jboss/netty/channel/Channel;->getConfig()Lorg/jboss/netty/channel/ChannelConfig;

    move-result-object v0

    invoke-interface {v0, p1}, Lorg/jboss/netty/channel/ChannelConfig;->setBufferFactory(Lorg/jboss/netty/buffer/ChannelBufferFactory;)V

    .line 71
    return-void
.end method

.method protected varargs constructor <init>([Lorg/jboss/netty/channel/ChannelHandler;)V
    .locals 3
    .param p1, "handlers"    # [Lorg/jboss/netty/channel/ChannelHandler;

    .prologue
    .line 54
    .local p0, "this":Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder;, "Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder<TE;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    new-instance v0, Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder$EmbeddedChannelSink;

    invoke-direct {v0, p0}, Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder$EmbeddedChannelSink;-><init>(Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder;)V

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder;->sink:Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder$EmbeddedChannelSink;

    .line 48
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder;->productQueue:Ljava/util/Queue;

    .line 55
    new-instance v0, Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder$EmbeddedChannelPipeline;

    invoke-direct {v0}, Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder$EmbeddedChannelPipeline;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder;->pipeline:Lorg/jboss/netty/channel/ChannelPipeline;

    .line 56
    invoke-direct {p0, p1}, Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder;->configurePipeline([Lorg/jboss/netty/channel/ChannelHandler;)V

    .line 57
    new-instance v0, Lorg/jboss/netty/handler/codec/embedder/EmbeddedChannel;

    iget-object v1, p0, Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder;->pipeline:Lorg/jboss/netty/channel/ChannelPipeline;

    iget-object v2, p0, Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder;->sink:Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder$EmbeddedChannelSink;

    invoke-direct {v0, v1, v2}, Lorg/jboss/netty/handler/codec/embedder/EmbeddedChannel;-><init>(Lorg/jboss/netty/channel/ChannelPipeline;Lorg/jboss/netty/channel/ChannelSink;)V

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder;->channel:Lorg/jboss/netty/channel/Channel;

    .line 58
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder;->fireInitialEvents()V

    .line 59
    return-void
.end method

.method private varargs configurePipeline([Lorg/jboss/netty/channel/ChannelHandler;)V
    .locals 5
    .param p1, "handlers"    # [Lorg/jboss/netty/channel/ChannelHandler;

    .prologue
    .line 81
    .local p0, "this":Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder;, "Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder<TE;>;"
    if-nez p1, :cond_0

    .line 82
    new-instance v2, Ljava/lang/NullPointerException;

    const-string v3, "handlers"

    invoke-direct {v2, v3}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 85
    :cond_0
    array-length v2, p1

    if-nez v2, :cond_1

    .line 86
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "handlers should contain at least one "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-class v4, Lorg/jboss/netty/channel/ChannelHandler;

    invoke-virtual {v4}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const/16 v4, 0x2e

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 91
    :cond_1
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v2, p1

    if-ge v1, v2, :cond_3

    .line 92
    aget-object v0, p1, v1

    .line 93
    .local v0, "h":Lorg/jboss/netty/channel/ChannelHandler;
    if-nez v0, :cond_2

    .line 94
    new-instance v2, Ljava/lang/NullPointerException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "handlers["

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const/16 v4, 0x5d

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 96
    :cond_2
    iget-object v2, p0, Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder;->pipeline:Lorg/jboss/netty/channel/ChannelPipeline;

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    aget-object v4, p1, v1

    invoke-interface {v2, v3, v4}, Lorg/jboss/netty/channel/ChannelPipeline;->addLast(Ljava/lang/String;Lorg/jboss/netty/channel/ChannelHandler;)V

    .line 91
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 98
    .end local v0    # "h":Lorg/jboss/netty/channel/ChannelHandler;
    :cond_3
    iget-object v2, p0, Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder;->pipeline:Lorg/jboss/netty/channel/ChannelPipeline;

    const-string v3, "SINK"

    iget-object v4, p0, Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder;->sink:Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder$EmbeddedChannelSink;

    invoke-interface {v2, v3, v4}, Lorg/jboss/netty/channel/ChannelPipeline;->addLast(Ljava/lang/String;Lorg/jboss/netty/channel/ChannelHandler;)V

    .line 99
    return-void
.end method

.method private fireInitialEvents()V
    .locals 2

    .prologue
    .line 75
    .local p0, "this":Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder;, "Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder<TE;>;"
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder;->channel:Lorg/jboss/netty/channel/Channel;

    invoke-static {v0}, Lorg/jboss/netty/channel/Channels;->fireChannelOpen(Lorg/jboss/netty/channel/Channel;)V

    .line 76
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder;->channel:Lorg/jboss/netty/channel/Channel;

    iget-object v1, p0, Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder;->channel:Lorg/jboss/netty/channel/Channel;

    invoke-interface {v1}, Lorg/jboss/netty/channel/Channel;->getLocalAddress()Ljava/net/SocketAddress;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/jboss/netty/channel/Channels;->fireChannelBound(Lorg/jboss/netty/channel/Channel;Ljava/net/SocketAddress;)V

    .line 77
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder;->channel:Lorg/jboss/netty/channel/Channel;

    iget-object v1, p0, Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder;->channel:Lorg/jboss/netty/channel/Channel;

    invoke-interface {v1}, Lorg/jboss/netty/channel/Channel;->getRemoteAddress()Ljava/net/SocketAddress;

    move-result-object v1

    invoke-static {v0, v1}, Lorg/jboss/netty/channel/Channels;->fireChannelConnected(Lorg/jboss/netty/channel/Channel;Ljava/net/SocketAddress;)V

    .line 78
    return-void
.end method


# virtual methods
.method public finish()Z
    .locals 1

    .prologue
    .line 102
    .local p0, "this":Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder;, "Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder<TE;>;"
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder;->channel:Lorg/jboss/netty/channel/Channel;

    invoke-static {v0}, Lorg/jboss/netty/channel/Channels;->close(Lorg/jboss/netty/channel/Channel;)Lorg/jboss/netty/channel/ChannelFuture;

    .line 103
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder;->channel:Lorg/jboss/netty/channel/Channel;

    invoke-static {v0}, Lorg/jboss/netty/channel/Channels;->fireChannelDisconnected(Lorg/jboss/netty/channel/Channel;)V

    .line 104
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder;->channel:Lorg/jboss/netty/channel/Channel;

    invoke-static {v0}, Lorg/jboss/netty/channel/Channels;->fireChannelUnbound(Lorg/jboss/netty/channel/Channel;)V

    .line 105
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder;->channel:Lorg/jboss/netty/channel/Channel;

    invoke-static {v0}, Lorg/jboss/netty/channel/Channels;->fireChannelClosed(Lorg/jboss/netty/channel/Channel;)V

    .line 106
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder;->productQueue:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected final getChannel()Lorg/jboss/netty/channel/Channel;
    .locals 1

    .prologue
    .line 114
    .local p0, "this":Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder;, "Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder<TE;>;"
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder;->channel:Lorg/jboss/netty/channel/Channel;

    return-object v0
.end method

.method public getPipeline()Lorg/jboss/netty/channel/ChannelPipeline;
    .locals 1

    .prologue
    .line 182
    .local p0, "this":Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder;, "Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder<TE;>;"
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder;->pipeline:Lorg/jboss/netty/channel/ChannelPipeline;

    return-object v0
.end method

.method protected final isEmpty()Z
    .locals 1

    .prologue
    .line 122
    .local p0, "this":Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder;, "Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder<TE;>;"
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder;->productQueue:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public final peek()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .prologue
    .line 132
    .local p0, "this":Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder;, "Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder<TE;>;"
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder;->productQueue:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->peek()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final poll()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .prologue
    .line 127
    .local p0, "this":Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder;, "Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder<TE;>;"
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder;->productQueue:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final pollAll()[Ljava/lang/Object;
    .locals 5

    .prologue
    .line 136
    .local p0, "this":Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder;, "Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder<TE;>;"
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder;->size()I

    move-result v3

    .line 137
    .local v3, "size":I
    new-array v0, v3, [Ljava/lang/Object;

    .line 138
    .local v0, "a":[Ljava/lang/Object;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v3, :cond_1

    .line 139
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder;->poll()Ljava/lang/Object;

    move-result-object v2

    .line 140
    .local v2, "product":Ljava/lang/Object;, "TE;"
    if-nez v2, :cond_0

    .line 141
    new-instance v4, Ljava/util/ConcurrentModificationException;

    invoke-direct {v4}, Ljava/util/ConcurrentModificationException;-><init>()V

    throw v4

    .line 143
    :cond_0
    aput-object v2, v0, v1

    .line 138
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 145
    .end local v2    # "product":Ljava/lang/Object;, "TE;"
    :cond_1
    return-object v0
.end method

.method public final pollAll([Ljava/lang/Object;)[Ljava/lang/Object;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;)[TT;"
        }
    .end annotation

    .prologue
    .line 150
    .local p0, "this":Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder;, "Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder<TE;>;"
    .local p1, "a":[Ljava/lang/Object;, "[TT;"
    if-nez p1, :cond_0

    .line 151
    new-instance v3, Ljava/lang/NullPointerException;

    const-string v4, "a"

    invoke-direct {v3, v4}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 154
    :cond_0
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder;->size()I

    move-result v2

    .line 157
    .local v2, "size":I
    array-length v3, p1

    if-ge v3, v2, :cond_1

    .line 158
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getComponentType()Ljava/lang/Class;

    move-result-object v3

    invoke-static {v3, v2}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Ljava/lang/Object;

    move-object p1, v3

    check-cast p1, [Ljava/lang/Object;

    .line 161
    :cond_1
    const/4 v0, 0x0

    .line 162
    .local v0, "i":I
    :goto_0
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder;->poll()Ljava/lang/Object;

    move-result-object v1

    .line 163
    .local v1, "product":Ljava/lang/Object;, "TT;"
    if-nez v1, :cond_3

    .line 170
    array-length v3, p1

    if-le v3, v2, :cond_2

    .line 171
    const/4 v3, 0x0

    aput-object v3, p1, v2

    .line 174
    :cond_2
    return-object p1

    .line 166
    :cond_3
    aput-object v1, p1, v0

    .line 161
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public final size()I
    .locals 1

    .prologue
    .line 178
    .local p0, "this":Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder;, "Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder<TE;>;"
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/embedder/AbstractCodecEmbedder;->productQueue:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->size()I

    move-result v0

    return v0
.end method
