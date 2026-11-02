.class final Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannelDetector;
.super Ljava/lang/Object;
.source "DefaultChannelPool.java"

# interfaces
.implements Lorg/jboss/netty/util/TimerTask;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "IdleChannelDetector"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;


# direct methods
.method private constructor <init>(Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;)V
    .locals 0

    .prologue
    .line 128
    iput-object p1, p0, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannelDetector;->this$0:Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;
    .param p2, "x1"    # Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$1;

    .prologue
    .line 128
    invoke-direct {p0, p1}, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannelDetector;-><init>(Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;)V

    return-void
.end method

.method private final closeChannels(Ljava/util/List;)Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannel;",
            ">;)",
            "Ljava/util/List",
            "<",
            "Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannel;",
            ">;"
        }
    .end annotation

    .prologue
    .line 165
    .local p1, "candidates":Ljava/util/List;, "Ljava/util/List<Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannel;>;"
    const/4 v0, 0x0

    .line 167
    .local v0, "closedChannels":Ljava/util/List;, "Ljava/util/List<Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannel;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v4

    if-ge v1, v4, :cond_2

    .line 168
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannel;

    .line 169
    .local v2, "idleChannel":Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannel;
    iget-object v4, v2, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannel;->channel:Lorg/jboss/netty/channel/Channel;

    invoke-direct {p0, v4}, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannelDetector;->isChannelCloseable(Lorg/jboss/netty/channel/Channel;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 170
    invoke-static {}, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;->access$400()Lorg/slf4j/Logger;

    move-result-object v4

    const-string v5, "Closing Idle Channel {}"

    iget-object v6, v2, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannel;->channel:Lorg/jboss/netty/channel/Channel;

    invoke-interface {v4, v5, v6}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;Ljava/lang/Object;)V

    .line 171
    iget-object v4, p0, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannelDetector;->this$0:Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;

    iget-object v5, v2, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannel;->channel:Lorg/jboss/netty/channel/Channel;

    invoke-static {v4, v5}, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;->access$500(Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;Lorg/jboss/netty/channel/Channel;)V

    .line 172
    if-eqz v0, :cond_0

    .line 173
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 167
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 176
    :cond_1
    if-nez v0, :cond_0

    .line 178
    new-instance v0, Ljava/util/ArrayList;

    .end local v0    # "closedChannels":Ljava/util/List;, "Ljava/util/List<Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannel;>;"
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v4

    invoke-direct {v0, v4}, Ljava/util/ArrayList;-><init>(I)V

    .line 179
    .restart local v0    # "closedChannels":Ljava/util/List;, "Ljava/util/List<Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannel;>;"
    const/4 v3, 0x0

    .local v3, "j":I
    :goto_1
    if-ge v3, v1, :cond_0

    .line 180
    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 179
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 184
    .end local v2    # "idleChannel":Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannel;
    .end local v3    # "j":I
    :cond_2
    if-eqz v0, :cond_3

    .end local v0    # "closedChannels":Ljava/util/List;, "Ljava/util/List<Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannel;>;"
    :goto_2
    return-object v0

    .restart local v0    # "closedChannels":Ljava/util/List;, "Ljava/util/List<Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannel;>;"
    :cond_3
    move-object v0, p1

    goto :goto_2
.end method

.method private expiredChannels(Ljava/util/concurrent/ConcurrentLinkedQueue;J)Ljava/util/List;
    .locals 6
    .param p2, "now"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/ConcurrentLinkedQueue",
            "<",
            "Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannel;",
            ">;J)",
            "Ljava/util/List",
            "<",
            "Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannel;",
            ">;"
        }
    .end annotation

    .prologue
    .line 136
    .local p1, "partition":Ljava/util/concurrent/ConcurrentLinkedQueue;, "Ljava/util/concurrent/ConcurrentLinkedQueue<Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannel;>;"
    const/4 v2, 0x0

    .line 137
    .local v2, "idleTimeoutChannels":Ljava/util/List;, "Ljava/util/List<Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannel;>;"
    invoke-virtual {p1}, Ljava/util/concurrent/ConcurrentLinkedQueue;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannel;

    .line 138
    .local v1, "idleChannel":Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannel;
    iget-object v3, p0, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannelDetector;->this$0:Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;

    iget-object v4, v1, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannel;->channel:Lorg/jboss/netty/channel/Channel;

    invoke-static {v3, v4, p2, p3}, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;->access$300(Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;Lorg/jboss/netty/channel/Channel;J)Z

    move-result v3

    if-nez v3, :cond_1

    invoke-direct {p0, v1, p2, p3}, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannelDetector;->isIdleTimeoutExpired(Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannel;J)Z

    move-result v3

    if-nez v3, :cond_1

    iget-object v3, v1, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannel;->channel:Lorg/jboss/netty/channel/Channel;

    invoke-static {v3}, Lcom/ning/http/client/providers/netty/channel/Channels;->isChannelValid(Lorg/jboss/netty/channel/Channel;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 140
    :cond_1
    invoke-static {}, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;->access$400()Lorg/slf4j/Logger;

    move-result-object v3

    const-string v4, "Adding Candidate expired Channel {}"

    iget-object v5, v1, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannel;->channel:Lorg/jboss/netty/channel/Channel;

    invoke-interface {v3, v4, v5}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;Ljava/lang/Object;)V

    .line 141
    if-nez v2, :cond_2

    .line 142
    new-instance v2, Ljava/util/ArrayList;

    .end local v2    # "idleTimeoutChannels":Ljava/util/List;, "Ljava/util/List<Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannel;>;"
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 143
    .restart local v2    # "idleTimeoutChannels":Ljava/util/List;, "Ljava/util/List<Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannel;>;"
    :cond_2
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 147
    .end local v1    # "idleChannel":Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannel;
    :cond_3
    if-eqz v2, :cond_4

    .end local v2    # "idleTimeoutChannels":Ljava/util/List;, "Ljava/util/List<Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannel;>;"
    :goto_1
    return-object v2

    .restart local v2    # "idleTimeoutChannels":Ljava/util/List;, "Ljava/util/List<Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannel;>;"
    :cond_4
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v2

    goto :goto_1
