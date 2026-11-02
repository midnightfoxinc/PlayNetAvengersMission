.class public Lorg/jboss/netty/channel/DefaultChannelPipeline;
.super Ljava/lang/Object;
.source "DefaultChannelPipeline.java"

# interfaces
.implements Lorg/jboss/netty/channel/ChannelPipeline;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jboss/netty/channel/DefaultChannelPipeline$DiscardingChannelSink;,
        Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;
    }
.end annotation


# static fields
.field static final discardingSink:Lorg/jboss/netty/channel/ChannelSink;

.field static final logger:Lorg/jboss/netty/logging/InternalLogger;


# instance fields
.field private volatile channel:Lorg/jboss/netty/channel/Channel;

.field private volatile head:Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;

.field private final name2ctx:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;",
            ">;"
        }
    .end annotation
.end field

.field private volatile sink:Lorg/jboss/netty/channel/ChannelSink;

.field private volatile tail:Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 36
    const-class v0, Lorg/jboss/netty/channel/DefaultChannelPipeline;

    invoke-static {v0}, Lorg/jboss/netty/logging/InternalLoggerFactory;->getInstance(Ljava/lang/Class;)Lorg/jboss/netty/logging/InternalLogger;

    move-result-object v0

    sput-object v0, Lorg/jboss/netty/channel/DefaultChannelPipeline;->logger:Lorg/jboss/netty/logging/InternalLogger;

    .line 37
    new-instance v0, Lorg/jboss/netty/channel/DefaultChannelPipeline$DiscardingChannelSink;

    invoke-direct {v0}, Lorg/jboss/netty/channel/DefaultChannelPipeline$DiscardingChannelSink;-><init>()V

    sput-object v0, Lorg/jboss/netty/channel/DefaultChannelPipeline;->discardingSink:Lorg/jboss/netty/channel/ChannelSink;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    new-instance v0, Ljava/util/HashMap;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Ljava/util/HashMap;-><init>(I)V

    iput-object v0, p0, Lorg/jboss/netty/channel/DefaultChannelPipeline;->name2ctx:Ljava/util/Map;

    .line 796
    return-void
.end method

.method static synthetic access$000(Lorg/jboss/netty/channel/DefaultChannelPipeline;Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;)Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;
    .locals 1
    .param p0, "x0"    # Lorg/jboss/netty/channel/DefaultChannelPipeline;
    .param p1, "x1"    # Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;

    .prologue
    .line 34
    invoke-direct {p0, p1}, Lorg/jboss/netty/channel/DefaultChannelPipeline;->getActualDownstreamContext(Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;)Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$100(Lorg/jboss/netty/channel/DefaultChannelPipeline;Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;)Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;
    .locals 1
    .param p0, "x0"    # Lorg/jboss/netty/channel/DefaultChannelPipeline;
    .param p1, "x1"    # Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;

    .prologue
    .line 34
    invoke-direct {p0, p1}, Lorg/jboss/netty/channel/DefaultChannelPipeline;->getActualUpstreamContext(Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;)Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;

    move-result-object v0

    return-object v0
.end method

.method private callAfterAdd(Lorg/jboss/netty/channel/ChannelHandlerContext;)V
    .locals 8
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;

    .prologue
    .line 334
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getHandler()Lorg/jboss/netty/channel/ChannelHandler;

    move-result-object v5

    instance-of v5, v5, Lorg/jboss/netty/channel/LifeCycleAwareChannelHandler;

    if-nez v5, :cond_0

    .line 364
    :goto_0
    return-void

    .line 338
    :cond_0
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getHandler()Lorg/jboss/netty/channel/ChannelHandler;

    move-result-object v1

    check-cast v1, Lorg/jboss/netty/channel/LifeCycleAwareChannelHandler;

    .line 342
    .local v1, "h":Lorg/jboss/netty/channel/LifeCycleAwareChannelHandler;
    :try_start_0
    invoke-interface {v1, p1}, Lorg/jboss/netty/channel/LifeCycleAwareChannelHandler;->afterAdd(Lorg/jboss/netty/channel/ChannelHandlerContext;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 343
    :catch_0
    move-exception v3

    .line 344
    .local v3, "t":Ljava/lang/Throwable;
    const/4 v2, 0x0

    .line 346
    .local v2, "removed":Z
    :try_start_1
    move-object v0, p1

    check-cast v0, Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;

    move-object v5, v0

    invoke-direct {p0, v5}, Lorg/jboss/netty/channel/DefaultChannelPipeline;->remove(Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;)Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    .line 347
    const/4 v2, 0x1

    .line 354
    :cond_1
    :goto_1
    if-eqz v2, :cond_2

    .line 355
    new-instance v5, Lorg/jboss/netty/channel/ChannelHandlerLifeCycleException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ".afterAdd() has thrown an exception; removed."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6, v3}, Lorg/jboss/netty/channel/ChannelHandlerLifeCycleException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v5

    .line 348
    :catch_1
    move-exception v4

    .line 349
    .local v4, "t2":Ljava/lang/Throwable;
    sget-object v5, Lorg/jboss/netty/channel/DefaultChannelPipeline;->logger:Lorg/jboss/netty/logging/InternalLogger;

    invoke-interface {v5}, Lorg/jboss/netty/logging/InternalLogger;->isWarnEnabled()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 350
    sget-object v5, Lorg/jboss/netty/channel/DefaultChannelPipeline;->logger:Lorg/jboss/netty/logging/InternalLogger;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Failed to remove a handler: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6, v4}, Lorg/jboss/netty/logging/InternalLogger;->warn(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1

    .line 359
    .end local v4    # "t2":Ljava/lang/Throwable;
    :cond_2
    new-instance v5, Lorg/jboss/netty/channel/ChannelHandlerLifeCycleException;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ".afterAdd() has thrown an exception; also failed to remove."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6, v3}, Lorg/jboss/netty/channel/ChannelHandlerLifeCycleException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v5
.end method

.method private static callAfterRemove(Lorg/jboss/netty/channel/ChannelHandlerContext;)V
    .locals 5
    .param p0, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;

    .prologue
    .line 384
    invoke-interface {p0}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getHandler()Lorg/jboss/netty/channel/ChannelHandler;

    move-result-object v2

    instance-of v2, v2, Lorg/jboss/netty/channel/LifeCycleAwareChannelHandler;

    if-nez v2, :cond_0

    .line 398
    :goto_0
    return-void

    .line 388
    :cond_0
    invoke-interface {p0}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getHandler()Lorg/jboss/netty/channel/ChannelHandler;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/channel/LifeCycleAwareChannelHandler;

    .line 392
    .local v0, "h":Lorg/jboss/netty/channel/LifeCycleAwareChannelHandler;
    :try_start_0
    invoke-interface {v0, p0}, Lorg/jboss/netty/channel/LifeCycleAwareChannelHandler;->afterRemove(Lorg/jboss/netty/channel/ChannelHandlerContext;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 393
    :catch_0
    move-exception v1

    .line 394
    .local v1, "t":Ljava/lang/Throwable;
    new-instance v2, Lorg/jboss/netty/channel/ChannelHandlerLifeCycleException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ".afterRemove() has thrown an exception."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v1}, Lorg/jboss/netty/channel/ChannelHandlerLifeCycleException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method private static callBeforeAdd(Lorg/jboss/netty/channel/ChannelHandlerContext;)V
    .locals 5
    .param p0, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;

    .prologue
    .line 317
    invoke-interface {p0}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getHandler()Lorg/jboss/netty/channel/ChannelHandler;

    move-result-object v2

    instance-of v2, v2, Lorg/jboss/netty/channel/LifeCycleAwareChannelHandler;

    if-nez v2, :cond_0

    .line 331
    :goto_0
    return-void

    .line 321
    :cond_0
    invoke-interface {p0}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getHandler()Lorg/jboss/netty/channel/ChannelHandler;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/channel/LifeCycleAwareChannelHandler;

    .line 325
    .local v0, "h":Lorg/jboss/netty/channel/LifeCycleAwareChannelHandler;
    :try_start_0
    invoke-interface {v0, p0}, Lorg/jboss/netty/channel/LifeCycleAwareChannelHandler;->beforeAdd(Lorg/jboss/netty/channel/ChannelHandlerContext;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 326
    :catch_0
    move-exception v1

    .line 327
    .local v1, "t":Ljava/lang/Throwable;
    new-instance v2, Lorg/jboss/netty/channel/ChannelHandlerLifeCycleException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ".beforeAdd() has thrown an exception; not adding."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v1}, Lorg/jboss/netty/channel/ChannelHandlerLifeCycleException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method private static callBeforeRemove(Lorg/jboss/netty/channel/ChannelHandlerContext;)V
    .locals 5
    .param p0, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;

    .prologue
    .line 367
    invoke-interface {p0}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getHandler()Lorg/jboss/netty/channel/ChannelHandler;

    move-result-object v2

    instance-of v2, v2, Lorg/jboss/netty/channel/LifeCycleAwareChannelHandler;

    if-nez v2, :cond_0

    .line 381
    :goto_0
    return-void

    .line 371
    :cond_0
    invoke-interface {p0}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getHandler()Lorg/jboss/netty/channel/ChannelHandler;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/channel/LifeCycleAwareChannelHandler;

    .line 375
    .local v0, "h":Lorg/jboss/netty/channel/LifeCycleAwareChannelHandler;
    :try_start_0
    invoke-interface {v0, p0}, Lorg/jboss/netty/channel/LifeCycleAwareChannelHandler;->beforeRemove(Lorg/jboss/netty/channel/ChannelHandlerContext;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 376
    :catch_0
    move-exception v1

    .line 377
    .local v1, "t":Ljava/lang/Throwable;
    new-instance v2, Lorg/jboss/netty/channel/ChannelHandlerLifeCycleException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ".beforeRemove() has thrown an exception; not removing."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v1}, Lorg/jboss/netty/channel/ChannelHandlerLifeCycleException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method

