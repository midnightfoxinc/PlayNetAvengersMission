.class Lorg/jboss/netty/logging/CommonsLogger;
.super Lorg/jboss/netty/logging/AbstractInternalLogger;
.source "CommonsLogger.java"


# instance fields
.field private final logger:Lorg/apache/commons/logging/Log;

.field private final loggerName:Ljava/lang/String;


# direct methods
.method constructor <init>(Lorg/apache/commons/logging/Log;Ljava/lang/String;)V
    .locals 0
    .param p1, "logger"    # Lorg/apache/commons/logging/Log;
    .param p2, "loggerName"    # Ljava/lang/String;

    .prologue
    .line 29
    invoke-direct {p0}, Lorg/jboss/netty/logging/AbstractInternalLogger;-><init>()V

    .line 30
    iput-object p1, p0, Lorg/jboss/netty/logging/CommonsLogger;->logger:Lorg/apache/commons/logging/Log;

    .line 31
    iput-object p2, p0, Lorg/jboss/netty/logging/CommonsLogger;->loggerName:Ljava/lang/String;

    .line 32
    return-void
.end method


# virtual methods
.method public debug(Ljava/lang/String;)V
    .locals 1
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 35
    iget-object v0, p0, Lorg/jboss/netty/logging/CommonsLogger;->logger:Lorg/apache/commons/logging/Log;

    invoke-interface {v0, p1}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 36
    return-void
.end method

.method public debug(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "cause"    # Ljava/lang/Throwable;

    .prologue
    .line 39
    iget-object v0, p0, Lorg/jboss/netty/logging/CommonsLogger;->logger:Lorg/apache/commons/logging/Log;

    invoke-interface {v0, p1, p2}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 40
    return-void
.end method

.method public error(Ljava/lang/String;)V
    .locals 1
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 43
    iget-object v0, p0, Lorg/jboss/netty/logging/CommonsLogger;->logger:Lorg/apache/commons/logging/Log;

    invoke-interface {v0, p1}, Lorg/apache/commons/logging/Log;->error(Ljava/lang/Object;)V

    .line 44
    return-void
.end method

.method public error(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "cause"    # Ljava/lang/Throwable;

    .prologue
    .line 47
    iget-object v0, p0, Lorg/jboss/netty/logging/CommonsLogger;->logger:Lorg/apache/commons/logging/Log;

    invoke-interface {v0, p1, p2}, Lorg/apache/commons/logging/Log;->error(Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 48
    return-void
.end method

.method public info(Ljava/lang/String;)V
    .locals 1
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 51
    iget-object v0, p0, Lorg/jboss/netty/logging/CommonsLogger;->logger:Lorg/apache/commons/logging/Log;

    invoke-interface {v0, p1}, Lorg/apache/commons/logging/Log;->info(Ljava/lang/Object;)V

    .line 52
    return-void
.end method

.method public info(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "cause"    # Ljava/lang/Throwable;

    .prologue
    .line 55
    iget-object v0, p0, Lorg/jboss/netty/logging/CommonsLogger;->logger:Lorg/apache/commons/logging/Log;

    invoke-interface {v0, p1, p2}, Lorg/apache/commons/logging/Log;->info(Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 56
    return-void
.end method

.method public isDebugEnabled()Z
    .locals 1

    .prologue
    .line 59
    iget-object v0, p0, Lorg/jboss/netty/logging/CommonsLogger;->logger:Lorg/apache/commons/logging/Log;

    invoke-interface {v0}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v0

    return v0
.end method

.method public isErrorEnabled()Z
    .locals 1

    .prologue
    .line 63
    iget-object v0, p0, Lorg/jboss/netty/logging/CommonsLogger;->logger:Lorg/apache/commons/logging/Log;

    invoke-interface {v0}, Lorg/apache/commons/logging/Log;->isErrorEnabled()Z

    move-result v0

    return v0
.end method

.method public isInfoEnabled()Z
    .locals 1

    .prologue
    .line 67
    iget-object v0, p0, Lorg/jboss/netty/logging/CommonsLogger;->logger:Lorg/apache/commons/logging/Log;

    invoke-interface {v0}, Lorg/apache/commons/logging/Log;->isInfoEnabled()Z

    move-result v0

    return v0
.end method

.method public isWarnEnabled()Z
    .locals 1

    .prologue
    .line 71
    iget-object v0, p0, Lorg/jboss/netty/logging/CommonsLogger;->logger:Lorg/apache/commons/logging/Log;

    invoke-interface {v0}, Lorg/apache/commons/logging/Log;->isWarnEnabled()Z

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 84
    iget-object v0, p0, Lorg/jboss/netty/logging/CommonsLogger;->loggerName:Ljava/lang/String;

    return-object v0
.end method

.method public warn(Ljava/lang/String;)V
    .locals 1
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 75
    iget-object v0, p0, Lorg/jboss/netty/logging/CommonsLogger;->logger:Lorg/apache/commons/logging/Log;

    invoke-interface {v0, p1}, Lorg/apache/commons/logging/Log;->warn(Ljava/lang/Object;)V

    .line 76
    return-void
.end method

.method public warn(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 1
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "cause"    # Ljava/lang/Throwable;

    .prologue
    .line 79
    iget-object v0, p0, Lorg/jboss/netty/logging/CommonsLogger;->logger:Lorg/apache/commons/logging/Log;

    invoke-interface {v0, p1, p2}, Lorg/apache/commons/logging/Log;->warn(Ljava/lang/Object;Ljava/lang/Throwable;)V

    .line 80
    return-void
.end method
