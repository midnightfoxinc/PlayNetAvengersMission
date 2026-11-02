.class Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$1$1;
.super Ljava/lang/Object;
.source "GlobalChannelTrafficShapingHandler.java"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$1;->iterator()Ljava/util/Iterator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Iterator",
        "<",
        "Lorg/jboss/netty/handler/traffic/TrafficCounter;",
        ">;"
    }
.end annotation


# instance fields
.field final iter:Ljava/util/Iterator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Iterator",
            "<",
            "Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$1:Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$1;


# direct methods
.method constructor <init>(Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$1;)V
    .locals 1

    .prologue
    .line 720
    iput-object p1, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$1$1;->this$1:Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 721
    iget-object v0, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$1$1;->this$1:Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$1;

    iget-object v0, v0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$1;->this$0:Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;

    iget-object v0, v0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->channelQueues:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v0}, Ljava/util/concurrent/ConcurrentMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    iput-object v0, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$1$1;->iter:Ljava/util/Iterator;

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .locals 1

    .prologue
    .line 723
    iget-object v0, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$1$1;->iter:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    return v0
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 720
    invoke-virtual {p0}, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$1$1;->next()Lorg/jboss/netty/handler/traffic/TrafficCounter;

    move-result-object v0

    return-object v0
.end method

.method public next()Lorg/jboss/netty/handler/traffic/TrafficCounter;
    .locals 1

    .prologue
    .line 726
    iget-object v0, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$1$1;->iter:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;

    iget-object v0, v0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;->channelTrafficCounter:Lorg/jboss/netty/handler/traffic/TrafficCounter;

    return-object v0
.end method

.method public remove()V
    .locals 1

    .prologue
    .line 729
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method
