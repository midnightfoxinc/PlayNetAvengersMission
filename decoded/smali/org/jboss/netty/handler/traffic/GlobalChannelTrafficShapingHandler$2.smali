.class Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$2;
.super Ljava/lang/Object;
.source "GlobalChannelTrafficShapingHandler.java"

# interfaces
.implements Lorg/jboss/netty/util/TimerTask;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->submitWrite(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/MessageEvent;JJJ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;

.field final synthetic val$ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

.field final synthetic val$forSchedule:Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;

.field final synthetic val$futureNow:J


# direct methods
.method constructor <init>(Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;J)V
    .locals 0

    .prologue
    .line 842
    iput-object p1, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$2;->this$0:Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;

    iput-object p2, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$2;->val$ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

    iput-object p3, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$2;->val$forSchedule:Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;

    iput-wide p4, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$2;->val$futureNow:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run(Lorg/jboss/netty/util/Timeout;)V
    .locals 6
    .param p1, "timeout"    # Lorg/jboss/netty/util/Timeout;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 844
    iget-object v0, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$2;->this$0:Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;

    iget-object v1, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$2;->val$ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

    iget-object v2, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$2;->val$forSchedule:Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;

    iget-wide v4, p0, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$2;->val$futureNow:J

    invoke-static {v0, v1, v2, v4, v5}, Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;->access$100(Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler;Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/handler/traffic/GlobalChannelTrafficShapingHandler$PerChannel;J)V

    .line 845
    return-void
.end method
