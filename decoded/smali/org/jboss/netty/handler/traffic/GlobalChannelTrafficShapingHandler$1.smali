.class Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$1;
.super Ljava/util/AbstractCollection;
.source "GlobalChannelTrafficShapingHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->channelTrafficCounters()Ljava/util/Collection;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/AbstractCollection",
        "<",
        "Lorg/jboss/netty/handler/traffic/TrafficCounter;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;


# direct methods
.method constructor <init>(Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;)V
    .locals 0

    .prologue
    .line 718
    iput-object p1, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$1;->this$0:Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;

    invoke-direct {p0}, Ljava/util/AbstractCollection;-><init>()V

    return-void
.end method


# virtual methods
.method public iterator()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Lorg/jboss/netty/handler/traffic/TrafficCounter;",
            ">;"
        }
    .end annotation

    .prologue
    .line 720
    new-instance v0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$1$1;

    invoke-direct {v0, p0}, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$1$1;-><init>(Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$1;)V

    return-object v0
.end method

.method public size()I
    .locals 1

    .prologue
    .line 734
    iget-object v0, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$1;->this$0:Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;

    iget-object v0, v0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->channelQueues:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v0}, Ljava/util/concurrent/ConcurrentMap;->size()I

    move-result v0

    return v0
.end method
