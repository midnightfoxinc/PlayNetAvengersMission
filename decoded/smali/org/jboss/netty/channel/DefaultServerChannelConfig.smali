.class public Lorg/jboss/netty/channel/DefaultServerChannelConfig;
.super Ljava/lang/Object;
.source "DefaultServerChannelConfig.java"

# interfaces
.implements Lorg/jboss/netty/channel/ChannelConfig;


# instance fields
.field private volatile bufferFactory:Lorg/jboss/netty/buffer/ChannelBufferFactory;

.field private volatile pipelineFactory:Lorg/jboss/netty/channel/ChannelPipelineFactory;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    invoke-static {}, Lorg/jboss/netty/buffer/HeapChannelBufferFactory;->getInstance()Lorg/jboss/netty/buffer/ChannelBufferFactory;

    move-result-object v0

    iput-object v0, p0, Lorg/jboss/netty/channel/DefaultServerChannelConfig;->bufferFactory:Lorg/jboss/netty/buffer/ChannelBufferFactory;

    return-void
.end method


# virtual methods
.method public getBufferFactory()Lorg/jboss/netty/buffer/ChannelBufferFactory;
    .locals 1

    .prologue
    .line 69
    iget-object v0, p0, Lorg/jboss/netty/channel/DefaultServerChannelConfig;->bufferFactory:Lorg/jboss/netty/buffer/ChannelBufferFactory;

    return-object v0
.end method

.method public getConnectTimeoutMillis()I
    .locals 1

    .prologue
    .line 81
    const/4 v0, 0x0

    return v0
.end method

.method public getPipelineFactory()Lorg/jboss/netty/channel/ChannelPipelineFactory;
    .locals 1

    .prologue
    .line 58
    iget-object v0, p0, Lorg/jboss/netty/channel/DefaultServerChannelConfig;->pipelineFactory:Lorg/jboss/netty/channel/ChannelPipelineFactory;

    return-object v0
.end method

.method public setBufferFactory(Lorg/jboss/netty/buffer/ChannelBufferFactory;)V
    .locals 2
    .param p1, "bufferFactory"    # Lorg/jboss/netty/buffer/ChannelBufferFactory;

    .prologue
    .line 73
    if-nez p1, :cond_0

    .line 74
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "bufferFactory"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 77
    :cond_0
    iput-object p1, p0, Lorg/jboss/netty/channel/DefaultServerChannelConfig;->bufferFactory:Lorg/jboss/netty/buffer/ChannelBufferFactory;

    .line 78
    return-void
.end method

.method public setConnectTimeoutMillis(I)V
    .locals 0
    .param p1, "connectTimeoutMillis"    # I

    .prologue
    .line 86
    return-void
.end method

.method public setOption(Ljava/lang/String;Ljava/lang/Object;)Z
    .locals 2
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 44
    if-nez p1, :cond_0

    .line 45
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "key"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 47
    :cond_0
    const-string v0, "pipelineFactory"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 48
    check-cast p2, Lorg/jboss/netty/channel/ChannelPipelineFactory;

    .end local p2    # "value":Ljava/lang/Object;
    invoke-virtual {p0, p2}, Lorg/jboss/netty/channel/DefaultServerChannelConfig;->setPipelineFactory(Lorg/jboss/netty/channel/ChannelPipelineFactory;)V

    .line 54
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0

    .line 49
    .restart local p2    # "value":Ljava/lang/Object;
    :cond_1
    const-string v0, "bufferFactory"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 50
    check-cast p2, Lorg/jboss/netty/buffer/ChannelBufferFactory;

    .end local p2    # "value":Ljava/lang/Object;
    invoke-virtual {p0, p2}, Lorg/jboss/netty/channel/DefaultServerChannelConfig;->setBufferFactory(Lorg/jboss/netty/buffer/ChannelBufferFactory;)V

    goto :goto_0

    .line 52
    .restart local p2    # "value":Ljava/lang/Object;
    :cond_2
    const/4 v0, 0x0

    goto :goto_1
.end method

.method public setOptions(Ljava/util/Map;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 34
    .local p1, "options":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 35
    .local v0, "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {p0, v2, v3}, Lorg/jboss/netty/channel/DefaultServerChannelConfig;->setOption(Ljava/lang/String;Ljava/lang/Object;)Z

    goto :goto_0

    .line 37
    .end local v0    # "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_0
    return-void
.end method

.method public setPipelineFactory(Lorg/jboss/netty/channel/ChannelPipelineFactory;)V
    .locals 2
    .param p1, "pipelineFactory"    # Lorg/jboss/netty/channel/ChannelPipelineFactory;

    .prologue
    .line 62
    if-nez p1, :cond_0

    .line 63
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "pipelineFactory"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 65
    :cond_0
    iput-object p1, p0, Lorg/jboss/netty/channel/DefaultServerChannelConfig;->pipelineFactory:Lorg/jboss/netty/channel/ChannelPipelineFactory;

    .line 66
    return-void
.end method
