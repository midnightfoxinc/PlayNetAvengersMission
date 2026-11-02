.class public Lcom/ning/http/client/providers/netty/handler/Processor;
.super Lorg/jboss/netty/channel/SimpleChannelUpstreamHandler;
.source "Processor.java"


# static fields
.field public static final CHANNEL_CLOSED_EXCEPTION:Ljava/io/IOException;

.field private static final LOGGER:Lorg/slf4j/Logger;


# instance fields
.field private final channelManager:Lcom/ning/http/client/providers/netty/channel/ChannelManager;

.field private final config:Lcom/ning/http/client/AsyncHttpClientConfig;

.field private final protocol:Lcom/ning/http/client/providers/netty/handler/Protocol;

.field private final requestSender:Lcom/ning/http/client/providers/netty/request/NettyRequestSender;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 41
    const-class v0, Lcom/ning/http/client/providers/netty/handler/Processor;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    sput-object v0, Lcom/ning/http/client/providers/netty/handler/Processor;->LOGGER:Lorg/slf4j/Logger;

    .line 43
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Channel closed"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/ning/http/client/providers/netty/handler/Processor;->CHANNEL_CLOSED_EXCEPTION:Ljava/io/IOException;

    .line 45
    sget-object v0, Lcom/ning/http/client/providers/netty/handler/Processor;->CHANNEL_CLOSED_EXCEPTION:Ljava/io/IOException;

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/StackTraceElement;

    invoke-virtual {v0, v1}, Ljava/io/IOException;->setStackTrace([Ljava/lang/StackTraceElement;)V

    .line 46
    return-void
.end method

.method public constructor <init>(Lcom/ning/http/client/AsyncHttpClientConfig;Lcom/ning/http/client/providers/netty/channel/ChannelManager;Lcom/ning/http/client/providers/netty/request/NettyRequestSender;Lcom/ning/http/client/providers/netty/handler/Protocol;)V
    .locals 0
    .param p1, "config"    # Lcom/ning/http/client/AsyncHttpClientConfig;
    .param p2, "channelManager"    # Lcom/ning/http/client/providers/netty/channel/ChannelManager;
    .param p3, "requestSender"    # Lcom/ning/http/client/providers/netty/request/NettyRequestSender;
    .param p4, "protocol"    # Lcom/ning/http/client/providers/netty/handler/Protocol;

    .prologue
    .line 56
    invoke-direct {p0}, Lorg/jboss/netty/channel/SimpleChannelUpstreamHandler;-><init>()V

    .line 57
    iput-object p1, p0, Lcom/ning/http/client/providers/netty/handler/Processor;->config:Lcom/ning/http/client/AsyncHttpClientConfig;

    .line 58
    iput-object p2, p0, Lcom/ning/http/client/providers/netty/handler/Processor;->channelManager:Lcom/ning/http/client/providers/netty/channel/ChannelManager;

    .line 59
    iput-object p3, p0, Lcom/ning/http/client/providers/netty/handler/Processor;->requestSender:Lcom/ning/http/client/providers/netty/request/NettyRequestSender;

    .line 60
    iput-object p4, p0, Lcom/ning/http/client/providers/netty/handler/Processor;->protocol:Lcom/ning/http/client/providers/netty/handler/Protocol;

    .line 61
    return-void
.end method


# virtual methods
.method public channelClosed(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelStateEvent;)V
    .locals 7
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "e"    # Lorg/jboss/netty/channel/ChannelStateEvent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 101
    iget-object v5, p0, Lcom/ning/http/client/providers/netty/handler/Processor;->requestSender:Lcom/ning/http/client/providers/netty/request/NettyRequestSender;

    invoke-virtual {v5}, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->isClosed()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 132
    :cond_0
    :goto_0
    return-void

    .line 104
    :cond_1
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v2

    .line 105
    .local v2, "channel":Lorg/jboss/netty/channel/Channel;
    iget-object v5, p0, Lcom/ning/http/client/providers/netty/handler/Processor;->channelManager:Lcom/ning/http/client/providers/netty/channel/ChannelManager;

    invoke-virtual {v5, v2}, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->removeAll(Lorg/jboss/netty/channel/Channel;)Z

    .line 108
    :try_start_0
    invoke-super {p0, p1, p2}, Lorg/jboss/netty/channel/SimpleChannelUpstreamHandler;->channelClosed(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelStateEvent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 113
    :goto_1
    invoke-static {v2}, Lcom/ning/http/client/providers/netty/channel/Channels;->getAttribute(Lorg/jboss/netty/channel/Channel;)Ljava/lang/Object;

    move-result-object v0

    .line 114
    .local v0, "attribute":Ljava/lang/Object;
    sget-object v5, Lcom/ning/http/client/providers/netty/handler/Processor;->LOGGER:Lorg/slf4j/Logger;

    const-string v6, "Channel Closed: {} with attribute {}"

    invoke-interface {v5, v6, v2, v0}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 116
    instance-of v5, v0, Lcom/ning/http/client/providers/netty/Callback;

    if-eqz v5, :cond_2

    move-object v1, v0

    .line 117
    check-cast v1, Lcom/ning/http/client/providers/netty/Callback;

    .line 118
    .local v1, "callback":Lcom/ning/http/client/providers/netty/Callback;
    invoke-virtual {v1}, Lcom/ning/http/client/providers/netty/Callback;->future()Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;

    move-result-object v5

    invoke-static {v2, v5}, Lcom/ning/http/client/providers/netty/channel/Channels;->setAttribute(Lorg/jboss/netty/channel/Channel;Ljava/lang/Object;)V

    .line 119
    invoke-virtual {v1}, Lcom/ning/http/client/providers/netty/Callback;->call()V

    goto :goto_0

    .line 109
    .end local v0    # "attribute":Ljava/lang/Object;
    .end local v1    # "callback":Lcom/ning/http/client/providers/netty/Callback;
    :catch_0
    move-exception v3

    .line 110
    .local v3, "ex":Ljava/lang/Exception;
    sget-object v5, Lcom/ning/http/client/providers/netty/handler/Processor;->LOGGER:Lorg/slf4j/Logger;

    const-string v6, "super.channelClosed"

    invoke-interface {v5, v6, v3}, Lorg/slf4j/Logger;->trace(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1

    .line 121
    .end local v3    # "ex":Ljava/lang/Exception;
    .restart local v0    # "attribute":Ljava/lang/Object;
    :cond_2
    instance-of v5, v0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;

    if-eqz v5, :cond_0

    move-object v4, v0

    .line 122
    check-cast v4, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;

    .line 123
    .local v4, "future":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<*>;"
    invoke-virtual {v4}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->touch()V

    .line 125
    iget-object v5, p0, Lcom/ning/http/client/providers/netty/handler/Processor;->config:Lcom/ning/http/client/AsyncHttpClientConfig;

    invoke-virtual {v5}, Lcom/ning/http/client/AsyncHttpClientConfig;->getIOExceptionFilters()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_3

    iget-object v5, p0, Lcom/ning/http/client/providers/netty/handler/Processor;->requestSender:Lcom/ning/http/client/providers/netty/request/NettyRequestSender;

    sget-object v6, Lcom/ning/http/client/providers/netty/handler/Processor;->CHANNEL_CLOSED_EXCEPTION:Ljava/io/IOException;

    invoke-virtual {v5, v4, v6, v2}, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->applyIoExceptionFiltersAndReplayRequest(Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Ljava/io/IOException;Lorg/jboss/netty/channel/Channel;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 129
    :cond_3
    iget-object v5, p0, Lcom/ning/http/client/providers/netty/handler/Processor;->protocol:Lcom/ning/http/client/providers/netty/handler/Protocol;

    invoke-virtual {v5, v4}, Lcom/ning/http/client/providers/netty/handler/Protocol;->onClose(Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;)V

    .line 130
    iget-object v5, p0, Lcom/ning/http/client/providers/netty/handler/Processor;->requestSender:Lcom/ning/http/client/providers/netty/request/NettyRequestSender;

    invoke-virtual {v5, v2, v4}, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->handleUnexpectedClosedChannel(Lorg/jboss/netty/channel/Channel;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;)V

    goto :goto_0
.end method

.method public exceptionCaught(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ExceptionEvent;)V
    .locals 8
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "e"    # Lorg/jboss/netty/channel/ExceptionEvent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 136
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v3

    .line 137
    .local v3, "channel":Lorg/jboss/netty/channel/Channel;
    invoke-interface {p2}, Lorg/jboss/netty/channel/ExceptionEvent;->getCause()Ljava/lang/Throwable;

    move-result-object v2

    .line 138
    .local v2, "cause":Ljava/lang/Throwable;
    const/4 v4, 0x0

    .line 141
    .local v4, "future":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<*>;"
    instance-of v6, v2, Lorg/jboss/netty/handler/codec/PrematureChannelClosureException;

    if-nez v6, :cond_0

    instance-of v6, v2, Ljava/nio/channels/ClosedChannelException;

    if-eqz v6, :cond_1

    .line 187
    :cond_0
    :goto_0
    return-void

    .line 144
    :cond_1
    sget-object v6, Lcom/ning/http/client/providers/netty/handler/Processor;->LOGGER:Lorg/slf4j/Logger;

    const-string v7, "Unexpected I/O exception on channel {}"

    invoke-interface {v6, v7, v3, v2}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 147
    :try_start_0
    invoke-static {v3}, Lcom/ning/http/client/providers/netty/channel/Channels;->getAttribute(Lorg/jboss/netty/channel/Channel;)Ljava/lang/Object;

    move-result-object v1

    .line 148
    .local v1, "attribute":Ljava/lang/Object;
    instance-of v6, v1, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;

    if-eqz v6, :cond_5

    .line 149
    move-object v0, v1

    check-cast v0, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;

    move-object v4, v0

    .line 150
    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual {v4, v6, v7}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->attachChannel(Lorg/jboss/netty/channel/Channel;Z)V

    .line 151
    invoke-virtual {v4}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->touch()V

    .line 153
    instance-of v6, v2, Ljava/io/IOException;

    if-eqz v6, :cond_4

    .line 156
    iget-object v6, p0, Lcom/ning/http/client/providers/netty/handler/Processor;->config:Lcom/ning/http/client/AsyncHttpClientConfig;

    invoke-virtual {v6}, Lcom/ning/http/client/AsyncHttpClientConfig;->getIOExceptionFilters()Ljava/util/List;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/List;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_4

    .line 157
    iget-object v6, p0, Lcom/ning/http/client/providers/netty/handler/Processor;->requestSender:Lcom/ning/http/client/providers/netty/request/NettyRequestSender;

    sget-object v7, Lcom/ning/http/client/providers/netty/handler/Processor;->CHANNEL_CLOSED_EXCEPTION:Ljava/io/IOException;

    invoke-virtual {v6, v4, v7, v3}, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->applyIoExceptionFiltersAndReplayRequest(Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Ljava/io/IOException;Lorg/jboss/netty/channel/Channel;)Z

    move-result v6

    if-nez v6, :cond_0

    .line 159
    invoke-static {v3}, Lcom/ning/http/client/providers/netty/channel/Channels;->silentlyCloseChannel(Lorg/jboss/netty/channel/Channel;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 172
    .end local v1    # "attribute":Ljava/lang/Object;
    :catch_0
    move-exception v5

    .line 173
    .local v5, "t":Ljava/lang/Throwable;
    move-object v2, v5

    .line 176
    .end local v5    # "t":Ljava/lang/Throwable;
    :cond_2
    :goto_1
    if-eqz v4, :cond_3

    .line 178
    :try_start_1
    sget-object v6, Lcom/ning/http/client/providers/netty/handler/Processor;->LOGGER:Lorg/slf4j/Logger;

    const-string v7, "Was unable to recover Future: {}"

    invoke-interface {v6, v7, v4}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;Ljava/lang/Object;)V

    .line 179
    iget-object v6, p0, Lcom/ning/http/client/providers/netty/handler/Processor;->requestSender:Lcom/ning/http/client/providers/netty/request/NettyRequestSender;

    invoke-virtual {v6, v3, v4, v2}, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->abort(Lorg/jboss/netty/channel/Channel;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Ljava/lang/Throwable;)V

    .line 180
    iget-object v6, p0, Lcom/ning/http/client/providers/netty/handler/Processor;->protocol:Lcom/ning/http/client/providers/netty/handler/Protocol;

    invoke-interface {p2}, Lorg/jboss/netty/channel/ExceptionEvent;->getCause()Ljava/lang/Throwable;

    move-result-object v7

    invoke-virtual {v6, v4, v7}, Lcom/ning/http/client/providers/netty/handler/Protocol;->onError(Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Ljava/lang/Throwable;)V
    :try_end_1
    .catch Ljava/lang/Throwable; {:try_start_1 .. :try_end_1} :catch_1

    .line 185
    :cond_3
    :goto_2
    iget-object v6, p0, Lcom/ning/http/client/providers/netty/handler/Processor;->channelManager:Lcom/ning/http/client/providers/netty/channel/ChannelManager;

    invoke-virtual {v6, v3}, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->closeChannel(Lorg/jboss/netty/channel/Channel;)V

    .line 186
    invoke-interface {p1, p2}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendUpstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    goto :goto_0

    .line 165
    .restart local v1    # "attribute":Ljava/lang/Object;
    :cond_4
    :try_start_2
    invoke-static {v2}, Lcom/ning/http/client/providers/netty/future/StackTraceInspector;->recoverOnReadOrWriteException(Ljava/lang/Throwable;)Z

    move-result v6

    if-eqz v6, :cond_2

    .line 166
    sget-object v6, Lcom/ning/http/client/providers/netty/handler/Processor;->LOGGER:Lorg/slf4j/Logger;

    const-string v7, "Trying to recover from dead Channel: {}"

    invoke-interface {v6, v7, v3}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_0

    .line 169
    :cond_5
    instance-of v6, v1, Lcom/ning/http/client/providers/netty/Callback;

    if-eqz v6, :cond_2

    .line 170
    check-cast v1, Lcom/ning/http/client/providers/netty/Callback;

    .end local v1    # "attribute":Ljava/lang/Object;
    invoke-virtual {v1}, Lcom/ning/http/client/providers/netty/Callback;->future()Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_0

    move-result-object v4

    goto :goto_1

    .line 181
    :catch_1
    move-exception v5

    .line 182
    .restart local v5    # "t":Ljava/lang/Throwable;
    sget-object v6, Lcom/ning/http/client/providers/netty/handler/Processor;->LOGGER:Lorg/slf4j/Logger;

    invoke-virtual {v5}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7, v5}, Lorg/slf4j/Logger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_2
.end method

.method public messageReceived(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/MessageEvent;)V
    .locals 10
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "e"    # Lorg/jboss/netty/channel/MessageEvent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 67
    invoke-super {p0, p1, p2}, Lorg/jboss/netty/channel/SimpleChannelUpstreamHandler;->messageReceived(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/MessageEvent;)V

    .line 69
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v2

    .line 70
    .local v2, "channel":Lorg/jboss/netty/channel/Channel;
    invoke-static {v2}, Lcom/ning/http/client/providers/netty/channel/Channels;->getAttribute(Lorg/jboss/netty/channel/Channel;)Ljava/lang/Object;

    move-result-object v1

    .line 72
    .local v1, "attribute":Ljava/lang/Object;
    instance-of v5, v1, Lcom/ning/http/client/providers/netty/Callback;

    if-eqz v5, :cond_2

    .line 73
    invoke-interface {p2}, Lorg/jboss/netty/channel/MessageEvent;->getMessage()Ljava/lang/Object;

    move-result-object v4

    .local v4, "message":Ljava/lang/Object;
    move-object v0, v1

    .line 74
    check-cast v0, Lcom/ning/http/client/providers/netty/Callback;

    .line 75
    .local v0, "ac":Lcom/ning/http/client/providers/netty/Callback;
    instance-of v5, v4, Lorg/jboss/netty/handler/codec/http/HttpChunk;

    if-eqz v5, :cond_1

    .line 77
    const-class v5, Lorg/jboss/netty/handler/codec/http/HttpChunk;

    invoke-virtual {v5, v4}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/jboss/netty/handler/codec/http/HttpChunk;

    invoke-interface {v5}, Lorg/jboss/netty/handler/codec/http/HttpChunk;->isLast()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 79
    invoke-virtual {v0}, Lcom/ning/http/client/providers/netty/Callback;->call()V

    .line 96
    .end local v0    # "ac":Lcom/ning/http/client/providers/netty/Callback;
    .end local v4    # "message":Ljava/lang/Object;
    :cond_0
    :goto_0
    return-void

    .line 82
    .restart local v0    # "ac":Lcom/ning/http/client/providers/netty/Callback;
    .restart local v4    # "message":Ljava/lang/Object;
    :cond_1
    sget-object v5, Lcom/ning/http/client/providers/netty/handler/Processor;->LOGGER:Lorg/slf4j/Logger;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Received unexpected message while expecting a chunk: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Lorg/slf4j/Logger;->info(Ljava/lang/String;)V

    .line 83
    invoke-virtual {v0}, Lcom/ning/http/client/providers/netty/Callback;->call()V

    .line 84
    invoke-static {v2}, Lcom/ning/http/client/providers/netty/channel/Channels;->setDiscard(Lorg/jboss/netty/channel/Channel;)V

    goto :goto_0

    .line 87
    .end local v0    # "ac":Lcom/ning/http/client/providers/netty/Callback;
    .end local v4    # "message":Ljava/lang/Object;
    :cond_2
    instance-of v5, v1, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;

    if-eqz v5, :cond_3

    move-object v3, v1

    .line 88
    check-cast v3, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;

    .line 89
    .local v3, "future":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<*>;"
    iget-object v5, p0, Lcom/ning/http/client/providers/netty/handler/Processor;->protocol:Lcom/ning/http/client/providers/netty/handler/Protocol;

    invoke-interface {p2}, Lorg/jboss/netty/channel/MessageEvent;->getMessage()Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v5, v2, v3, v6}, Lcom/ning/http/client/providers/netty/handler/Protocol;->handle(Lorg/jboss/netty/channel/Channel;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Ljava/lang/Object;)V

    goto :goto_0

    .line 91
    .end local v3    # "future":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<*>;"
    :cond_3
    sget-object v5, Lcom/ning/http/client/providers/netty/DiscardEvent;->INSTANCE:Lcom/ning/http/client/providers/netty/DiscardEvent;

    if-eq v1, v5, :cond_0

    .line 93
    sget-object v5, Lcom/ning/http/client/providers/netty/handler/Processor;->LOGGER:Lorg/slf4j/Logger;

    const-string v6, "Orphan channel {} with attribute {} received message {}, closing"

    const/4 v7, 0x3

    new-array v7, v7, [Ljava/lang/Object;

    const/4 v8, 0x0

    aput-object v2, v7, v8

    const/4 v8, 0x1

    aput-object v1, v7, v8

    const/4 v8, 0x2

    invoke-interface {p2}, Lorg/jboss/netty/channel/MessageEvent;->getMessage()Ljava/lang/Object;

    move-result-object v9

    aput-object v9, v7, v8

    invoke-interface {v5, v6, v7}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 94
    invoke-static {v2}, Lcom/ning/http/client/providers/netty/channel/Channels;->silentlyCloseChannel(Lorg/jboss/netty/channel/Channel;)V

    goto :goto_0
.end method
