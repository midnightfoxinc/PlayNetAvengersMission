.class final Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler$ToSend;
.super Ljava/lang/Object;
.source "ChannelTrafficShapingHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "ToSend"
.end annotation


# instance fields
.field final relativeTimeAction:J

.field final toSend:Lorg/jboss/netty/channel/MessageEvent;


# direct methods
.method private constructor <init>(JLorg/jboss/netty/channel/MessageEvent;)V
    .locals 1
    .param p1, "delay"    # J
    .param p3, "toSend"    # Lorg/jboss/netty/channel/MessageEvent;

    .prologue
    .line 146
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 147
    iput-wide p1, p0, Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler$ToSend;->relativeTimeAction:J

    .line 148
    iput-object p3, p0, Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler$ToSend;->toSend:Lorg/jboss/netty/channel/MessageEvent;

    .line 149
    return-void
.end method

.method synthetic constructor <init>(JLorg/jboss/netty/channel/MessageEvent;Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler$1;)V
    .locals 1
    .param p1, "x0"    # J
    .param p3, "x1"    # Lorg/jboss/netty/channel/MessageEvent;
    .param p4, "x2"    # Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler$1;

    .prologue
    .line 142
    invoke-direct {p0, p1, p2, p3}, Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler$ToSend;-><init>(JLorg/jboss/netty/channel/MessageEvent;)V

    return-void
.end method
