.class final Lorg/jboss/netty/channel/socket/nio/SelectorUtil;
.super Ljava/lang/Object;
.source "SelectorUtil.java"


# static fields
.field static final DEFAULT_IO_THREADS:I

.field static final DEFAULT_SELECT_TIMEOUT:J = 0x1f4L

.field static final EPOLL_BUG_WORKAROUND:Z

.field static final SELECT_TIMEOUT:J

.field static final SELECT_TIMEOUT_NANOS:J

.field private static final logger:Lorg/jboss/netty/logging/InternalLogger;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .prologue
    .line 28
    const-class v3, Lorg/jboss/netty/channel/socket/nio/SelectorUtil;

    invoke-static {v3}, Lorg/jboss/netty/logging/InternalLoggerFactory;->getInstance(Ljava/lang/Class;)Lorg/jboss/netty/logging/InternalLogger;

    move-result-object v3

    sput-object v3, Lorg/jboss/netty/channel/socket/nio/SelectorUtil;->logger:Lorg/jboss/netty/logging/InternalLogger;

    .line 31
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Runtime;->availableProcessors()I

    move-result v3

    mul-int/lit8 v3, v3, 0x2

    sput v3, Lorg/jboss/netty/channel/socket/nio/SelectorUtil;->DEFAULT_IO_THREADS:I

    .line 33
    const-string v3, "org.jboss.netty.selectTimeout"

    const-wide/16 v4, 0x1f4

    invoke-static {v3, v4, v5}, Lorg/jboss/netty/util/internal/SystemPropertyUtil;->getLong(Ljava/lang/String;J)J

    move-result-wide v4

    sput-wide v4, Lorg/jboss/netty/channel/socket/nio/SelectorUtil;->SELECT_TIMEOUT:J

    .line 35
    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    sget-wide v4, Lorg/jboss/netty/channel/socket/nio/SelectorUtil;->SELECT_TIMEOUT:J

    invoke-virtual {v3, v4, v5}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    move-result-wide v4

    sput-wide v4, Lorg/jboss/netty/channel/socket/nio/SelectorUtil;->SELECT_TIMEOUT_NANOS:J

    .line 36
    const-string v3, "org.jboss.netty.epollBugWorkaround"

    const/4 v4, 0x0

    invoke-static {v3, v4}, Lorg/jboss/netty/util/internal/SystemPropertyUtil;->getBoolean(Ljava/lang/String;Z)Z

    move-result v3

    sput-boolean v3, Lorg/jboss/netty/channel/socket/nio/SelectorUtil;->EPOLL_BUG_WORKAROUND:Z

    .line 45
    const-string v2, "sun.nio.ch.bugLevel"

    .line 47
    .local v2, "key":Ljava/lang/String;
    :try_start_0
    invoke-static {v2}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 48
    .local v0, "buglevel":Ljava/lang/String;
    if-nez v0, :cond_0

    .line 49
    const-string v3, ""

    invoke-static {v2, v3}, Ljava/lang/System;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 56
    .end local v0    # "buglevel":Ljava/lang/String;
    :cond_0
    :goto_0
    sget-object v3, Lorg/jboss/netty/channel/socket/nio/SelectorUtil;->logger:Lorg/jboss/netty/logging/InternalLogger;

    invoke-interface {v3}, Lorg/jboss/netty/logging/InternalLogger;->isDebugEnabled()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 57
    sget-object v3, Lorg/jboss/netty/channel/socket/nio/SelectorUtil;->logger:Lorg/jboss/netty/logging/InternalLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Using select timeout of "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-wide v6, Lorg/jboss/netty/channel/socket/nio/SelectorUtil;->SELECT_TIMEOUT:J

    invoke-virtual {v4, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Lorg/jboss/netty/logging/InternalLogger;->debug(Ljava/lang/String;)V

    .line 58
    sget-object v3, Lorg/jboss/netty/channel/socket/nio/SelectorUtil;->logger:Lorg/jboss/netty/logging/InternalLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Epoll-bug workaround enabled = "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-boolean v5, Lorg/jboss/netty/channel/socket/nio/SelectorUtil;->EPOLL_BUG_WORKAROUND:Z

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Lorg/jboss/netty/logging/InternalLogger;->debug(Ljava/lang/String;)V

    .line 60
    :cond_1
    return-void

    .line 51
    :catch_0
    move-exception v1

    .line 52
    .local v1, "e":Ljava/lang/SecurityException;
    sget-object v3, Lorg/jboss/netty/channel/socket/nio/SelectorUtil;->logger:Lorg/jboss/netty/logging/InternalLogger;

    invoke-interface {v3}, Lorg/jboss/netty/logging/InternalLogger;->isDebugEnabled()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 53
    sget-object v3, Lorg/jboss/netty/channel/socket/nio/SelectorUtil;->logger:Lorg/jboss/netty/logging/InternalLogger;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Unable to get/set System Property \'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const/16 v5, 0x27

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4, v1}, Lorg/jboss/netty/logging/InternalLogger;->debug(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 80
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 82
    return-void
.end method

.method static open()Ljava/nio/channels/Selector;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 63
    invoke-static {}, Ljava/nio/channels/Selector;->open()Ljava/nio/channels/Selector;

    move-result-object v0

    return-object v0
.end method

.method static select(Ljava/nio/channels/Selector;)I
    .locals 4
    .param p0, "selector"    # Ljava/nio/channels/Selector;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 68
    :try_start_0
    sget-wide v2, Lorg/jboss/netty/channel/socket/nio/SelectorUtil;->SELECT_TIMEOUT:J

    invoke-virtual {p0, v2, v3}, Ljava/nio/channels/Selector;->select(J)I
    :try_end_0
    .catch Ljava/nio/channels/CancelledKeyException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 77
    :goto_0
    return v1

    .line 69
    :catch_0
    move-exception v0

    .line 70
    .local v0, "e":Ljava/nio/channels/CancelledKeyException;
    sget-object v1, Lorg/jboss/netty/channel/socket/nio/SelectorUtil;->logger:Lorg/jboss/netty/logging/InternalLogger;

    invoke-interface {v1}, Lorg/jboss/netty/logging/InternalLogger;->isDebugEnabled()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 71
    sget-object v1, Lorg/jboss/netty/channel/socket/nio/SelectorUtil;->logger:Lorg/jboss/netty/logging/InternalLogger;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-class v3, Ljava/nio/channels/CancelledKeyException;

    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " raised by a Selector - JDK bug?"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2, v0}, Lorg/jboss/netty/logging/InternalLogger;->debug(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 77
    :cond_0
    const/4 v1, -0x1

    goto :goto_0
.end method
