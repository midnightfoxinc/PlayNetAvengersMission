.class Lorg/jboss/netty/handler/execution/OrderedDownstreamThreadPoolExecutor$1;
.super Ljava/lang/Object;
.source "OrderedDownstreamThreadPoolExecutor.java"

# interfaces
.implements Lorg/jboss/netty/channel/ChannelFutureListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/jboss/netty/handler/execution/OrderedDownstreamThreadPoolExecutor;->getChildExecutor(Lorg/jboss/netty/channel/ChannelEvent;)Ljava/util/concurrent/Executor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/jboss/netty/handler/execution/OrderedDownstreamThreadPoolExecutor;

.field final synthetic val$key:Ljava/lang/Object;


# direct methods
.method constructor <init>(Lorg/jboss/netty/handler/execution/OrderedDownstreamThreadPoolExecutor;Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 147
    iput-object p1, p0, Lorg/jboss/netty/handler/execution/OrderedDownstreamThreadPoolExecutor$1;->this$0:Lorg/jboss/netty/handler/execution/OrderedDownstreamThreadPoolExecutor;

    iput-object p2, p0, Lorg/jboss/netty/handler/execution/OrderedDownstreamThreadPoolExecutor$1;->val$key:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public operationComplete(Lorg/jboss/netty/channel/ChannelFuture;)V
    .locals 2
    .param p1, "future"    # Lorg/jboss/netty/channel/ChannelFuture;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 150
    iget-object v0, p0, Lorg/jboss/netty/handler/execution/OrderedDownstreamThreadPoolExecutor$1;->this$0:Lorg/jboss/netty/handler/execution/OrderedDownstreamThreadPoolExecutor;

    iget-object v1, p0, Lorg/jboss/netty/handler/execution/OrderedDownstreamThreadPoolExecutor$1;->val$key:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Lorg/jboss/netty/handler/execution/OrderedDownstreamThreadPoolExecutor;->removeChildExecutor(Ljava/lang/Object;)Z

    .line 151
    return-void
.end method
