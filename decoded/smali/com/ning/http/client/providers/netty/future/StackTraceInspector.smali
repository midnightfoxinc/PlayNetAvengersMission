.class public Lcom/ning/http/client/providers/netty/future/StackTraceInspector;
.super Ljava/lang/Object;
.source "StackTraceInspector.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static exceptionInMethod(Ljava/lang/Throwable;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 5
    .param p0, "t"    # Ljava/lang/Throwable;
    .param p1, "className"    # Ljava/lang/String;
    .param p2, "methodName"    # Ljava/lang/String;

    .prologue
    .line 22
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Throwable;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v0

    .local v0, "arr$":[Ljava/lang/StackTraceElement;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_0
    if-ge v2, v3, :cond_1

    aget-object v1, v0, v2

    .line 23
    .local v1, "element":Ljava/lang/StackTraceElement;
    invoke-virtual {v1}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-virtual {v1}, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result v4

    if-eqz v4, :cond_0

    .line 24
    const/4 v4, 0x1

    .line 28
    .end local v0    # "arr$":[Ljava/lang/StackTraceElement;
    .end local v1    # "element":Ljava/lang/StackTraceElement;
    .end local v2    # "i$":I
    .end local v3    # "len$":I
    :goto_1
    return v4

    .line 22
    .restart local v0    # "arr$":[Ljava/lang/StackTraceElement;
    .restart local v1    # "element":Ljava/lang/StackTraceElement;
    .restart local v2    # "i$":I
    .restart local v3    # "len$":I
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 26
    .end local v0    # "arr$":[Ljava/lang/StackTraceElement;
    .end local v1    # "element":Ljava/lang/StackTraceElement;
    .end local v2    # "i$":I
    .end local v3    # "len$":I
    :catch_0
    move-exception v4

    .line 28
    :cond_1
    const/4 v4, 0x0

    goto :goto_1
.end method

.method private static recoverOnConnectCloseException(Ljava/lang/Throwable;)Z
    .locals 2
    .param p0, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 32
    const-string v0, "sun.nio.ch.SocketChannelImpl"

    const-string v1, "checkConnect"

    invoke-static {p0, v0, v1}, Lcom/ning/http/client/providers/netty/future/StackTraceInspector;->exceptionInMethod(Ljava/lang/Throwable;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    invoke-static {v0}, Lcom/ning/http/client/providers/netty/future/StackTraceInspector;->recoverOnConnectCloseException(Ljava/lang/Throwable;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static recoverOnDisconnectException(Ljava/lang/Throwable;)Z
    .locals 2
    .param p0, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 37
    instance-of v0, p0, Ljava/nio/channels/ClosedChannelException;

    if-nez v0, :cond_0

    const-string v0, "org.jboss.netty.handler.ssl.SslHandler"

    const-string v1, "channelDisconnected"

    invoke-static {p0, v0, v1}, Lcom/ning/http/client/providers/netty/future/StackTraceInspector;->exceptionInMethod(Ljava/lang/Throwable;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    invoke-static {v0}, Lcom/ning/http/client/providers/netty/future/StackTraceInspector;->recoverOnConnectCloseException(Ljava/lang/Throwable;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static recoverOnReadOrWriteException(Ljava/lang/Throwable;)Z
    .locals 9
    .param p0, "t"    # Ljava/lang/Throwable;

    .prologue
    const/4 v6, 0x1

    .line 44
    instance-of v7, p0, Ljava/io/IOException;

    if-eqz v7, :cond_1

    const-string v7, "Connection reset by peer"

    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 60
    :cond_0
    :goto_0
    return v6

    .line 48
    :cond_1
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Throwable;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v0

    .local v0, "arr$":[Ljava/lang/StackTraceElement;
    array-length v4, v0

    .local v4, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_1
    if-ge v3, v4, :cond_3

    aget-object v2, v0, v3

    .line 49
    .local v2, "element":Ljava/lang/StackTraceElement;
    invoke-virtual {v2}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    move-result-object v1

    .line 50
    .local v1, "className":Ljava/lang/String;
    invoke-virtual {v2}, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;

    move-result-object v5

    .line 51
    .local v5, "methodName":Ljava/lang/String;
    const-string v7, "sun.nio.ch.SocketDispatcher"

    invoke-virtual {v1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_2

    const-string v7, "read"

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_0

    const-string v7, "write"

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result v7

    if-nez v7, :cond_0

    .line 48
    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 54
    .end local v0    # "arr$":[Ljava/lang/StackTraceElement;
    .end local v1    # "className":Ljava/lang/String;
    .end local v2    # "element":Ljava/lang/StackTraceElement;
    .end local v3    # "i$":I
    .end local v4    # "len$":I
    .end local v5    # "methodName":Ljava/lang/String;
    :catch_0
    move-exception v6

    .line 57
    :cond_3
    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v6

    if-eqz v6, :cond_4

    .line 58
    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v6

    invoke-static {v6}, Lcom/ning/http/client/providers/netty/future/StackTraceInspector;->recoverOnReadOrWriteException(Ljava/lang/Throwable;)Z

    move-result v6

    goto :goto_0

    .line 60
    :cond_4
    const/4 v6, 0x0

    goto :goto_0
.end method
