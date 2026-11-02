.class Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler$1;
.super Ljava/lang/Object;
.source "ChannelTrafficShapingHandler.java"

# interfaces
.implements Lorg/jboss/netty/util/TimerTask;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler;->submitWrite(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/MessageEvent;JJJ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler;

.field final synthetic val$ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

.field final synthetic val$futureNow:J


# direct methods
.method constructor <init>(Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler;Lorg/jboss/netty/channel/ChannelHandlerContext;J)V
    .locals 1

    .prologue
    .line 195
    iput-object p1, p0, Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler$1;->this$0:Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler;

    iput-object p2, p0, Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler$1;->val$ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

    iput-wide p3, p0, Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler$1;->val$futureNow:J

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run(Lorg/jboss/netty/util/Timeout;)V
    .locals 4
    .param p1, "timeout"    # Lorg/jboss/netty/util/Timeout;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 197
    iget-object v0, p0, Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler$1;->this$0:Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler;

    iget-object v1, p0, Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler$1;->val$ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

    iget-wide v2, p0, Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler$1;->val$futureNow:J

    invoke-static {v0, v1, v2, v3}, Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler;->access$100(Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler;Lorg/jboss/netty/channel/ChannelHandlerContext;J)V

    .line 198
    return-void
.end method
