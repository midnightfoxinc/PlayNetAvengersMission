.class Lorg/jboss/netty/handler/queue/BufferedWriteHandler$1;
.super Ljava/lang/Object;
.source "BufferedWriteHandler.java"

# interfaces
.implements Lorg/jboss/netty/channel/ChannelFutureListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/jboss/netty/handler/queue/BufferedWriteHandler;->consolidatedWrite(Ljava/util/List;)Ljava/util/List;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/jboss/netty/handler/queue/BufferedWriteHandler;

.field final synthetic val$pendingWrites:Ljava/util/List;


# direct methods
.method constructor <init>(Lorg/jboss/netty/handler/queue/BufferedWriteHandler;Ljava/util/List;)V
    .locals 0

    .prologue
    .line 311
    iput-object p1, p0, Lorg/jboss/netty/handler/queue/BufferedWriteHandler$1;->this$0:Lorg/jboss/netty/handler/queue/BufferedWriteHandler;

    iput-object p2, p0, Lorg/jboss/netty/handler/queue/BufferedWriteHandler$1;->val$pendingWrites:Ljava/util/List;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public operationComplete(Lorg/jboss/netty/channel/ChannelFuture;)V
    .locals 4
    .param p1, "future"    # Lorg/jboss/netty/channel/ChannelFuture;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 314
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelFuture;->isSuccess()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 315
    iget-object v3, p0, Lorg/jboss/netty/handler/queue/BufferedWriteHandler$1;->val$pendingWrites:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jboss/netty/channel/MessageEvent;

    .line 316
    .local v1, "e":Lorg/jboss/netty/channel/MessageEvent;
    invoke-interface {v1}, Lorg/jboss/netty/channel/MessageEvent;->getFuture()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v3

    invoke-interface {v3}, Lorg/jboss/netty/channel/ChannelFuture;->setSuccess()Z

    goto :goto_0

    .line 319
    .end local v1    # "e":Lorg/jboss/netty/channel/MessageEvent;
    .end local v2    # "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelFuture;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    .line 320
    .local v0, "cause":Ljava/lang/Throwable;
    iget-object v3, p0, Lorg/jboss/netty/handler/queue/BufferedWriteHandler$1;->val$pendingWrites:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .restart local v2    # "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jboss/netty/channel/MessageEvent;

    .line 321
    .restart local v1    # "e":Lorg/jboss/netty/channel/MessageEvent;
    invoke-interface {v1}, Lorg/jboss/netty/channel/MessageEvent;->getFuture()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v3

    invoke-interface {v3, v0}, Lorg/jboss/netty/channel/ChannelFuture;->setFailure(Ljava/lang/Throwable;)Z

    goto :goto_1

    .line 324
    .end local v0    # "cause":Ljava/lang/Throwable;
    .end local v1    # "e":Lorg/jboss/netty/channel/MessageEvent;
    :cond_1
    return-void
.end method
