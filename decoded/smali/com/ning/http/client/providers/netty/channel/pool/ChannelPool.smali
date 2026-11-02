.class public interface abstract Lcom/ning/http/client/providers/netty/channel/pool/ChannelPool;
.super Ljava/lang/Object;
.source "ChannelPool.java"


# virtual methods
.method public abstract destroy()V
.end method

.method public abstract flushPartition(Ljava/lang/String;)V
.end method

.method public abstract flushPartitions(Lcom/ning/http/client/providers/netty/channel/pool/ChannelPoolPartitionSelector;)V
.end method

.method public abstract isOpen()Z
.end method

.method public abstract offer(Lorg/jboss/netty/channel/Channel;Ljava/lang/String;)Z
.end method

.method public abstract poll(Ljava/lang/String;)Lorg/jboss/netty/channel/Channel;
.end method

.method public abstract removeAll(Lorg/jboss/netty/channel/Channel;)Z
.end method
