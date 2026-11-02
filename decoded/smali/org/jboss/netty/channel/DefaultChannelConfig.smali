.class public Lorg/jboss/netty/channel/DefaultChannelConfig;
.super Ljava/lang/Object;
.source "DefaultChannelConfig.java"

# interfaces
.implements Lorg/jboss/netty/channel/ChannelConfig;


# instance fields
.field private volatile bufferFactory:Lorg/jboss/netty/buffer/ChannelBufferFactory;

.field private volatile connectTimeoutMillis:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    invoke-static {}, Lorg/jboss/netty/buffer/HeapChannelBufferFactory;->getInstance()Lorg/jboss/netty/buffer/ChannelBufferFactory;

    move-result-object v0

    iput-object v0, p0, Lorg/jboss/netty/channel/DefaultChannelConfig;->bufferFactory:Lorg/jboss/netty/buffer/ChannelBufferFactory;

    .line 32
    const/16 v0, 0x2710

    iput v0, p0, Lorg/jboss/netty/channel/DefaultChannelConfig;->connectTimeoutMillis:I

    return-void
.end method


# virtual methods
.method public getBufferFactory()Lorg/jboss/netty/buffer/ChannelBufferFactory;
    .locals 1

    .prologue
    .line 62
    iget-object v0, p0, Lorg/jboss/netty/channel/DefaultChannelConfig;->bufferFactory:Lorg/jboss/netty/buffer/ChannelBufferFactory;

    return-object v0
.end method

.method public getConnectTimeoutMillis()I
    .locals 1

    .prologue
    .line 58
    iget v0, p0, Lorg/jboss/netty/channel/DefaultChannelConfig;->connectTimeoutMillis:I

    return v0
.end method

.method public getPipelineFactory()Lorg/jboss/netty/channel/ChannelPipelineFactory;
    .locals 1

    .prologue
    .line 73
    const/4 v0, 0x0

    return-object v0
.end method

.method public setBufferFactory(Lorg/jboss/netty/buffer/ChannelBufferFactory;)V
    .locals 2
    .param p1, "bufferFactory"    # Lorg/jboss/netty/buffer/ChannelBufferFactory;

    .prologue
    .line 66
    if-nez p1, :cond_0

    .line 67
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "bufferFactory"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 69
    :cond_0
    iput-object p1, p0, Lorg/jboss/netty/channel/DefaultChannelConfig;->bufferFactory:Lorg/jboss/netty/buffer/ChannelBufferFactory;

    .line 70
    return-void
.end method

.method public setConnectTimeoutMillis(I)V
    .locals 3
    .param p1, "connectTimeoutMillis"    # I

    .prologue
    .line 77
    if-gez p1, :cond_0

    .line 78
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "connectTimeoutMillis: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 80
    :cond_0
    iput p1, p0, Lorg/jboss/netty/channel/DefaultChannelConfig;->connectTimeoutMillis:I

    .line 81
    return-void
.end method

.method public setOption(Ljava/lang/String;Ljava/lang/Object;)Z
    .locals 2
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/Object;

    .prologue
    .line 41
    if-nez p1, :cond_0

    .line 42
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "key"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 45
    :cond_0
    const-string v0, "pipelineFactory"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 46
    check-cast p2, Lorg/jboss/netty/channel/ChannelPipelineFactory;

    .end local p2    # "value":Ljava/lang/Object;
    invoke-virtual {p0, p2}, Lorg/jboss/netty/channel/DefaultChannelConfig;->setPipelineFactory(Lorg/jboss/netty/channel/ChannelPipelineFactory;)V

    .line 54
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0

    .line 47
    .restart local p2    # "value":Ljava/lang/Object;
    :cond_1
    const-string v0, "connectTimeoutMillis"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 48
    invoke-static {p2}, Lorg/jboss/netty/util/internal/ConversionUtil;->toInt(Ljava/lang/Object;)I

    move-result v0

    invoke-virtual {p0, v0}, Lorg/jboss/netty/channel/DefaultChannelConfig;->setConnectTimeoutMillis(I)V

    goto :goto_0

    .line 49
    :cond_2
    const-string v0, "bufferFactory"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 50
    check-cast p2, Lorg/jboss/netty/buffer/ChannelBufferFactory;

    .end local p2    # "value":Ljava/lang/Object;
    invoke-virtual {p0, p2}, Lorg/jboss/netty/channel/DefaultChannelConfig;->setBufferFactory(Lorg/jboss/netty/buffer/ChannelBufferFactory;)V

    goto :goto_0

    .line 52
    .restart local p2    # "value":Ljava/lang/Object;
    :cond_3
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
    .line 35
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

    .line 36
    .local v0, "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {p0, v2, v3}, Lorg/jboss/netty/channel/DefaultChannelConfig;->setOption(Ljava/lang/String;Ljava/lang/Object;)Z

    goto :goto_0

    .line 38
    .end local v0    # "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_0
    return-void
.end method

.method public setPipelineFactory(Lorg/jboss/netty/channel/ChannelPipelineFactory;)V
    .locals 0
    .param p1, "pipelineFactory"    # Lorg/jboss/netty/channel/ChannelPipelineFactory;

    .prologue
    .line 85
    return-void
.end method
