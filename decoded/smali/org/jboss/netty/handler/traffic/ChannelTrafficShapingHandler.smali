.class public Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler;
.super Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;
.source "ChannelTrafficShapingHandler.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler$ToSend;
    }
.end annotation


# instance fields
.field private volatile ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

.field private final messagesQueue:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler$ToSend;",
            ">;"
        }
    .end annotation
.end field

.field private queueSize:J

.field private volatile writeTimeout:Lorg/jboss/netty/util/Timeout;


# direct methods
.method public constructor <init>(Lorg/jboss/netty/util/ObjectSizeEstimator;Lorg/jboss/netty/util/Timer;)V
    .locals 1
    .param p1, "objectSizeEstimator"    # Lorg/jboss/netty/util/ObjectSizeEstimator;
    .param p2, "timer"    # Lorg/jboss/netty/util/Timer;

    .prologue
    .line 139
    invoke-direct {p0, p1, p2}, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;-><init>(Lorg/jboss/netty/util/ObjectSizeEstimator;Lorg/jboss/netty/util/Timer;)V

    .line 83
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler;->messagesQueue:Ljava/util/List;

    .line 140
    return-void
.end method

.method public constructor <init>(Lorg/jboss/netty/util/ObjectSizeEstimator;Lorg/jboss/netty/util/Timer;J)V
    .locals 1
    .param p1, "objectSizeEstimator"    # Lorg/jboss/netty/util/ObjectSizeEstimator;
    .param p2, "timer"    # Lorg/jboss/netty/util/Timer;
    .param p3, "checkInterval"    # J

    .prologue
    .line 134
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;-><init>(Lorg/jboss/netty/util/ObjectSizeEstimator;Lorg/jboss/netty/util/Timer;J)V

    .line 83
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler;->messagesQueue:Ljava/util/List;

    .line 135
    return-void
.end method

.method public constructor <init>(Lorg/jboss/netty/util/ObjectSizeEstimator;Lorg/jboss/netty/util/Timer;JJ)V
    .locals 1
    .param p1, "objectSizeEstimator"    # Lorg/jboss/netty/util/ObjectSizeEstimator;
    .param p2, "timer"    # Lorg/jboss/netty/util/Timer;
    .param p3, "writeLimit"    # J
    .param p5, "readLimit"    # J

    .prologue
    .line 128
    invoke-direct/range {p0 .. p6}, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;-><init>(Lorg/jboss/netty/util/ObjectSizeEstimator;Lorg/jboss/netty/util/Timer;JJ)V

    .line 83
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler;->messagesQueue:Ljava/util/List;

    .line 129
    return-void
.end method

.method public constructor <init>(Lorg/jboss/netty/util/ObjectSizeEstimator;Lorg/jboss/netty/util/Timer;JJJ)V
    .locals 1
    .param p1, "objectSizeEstimator"    # Lorg/jboss/netty/util/ObjectSizeEstimator;
    .param p2, "timer"    # Lorg/jboss/netty/util/Timer;
    .param p3, "writeLimit"    # J
    .param p5, "readLimit"    # J
    .param p7, "checkInterval"    # J

    .prologue
    .line 114
    invoke-direct/range {p0 .. p8}, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;-><init>(Lorg/jboss/netty/util/ObjectSizeEstimator;Lorg/jboss/netty/util/Timer;JJJ)V

    .line 83
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler;->messagesQueue:Ljava/util/List;

    .line 116
    return-void
.end method

.method public constructor <init>(Lorg/jboss/netty/util/ObjectSizeEstimator;Lorg/jboss/netty/util/Timer;JJJJ)V
    .locals 1
    .param p1, "objectSizeEstimator"    # Lorg/jboss/netty/util/ObjectSizeEstimator;
    .param p2, "timer"    # Lorg/jboss/netty/util/Timer;
    .param p3, "writeLimit"    # J
    .param p5, "readLimit"    # J
    .param p7, "checkInterval"    # J
    .param p9, "maxTime"    # J

    .prologue
    .line 121
    invoke-direct/range {p0 .. p10}, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;-><init>(Lorg/jboss/netty/util/ObjectSizeEstimator;Lorg/jboss/netty/util/Timer;JJJJ)V

    .line 83
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler;->messagesQueue:Ljava/util/List;

    .line 123
    return-void
.end method

