.class final Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler$PerChannel;
.super Ljava/lang/Object;
.source "GlobalTrafficShapingHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "PerChannel"
.end annotation


# instance fields
.field ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

.field lastReadTimestamp:J

.field lastWriteTimestamp:J

.field messagesQueue:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler$ToSend;",
            ">;"
        }
    .end annotation
.end field

.field queueSize:J


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 91
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler$1;)V
    .locals 0
    .param p1, "x0"    # Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler$1;

    .prologue
    .line 91
    invoke-direct {p0}, Lorg/jboss/netty/handler/traffic/GlobalTrafficShapingHandler$PerChannel;-><init>()V

    return-void
.end method