.end method

.method private isChannelCloseable(Lorg/jboss/netty/channel/Channel;)Z
    .locals 4
    .param p1, "channel"    # Lorg/jboss/netty/channel/Channel;

    .prologue
    .line 151
    invoke-static {p1}, Lcom/ning/http/client/providers/netty/channel/Channels;->getAttribute(Lorg/jboss/netty/channel/Channel;)Ljava/lang/Object;

    move-result-object v0

    .line 152
    .local v0, "attribute":Ljava/lang/Object;
    instance-of v2, v0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;

    if-eqz v2, :cond_0

    move-object v1, v0

    .line 153
    check-cast v1, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;

    .line 154
    .local v1, "future":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<*>;"
    invoke-virtual {v1}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->isDone()Z

    move-result v2

    if-nez v2, :cond_0

    .line 155
    invoke-static {}, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;->access$400()Lorg/slf4j/Logger;

    move-result-object v2

    const-string v3, "Future not in appropriate state %s, not closing"

    invoke-interface {v2, v3, v1}, Lorg/slf4j/Logger;->error(Ljava/lang/String;Ljava/lang/Object;)V

    .line 156
    const/4 v2, 0x0

    .line 159
    .end local v1    # "future":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<*>;"
    :goto_0
    return v2

    :cond_0
    const/4 v2, 0x1

    goto :goto_0
.end method

