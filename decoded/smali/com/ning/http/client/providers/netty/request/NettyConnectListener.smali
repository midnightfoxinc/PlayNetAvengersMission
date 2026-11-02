.class public final Lcom/ning/http/client/providers/netty/request/NettyConnectListener;
.super Ljava/lang/Object;
.source "NettyConnectListener.java"

# interfaces
.implements Lorg/jboss/netty/channel/ChannelFutureListener;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lorg/jboss/netty/channel/ChannelFutureListener;"
    }
.end annotation


# static fields
.field private static final LOGGER:Lorg/slf4j/Logger;


# instance fields
.field private final channelManager:Lcom/ning/http/client/providers/netty/channel/ChannelManager;

.field private final channelPreempted:Z

.field private final future:Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture",
            "<TT;>;"
        }
    .end annotation
.end field

.field private final partition:Ljava/lang/String;

.field private final requestSender:Lcom/ning/http/client/providers/netty/request/NettyRequestSender;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 36
    const-class v0, Lcom/ning/http/client/providers/netty/request/NettyConnectListener;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    sput-object v0, Lcom/ning/http/client/providers/netty/request/NettyConnectListener;->LOGGER:Lorg/slf4j/Logger;

    return-void
.end method

.method public constructor <init>(Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Lcom/ning/http/client/providers/netty/request/NettyRequestSender;Lcom/ning/http/client/providers/netty/channel/ChannelManager;ZLjava/lang/String;)V
    .locals 0
    .param p2, "requestSender"    # Lcom/ning/http/client/providers/netty/request/NettyRequestSender;
    .param p3, "channelManager"    # Lcom/ning/http/client/providers/netty/channel/ChannelManager;
    .param p4, "channelPreempted"    # Z
    .param p5, "partition"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture",
            "<TT;>;",
            "Lcom/ning/http/client/providers/netty/request/NettyRequestSender;",
            "Lcom/ning/http/client/providers/netty/channel/ChannelManager;",
            "Z",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 47
    .local p0, "this":Lcom/ning/http/client/providers/netty/request/NettyConnectListener;, "Lcom/ning/http/client/providers/netty/request/NettyConnectListener<TT;>;"
    .local p1, "future":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    iput-object p1, p0, Lcom/ning/http/client/providers/netty/request/NettyConnectListener;->future:Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;

    .line 49
    iput-object p2, p0, Lcom/ning/http/client/providers/netty/request/NettyConnectListener;->requestSender:Lcom/ning/http/client/providers/netty/request/NettyRequestSender;

    .line 50
    iput-object p3, p0, Lcom/ning/http/client/providers/netty/request/NettyConnectListener;->channelManager:Lcom/ning/http/client/providers/netty/channel/ChannelManager;

    .line 51
    iput-boolean p4, p0, Lcom/ning/http/client/providers/netty/request/NettyConnectListener;->channelPreempted:Z

    .line 52
    iput-object p5, p0, Lcom/ning/http/client/providers/netty/request/NettyConnectListener;->partition:Ljava/lang/String;

    .line 53
    return-void
.end method

.method private abortChannelPreemption(Ljava/lang/String;)V
    .locals 1
    .param p1, "partition"    # Ljava/lang/String;

    .prologue
    .line 60
    .local p0, "this":Lcom/ning/http/client/providers/netty/request/NettyConnectListener;, "Lcom/ning/http/client/providers/netty/request/NettyConnectListener<TT;>;"
    iget-boolean v0, p0, Lcom/ning/http/client/providers/netty/request/NettyConnectListener;->channelPreempted:Z

    if-eqz v0, :cond_0

    .line 61
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/request/NettyConnectListener;->channelManager:Lcom/ning/http/client/providers/netty/channel/ChannelManager;

    invoke-virtual {v0, p1}, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->abortChannelPreemption(Ljava/lang/String;)V

    .line 62
    :cond_0
    return-void
.end method

