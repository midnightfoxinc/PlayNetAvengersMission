.class Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler$ReopenReadTimerTask;
.super Ljava/lang/Object;
.source "AbstractTrafficShapingHandler.java"

# interfaces
.implements Lorg/jboss/netty/util/TimerTask;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "ReopenReadTimerTask"
.end annotation


# instance fields
.field final ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

.field final synthetic this$0:Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;


# direct methods
.method constructor <init>(Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;Lorg/jboss/netty/channel/ChannelHandlerContext;)V
    .locals 0
    .param p2, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;

    .prologue
    .line 616
    iput-object p1, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler$ReopenReadTimerTask;->this$0:Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 617
    iput-object p2, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler$ReopenReadTimerTask;->ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

    .line 618
    return-void
.end method


# virtual methods
.method public run(Lorg/jboss/netty/util/Timeout;)V
    .locals 6
    .param p1, "timeoutArg"    # Lorg/jboss/netty/util/Timeout;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 621
    iget-object v2, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler$ReopenReadTimerTask;->this$0:Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;

    iget-object v2, v2, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->release:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 656
    :cond_0
    :goto_0
    return-void

    .line 624
    :cond_1
    iget-object v2, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler$ReopenReadTimerTask;->ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

    invoke-static {v2}, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->checkAttachment(Lorg/jboss/netty/channel/ChannelHandlerContext;)Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler$ReadWriteStatus;

    move-result-object v1

    .line 625
    .local v1, "rws":Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler$ReadWriteStatus;
    iget-object v2, p0, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler$ReopenReadTimerTask;->ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

    invoke-interface {v2}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v0

    .line 626
    .local v0, "channel":Lorg/jboss/netty/channel/Channel;
    invoke-interface {v0}, Lorg/jboss/netty/channel/Channel;->isConnected()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 630
    invoke-interface {v0}, Lorg/jboss/netty/channel/Channel;->isReadable()Z

    move-result v2

    if-nez v2, :cond_3

    iget-boolean v2, v1, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler$ReadWriteStatus;->readSuspend:Z

    if-nez v2, :cond_3

    .line 633
    sget-object v2, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->logger:Lorg/jboss/netty/logging/InternalLogger;

    invoke-interface {v2}, Lorg/jboss/netty/logging/InternalLogger;->isDebugEnabled()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 634
    sget-object v2, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->logger:Lorg/jboss/netty/logging/InternalLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Not unsuspend: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-interface {v0}, Lorg/jboss/netty/channel/Channel;->isReadable()Z

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ":"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-boolean v4, v1, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler$ReadWriteStatus;->readSuspend:Z

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lorg/jboss/netty/logging/InternalLogger;->debug(Ljava/lang/String;)V

    .line 637
    :cond_2
    iput-boolean v5, v1, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler$ReadWriteStatus;->readSuspend:Z

    .line 652
    :goto_1
    sget-object v2, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->logger:Lorg/jboss/netty/logging/InternalLogger;

    invoke-interface {v2}, Lorg/jboss/netty/logging/InternalLogger;->isDebugEnabled()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 653
    sget-object v2, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->logger:Lorg/jboss/netty/logging/InternalLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unsupsend final status => "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-interface {v0}, Lorg/jboss/netty/channel/Channel;->isReadable()Z

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ":"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-boolean v4, v1, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler$ReadWriteStatus;->readSuspend:Z

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lorg/jboss/netty/logging/InternalLogger;->debug(Ljava/lang/String;)V

    goto :goto_0

    .line 640
    :cond_3
    sget-object v2, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->logger:Lorg/jboss/netty/logging/InternalLogger;

    invoke-interface {v2}, Lorg/jboss/netty/logging/InternalLogger;->isDebugEnabled()Z

    move-result v2

    if-eqz v2, :cond_4

    .line 641
    invoke-interface {v0}, Lorg/jboss/netty/channel/Channel;->isReadable()Z

    move-result v2

    if-eqz v2, :cond_5

    iget-boolean v2, v1, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler$ReadWriteStatus;->readSuspend:Z

    if-eqz v2, :cond_5

    .line 642
    sget-object v2, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->logger:Lorg/jboss/netty/logging/InternalLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unsuspend: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-interface {v0}, Lorg/jboss/netty/channel/Channel;->isReadable()Z

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ":"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-boolean v4, v1, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler$ReadWriteStatus;->readSuspend:Z

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lorg/jboss/netty/logging/InternalLogger;->debug(Ljava/lang/String;)V

    .line 649
    :cond_4
    :goto_2
    iput-boolean v5, v1, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler$ReadWriteStatus;->readSuspend:Z

    .line 650
    const/4 v2, 0x1

    invoke-interface {v0, v2}, Lorg/jboss/netty/channel/Channel;->setReadable(Z)Lorg/jboss/netty/channel/ChannelFuture;

    goto :goto_1

    .line 645
    :cond_5
    sget-object v2, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->logger:Lorg/jboss/netty/logging/InternalLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Normal unsuspend: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-interface {v0}, Lorg/jboss/netty/channel/Channel;->isReadable()Z

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ":"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-boolean v4, v1, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler$ReadWriteStatus;->readSuspend:Z

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lorg/jboss/netty/logging/InternalLogger;->debug(Ljava/lang/String;)V

    goto :goto_2
.end method