.method private checkDuplicateName(Ljava/lang/String;)V
    .locals 3
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 676
    iget-object v0, p0, Lorg/jboss/netty/channel/DefaultChannelPipeline;->name2ctx:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 677
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Duplicate handler name: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 679
    :cond_0
    return-void
.end method

.method private getActualDownstreamContext(Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;)Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;
    .locals 3
    .param p1, "ctx"    # Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;

    .prologue
    const/4 v1, 0x0

    .line 620
    if-nez p1, :cond_1

    move-object v0, v1

    .line 632
    :cond_0
    :goto_0
    return-object v0

    .line 624
    :cond_1
    move-object v0, p1

    .line 625
    .local v0, "realCtx":Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;
    :cond_2
    invoke-virtual {v0}, Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;->canHandleDownstream()Z

    move-result v2

    if-nez v2, :cond_0

    .line 626
    iget-object v0, v0, Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;->prev:Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;

    .line 627
    if-nez v0, :cond_2

    move-object v0, v1

    .line 628
    goto :goto_0
.end method

.method private getActualUpstreamContext(Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;)Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;
    .locals 3
    .param p1, "ctx"    # Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;

    .prologue
    const/4 v1, 0x0

    .line 604
    if-nez p1, :cond_1

    move-object v0, v1

    .line 616
    :cond_0
    :goto_0
    return-object v0

    .line 608
    :cond_1
    move-object v0, p1

    .line 609
    .local v0, "realCtx":Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;
    :cond_2
    invoke-virtual {v0}, Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;->canHandleUpstream()Z

    move-result v2

    if-nez v2, :cond_0

    .line 610
    iget-object v0, v0, Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;->next:Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;

    .line 611
    if-nez v0, :cond_2

    move-object v0, v1

    .line 612
    goto :goto_0
.end method

.method private getContextOrDie(Ljava/lang/Class;)Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<+",
            "Lorg/jboss/netty/channel/ChannelHandler;",
            ">;)",
            "Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;"
        }
    .end annotation

    .prologue
    .line 700
    .local p1, "handlerType":Ljava/lang/Class;, "Ljava/lang/Class<+Lorg/jboss/netty/channel/ChannelHandler;>;"
    invoke-virtual {p0, p1}, Lorg/jboss/netty/channel/DefaultChannelPipeline;->getContext(Ljava/lang/Class;)Lorg/jboss/netty/channel/ChannelHandlerContext;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;

    .line 701
    .local v0, "ctx":Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;
    if-nez v0, :cond_0

    .line 702
    new-instance v1, Ljava/util/NoSuchElementException;

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/NoSuchElementException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 704
    :cond_0
    return-object v0
.end method

.method private getContextOrDie(Ljava/lang/String;)Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;
    .locals 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 682
    invoke-virtual {p0, p1}, Lorg/jboss/netty/channel/DefaultChannelPipeline;->getContext(Ljava/lang/String;)Lorg/jboss/netty/channel/ChannelHandlerContext;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;

    .line 683
    .local v0, "ctx":Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;
    if-nez v0, :cond_0

    .line 684
    new-instance v1, Ljava/util/NoSuchElementException;

    invoke-direct {v1, p1}, Ljava/util/NoSuchElementException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 686
    :cond_0
    return-object v0
.end method

.method private getContextOrDie(Lorg/jboss/netty/channel/ChannelHandler;)Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;
    .locals 3
    .param p1, "handler"    # Lorg/jboss/netty/channel/ChannelHandler;

    .prologue
    .line 691
    invoke-virtual {p0, p1}, Lorg/jboss/netty/channel/DefaultChannelPipeline;->getContext(Lorg/jboss/netty/channel/ChannelHandler;)Lorg/jboss/netty/channel/ChannelHandlerContext;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;

    .line 692
    .local v0, "ctx":Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;
    if-nez v0, :cond_0

    .line 693
    new-instance v1, Ljava/util/NoSuchElementException;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/util/NoSuchElementException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 695
    :cond_0
    return-object v0
.end method

.method private init(Ljava/lang/String;Lorg/jboss/netty/channel/ChannelHandler;)V
    .locals 6
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "handler"    # Lorg/jboss/netty/channel/ChannelHandler;

    .prologue
    const/4 v2, 0x0

    .line 667
    new-instance v0, Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;

    move-object v1, p0

    move-object v3, v2

    move-object v4, p1

    move-object v5, p2

    invoke-direct/range {v0 .. v5}, Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;-><init>(Lorg/jboss/netty/channel/DefaultChannelPipeline;Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;Ljava/lang/String;Lorg/jboss/netty/channel/ChannelHandler;)V

    .line 668
    .local v0, "ctx":Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;
    invoke-static {v0}, Lorg/jboss/netty/channel/DefaultChannelPipeline;->callBeforeAdd(Lorg/jboss/netty/channel/ChannelHandlerContext;)V

    .line 669
    iput-object v0, p0, Lorg/jboss/netty/channel/DefaultChannelPipeline;->tail:Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;

    iput-object v0, p0, Lorg/jboss/netty/channel/DefaultChannelPipeline;->head:Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;

    .line 670
    iget-object v1, p0, Lorg/jboss/netty/channel/DefaultChannelPipeline;->name2ctx:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->clear()V

    .line 671
    iget-object v1, p0, Lorg/jboss/netty/channel/DefaultChannelPipeline;->name2ctx:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 672
    invoke-direct {p0, v0}, Lorg/jboss/netty/channel/DefaultChannelPipeline;->callAfterAdd(Lorg/jboss/netty/channel/ChannelHandlerContext;)V

    .line 673
    return-void
.end method

