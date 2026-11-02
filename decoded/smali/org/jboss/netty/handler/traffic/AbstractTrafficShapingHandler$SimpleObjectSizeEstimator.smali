.class public Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler$SimpleObjectSizeEstimator;
.super Lorg/jboss/netty/util/DefaultObjectSizeEstimator;
.source "AbstractTrafficShapingHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SimpleObjectSizeEstimator"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 161
    invoke-direct {p0}, Lorg/jboss/netty/util/DefaultObjectSizeEstimator;-><init>()V

    return-void
.end method


# virtual methods
.method public estimateSize(Ljava/lang/Object;)I
    .locals 2
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 165
    instance-of v1, p1, Lorg/jboss/netty/buffer/ChannelBuffer;

    if-eqz v1, :cond_0

    .line 166
    check-cast p1, Lorg/jboss/netty/buffer/ChannelBuffer;

    .end local p1    # "o":Ljava/lang/Object;
    invoke-interface {p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v0

    .line 170
    .local v0, "size":I
    :goto_0
    return v0

    .line 168
    .end local v0    # "size":I
    .restart local p1    # "o":Ljava/lang/Object;
    :cond_0
    invoke-super {p0, p1}, Lorg/jboss/netty/util/DefaultObjectSizeEstimator;->estimateSize(Ljava/lang/Object;)I

    move-result v0

    .restart local v0    # "size":I
    goto :goto_0
.end method