.method private onFutureFailure(Lorg/jboss/netty/channel/Channel;Ljava/lang/Throwable;)V
    .locals 7
    .param p1, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p2, "cause"    # Ljava/lang/Throwable;

    .prologue
    .line 87
    .local p0, "this":Lcom/ning/http/client/providers/netty/request/NettyConnectListener;, "Lcom/ning/http/client/providers/netty/request/NettyConnectListener<TT;>;"
    iget-object v4, p0, Lcom/ning/http/client/providers/netty/request/NettyConnectListener;->partition:Ljava/lang/String;

    invoke-direct {p0, v4}, Lcom/ning/http/client/providers/netty/request/NettyConnectListener;->abortChannelPreemption(Ljava/lang/String;)V

    .line 89
    iget-object v4, p0, Lcom/ning/http/client/providers/netty/request/NettyConnectListener;->future:Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;

    invoke-virtual {v4}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->canRetry()Z

    move-result v0

    .line 90
    .local v0, "canRetry":Z
    sget-object v4, Lcom/ning/http/client/providers/netty/request/NettyConnectListener;->LOGGER:Lorg/slf4j/Logger;

    const-string v5, "Trying to recover from failing to connect channel {} with a retry value of {} "

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    invoke-interface {v4, v5, p1, v6}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 91
    if-eqz v0, :cond_1

    if-eqz p2, :cond_1

    iget-object v4, p0, Lcom/ning/http/client/providers/netty/request/NettyConnectListener;->future:Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;

    invoke-virtual {v4}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->getState()Lcom/ning/http/client/providers/netty/future/NettyResponseFuture$STATE;

    move-result-object v4

    sget-object v5, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture$STATE;->NEW:Lcom/ning/http/client/providers/netty/future/NettyResponseFuture$STATE;

    if-ne v4, v5, :cond_0

    invoke-static {p2}, Lcom/ning/http/client/providers/netty/future/StackTraceInspector;->recoverOnDisconnectException(Ljava/lang/Throwable;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 95
    :cond_0
    iget-object v4, p0, Lcom/ning/http/client/providers/netty/request/NettyConnectListener;->requestSender:Lcom/ning/http/client/providers/netty/request/NettyRequestSender;

    iget-object v5, p0, Lcom/ning/http/client/providers/netty/request/NettyConnectListener;->future:Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;

    invoke-virtual {v4, v5}, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->retry(Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 108
    :goto_0
    return-void

    .line 99
    :cond_1
    sget-object v4, Lcom/ning/http/client/providers/netty/request/NettyConnectListener;->LOGGER:Lorg/slf4j/Logger;

    const-string v5, "Failed to recover from connect exception: {} with channel {}"

    invoke-interface {v4, v5, p2, p1}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 101
    if-eqz p2, :cond_3

    invoke-virtual {p2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_3

    const/4 v2, 0x1

    .line 102
    .local v2, "printCause":Z
    :goto_1
    if-eqz v2, :cond_4

    invoke-virtual {p2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v3

    .line 103
    .local v3, "printedCause":Ljava/lang/String;
    :goto_2
    new-instance v1, Ljava/net/ConnectException;

    invoke-direct {v1, v3}, Ljava/net/ConnectException;-><init>(Ljava/lang/String;)V

    .line 104
    .local v1, "e":Ljava/net/ConnectException;
    if-eqz p2, :cond_2

    .line 105
    invoke-virtual {v1, p2}, Ljava/net/ConnectException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 107
    :cond_2
    iget-object v4, p0, Lcom/ning/http/client/providers/netty/request/NettyConnectListener;->future:Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;

    invoke-virtual {v4, v1}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->abort(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 101
    .end local v1    # "e":Ljava/net/ConnectException;
    .end local v2    # "printCause":Z
    .end local v3    # "printedCause":Ljava/lang/String;
    :cond_3
    const/4 v2, 0x0

    goto :goto_1

    .line 102
    .restart local v2    # "printCause":Z
    :cond_4
    iget-object v4, p0, Lcom/ning/http/client/providers/netty/request/NettyConnectListener;->future:Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;

    invoke-virtual {v4}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->getUri()Lcom/ning/http/client/uri/Uri;

    move-result-object v4

    invoke-static {v4}, Lcom/ning/http/util/AsyncHttpProviderUtils;->getBaseUrl(Lcom/ning/http/client/uri/Uri;)Ljava/lang/String;

    move-result-object v3

    goto :goto_2
.end method

.method private onFutureSuccess(Lorg/jboss/netty/channel/Channel;)V
    .locals 1
    .param p1, "channel"    # Lorg/jboss/netty/channel/Channel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/ConnectException;
        }
    .end annotation

    .prologue
    .line 82
    .local p0, "this":Lcom/ning/http/client/providers/netty/request/NettyConnectListener;, "Lcom/ning/http/client/providers/netty/request/NettyConnectListener<TT;>;"
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/request/NettyConnectListener;->future:Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;

    invoke-static {p1, v0}, Lcom/ning/http/client/providers/netty/channel/Channels;->setAttribute(Lorg/jboss/netty/channel/Channel;Ljava/lang/Object;)V

    .line 83
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/request/NettyConnectListener;->partition:Ljava/lang/String;

    invoke-direct {p0, p1, v0}, Lcom/ning/http/client/providers/netty/request/NettyConnectListener;->writeRequest(Lorg/jboss/netty/channel/Channel;Ljava/lang/String;)V

    .line 84
    return-void
.end method

.method private writeRequest(Lorg/jboss/netty/channel/Channel;Ljava/lang/String;)V
    .locals 3
    .param p1, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p2, "partition"    # Ljava/lang/String;

    .prologue
    .line 66
    .local p0, "this":Lcom/ning/http/client/providers/netty/request/NettyConnectListener;, "Lcom/ning/http/client/providers/netty/request/NettyConnectListener<TT;>;"
    sget-object v0, Lcom/ning/http/client/providers/netty/request/NettyConnectListener;->LOGGER:Lorg/slf4j/Logger;

    const-string v1, "Request using non cached Channel \'{}\':\n{}\n"

    iget-object v2, p0, Lcom/ning/http/client/providers/netty/request/NettyConnectListener;->future:Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;

    invoke-virtual {v2}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->getNettyRequest()Lcom/ning/http/client/providers/netty/request/NettyRequest;

    move-result-object v2

    invoke-virtual {v2}, Lcom/ning/http/client/providers/netty/request/NettyRequest;->getHttpRequest()Lorg/jboss/netty/handler/codec/http/HttpRequest;

    move-result-object v2

    invoke-interface {v0, v1, p1, v2}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 68
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/request/NettyConnectListener;->future:Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;

    invoke-virtual {v0}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->isDone()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 69
    invoke-direct {p0, p2}, Lcom/ning/http/client/providers/netty/request/NettyConnectListener;->abortChannelPreemption(Ljava/lang/String;)V

    .line 79
    :goto_0
    return-void

    .line 73
    :cond_0
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/request/NettyConnectListener;->future:Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;

    invoke-virtual {v0}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->getAsyncHandler()Lcom/ning/http/client/AsyncHandler;

    move-result-object v0

    instance-of v0, v0, Lcom/ning/http/client/AsyncHandlerExtensions;

    if-eqz v0, :cond_1

    .line 74
    const-class v0, Lcom/ning/http/client/AsyncHandlerExtensions;

    iget-object v1, p0, Lcom/ning/http/client/providers/netty/request/NettyConnectListener;->future:Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;

    invoke-virtual {v1}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->getAsyncHandler()Lcom/ning/http/client/AsyncHandler;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/AsyncHandlerExtensions;

    invoke-interface {v0}, Lcom/ning/http/client/AsyncHandlerExtensions;->onConnectionOpen()V

    .line 76
    :cond_1
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/request/NettyConnectListener;->channelManager:Lcom/ning/http/client/providers/netty/channel/ChannelManager;

    invoke-virtual {v0, p1, p2}, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->registerOpenChannel(Lorg/jboss/netty/channel/Channel;Ljava/lang/String;)V

    .line 77
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/request/NettyConnectListener;->future:Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->attachChannel(Lorg/jboss/netty/channel/Channel;Z)V

    .line 78
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/request/NettyConnectListener;->requestSender:Lcom/ning/http/client/providers/netty/request/NettyRequestSender;

    iget-object v1, p0, Lcom/ning/http/client/providers/netty/request/NettyConnectListener;->future:Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;

    invoke-virtual {v0, v1, p1}, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->writeRequest(Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Lorg/jboss/netty/channel/Channel;)V

    goto :goto_0
.end method


# virtual methods
.method public future()Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 56
    .local p0, "this":Lcom/ning/http/client/providers/netty/request/NettyConnectListener;, "Lcom/ning/http/client/providers/netty/request/NettyConnectListener<TT;>;"
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/request/NettyConnectListener;->future:Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;

    return-object v0
.end method

.method public final operationComplete(Lorg/jboss/netty/channel/ChannelFuture;)V
    .locals 2
    .param p1, "f"    # Lorg/jboss/netty/channel/ChannelFuture;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 111
    .local p0, "this":Lcom/ning/http/client/providers/netty/request/NettyConnectListener;, "Lcom/ning/http/client/providers/netty/request/NettyConnectListener<TT;>;"
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelFuture;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v0

    .line 112
    .local v0, "channel":Lorg/jboss/netty/channel/Channel;
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelFuture;->isSuccess()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 113
    invoke-direct {p0, v0}, Lcom/ning/http/client/providers/netty/request/NettyConnectListener;->onFutureSuccess(Lorg/jboss/netty/channel/Channel;)V

    .line 116
    :goto_0
    return-void

    .line 115
    :cond_0
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelFuture;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lcom/ning/http/client/providers/netty/request/NettyConnectListener;->onFutureFailure(Lorg/jboss/netty/channel/Channel;Ljava/lang/Throwable;)V

    goto :goto_0
.end method