.method private remove(Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;)Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;
    .locals 4
    .param p1, "ctx"    # Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;

    .prologue
    .line 162
    iget-object v2, p0, Lorg/jboss/netty/channel/DefaultChannelPipeline;->head:Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;

    iget-object v3, p0, Lorg/jboss/netty/channel/DefaultChannelPipeline;->tail:Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;

    if-ne v2, v3, :cond_0

    .line 163
    invoke-static {p1}, Lorg/jboss/netty/channel/DefaultChannelPipeline;->callBeforeRemove(Lorg/jboss/netty/channel/ChannelHandlerContext;)V

    .line 165
    const/4 v2, 0x0

    iput-object v2, p0, Lorg/jboss/netty/channel/DefaultChannelPipeline;->tail:Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;

    iput-object v2, p0, Lorg/jboss/netty/channel/DefaultChannelPipeline;->head:Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;

    .line 166
    iget-object v2, p0, Lorg/jboss/netty/channel/DefaultChannelPipeline;->name2ctx:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->clear()V

    .line 168
    invoke-static {p1}, Lorg/jboss/netty/channel/DefaultChannelPipeline;->callAfterRemove(Lorg/jboss/netty/channel/ChannelHandlerContext;)V

    .line 184
    :goto_0
    return-object p1

    .line 169
    :cond_0
    iget-object v2, p0, Lorg/jboss/netty/channel/DefaultChannelPipeline;->head:Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;

    if-ne p1, v2, :cond_1

    .line 170
    invoke-virtual {p0}, Lorg/jboss/netty/channel/DefaultChannelPipeline;->removeFirst()Lorg/jboss/netty/channel/ChannelHandler;

    goto :goto_0

    .line 171
    :cond_1
    iget-object v2, p0, Lorg/jboss/netty/channel/DefaultChannelPipeline;->tail:Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;

    if-ne p1, v2, :cond_2

    .line 172
    invoke-virtual {p0}, Lorg/jboss/netty/channel/DefaultChannelPipeline;->removeLast()Lorg/jboss/netty/channel/ChannelHandler;

    goto :goto_0

    .line 174
    :cond_2
    invoke-static {p1}, Lorg/jboss/netty/channel/DefaultChannelPipeline;->callBeforeRemove(Lorg/jboss/netty/channel/ChannelHandlerContext;)V

    .line 176
    iget-object v1, p1, Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;->prev:Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;

    .line 177
    .local v1, "prev":Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;
    iget-object v0, p1, Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;->next:Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;

    .line 178
    .local v0, "next":Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;
    iput-object v0, v1, Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;->next:Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;

    .line 179
    iput-object v1, v0, Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;->prev:Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;

    .line 180
    iget-object v2, p0, Lorg/jboss/netty/channel/DefaultChannelPipeline;->name2ctx:Ljava/util/Map;

    invoke-virtual {p1}, Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 182
    invoke-static {p1}, Lorg/jboss/netty/channel/DefaultChannelPipeline;->callAfterRemove(Lorg/jboss/netty/channel/ChannelHandlerContext;)V

    goto :goto_0
.end method

