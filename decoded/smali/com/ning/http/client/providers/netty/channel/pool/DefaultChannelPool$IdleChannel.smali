.class final Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannel;
.super Ljava/lang/Object;
.source "DefaultChannelPool.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "IdleChannel"
.end annotation


# instance fields
.field final channel:Lorg/jboss/netty/channel/Channel;

.field final start:J


# direct methods
.method constructor <init>(Lorg/jboss/netty/channel/Channel;J)V
    .locals 2
    .param p1, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p2, "start"    # J

    .prologue
    .line 101
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 102
    if-nez p1, :cond_0

    .line 103
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "channel"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 104
    :cond_0
    iput-object p1, p0, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannel;->channel:Lorg/jboss/netty/channel/Channel;

    .line 105
    iput-wide p2, p0, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannel;->start:J

    .line 106
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 2
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 111
    if-eq p0, p1, :cond_0

    instance-of v0, p1, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannel;

    if-eqz v0, :cond_1

    iget-object v1, p0, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannel;->channel:Lorg/jboss/netty/channel/Channel;

    const-class v0, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannel;

    invoke-virtual {v0, p1}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannel;

    iget-object v0, v0, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannel;->channel:Lorg/jboss/netty/channel/Channel;

    invoke-virtual {v1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 116
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannel;->channel:Lorg/jboss/netty/channel/Channel;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    return v0
.end method