.method public constructor <init>(Lorg/jboss/netty/util/Timer;)V
    .locals 1
    .param p1, "timer"    # Lorg/jboss/netty/util/Timer;

    .prologue
    .line 108
    invoke-direct {p0, p1}, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;-><init>(Lorg/jboss/netty/util/Timer;)V

    .line 83
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler;->messagesQueue:Ljava/util/List;

    .line 109
    return-void
.end method

.method public constructor <init>(Lorg/jboss/netty/util/Timer;J)V
    .locals 2
    .param p1, "timer"    # Lorg/jboss/netty/util/Timer;
    .param p2, "checkInterval"    # J

    .prologue
    .line 104
    invoke-direct {p0, p1, p2, p3}, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;-><init>(Lorg/jboss/netty/util/Timer;J)V

    .line 83
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler;->messagesQueue:Ljava/util/List;

    .line 105
    return-void
.end method

.method public constructor <init>(Lorg/jboss/netty/util/Timer;JJ)V
    .locals 2
    .param p1, "timer"    # Lorg/jboss/netty/util/Timer;
    .param p2, "writeLimit"    # J
    .param p4, "readLimit"    # J

    .prologue
    .line 100
    invoke-direct/range {p0 .. p5}, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;-><init>(Lorg/jboss/netty/util/Timer;JJ)V

    .line 83
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler;->messagesQueue:Ljava/util/List;

    .line 101
    return-void
.end method

.method public constructor <init>(Lorg/jboss/netty/util/Timer;JJJ)V
    .locals 2
    .param p1, "timer"    # Lorg/jboss/netty/util/Timer;
    .param p2, "writeLimit"    # J
    .param p4, "readLimit"    # J
    .param p6, "checkInterval"    # J

    .prologue
    .line 90
    invoke-direct/range {p0 .. p7}, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;-><init>(Lorg/jboss/netty/util/Timer;JJJ)V

    .line 83
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler;->messagesQueue:Ljava/util/List;

    .line 91
    return-void
.end method

.method public constructor <init>(Lorg/jboss/netty/util/Timer;JJJJ)V
    .locals 2
    .param p1, "timer"    # Lorg/jboss/netty/util/Timer;
    .param p2, "writeLimit"    # J
    .param p4, "readLimit"    # J
    .param p6, "checkInterval"    # J
    .param p8, "maxTime"    # J

    .prologue
    .line 95
    invoke-direct/range {p0 .. p9}, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;-><init>(Lorg/jboss/netty/util/Timer;JJJJ)V

    .line 83
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler;->messagesQueue:Ljava/util/List;

    .line 96
    return-void
.end method

.method static synthetic access$100(Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler;Lorg/jboss/netty/channel/ChannelHandlerContext;J)V
    .locals 0
    .param p0, "x0"    # Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler;
    .param p1, "x1"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "x2"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 82
    invoke-direct {p0, p1, p2, p3}, Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler;->sendAllValid(Lorg/jboss/netty/channel/ChannelHandlerContext;J)V

    return-void
.end method