.method private replace(Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;Ljava/lang/String;Lorg/jboss/netty/channel/ChannelHandler;)Lorg/jboss/netty/channel/ChannelHandler;
    .locals 12
    .param p1, "ctx"    # Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;
    .param p2, "newName"    # Ljava/lang/String;
    .param p3, "newHandler"    # Lorg/jboss/netty/channel/ChannelHandler;

    .prologue
    .line 254
    iget-object v1, p0, Lorg/jboss/netty/channel/DefaultChannelPipeline;->head:Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;

    if-ne p1, v1, :cond_1

    .line 255
    invoke-virtual {p0}, Lorg/jboss/netty/channel/DefaultChannelPipeline;->removeFirst()Lorg/jboss/netty/channel/ChannelHandler;

    .line 256
    invoke-virtual {p0, p2, p3}, Lorg/jboss/netty/channel/DefaultChannelPipeline;->addFirst(Ljava/lang/String;Lorg/jboss/netty/channel/ChannelHandler;)V

    .line 313
    :cond_0
    :goto_0
    invoke-virtual {p1}, Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;->getHandler()Lorg/jboss/netty/channel/ChannelHandler;

    move-result-object v1

    return-object v1

    .line 257
    :cond_1
    iget-object v1, p0, Lorg/jboss/netty/channel/DefaultChannelPipeline;->tail:Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;

    if-ne p1, v1, :cond_2

    .line 258
    invoke-virtual {p0}, Lorg/jboss/netty/channel/DefaultChannelPipeline;->removeLast()Lorg/jboss/netty/channel/ChannelHandler;

    .line 259
    invoke-virtual {p0, p2, p3}, Lorg/jboss/netty/channel/DefaultChannelPipeline;->addLast(Ljava/lang/String;Lorg/jboss/netty/channel/ChannelHandler;)V

    goto :goto_0

    .line 261
    :cond_2
    invoke-virtual {p1}, Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    .line 262
    .local v11, "sameName":Z
    if-nez v11, :cond_3

    .line 263
    invoke-direct {p0, p2}, Lorg/jboss/netty/channel/DefaultChannelPipeline;->checkDuplicateName(Ljava/lang/String;)V

    .line 266
    :cond_3
    iget-object v2, p1, Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;->prev:Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;

    .line 267
    .local v2, "prev":Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;
    iget-object v3, p1, Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;->next:Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;

    .line 268
    .local v3, "next":Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;
    new-instance v0, Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;

    move-object v1, p0

    move-object v4, p2

    move-object v5, p3

    invoke-direct/range {v0 .. v5}, Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;-><init>(Lorg/jboss/netty/channel/DefaultChannelPipeline;Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;Ljava/lang/String;Lorg/jboss/netty/channel/ChannelHandler;)V

    .line 270
    .local v0, "newCtx":Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;
    invoke-static {p1}, Lorg/jboss/netty/channel/DefaultChannelPipeline;->callBeforeRemove(Lorg/jboss/netty/channel/ChannelHandlerContext;)V

    .line 271
    invoke-static {v0}, Lorg/jboss/netty/channel/DefaultChannelPipeline;->callBeforeAdd(Lorg/jboss/netty/channel/ChannelHandlerContext;)V

    .line 273
    iput-object v0, v2, Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;->next:Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;

    .line 274
    iput-object v0, v3, Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;->prev:Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;

    .line 276
    if-nez v11, :cond_4

    .line 277
    iget-object v1, p0, Lorg/jboss/netty/channel/DefaultChannelPipeline;->name2ctx:Ljava/util/Map;

    invoke-virtual {p1}, Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v1, v4}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 279
    :cond_4
    iget-object v1, p0, Lorg/jboss/netty/channel/DefaultChannelPipeline;->name2ctx:Ljava/util/Map;

    invoke-interface {v1, p2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 281
    const/4 v9, 0x0

    .line 282
    .local v9, "removeException":Lorg/jboss/netty/channel/ChannelHandlerLifeCycleException;
    const/4 v6, 0x0

    .line 283
    .local v6, "addException":Lorg/jboss/netty/channel/ChannelHandlerLifeCycleException;
    const/4 v10, 0x0

    .line 285
    .local v10, "removed":Z
    :try_start_0
    invoke-static {p1}, Lorg/jboss/netty/channel/DefaultChannelPipeline;->callAfterRemove(Lorg/jboss/netty/channel/ChannelHandlerContext;)V
    :try_end_0
    .catch Lorg/jboss/netty/channel/ChannelHandlerLifeCycleException; {:try_start_0 .. :try_end_0} :catch_0

    .line 286
    const/4 v10, 0x1

    .line 291
    :goto_1
    const/4 v7, 0x0

    .line 293
    .local v7, "added":Z
    :try_start_1
    invoke-direct {p0, v0}, Lorg/jboss/netty/channel/DefaultChannelPipeline;->callAfterAdd(Lorg/jboss/netty/channel/ChannelHandlerContext;)V
    :try_end_1
    .catch Lorg/jboss/netty/channel/ChannelHandlerLifeCycleException; {:try_start_1 .. :try_end_1} :catch_1

    .line 294
    const/4 v7, 0x1

    .line 299
    :goto_2
    if-nez v10, :cond_5

    if-nez v7, :cond_5

    .line 300
    sget-object v1, Lorg/jboss/netty/channel/DefaultChannelPipeline;->logger:Lorg/jboss/netty/logging/InternalLogger;

    invoke-virtual {v9}, Lorg/jboss/netty/channel/ChannelHandlerLifeCycleException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v1, v4, v9}, Lorg/jboss/netty/logging/InternalLogger;->warn(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 301
    sget-object v1, Lorg/jboss/netty/channel/DefaultChannelPipeline;->logger:Lorg/jboss/netty/logging/InternalLogger;

    invoke-virtual {v6}, Lorg/jboss/netty/channel/ChannelHandlerLifeCycleException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v1, v4, v6}, Lorg/jboss/netty/logging/InternalLogger;->warn(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 302
    new-instance v1, Lorg/jboss/netty/channel/ChannelHandlerLifeCycleException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Both "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p1}, Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;->getHandler()Lorg/jboss/netty/channel/ChannelHandler;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ".afterRemove() and "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;->getHandler()Lorg/jboss/netty/channel/ChannelHandler;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ".afterAdd() failed; see logs."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v1, v4}, Lorg/jboss/netty/channel/ChannelHandlerLifeCycleException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 287
    .end local v7    # "added":Z
    :catch_0
    move-exception v8

    .line 288
    .local v8, "e":Lorg/jboss/netty/channel/ChannelHandlerLifeCycleException;
    move-object v9, v8

    goto :goto_1

    .line 295
    .end local v8    # "e":Lorg/jboss/netty/channel/ChannelHandlerLifeCycleException;
    .restart local v7    # "added":Z
    :catch_1
    move-exception v8

    .line 296
    .restart local v8    # "e":Lorg/jboss/netty/channel/ChannelHandlerLifeCycleException;
    move-object v6, v8

    goto :goto_2

    .line 306
    .end local v8    # "e":Lorg/jboss/netty/channel/ChannelHandlerLifeCycleException;
    :cond_5
    if-nez v10, :cond_6

    .line 307
    throw v9

    .line 308
    :cond_6
    if-nez v7, :cond_0

    .line 309
    throw v6
.end method


# virtual methods
.method public declared-synchronized addAfter(Ljava/lang/String;Ljava/lang/String;Lorg/jboss/netty/channel/ChannelHandler;)V
    .locals 6
    .param p1, "baseName"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "handler"    # Lorg/jboss/netty/channel/ChannelHandler;

    .prologue
    .line 131
    monitor-enter p0

    :try_start_0
    invoke-direct {p0, p1}, Lorg/jboss/netty/channel/DefaultChannelPipeline;->getContextOrDie(Ljava/lang/String;)Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;

    move-result-object v2

    .line 132
    .local v2, "ctx":Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;
    iget-object v1, p0, Lorg/jboss/netty/channel/DefaultChannelPipeline;->tail:Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;

    if-ne v2, v1, :cond_0

    .line 133
    invoke-virtual {p0, p2, p3}, Lorg/jboss/netty/channel/DefaultChannelPipeline;->addLast(Ljava/lang/String;Lorg/jboss/netty/channel/ChannelHandler;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 146
    :goto_0
    monitor-exit p0

    return-void

    .line 135
    :cond_0
    :try_start_1
    invoke-direct {p0, p2}, Lorg/jboss/netty/channel/DefaultChannelPipeline;->checkDuplicateName(Ljava/lang/String;)V

    .line 136
    new-instance v0, Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;

    iget-object v3, v2, Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;->next:Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;

    move-object v1, p0

    move-object v4, p2

    move-object v5, p3

    invoke-direct/range {v0 .. v5}, Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;-><init>(Lorg/jboss/netty/channel/DefaultChannelPipeline;Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;Ljava/lang/String;Lorg/jboss/netty/channel/ChannelHandler;)V

    .line 138
    .local v0, "newCtx":Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;
    invoke-static {v0}, Lorg/jboss/netty/channel/DefaultChannelPipeline;->callBeforeAdd(Lorg/jboss/netty/channel/ChannelHandlerContext;)V

    .line 140
    iget-object v1, v2, Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;->next:Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;

    iput-object v0, v1, Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;->prev:Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;

    .line 141
    iput-object v0, v2, Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;->next:Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;

    .line 142
    iget-object v1, p0, Lorg/jboss/netty/channel/DefaultChannelPipeline;->name2ctx:Ljava/util/Map;

    invoke-interface {v1, p2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 144
    invoke-direct {p0, v0}, Lorg/jboss/netty/channel/DefaultChannelPipeline;->callAfterAdd(Lorg/jboss/netty/channel/ChannelHandlerContext;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 131
    .end local v0    # "newCtx":Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;
    .end local v2    # "ctx":Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized addBefore(Ljava/lang/String;Ljava/lang/String;Lorg/jboss/netty/channel/ChannelHandler;)V
    .locals 6
    .param p1, "baseName"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "handler"    # Lorg/jboss/netty/channel/ChannelHandler;

    .prologue
    .line 113
    monitor-enter p0

    :try_start_0
    invoke-direct {p0, p1}, Lorg/jboss/netty/channel/DefaultChannelPipeline;->getContextOrDie(Ljava/lang/String;)Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;

    move-result-object v3

    .line 114
    .local v3, "ctx":Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;
    iget-object v1, p0, Lorg/jboss/netty/channel/DefaultChannelPipeline;->head:Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;

    if-ne v3, v1, :cond_0

    .line 115
    invoke-virtual {p0, p2, p3}, Lorg/jboss/netty/channel/DefaultChannelPipeline;->addFirst(Ljava/lang/String;Lorg/jboss/netty/channel/ChannelHandler;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 128
    :goto_0
    monitor-exit p0

    return-void

    .line 117
    :cond_0
    :try_start_1
    invoke-direct {p0, p2}, Lorg/jboss/netty/channel/DefaultChannelPipeline;->checkDuplicateName(Ljava/lang/String;)V

    .line 118
    new-instance v0, Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;

    iget-object v2, v3, Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;->prev:Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;

    move-object v1, p0

    move-object v4, p2

    move-object v5, p3

    invoke-direct/range {v0 .. v5}, Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;-><init>(Lorg/jboss/netty/channel/DefaultChannelPipeline;Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;Ljava/lang/String;Lorg/jboss/netty/channel/ChannelHandler;)V

    .line 120
    .local v0, "newCtx":Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;
    invoke-static {v0}, Lorg/jboss/netty/channel/DefaultChannelPipeline;->callBeforeAdd(Lorg/jboss/netty/channel/ChannelHandlerContext;)V

    .line 122
    iget-object v1, v3, Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;->prev:Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;

    iput-object v0, v1, Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;->next:Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;

    .line 123
    iput-object v0, v3, Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;->prev:Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;

    .line 124
    iget-object v1, p0, Lorg/jboss/netty/channel/DefaultChannelPipeline;->name2ctx:Ljava/util/Map;

    invoke-interface {v1, p2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 126
    invoke-direct {p0, v0}, Lorg/jboss/netty/channel/DefaultChannelPipeline;->callAfterAdd(Lorg/jboss/netty/channel/ChannelHandlerContext;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 113
    .end local v0    # "newCtx":Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;
    .end local v3    # "ctx":Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized addFirst(Ljava/lang/String;Lorg/jboss/netty/channel/ChannelHandler;)V
    .locals 6
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "handler"    # Lorg/jboss/netty/channel/ChannelHandler;

    .prologue
    .line 77
    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lorg/jboss/netty/channel/DefaultChannelPipeline;->name2ctx:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 78
    invoke-direct {p0, p1, p2}, Lorg/jboss/netty/channel/DefaultChannelPipeline;->init(Ljava/lang/String;Lorg/jboss/netty/channel/ChannelHandler;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 92
    :goto_0
    monitor-exit p0

    return-void

    .line 80
    :cond_0
    :try_start_1
    invoke-direct {p0, p1}, Lorg/jboss/netty/channel/DefaultChannelPipeline;->checkDuplicateName(Ljava/lang/String;)V

    .line 81
    iget-object v3, p0, Lorg/jboss/netty/channel/DefaultChannelPipeline;->head:Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;

    .line 82
    .local v3, "oldHead":Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;
    new-instance v0, Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;

    const/4 v2, 0x0

    move-object v1, p0

    move-object v4, p1

    move-object v5, p2

    invoke-direct/range {v0 .. v5}, Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;-><init>(Lorg/jboss/netty/channel/DefaultChannelPipeline;Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;Ljava/lang/String;Lorg/jboss/netty/channel/ChannelHandler;)V

    .line 84
    .local v0, "newHead":Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;
    invoke-static {v0}, Lorg/jboss/netty/channel/DefaultChannelPipeline;->callBeforeAdd(Lorg/jboss/netty/channel/ChannelHandlerContext;)V

    .line 86
    iput-object v0, v3, Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;->prev:Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;

    .line 87
    iput-object v0, p0, Lorg/jboss/netty/channel/DefaultChannelPipeline;->head:Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;

    .line 88
    iget-object v1, p0, Lorg/jboss/netty/channel/DefaultChannelPipeline;->name2ctx:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 90
    invoke-direct {p0, v0}, Lorg/jboss/netty/channel/DefaultChannelPipeline;->callAfterAdd(Lorg/jboss/netty/channel/ChannelHandlerContext;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 77
    .end local v0    # "newHead":Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;
    .end local v3    # "oldHead":Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized addLast(Ljava/lang/String;Lorg/jboss/netty/channel/ChannelHandler;)V
    .locals 6
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "handler"    # Lorg/jboss/netty/channel/ChannelHandler;

    .prologue
    .line 95
    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lorg/jboss/netty/channel/DefaultChannelPipeline;->name2ctx:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 96
    invoke-direct {p0, p1, p2}, Lorg/jboss/netty/channel/DefaultChannelPipeline;->init(Ljava/lang/String;Lorg/jboss/netty/channel/ChannelHandler;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 110
    :goto_0
    monitor-exit p0

    return-void

    .line 98
    :cond_0
    :try_start_1
    invoke-direct {p0, p1}, Lorg/jboss/netty/channel/DefaultChannelPipeline;->checkDuplicateName(Ljava/lang/String;)V

    .line 99
    iget-object v2, p0, Lorg/jboss/netty/channel/DefaultChannelPipeline;->tail:Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;

    .line 100
    .local v2, "oldTail":Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;
    new-instance v0, Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;

    const/4 v3, 0x0

    move-object v1, p0

    move-object v4, p1

    move-object v5, p2

    invoke-direct/range {v0 .. v5}, Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;-><init>(Lorg/jboss/netty/channel/DefaultChannelPipeline;Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;Ljava/lang/String;Lorg/jboss/netty/channel/ChannelHandler;)V

    .line 102
    .local v0, "newTail":Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;
    invoke-static {v0}, Lorg/jboss/netty/channel/DefaultChannelPipeline;->callBeforeAdd(Lorg/jboss/netty/channel/ChannelHandlerContext;)V

    .line 104
    iput-object v0, v2, Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;->next:Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;

    .line 105
    iput-object v0, p0, Lorg/jboss/netty/channel/DefaultChannelPipeline;->tail:Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;

    .line 106
    iget-object v1, p0, Lorg/jboss/netty/channel/DefaultChannelPipeline;->name2ctx:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 108
    invoke-direct {p0, v0}, Lorg/jboss/netty/channel/DefaultChannelPipeline;->callAfterAdd(Lorg/jboss/netty/channel/ChannelHandlerContext;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 95
    .end local v0    # "newTail":Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;
    .end local v2    # "oldTail":Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public attach(Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/channel/ChannelSink;)V
    .locals 2
    .param p1, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p2, "sink"    # Lorg/jboss/netty/channel/ChannelSink;

    .prologue
    .line 59
    if-nez p1, :cond_0

    .line 60
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "channel"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 62
    :cond_0
    if-nez p2, :cond_1

    .line 63
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "sink"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 65
    :cond_1
    iget-object v0, p0, Lorg/jboss/netty/channel/DefaultChannelPipeline;->channel:Lorg/jboss/netty/channel/Channel;

    if-nez v0, :cond_2

    iget-object v0, p0, Lorg/jboss/netty/channel/DefaultChannelPipeline;->sink:Lorg/jboss/netty/channel/ChannelSink;

    if-eqz v0, :cond_3

    .line 66
    :cond_2
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "attached already"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 68
    :cond_3
    iput-object p1, p0, Lorg/jboss/netty/channel/DefaultChannelPipeline;->channel:Lorg/jboss/netty/channel/Channel;

    .line 69
    iput-object p2, p0, Lorg/jboss/netty/channel/DefaultChannelPipeline;->sink:Lorg/jboss/netty/channel/ChannelSink;

    .line 70
    return-void
.end method

.method public execute(Ljava/lang/Runnable;)Lorg/jboss/netty/channel/ChannelFuture;
    .locals 1
    .param p1, "task"    # Ljava/lang/Runnable;

    .prologue
    .line 636
    invoke-virtual {p0}, Lorg/jboss/netty/channel/DefaultChannelPipeline;->getSink()Lorg/jboss/netty/channel/ChannelSink;

    move-result-object v0

    invoke-interface {v0, p0, p1}, Lorg/jboss/netty/channel/ChannelSink;->execute(Lorg/jboss/netty/channel/ChannelPipeline;Ljava/lang/Runnable;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v0

    return-object v0
.end method

.method public declared-synchronized get(Ljava/lang/Class;)Lorg/jboss/netty/channel/ChannelHandler;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lorg/jboss/netty/channel/ChannelHandler;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)TT;"
        }
    .end annotation

    .prologue
    .line 426
    .local p1, "handlerType":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    monitor-enter p0

    :try_start_0
    invoke-virtual {p0, p1}, Lorg/jboss/netty/channel/DefaultChannelPipeline;->getContext(Ljava/lang/Class;)Lorg/jboss/netty/channel/ChannelHandlerContext;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    .line 427
    .local v0, "ctx":Lorg/jboss/netty/channel/ChannelHandlerContext;
    if-nez v0, :cond_0

    .line 428
    const/4 v1, 0x0

    .line 432
    :goto_0
    monitor-exit p0

    return-object v1

    .line 431
    :cond_0
    :try_start_1
    invoke-interface {v0}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getHandler()Lorg/jboss/netty/channel/ChannelHandler;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v1

    .line 432
    .local v1, "handler":Lorg/jboss/netty/channel/ChannelHandler;, "TT;"
    goto :goto_0

    .line 426
    .end local v0    # "ctx":Lorg/jboss/netty/channel/ChannelHandlerContext;
    .end local v1    # "handler":Lorg/jboss/netty/channel/ChannelHandler;, "TT;"
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2
.end method

.method public declared-synchronized get(Ljava/lang/String;)Lorg/jboss/netty/channel/ChannelHandler;
    .locals 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 417
    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lorg/jboss/netty/channel/DefaultChannelPipeline;->name2ctx:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 418
    .local v0, "ctx":Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;
    if-nez v0, :cond_0

    .line 419
    const/4 v1, 0x0

    .line 421
    :goto_0
    monitor-exit p0

    return-object v1

    :cond_0
    :try_start_1
    invoke-virtual {v0}, Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;->getHandler()Lorg/jboss/netty/channel/ChannelHandler;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v1

    goto :goto_0

    .line 417
    .end local v0    # "ctx":Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public getChannel()Lorg/jboss/netty/channel/Channel;
    .locals 1

    .prologue
    .line 47
    iget-object v0, p0, Lorg/jboss/netty/channel/DefaultChannelPipeline;->channel:Lorg/jboss/netty/channel/Channel;

    return-object v0
.end method

.method public declared-synchronized getContext(Ljava/lang/Class;)Lorg/jboss/netty/channel/ChannelHandlerContext;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<+",
            "Lorg/jboss/netty/channel/ChannelHandler;",
            ">;)",
            "Lorg/jboss/netty/channel/ChannelHandlerContext;"
        }
    .end annotation

    .prologue
    .local p1, "handlerType":Ljava/lang/Class;, "Ljava/lang/Class<+Lorg/jboss/netty/channel/ChannelHandler;>;"
    const/4 v1, 0x0

    .line 466
    monitor-enter p0

    if-nez p1, :cond_0

    .line 467
    :try_start_0
    new-instance v1, Ljava/lang/NullPointerException;

    const-string v2, "handlerType"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 466
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1

    .line 470
    :cond_0
    :try_start_1
    iget-object v2, p0, Lorg/jboss/netty/channel/DefaultChannelPipeline;->name2ctx:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->isEmpty()Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v2

    if-eqz v2, :cond_2

    move-object v0, v1

    .line 484
    :cond_1
    :goto_0
    monitor-exit p0

    return-object v0

    .line 473
    :cond_2
    :try_start_2
    iget-object v0, p0, Lorg/jboss/netty/channel/DefaultChannelPipeline;->head:Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;

    .line 475
    .local v0, "ctx":Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;
    :cond_3
    invoke-virtual {v0}, Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;->getHandler()Lorg/jboss/netty/channel/ChannelHandler;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 479
    iget-object v0, v0, Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;->next:Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 480
    if-nez v0, :cond_3

    move-object v0, v1

    .line 484
    goto :goto_0
.end method

.method public declared-synchronized getContext(Ljava/lang/String;)Lorg/jboss/netty/channel/ChannelHandlerContext;
    .locals 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 437
    monitor-enter p0

    if-nez p1, :cond_0

    .line 438
    :try_start_0
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "name"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 437
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0

    .line 440
    :cond_0
    :try_start_1
    iget-object v0, p0, Lorg/jboss/netty/channel/DefaultChannelPipeline;->name2ctx:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/channel/ChannelHandlerContext;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-object v0
.end method

.method public declared-synchronized getContext(Lorg/jboss/netty/channel/ChannelHandler;)Lorg/jboss/netty/channel/ChannelHandlerContext;
    .locals 3
    .param p1, "handler"    # Lorg/jboss/netty/channel/ChannelHandler;

    .prologue
    const/4 v1, 0x0

    .line 444
    monitor-enter p0

    if-nez p1, :cond_0

    .line 445
    :try_start_0
    new-instance v1, Ljava/lang/NullPointerException;

    const-string v2, "handler"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 444
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1

    .line 447
    :cond_0
    :try_start_1
    iget-object v2, p0, Lorg/jboss/netty/channel/DefaultChannelPipeline;->name2ctx:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->isEmpty()Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result v2

    if-eqz v2, :cond_2

    move-object v0, v1

    .line 461
    :cond_1
    :goto_0
    monitor-exit p0

    return-object v0

    .line 450
    :cond_2
    :try_start_2
    iget-object v0, p0, Lorg/jboss/netty/channel/DefaultChannelPipeline;->head:Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;

    .line 452
    .local v0, "ctx":Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;
    :cond_3
    invoke-virtual {v0}, Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;->getHandler()Lorg/jboss/netty/channel/ChannelHandler;

    move-result-object v2

    if-eq v2, p1, :cond_1

    .line 456
    iget-object v0, v0, Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;->next:Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 457
    if-nez v0, :cond_3

    move-object v0, v1

    .line 461
    goto :goto_0
.end method

.method public declared-synchronized getFirst()Lorg/jboss/netty/channel/ChannelHandler;
    .locals 2

    .prologue
    .line 401
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/jboss/netty/channel/DefaultChannelPipeline;->head:Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 402
    .local v0, "head":Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;
    if-nez v0, :cond_0

    .line 403
    const/4 v1, 0x0

    .line 405
    :goto_0
    monitor-exit p0

    return-object v1

    :cond_0
    :try_start_1
    invoke-virtual {v0}, Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;->getHandler()Lorg/jboss/netty/channel/ChannelHandler;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v1

    goto :goto_0

    .line 401
    .end local v0    # "head":Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized getLast()Lorg/jboss/netty/channel/ChannelHandler;
    .locals 2

    .prologue
    .line 409
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lorg/jboss/netty/channel/DefaultChannelPipeline;->tail:Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 410
    .local v0, "tail":Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;
    if-nez v0, :cond_0

    .line 411
    const/4 v1, 0x0

    .line 413
    :goto_0
    monitor-exit p0

    return-object v1

    :cond_0
    :try_start_1
    invoke-virtual {v0}, Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;->getHandler()Lorg/jboss/netty/channel/ChannelHandler;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v1

    goto :goto_0

    .line 409
    .end local v0    # "tail":Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public getNames()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 488
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 489
    .local v1, "list":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iget-object v2, p0, Lorg/jboss/netty/channel/DefaultChannelPipeline;->name2ctx:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 501
    :goto_0
    return-object v1

    .line 493
    :cond_0
    iget-object v0, p0, Lorg/jboss/netty/channel/DefaultChannelPipeline;->head:Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;

    .line 495
    .local v0, "ctx":Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;
    :cond_1
    invoke-virtual {v0}, Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 496
    iget-object v0, v0, Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;->next:Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;

    .line 497
    if-nez v0, :cond_1

    goto :goto_0
.end method

.method public getSink()Lorg/jboss/netty/channel/ChannelSink;
    .locals 1

    .prologue
    .line 51
    iget-object v0, p0, Lorg/jboss/netty/channel/DefaultChannelPipeline;->sink:Lorg/jboss/netty/channel/ChannelSink;

    .line 52
    .local v0, "sink":Lorg/jboss/netty/channel/ChannelSink;
    if-nez v0, :cond_0

    .line 53
    sget-object v0, Lorg/jboss/netty/channel/DefaultChannelPipeline;->discardingSink:Lorg/jboss/netty/channel/ChannelSink;

    .line 55
    .end local v0    # "sink":Lorg/jboss/netty/channel/ChannelSink;
    :cond_0
    return-object v0
.end method

.method public isAttached()Z
    .locals 1

    .prologue
    .line 73
    iget-object v0, p0, Lorg/jboss/netty/channel/DefaultChannelPipeline;->sink:Lorg/jboss/netty/channel/ChannelSink;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected notifyHandlerException(Lorg/jboss/netty/channel/ChannelEvent;Ljava/lang/Throwable;)V
    .locals 5
    .param p1, "e"    # Lorg/jboss/netty/channel/ChannelEvent;
    .param p2, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 640
    instance-of v2, p1, Lorg/jboss/netty/channel/ExceptionEvent;

    if-eqz v2, :cond_1

    .line 641
    sget-object v2, Lorg/jboss/netty/channel/DefaultChannelPipeline;->logger:Lorg/jboss/netty/logging/InternalLogger;

    invoke-interface {v2}, Lorg/jboss/netty/logging/InternalLogger;->isWarnEnabled()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 642
    sget-object v2, Lorg/jboss/netty/channel/DefaultChannelPipeline;->logger:Lorg/jboss/netty/logging/InternalLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "An exception was thrown by a user handler while handling an exception event ("

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const/16 v4, 0x29

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3, p2}, Lorg/jboss/netty/logging/InternalLogger;->warn(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 664
    :cond_0
    :goto_0
    return-void

    .line 651
    :cond_1
    instance-of v2, p2, Lorg/jboss/netty/channel/ChannelPipelineException;

    if-eqz v2, :cond_2

    move-object v1, p2

    .line 652
    check-cast v1, Lorg/jboss/netty/channel/ChannelPipelineException;

    .line 658
    .local v1, "pe":Lorg/jboss/netty/channel/ChannelPipelineException;
    :goto_1
    :try_start_0
    iget-object v2, p0, Lorg/jboss/netty/channel/DefaultChannelPipeline;->sink:Lorg/jboss/netty/channel/ChannelSink;

    invoke-interface {v2, p0, p1, v1}, Lorg/jboss/netty/channel/ChannelSink;->exceptionCaught(Lorg/jboss/netty/channel/ChannelPipeline;Lorg/jboss/netty/channel/ChannelEvent;Lorg/jboss/netty/channel/ChannelPipelineException;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 659
    :catch_0
    move-exception v0

    .line 660
    .local v0, "e1":Ljava/lang/Exception;
    sget-object v2, Lorg/jboss/netty/channel/DefaultChannelPipeline;->logger:Lorg/jboss/netty/logging/InternalLogger;

    invoke-interface {v2}, Lorg/jboss/netty/logging/InternalLogger;->isWarnEnabled()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 661
    sget-object v2, Lorg/jboss/netty/channel/DefaultChannelPipeline;->logger:Lorg/jboss/netty/logging/InternalLogger;

    const-string v3, "An exception was thrown by an exception handler."

    invoke-interface {v2, v3, v0}, Lorg/jboss/netty/logging/InternalLogger;->warn(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 654
    .end local v0    # "e1":Ljava/lang/Exception;
    .end local v1    # "pe":Lorg/jboss/netty/channel/ChannelPipelineException;
    :cond_2
    new-instance v1, Lorg/jboss/netty/channel/ChannelPipelineException;

    invoke-direct {v1, p2}, Lorg/jboss/netty/channel/ChannelPipelineException;-><init>(Ljava/lang/Throwable;)V

    .restart local v1    # "pe":Lorg/jboss/netty/channel/ChannelPipelineException;
    goto :goto_1
.end method

.method public declared-synchronized remove(Ljava/lang/Class;)Lorg/jboss/netty/channel/ChannelHandler;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lorg/jboss/netty/channel/ChannelHandler;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;)TT;"
        }
    .end annotation

    .prologue
    .line 158
    .local p1, "handlerType":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    monitor-enter p0

    :try_start_0
    invoke-direct {p0, p1}, Lorg/jboss/netty/channel/DefaultChannelPipeline;->getContextOrDie(Ljava/lang/Class;)Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/jboss/netty/channel/DefaultChannelPipeline;->remove(Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;)Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;

    move-result-object v0

    invoke-virtual {v0}, Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;->getHandler()Lorg/jboss/netty/channel/ChannelHandler;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized remove(Ljava/lang/String;)Lorg/jboss/netty/channel/ChannelHandler;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 153
    monitor-enter p0

    :try_start_0
    invoke-direct {p0, p1}, Lorg/jboss/netty/channel/DefaultChannelPipeline;->getContextOrDie(Ljava/lang/String;)Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/jboss/netty/channel/DefaultChannelPipeline;->remove(Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;)Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;

    move-result-object v0

    invoke-virtual {v0}, Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;->getHandler()Lorg/jboss/netty/channel/ChannelHandler;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized remove(Lorg/jboss/netty/channel/ChannelHandler;)V
    .locals 1
    .param p1, "handler"    # Lorg/jboss/netty/channel/ChannelHandler;

    .prologue
    .line 149
    monitor-enter p0

    :try_start_0
    invoke-direct {p0, p1}, Lorg/jboss/netty/channel/DefaultChannelPipeline;->getContextOrDie(Lorg/jboss/netty/channel/ChannelHandler;)Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/jboss/netty/channel/DefaultChannelPipeline;->remove(Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;)Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 150
    monitor-exit p0

    return-void

    .line 149
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized removeFirst()Lorg/jboss/netty/channel/ChannelHandler;
    .locals 3

    .prologue
    .line 188
    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lorg/jboss/netty/channel/DefaultChannelPipeline;->name2ctx:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 189
    new-instance v1, Ljava/util/NoSuchElementException;

    invoke-direct {v1}, Ljava/util/NoSuchElementException;-><init>()V

    throw v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 188
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1

    .line 192
    :cond_0
    :try_start_1
    iget-object v0, p0, Lorg/jboss/netty/channel/DefaultChannelPipeline;->head:Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;

    .line 193
    .local v0, "oldHead":Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;
    if-nez v0, :cond_1

    .line 194
    new-instance v1, Ljava/util/NoSuchElementException;

    invoke-direct {v1}, Ljava/util/NoSuchElementException;-><init>()V

    throw v1

    .line 197
    :cond_1
    invoke-static {v0}, Lorg/jboss/netty/channel/DefaultChannelPipeline;->callBeforeRemove(Lorg/jboss/netty/channel/ChannelHandlerContext;)V

    .line 199
    iget-object v1, v0, Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;->next:Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;

    if-nez v1, :cond_2

    .line 200
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/jboss/netty/channel/DefaultChannelPipeline;->tail:Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;

    iput-object v1, p0, Lorg/jboss/netty/channel/DefaultChannelPipeline;->head:Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;

    .line 201
    iget-object v1, p0, Lorg/jboss/netty/channel/DefaultChannelPipeline;->name2ctx:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->clear()V

    .line 208
    :goto_0
    invoke-static {v0}, Lorg/jboss/netty/channel/DefaultChannelPipeline;->callAfterRemove(Lorg/jboss/netty/channel/ChannelHandlerContext;)V

    .line 210
    invoke-virtual {v0}, Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;->getHandler()Lorg/jboss/netty/channel/ChannelHandler;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v1

    monitor-exit p0

    return-object v1

    .line 203
    :cond_2
    :try_start_2
    iget-object v1, v0, Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;->next:Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;

    const/4 v2, 0x0

    iput-object v2, v1, Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;->prev:Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;

    .line 204
    iget-object v1, v0, Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;->next:Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;

    iput-object v1, p0, Lorg/jboss/netty/channel/DefaultChannelPipeline;->head:Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;

    .line 205
    iget-object v1, p0, Lorg/jboss/netty/channel/DefaultChannelPipeline;->name2ctx:Ljava/util/Map;

    invoke-virtual {v0}, Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0
.end method

.method public declared-synchronized removeLast()Lorg/jboss/netty/channel/ChannelHandler;
    .locals 3

    .prologue
    .line 214
    monitor-enter p0

    :try_start_0
    iget-object v1, p0, Lorg/jboss/netty/channel/DefaultChannelPipeline;->name2ctx:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 215
    new-instance v1, Ljava/util/NoSuchElementException;

    invoke-direct {v1}, Ljava/util/NoSuchElementException;-><init>()V

    throw v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 214
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1

    .line 218
    :cond_0
    :try_start_1
    iget-object v0, p0, Lorg/jboss/netty/channel/DefaultChannelPipeline;->tail:Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;

    .line 219
    .local v0, "oldTail":Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;
    if-nez v0, :cond_1

    .line 220
    new-instance v1, Ljava/util/NoSuchElementException;

    invoke-direct {v1}, Ljava/util/NoSuchElementException;-><init>()V

    throw v1

    .line 223
    :cond_1
    invoke-static {v0}, Lorg/jboss/netty/channel/DefaultChannelPipeline;->callBeforeRemove(Lorg/jboss/netty/channel/ChannelHandlerContext;)V

    .line 225
    iget-object v1, v0, Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;->prev:Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;

    if-nez v1, :cond_2

    .line 226
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/jboss/netty/channel/DefaultChannelPipeline;->tail:Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;

    iput-object v1, p0, Lorg/jboss/netty/channel/DefaultChannelPipeline;->head:Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;

    .line 227
    iget-object v1, p0, Lorg/jboss/netty/channel/DefaultChannelPipeline;->name2ctx:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->clear()V

    .line 234
    :goto_0
    invoke-static {v0}, Lorg/jboss/netty/channel/DefaultChannelPipeline;->callAfterRemove(Lorg/jboss/netty/channel/ChannelHandlerContext;)V

    .line 236
    invoke-virtual {v0}, Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;->getHandler()Lorg/jboss/netty/channel/ChannelHandler;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v1

    monitor-exit p0

    return-object v1

    .line 229
    :cond_2
    :try_start_2
    iget-object v1, v0, Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;->prev:Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;

    const/4 v2, 0x0

    iput-object v2, v1, Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;->next:Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;

    .line 230
    iget-object v1, v0, Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;->prev:Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;

    iput-object v1, p0, Lorg/jboss/netty/channel/DefaultChannelPipeline;->tail:Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;

    .line 231
    iget-object v1, p0, Lorg/jboss/netty/channel/DefaultChannelPipeline;->name2ctx:Ljava/util/Map;

    invoke-virtual {v0}, Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0
.end method

.method public declared-synchronized replace(Ljava/lang/Class;Ljava/lang/String;Lorg/jboss/netty/channel/ChannelHandler;)Lorg/jboss/netty/channel/ChannelHandler;
    .locals 1
    .param p2, "newName"    # Ljava/lang/String;
    .param p3, "newHandler"    # Lorg/jboss/netty/channel/ChannelHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T::",
            "Lorg/jboss/netty/channel/ChannelHandler;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;",
            "Ljava/lang/String;",
            "Lorg/jboss/netty/channel/ChannelHandler;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 250
    .local p1, "oldHandlerType":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    monitor-enter p0

    :try_start_0
    invoke-direct {p0, p1}, Lorg/jboss/netty/channel/DefaultChannelPipeline;->getContextOrDie(Ljava/lang/Class;)Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;

    move-result-object v0

    invoke-direct {p0, v0, p2, p3}, Lorg/jboss/netty/channel/DefaultChannelPipeline;->replace(Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;Ljava/lang/String;Lorg/jboss/netty/channel/ChannelHandler;)Lorg/jboss/netty/channel/ChannelHandler;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized replace(Ljava/lang/String;Ljava/lang/String;Lorg/jboss/netty/channel/ChannelHandler;)Lorg/jboss/netty/channel/ChannelHandler;
    .locals 1
    .param p1, "oldName"    # Ljava/lang/String;
    .param p2, "newName"    # Ljava/lang/String;
    .param p3, "newHandler"    # Lorg/jboss/netty/channel/ChannelHandler;

    .prologue
    .line 244
    monitor-enter p0

    :try_start_0
    invoke-direct {p0, p1}, Lorg/jboss/netty/channel/DefaultChannelPipeline;->getContextOrDie(Ljava/lang/String;)Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;

    move-result-object v0

    invoke-direct {p0, v0, p2, p3}, Lorg/jboss/netty/channel/DefaultChannelPipeline;->replace(Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;Ljava/lang/String;Lorg/jboss/netty/channel/ChannelHandler;)Lorg/jboss/netty/channel/ChannelHandler;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized replace(Lorg/jboss/netty/channel/ChannelHandler;Ljava/lang/String;Lorg/jboss/netty/channel/ChannelHandler;)V
    .locals 1
    .param p1, "oldHandler"    # Lorg/jboss/netty/channel/ChannelHandler;
    .param p2, "newName"    # Ljava/lang/String;
    .param p3, "newHandler"    # Lorg/jboss/netty/channel/ChannelHandler;

    .prologue
    .line 240
    monitor-enter p0

    :try_start_0
    invoke-direct {p0, p1}, Lorg/jboss/netty/channel/DefaultChannelPipeline;->getContextOrDie(Lorg/jboss/netty/channel/ChannelHandler;)Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;

    move-result-object v0

    invoke-direct {p0, v0, p2, p3}, Lorg/jboss/netty/channel/DefaultChannelPipeline;->replace(Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;Ljava/lang/String;Lorg/jboss/netty/channel/ChannelHandler;)Lorg/jboss/netty/channel/ChannelHandler;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 241
    monitor-exit p0

    return-void

    .line 240
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public sendDownstream(Lorg/jboss/netty/channel/ChannelEvent;)V
    .locals 3
    .param p1, "e"    # Lorg/jboss/netty/channel/ChannelEvent;

    .prologue
    .line 571
    iget-object v2, p0, Lorg/jboss/netty/channel/DefaultChannelPipeline;->tail:Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;

    invoke-direct {p0, v2}, Lorg/jboss/netty/channel/DefaultChannelPipeline;->getActualDownstreamContext(Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;)Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;

    move-result-object v1

    .line 572
    .local v1, "tail":Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;
    if-nez v1, :cond_0

    .line 574
    :try_start_0
    invoke-virtual {p0}, Lorg/jboss/netty/channel/DefaultChannelPipeline;->getSink()Lorg/jboss/netty/channel/ChannelSink;

    move-result-object v2

    invoke-interface {v2, p0, p1}, Lorg/jboss/netty/channel/ChannelSink;->eventSunk(Lorg/jboss/netty/channel/ChannelPipeline;Lorg/jboss/netty/channel/ChannelEvent;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 583
    :goto_0
    return-void

    .line 576
    :catch_0
    move-exception v0

    .line 577
    .local v0, "t":Ljava/lang/Throwable;
    invoke-virtual {p0, p1, v0}, Lorg/jboss/netty/channel/DefaultChannelPipeline;->notifyHandlerException(Lorg/jboss/netty/channel/ChannelEvent;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 582
    .end local v0    # "t":Ljava/lang/Throwable;
    :cond_0
    invoke-virtual {p0, v1, p1}, Lorg/jboss/netty/channel/DefaultChannelPipeline;->sendDownstream(Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;Lorg/jboss/netty/channel/ChannelEvent;)V

    goto :goto_0
.end method

.method sendDownstream(Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;Lorg/jboss/netty/channel/ChannelEvent;)V
    .locals 3
    .param p1, "ctx"    # Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;
    .param p2, "e"    # Lorg/jboss/netty/channel/ChannelEvent;

    .prologue
    .line 586
    instance-of v1, p2, Lorg/jboss/netty/channel/UpstreamMessageEvent;

    if-eqz v1, :cond_0

    .line 587
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "cannot send an upstream event to downstream"

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 591
    :cond_0
    :try_start_0
    invoke-virtual {p1}, Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;->getHandler()Lorg/jboss/netty/channel/ChannelHandler;

    move-result-object v1

    check-cast v1, Lorg/jboss/netty/channel/ChannelDownstreamHandler;

    invoke-interface {v1, p1, p2}, Lorg/jboss/netty/channel/ChannelDownstreamHandler;->handleDownstream(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelEvent;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 601
    :goto_0
    return-void

    .line 592
    :catch_0
    move-exception v0

    .line 598
    .local v0, "t":Ljava/lang/Throwable;
    invoke-interface {p2}, Lorg/jboss/netty/channel/ChannelEvent;->getFuture()Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v1

    invoke-interface {v1, v0}, Lorg/jboss/netty/channel/ChannelFuture;->setFailure(Ljava/lang/Throwable;)Z

    .line 599
    invoke-virtual {p0, p2, v0}, Lorg/jboss/netty/channel/DefaultChannelPipeline;->notifyHandlerException(Lorg/jboss/netty/channel/ChannelEvent;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public sendUpstream(Lorg/jboss/netty/channel/ChannelEvent;)V
    .locals 4
    .param p1, "e"    # Lorg/jboss/netty/channel/ChannelEvent;

    .prologue
    .line 549
    iget-object v1, p0, Lorg/jboss/netty/channel/DefaultChannelPipeline;->head:Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;

    invoke-direct {p0, v1}, Lorg/jboss/netty/channel/DefaultChannelPipeline;->getActualUpstreamContext(Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;)Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;

    move-result-object v0

    .line 550
    .local v0, "head":Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;
    if-nez v0, :cond_1

    .line 551
    sget-object v1, Lorg/jboss/netty/channel/DefaultChannelPipeline;->logger:Lorg/jboss/netty/logging/InternalLogger;

    invoke-interface {v1}, Lorg/jboss/netty/logging/InternalLogger;->isWarnEnabled()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 552
    sget-object v1, Lorg/jboss/netty/channel/DefaultChannelPipeline;->logger:Lorg/jboss/netty/logging/InternalLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "The pipeline contains no upstream handlers; discarding: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lorg/jboss/netty/logging/InternalLogger;->warn(Ljava/lang/String;)V

    .line 560
    :cond_0
    :goto_0
    return-void

    .line 559
    :cond_1
    invoke-virtual {p0, v0, p1}, Lorg/jboss/netty/channel/DefaultChannelPipeline;->sendUpstream(Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;Lorg/jboss/netty/channel/ChannelEvent;)V

    goto :goto_0
.end method

.method sendUpstream(Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;Lorg/jboss/netty/channel/ChannelEvent;)V
    .locals 2
    .param p1, "ctx"    # Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;
    .param p2, "e"    # Lorg/jboss/netty/channel/ChannelEvent;

    .prologue
    .line 564
    :try_start_0
    invoke-virtual {p1}, Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;->getHandler()Lorg/jboss/netty/channel/ChannelHandler;

    move-result-object v1

    check-cast v1, Lorg/jboss/netty/channel/ChannelUpstreamHandler;

    invoke-interface {v1, p1, p2}, Lorg/jboss/netty/channel/ChannelUpstreamHandler;->handleUpstream(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelEvent;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 568
    :goto_0
    return-void

    .line 565
    :catch_0
    move-exception v0

    .line 566
    .local v0, "t":Ljava/lang/Throwable;
    invoke-virtual {p0, p2, v0}, Lorg/jboss/netty/channel/DefaultChannelPipeline;->notifyHandlerException(Lorg/jboss/netty/channel/ChannelEvent;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public toMap()Ljava/util/Map;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/jboss/netty/channel/ChannelHandler;",
            ">;"
        }
    .end annotation

    .prologue
    .line 505
    new-instance v1, Ljava/util/LinkedHashMap;

    invoke-direct {v1}, Ljava/util/LinkedHashMap;-><init>()V

    .line 506
    .local v1, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lorg/jboss/netty/channel/ChannelHandler;>;"
    iget-object v2, p0, Lorg/jboss/netty/channel/DefaultChannelPipeline;->name2ctx:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 518
    :goto_0
    return-object v1

    .line 510
    :cond_0
    iget-object v0, p0, Lorg/jboss/netty/channel/DefaultChannelPipeline;->head:Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;

    .line 512
    .local v0, "ctx":Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;
    :cond_1
    invoke-virtual {v0}, Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0}, Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;->getHandler()Lorg/jboss/netty/channel/ChannelHandler;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 513
    iget-object v0, v0, Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;->next:Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;

    .line 514
    if-nez v0, :cond_1

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 526
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 527
    .local v0, "buf":Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 528
    const/16 v2, 0x7b

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 529
    iget-object v1, p0, Lorg/jboss/netty/channel/DefaultChannelPipeline;->head:Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;

    .line 530
    .local v1, "ctx":Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;
    if-eqz v1, :cond_0

    .line 532
    :goto_0
    const/16 v2, 0x28

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 533
    invoke-virtual {v1}, Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 534
    const-string v2, " = "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 535
    invoke-virtual {v1}, Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;->getHandler()Lorg/jboss/netty/channel/ChannelHandler;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 536
    const/16 v2, 0x29

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 537
    iget-object v1, v1, Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;->next:Lorg/jboss/netty/channel/DefaultChannelPipeline$DefaultChannelHandlerContext;

    .line 538
    if-nez v1, :cond_1

    .line 544
    :cond_0
    const/16 v2, 0x7d

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 545
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    return-object v2

    .line 541
    :cond_1
    const-string v2, ", "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0
.end method
