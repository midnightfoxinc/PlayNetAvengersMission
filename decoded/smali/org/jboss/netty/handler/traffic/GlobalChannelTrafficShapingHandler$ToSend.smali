.class final Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$ToSend;
.super Ljava/lang/Object;
.source "GlobalChannelTrafficShapingHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "ToSend"
.end annotation


# instance fields
.field final relativeTimeAction:J

.field final size:J

.field final toSend:Lorg/jboss/netty/channel/MessageEvent;


# direct methods
.method private constructor <init>(JLorg/jboss/netty/channel/MessageEvent;J)V
    .locals 0
    .param p1, "delay"    # J
    .param p3, "toSend"    # Lorg/jboss/netty/channel/MessageEvent;
    .param p4, "size"    # J

    .prologue
    .line 698
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 699
    iput-wide p1, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$ToSend;->relativeTimeAction:J

    .line 700
    iput-object p3, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$ToSend;->toSend:Lorg/jboss/netty/channel/MessageEvent;

    .line 701
    iput-wide p4, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$ToSend;->size:J

    .line 702
    return-void
.end method

.method synthetic constructor <init>(JLorg/jboss/netty/channel/MessageEvent;JLorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$1;)V
    .locals 0
    .param p1, "x0"    # J
    .param p3, "x1"    # Lorg/jboss/netty/channel/MessageEvent;
    .param p4, "x2"    # J
    .param p6, "x3"    # Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$1;

    .prologue
    .line 693
    invoke-direct/range {p0 .. p5}, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$ToSend;-><init>(JLorg/jboss/netty/channel/MessageEvent;J)V

    return-void
.end method