.method private sendAllValid(Lorg/jboss/netty/channel/ChannelHandlerContext;J)V
    .locals 6
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "now"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 203
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v0

    .line 204
    .local v0, "channel":Lorg/jboss/netty/channel/Channel;
    invoke-interface {v0}, Lorg/jboss/netty/channel/Channel;->isConnected()Z

    move-result v4

    if-nez v4, :cond_0

    .line 231
    :goto_0
    return-void

    .line 208
    :cond_0
    monitor-enter p0

    .line 209
    :goto_1
    :try_start_0
    iget-object v4, p0, Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler;->messagesQueue:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_2

    .line 210
    iget-object v4, p0, Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler;->messagesQueue:Ljava/util/List;

    const/4 v5, 0x0

    invoke-interface {v4, v5}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler$ToSend;

    .line 211
    .local v1, "newToSend":Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler$ToSend;
    iget-wide v4, v1, Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler$ToSend;->relativeTimeAction:J

    cmp-long v4, v4, p2

    if-gtz v4, :cond_5

    .line 212
    iget-object v4, v1, Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler$ToSend;->toSend:Lorg/jboss/netty/channel/MessageEvent;

    invoke-interface {v4}, Lorg/jboss/netty/channel/MessageEvent;->getMessage()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {p0, v4}, Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler;->calculateSize(Ljava/lang/Object;)J

    move-result-wide v2

    .line 213
    .local v2, "size":J
    iget-object v4, p0, Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler;->trafficCounter:Lorg/jboss/netty/handler/traffic/TrafficCounter;

    if-eqz v4, :cond_1

    .line 214
    iget-object v4, p0, Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler;->trafficCounter:Lorg/jboss/netty/handler/traffic/TrafficCounter;

    invoke-virtual {v4, v2, v3}, Lorg/jboss/netty/handler/traffic/TrafficCounter;->bytesRealWriteFlowControl(J)V

    .line 216
    :cond_1
    iget-wide v4, p0, Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler;->queueSize:J

    sub-long/2addr v4, v2

    iput-wide v4, p0, Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler;->queueSize:J

    .line 217
    invoke-interface {v0}, Lorg/jboss/netty/channel/Channel;->isConnected()Z

    move-result v4

    if-nez v4, :cond_4

    .line 227
    .end local v1    # "newToSend":Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler$ToSend;
    .end local v2    # "size":J
    :cond_2
    :goto_2
    iget-object v4, p0, Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler;->messagesQueue:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_3

    .line 228
    invoke-virtual {p0, p1}, Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler;->releaseWriteSuspended(Lorg/jboss/netty/channel/ChannelHandlerContext;)V

    .line 230
    :cond_3
    monitor-exit p0

    goto :goto_0

    :catchall_0
    move-exception v4

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v4

    .line 221
    .restart local v1    # "newToSend":Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler$ToSend;
    .restart local v2    # "size":J
    :cond_4
    :try_start_1
    iget-object v4, v1, Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler$ToSend;->toSend:Lorg/jboss/netty/channel/MessageEvent;

    invoke-interface {p1, v4}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendDownstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    goto :goto_1

    .line 223
    .end local v2    # "size":J
    :cond_5
    iget-object v4, p0, Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler;->messagesQueue:Ljava/util/List;

    const/4 v5, 0x0

    invoke-interface {v4, v5, v1}, Ljava/util/List;->add(ILjava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_2
.end method


# virtual methods
.method public channelClosed(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelStateEvent;)V
    .locals 1
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "e"    # Lorg/jboss/netty/channel/ChannelStateEvent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 243
    iget-object v0, p0, Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler;->trafficCounter:Lorg/jboss/netty/handler/traffic/TrafficCounter;

    if-eqz v0, :cond_0

    .line 244
    iget-object v0, p0, Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler;->trafficCounter:Lorg/jboss/netty/handler/traffic/TrafficCounter;

    invoke-virtual {v0}, Lorg/jboss/netty/handler/traffic/TrafficCounter;->stop()V

    .line 246
    :cond_0
    monitor-enter p0

    .line 247
    :try_start_0
    iget-object v0, p0, Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler;->messagesQueue:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 248
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 249
    iget-object v0, p0, Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler;->writeTimeout:Lorg/jboss/netty/util/Timeout;

    if-eqz v0, :cond_1

    .line 250
    iget-object v0, p0, Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler;->writeTimeout:Lorg/jboss/netty/util/Timeout;

    invoke-interface {v0}, Lorg/jboss/netty/util/Timeout;->cancel()V

    .line 252
    :cond_1
    invoke-super {p0, p1, p2}, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->channelClosed(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelStateEvent;)V

    .line 253
    return-void

    .line 248
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public channelConnected(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelStateEvent;)V
    .locals 9
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "e"    # Lorg/jboss/netty/channel/ChannelStateEvent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v8, 0x1

    const/4 v7, 0x0

    .line 258
    iput-object p1, p0, Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler;->ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

    .line 260
    invoke-static {p1}, Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler;->checkAttachment(Lorg/jboss/netty/channel/ChannelHandlerContext;)Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler$ReadWriteStatus;

    move-result-object v6

    .line 261
    .local v6, "rws":Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler$ReadWriteStatus;
    iput-boolean v8, v6, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler$ReadWriteStatus;->readSuspend:Z

    .line 262
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v0

    invoke-interface {v0, v7}, Lorg/jboss/netty/channel/Channel;->setReadable(Z)Lorg/jboss/netty/channel/ChannelFuture;

    .line 263
    iget-object v0, p0, Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler;->trafficCounter:Lorg/jboss/netty/handler/traffic/TrafficCounter;

    if-nez v0, :cond_0

    .line 265
    iget-object v0, p0, Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler;->timer:Lorg/jboss/netty/util/Timer;

    if-eqz v0, :cond_0

    .line 266
    new-instance v0, Lorg/jboss/netty/handler/traffic/TrafficCounter;

    iget-object v2, p0, Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler;->timer:Lorg/jboss/netty/util/Timer;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "ChannelTC"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v3

    invoke-interface {v3}, Lorg/jboss/netty/channel/Channel;->getId()Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    iget-wide v4, p0, Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler;->checkInterval:J

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lorg/jboss/netty/handler/traffic/TrafficCounter;-><init>(Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;Lorg/jboss/netty/util/Timer;Ljava/lang/String;J)V

    iput-object v0, p0, Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler;->trafficCounter:Lorg/jboss/netty/handler/traffic/TrafficCounter;

    .line 270
    :cond_0
    iget-object v0, p0, Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler;->trafficCounter:Lorg/jboss/netty/handler/traffic/TrafficCounter;

    if-eqz v0, :cond_1

    .line 271
    iget-object v0, p0, Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler;->trafficCounter:Lorg/jboss/netty/handler/traffic/TrafficCounter;

    invoke-virtual {v0}, Lorg/jboss/netty/handler/traffic/TrafficCounter;->start()V

    .line 273
    :cond_1
    iput-boolean v7, v6, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler$ReadWriteStatus;->readSuspend:Z

    .line 274
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v0

    invoke-interface {v0, v8}, Lorg/jboss/netty/channel/Channel;->setReadable(Z)Lorg/jboss/netty/channel/ChannelFuture;

    .line 275
    invoke-super {p0, p1, p2}, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->channelConnected(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelStateEvent;)V

    .line 276
    return-void
.end method

.method public queueSize()J
    .locals 2

    .prologue
    .line 237
    iget-wide v0, p0, Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler;->queueSize:J

    return-wide v0
.end method

.method public releaseExternalResources()V
    .locals 5

    .prologue
    .line 280
    iget-object v3, p0, Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler;->ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

    invoke-interface {v3}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v0

    .line 281
    .local v0, "channel":Lorg/jboss/netty/channel/Channel;
    monitor-enter p0

    .line 282
    :try_start_0
    iget-object v3, p0, Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler;->ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

    if-eqz v3, :cond_0

    iget-object v3, p0, Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler;->ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

    invoke-interface {v3}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v3

    invoke-interface {v3}, Lorg/jboss/netty/channel/Channel;->isConnected()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 283
    iget-object v3, p0, Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler;->messagesQueue:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler$ToSend;

    .line 284
    .local v2, "toSend":Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler$ToSend;
    invoke-interface {v0}, Lorg/jboss/netty/channel/Channel;->isConnected()Z

    move-result v3

    if-nez v3, :cond_2

    .line 291
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v2    # "toSend":Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler$ToSend;
    :cond_0
    iget-object v3, p0, Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler;->messagesQueue:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->clear()V

    .line 292
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 293
    iget-object v3, p0, Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler;->writeTimeout:Lorg/jboss/netty/util/Timeout;

    if-eqz v3, :cond_1

    .line 294
    iget-object v3, p0, Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler;->writeTimeout:Lorg/jboss/netty/util/Timeout;

    invoke-interface {v3}, Lorg/jboss/netty/util/Timeout;->cancel()V

    .line 296
    :cond_1
    invoke-super {p0}, Lorg/jboss/netty/handler/traffic/AbstractTrafficShapingHandler;->releaseExternalResources()V

    .line 297
    return-void

    .line 288
    .restart local v1    # "i$":Ljava/util/Iterator;
    .restart local v2    # "toSend":Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler$ToSend;
    :cond_2
    :try_start_1
    iget-object v3, p0, Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler;->ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

    iget-object v4, v2, Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler$ToSend;->toSend:Lorg/jboss/netty/channel/MessageEvent;

    invoke-interface {v3, v4}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendDownstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    goto :goto_0

    .line 292
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v2    # "toSend":Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler$ToSend;
    :catchall_0
    move-exception v3

    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v3
.end method

.method submitWrite(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/MessageEvent;JJJ)V
    .locals 11
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "evt"    # Lorg/jboss/netty/channel/MessageEvent;
    .param p3, "size"    # J
    .param p5, "delay"    # J
    .param p7, "now"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 155
    if-nez p1, :cond_0

    .line 156
    iput-object p1, p0, Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler;->ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

    .line 159
    :cond_0
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v6

    .line 160
    .local v6, "channel":Lorg/jboss/netty/channel/Channel;
    monitor-enter p0

    .line 161
    const-wide/16 v0, 0x0

    cmp-long v0, p5, v0

    if-nez v0, :cond_3

    :try_start_0
    iget-object v0, p0, Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler;->messagesQueue:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 162
    invoke-interface {v6}, Lorg/jboss/netty/channel/Channel;->isConnected()Z

    move-result v0

    if-nez v0, :cond_1

    .line 164
    monitor-exit p0

    .line 200
    :goto_0
    return-void

    .line 166
    :cond_1
    iget-object v0, p0, Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler;->trafficCounter:Lorg/jboss/netty/handler/traffic/TrafficCounter;

    if-eqz v0, :cond_2

    .line 167
    iget-object v0, p0, Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler;->trafficCounter:Lorg/jboss/netty/handler/traffic/TrafficCounter;

    invoke-virtual {v0, p3, p4}, Lorg/jboss/netty/handler/traffic/TrafficCounter;->bytesRealWriteFlowControl(J)V

    .line 169
    :cond_2
    invoke-interface {p1, p2}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendDownstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 170
    monitor-exit p0

    goto :goto_0

    .line 193
    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    .line 172
    :cond_3
    :try_start_1
    iget-object v0, p0, Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler;->timer:Lorg/jboss/netty/util/Timer;

    if-nez v0, :cond_6

    .line 174
    invoke-static/range {p5 .. p6}, Ljava/lang/Thread;->sleep(J)V

    .line 175
    invoke-interface {v6}, Lorg/jboss/netty/channel/Channel;->isConnected()Z

    move-result v0

    if-nez v0, :cond_4

    .line 177
    monitor-exit p0

    goto :goto_0

    .line 179
    :cond_4
    iget-object v0, p0, Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler;->trafficCounter:Lorg/jboss/netty/handler/traffic/TrafficCounter;

    if-eqz v0, :cond_5

    .line 180
    iget-object v0, p0, Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler;->trafficCounter:Lorg/jboss/netty/handler/traffic/TrafficCounter;

    invoke-virtual {v0, p3, p4}, Lorg/jboss/netty/handler/traffic/TrafficCounter;->bytesRealWriteFlowControl(J)V

    .line 182
    :cond_5
    invoke-interface {p1, p2}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendDownstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 183
    monitor-exit p0

    goto :goto_0

    .line 185
    :cond_6
    invoke-interface {v6}, Lorg/jboss/netty/channel/Channel;->isConnected()Z

    move-result v0

    if-nez v0, :cond_7

    .line 187
    monitor-exit p0

    goto :goto_0

    .line 189
    :cond_7
    new-instance v7, Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler$ToSend;

    add-long v0, p5, p7

    const/4 v2, 0x0

    invoke-direct {v7, v0, v1, p2, v2}, Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler$ToSend;-><init>(JLorg/jboss/netty/channel/MessageEvent;Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler$1;)V

    .line 190
    .local v7, "newToSend":Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler$ToSend;
    iget-object v0, p0, Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler;->messagesQueue:Ljava/util/List;

    invoke-interface {v0, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 191
    iget-wide v0, p0, Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler;->queueSize:J

    add-long/2addr v0, p3

    iput-wide v0, p0, Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler;->queueSize:J

    .line 192
    iget-wide v4, p0, Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler;->queueSize:J

    move-object v0, p0

    move-object v1, p1

    move-wide/from16 v2, p5

    invoke-virtual/range {v0 .. v5}, Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler;->checkWriteSuspend(Lorg/jboss/netty/channel/ChannelHandlerContext;JJ)V

    .line 193
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 194
    iget-wide v8, v7, Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler$ToSend;->relativeTimeAction:J

    .line 195
    .local v8, "futureNow":J
    iget-object v0, p0, Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler;->timer:Lorg/jboss/netty/util/Timer;

    new-instance v1, Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler$1;

    invoke-direct {v1, p0, p1, v8, v9}, Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler$1;-><init>(Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler;Lorg/jboss/netty/channel/ChannelHandlerContext;J)V

    const-wide/16 v2, 0x1

    add-long v2, v2, p5

    sget-object v4, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v0, v1, v2, v3, v4}, Lorg/jboss/netty/util/Timer;->newTimeout(Lorg/jboss/netty/util/TimerTask;JLjava/util/concurrent/TimeUnit;)Lorg/jboss/netty/util/Timeout;

    move-result-object v0

    iput-object v0, p0, Lorg/jboss/netty/handler/traffic/ChannelTrafficShapingHandler;->writeTimeout:Lorg/jboss/netty/util/Timeout;

    goto :goto_0
.end method