.method private isIdleTimeoutExpired(Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannel;J)Z
    .locals 4
    .param p1, "idleChannel"    # Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannel;
    .param p2, "now"    # J

    .prologue
    .line 131
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannelDetector;->this$0:Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;

    invoke-static {v0}, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;->access$100(Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-wide v0, p1, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannel;->start:J

    sub-long v0, p2, v0

    iget-object v2, p0, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannelDetector;->this$0:Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;

    invoke-static {v2}, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;->access$200(Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;)J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-ltz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public run(Lorg/jboss/netty/util/Timeout;)V
    .locals 20
    .param p1, "timeout"    # Lorg/jboss/netty/util/Timeout;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 189
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannelDetector;->this$0:Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;

    invoke-static {v15}, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;->access$600(Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;)Ljava/util/concurrent/atomic/AtomicBoolean;

    move-result-object v15

    invoke-virtual {v15}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v15

    if-eqz v15, :cond_0

    .line 228
    :goto_0
    return-void

    .line 193
    :cond_0
    :try_start_0
    invoke-static {}, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;->access$400()Lorg/slf4j/Logger;

    move-result-object v15

    invoke-interface {v15}, Lorg/slf4j/Logger;->isDebugEnabled()Z

    move-result v15

    if-eqz v15, :cond_1

    .line 194
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannelDetector;->this$0:Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;

    invoke-static {v15}, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;->access$700(Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;)Ljava/util/concurrent/ConcurrentHashMap;

    move-result-object v15

    invoke-virtual {v15}, Ljava/util/concurrent/ConcurrentHashMap;->keySet()Ljava/util/Set;

    move-result-object v15

    invoke-interface {v15}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .local v5, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_1

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    .line 195
    .local v9, "key":Ljava/lang/String;
    invoke-static {}, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;->access$400()Lorg/slf4j/Logger;

    move-result-object v16

    const-string v17, "Entry count for : {} : {}"

    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannelDetector;->this$0:Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;

    invoke-static {v15}, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;->access$700(Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;)Ljava/util/concurrent/ConcurrentHashMap;

    move-result-object v15

    invoke-virtual {v15, v9}, Ljava/util/concurrent/ConcurrentHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {v15}, Ljava/util/concurrent/ConcurrentLinkedQueue;->size()I

    move-result v15

    invoke-static {v15}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v15

    move-object/from16 v0, v16

    move-object/from16 v1, v17

    invoke-interface {v0, v1, v9, v15}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 223
    .end local v5    # "i$":Ljava/util/Iterator;
    .end local v9    # "key":Ljava/lang/String;
    :catch_0
    move-exception v11

    .line 224
    .local v11, "t":Ljava/lang/Throwable;
    invoke-static {}, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;->access$400()Lorg/slf4j/Logger;

    move-result-object v15

    const-string v16, "uncaught exception!"

    move-object/from16 v0, v16

    invoke-interface {v15, v0, v11}, Lorg/slf4j/Logger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 227
    .end local v11    # "t":Ljava/lang/Throwable;
    :goto_2
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannelDetector;->this$0:Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;

    invoke-interface/range {p1 .. p1}, Lorg/jboss/netty/util/Timeout;->getTask()Lorg/jboss/netty/util/TimerTask;

    move-result-object v16

    invoke-static/range {v15 .. v16}, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;->access$900(Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;Lorg/jboss/netty/util/TimerTask;)V

    goto :goto_0

    .line 198
    :cond_1
    :try_start_1
    invoke-static {}, Lcom/ning/http/util/DateUtils;->millisTime()J

    move-result-wide v12

    .line 199
    .local v12, "start":J
    const/4 v4, 0x0

    .line 200
    .local v4, "closedCount":I
    const/4 v14, 0x0

    .line 202
    .local v14, "totalCount":I
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannelDetector;->this$0:Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;

    invoke-static {v15}, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;->access$700(Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;)Ljava/util/concurrent/ConcurrentHashMap;

    move-result-object v15

    invoke-virtual {v15}, Ljava/util/concurrent/ConcurrentHashMap;->values()Ljava/util/Collection;

    move-result-object v15

    invoke-interface {v15}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_2
    :goto_3
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_5

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 205
    .local v10, "partition":Ljava/util/concurrent/ConcurrentLinkedQueue;, "Ljava/util/concurrent/ConcurrentLinkedQueue<Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannel;>;"
    invoke-static {}, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;->access$400()Lorg/slf4j/Logger;

    move-result-object v15

    invoke-interface {v15}, Lorg/slf4j/Logger;->isDebugEnabled()Z

    move-result v15

    if-eqz v15, :cond_3

    .line 206
    invoke-virtual {v10}, Ljava/util/concurrent/ConcurrentLinkedQueue;->size()I

    move-result v15

    add-int/2addr v14, v15

    .line 208
    :cond_3
    move-object/from16 v0, p0

    invoke-direct {v0, v10, v12, v13}, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannelDetector;->expiredChannels(Ljava/util/concurrent/ConcurrentLinkedQueue;J)Ljava/util/List;

    move-result-object v15

    move-object/from16 v0, p0

    invoke-direct {v0, v15}, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannelDetector;->closeChannels(Ljava/util/List;)Ljava/util/List;

    move-result-object v3

    .line 210
    .local v3, "closedChannels":Ljava/util/List;, "Ljava/util/List<Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannel;>;"
    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v15

    if-nez v15, :cond_2

    .line 211
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    .local v8, "i$":Ljava/util/Iterator;
    :goto_4
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_4

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannel;

    .line 212
    .local v2, "closedChannel":Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannel;
    move-object/from16 v0, p0

    iget-object v15, v0, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannelDetector;->this$0:Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;

    invoke-static {v15}, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;->access$800(Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;)Ljava/util/concurrent/ConcurrentHashMap;

    move-result-object v15

    iget-object v0, v2, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannel;->channel:Lorg/jboss/netty/channel/Channel;

    move-object/from16 v16, v0

    invoke-interface/range {v16 .. v16}, Lorg/jboss/netty/channel/Channel;->getId()Ljava/lang/Integer;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/util/concurrent/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_4

    .line 214
    .end local v2    # "closedChannel":Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannel;
    :cond_4
    invoke-virtual {v10, v3}, Ljava/util/concurrent/ConcurrentLinkedQueue;->removeAll(Ljava/util/Collection;)Z

    .line 215
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v15

    add-int/2addr v4, v15

    goto :goto_3

    .line 219
    .end local v3    # "closedChannels":Ljava/util/List;, "Ljava/util/List<Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannel;>;"
    .end local v8    # "i$":Ljava/util/Iterator;
    .end local v10    # "partition":Ljava/util/concurrent/ConcurrentLinkedQueue;, "Ljava/util/concurrent/ConcurrentLinkedQueue<Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool$IdleChannel;>;"
    :cond_5
    invoke-static {}, Lcom/ning/http/util/DateUtils;->millisTime()J

    move-result-wide v16

    sub-long v6, v16, v12

    .line 221
    .local v6, "duration":J
    invoke-static {}, Lcom/ning/http/client/providers/netty/channel/pool/DefaultChannelPool;->access$400()Lorg/slf4j/Logger;

    move-result-object v15

    const-string v16, "Closed {} connections out of {} in {}ms"

    const/16 v17, 0x3

    move/from16 v0, v17

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v17, v0

    const/16 v18, 0x0

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v19

    aput-object v19, v17, v18

    const/16 v18, 0x1

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v19

    aput-object v19, v17, v18

    const/16 v18, 0x2

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v19

    aput-object v19, v17, v18

    invoke-interface/range {v15 .. v17}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_2
.end method
