.class public Lcom/ning/http/client/providers/netty/channel/pool/NoopChannelPool;
.super Ljava/lang/Object;
.source "NoopChannelPool.java"

# interfaces
.implements Lcom/ning/http/client/providers/netty/channel/pool/ChannelPool;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public destroy()V
    .locals 0

    .prologue
    .line 42
    return-void
.end method

.method public flushPartition(Ljava/lang/String;)V
    .locals 0
    .param p1, "partitionId"    # Ljava/lang/String;

    .prologue
    .line 46
    return-void
.end method

.method public flushPartitions(Lcom/ning/http/client/providers/netty/channel/pool/ChannelPoolPartitionSelector;)V
    .locals 0
    .param p1, "selector"    # Lcom/ning/http/client/providers/netty/channel/pool/ChannelPoolPartitionSelector;

    .prologue
    .line 50
    return-void
.end method

.method public isOpen()Z
    .locals 1

    .prologue
    .line 37
    const/4 v0, 0x1

    return v0
.end method

.method public offer(Lorg/jboss/netty/channel/Channel;Ljava/lang/String;)Z
    .locals 1
    .param p1, "connection"    # Lorg/jboss/netty/channel/Channel;
    .param p2, "partition"    # Ljava/lang/String;

    .prologue
    .line 22
    const/4 v0, 0x0

    return v0
.end method

.method public poll(Ljava/lang/String;)Lorg/jboss/netty/channel/Channel;
    .locals 1
    .param p1, "uri"    # Ljava/lang/String;

    .prologue
    .line 27
    const/4 v0, 0x0

    return-object v0
.end method

.method public removeAll(Lorg/jboss/netty/channel/Channel;)Z
    .locals 1
    .param p1, "connection"    # Lorg/jboss/netty/channel/Channel;

    .prologue
    .line 32
    const/4 v0, 0x0

    return v0
.end method
