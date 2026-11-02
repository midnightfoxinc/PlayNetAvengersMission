.class public final Lcom/ning/http/client/providers/netty/handler/WebSocketProtocol;
.super Lcom/ning/http/client/providers/netty/handler/Protocol;
.source "WebSocketProtocol.java"


# direct methods
.method public constructor <init>(Lcom/ning/http/client/providers/netty/channel/ChannelManager;Lcom/ning/http/client/AsyncHttpClientConfig;Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;Lcom/ning/http/client/providers/netty/request/NettyRequestSender;)V
    .locals 0
    .param p1, "channelManager"    # Lcom/ning/http/client/providers/netty/channel/ChannelManager;
    .param p2, "config"    # Lcom/ning/http/client/AsyncHttpClientConfig;
    .param p3, "nettyConfig"    # Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;
    .param p4, "requestSender"    # Lcom/ning/http/client/providers/netty/request/NettyRequestSender;

    .prologue
    .line 56
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/ning/http/client/providers/netty/handler/Protocol;-><init>(Lcom/ning/http/client/providers/netty/channel/ChannelManager;Lcom/ning/http/client/AsyncHttpClientConfig;Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;Lcom/ning/http/client/providers/netty/request/NettyRequestSender;)V

    .line 57
    return-void
.end method

.method private invokeOnSucces(Lorg/jboss/netty/channel/Channel;Lcom/ning/http/client/ws/WebSocketUpgradeHandler;)V
    .locals 3
    .param p1, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p2, "h"    # Lcom/ning/http/client/ws/WebSocketUpgradeHandler;

    .prologue
    .line 62
    invoke-virtual {p2}, Lcom/ning/http/client/ws/WebSocketUpgradeHandler;->touchSuccess()Z

    move-result v1

    if-nez v1, :cond_0

    .line 64
    :try_start_0
    iget-object v1, p0, Lcom/ning/http/client/providers/netty/handler/WebSocketProtocol;->nettyConfig:Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;

    invoke-virtual {v1}, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;->getNettyWebSocketFactory()Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig$NettyWebSocketFactory;

    move-result-object v1

    iget-object v2, p0, Lcom/ning/http/client/providers/netty/handler/WebSocketProtocol;->nettyConfig:Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;

    invoke-interface {v1, p1, v2}, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig$NettyWebSocketFactory;->newNettyWebSocket(Lorg/jboss/netty/channel/Channel;Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;)Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;

    move-result-object v1

    invoke-virtual {p2, v1}, Lcom/ning/http/client/ws/WebSocketUpgradeHandler;->onSuccess(Lcom/ning/http/client/ws/WebSocket;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 69
    :cond_0
    :goto_0
    return-void

    .line 65
    :catch_0
    move-exception v0

    .line 66
    .local v0, "ex":Ljava/lang/Exception;
    iget-object v1, p0, Lcom/ning/http/client/providers/netty/handler/WebSocketProtocol;->logger:Lorg/slf4j/Logger;

    const-string v2, "onSuccess unexpected exception"

    invoke-interface {v1, v2, v0}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method


# virtual methods
.method public handle(Lorg/jboss/netty/channel/Channel;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Ljava/lang/Object;)V
    .locals 28
    .param p1, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p3, "e"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jboss/netty/channel/Channel;",
            "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture",
            "<*>;",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 73
    .local p2, "future":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<*>;"
    const-class v3, Lcom/ning/http/client/ws/WebSocketUpgradeHandler;

    invoke-virtual/range {p2 .. p2}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->getAsyncHandler()Lcom/ning/http/client/AsyncHandler;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/ning/http/client/ws/WebSocketUpgradeHandler;

    .line 74
    .local v6, "handler":Lcom/ning/http/client/ws/WebSocketUpgradeHandler;
    invoke-virtual/range {p2 .. p2}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->getRequest()Lcom/ning/http/client/Request;

    move-result-object v13

    .line 76
    .local v13, "request":Lcom/ning/http/client/Request;
    move-object/from16 v0, p3

    instance-of v3, v0, Lorg/jboss/netty/handler/codec/http/HttpResponse;

    if-eqz v3, :cond_b

    move-object/from16 v12, p3

    .line 77
    check-cast v12, Lorg/jboss/netty/handler/codec/http/HttpResponse;

    .line 78
    .local v12, "response":Lorg/jboss/netty/handler/codec/http/HttpResponse;
    new-instance v7, Lcom/ning/http/client/providers/netty/response/NettyResponseStatus;

    invoke-virtual/range {p2 .. p2}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->getUri()Lcom/ning/http/client/uri/Uri;

    move-result-object v3

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/ning/http/client/providers/netty/handler/WebSocketProtocol;->config:Lcom/ning/http/client/AsyncHttpClientConfig;

    invoke-direct {v7, v3, v4, v12}, Lcom/ning/http/client/providers/netty/response/NettyResponseStatus;-><init>(Lcom/ning/http/client/uri/Uri;Lcom/ning/http/client/AsyncHttpClientConfig;Lorg/jboss/netty/handler/codec/http/HttpResponse;)V

    .line 79
    .local v7, "status":Lcom/ning/http/client/HttpResponseStatus;
    new-instance v8, Lcom/ning/http/client/providers/netty/response/NettyResponseHeaders;

    invoke-interface {v12}, Lorg/jboss/netty/handler/codec/http/HttpResponse;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v3

    invoke-direct {v8, v3}, Lcom/ning/http/client/providers/netty/response/NettyResponseHeaders;-><init>(Lorg/jboss/netty/handler/codec/http/HttpHeaders;)V

    .local v8, "responseHeaders":Lcom/ning/http/client/HttpResponseHeaders;
    move-object/from16 v3, p0

    move-object/from16 v4, p1

    move-object/from16 v5, p2

    .line 81
    invoke-virtual/range {v3 .. v8}, Lcom/ning/http/client/providers/netty/handler/WebSocketProtocol;->exitAfterProcessingFilters(Lorg/jboss/netty/channel/Channel;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Lcom/ning/http/client/AsyncHandler;Lcom/ning/http/client/HttpResponseStatus;Lcom/ning/http/client/HttpResponseHeaders;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 174
    .end local v7    # "status":Lcom/ning/http/client/HttpResponseStatus;
    .end local v8    # "responseHeaders":Lcom/ning/http/client/HttpResponseHeaders;
    .end local v12    # "response":Lorg/jboss/netty/handler/codec/http/HttpResponse;
    :cond_0
    :goto_0
    return-void

    .line 85
    .restart local v7    # "status":Lcom/ning/http/client/HttpResponseStatus;
    .restart local v8    # "responseHeaders":Lcom/ning/http/client/HttpResponseHeaders;
    .restart local v12    # "response":Lorg/jboss/netty/handler/codec/http/HttpResponse;
    :cond_1
    invoke-interface {v12}, Lorg/jboss/netty/handler/codec/http/HttpResponse;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v3

    move-object/from16 v0, p2

    invoke-virtual {v0, v3}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->setHttpHeaders(Lorg/jboss/netty/handler/codec/http/HttpHeaders;)V

    .line 86
    invoke-interface {v12}, Lorg/jboss/netty/handler/codec/http/HttpResponse;->getStatus()Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;

    move-result-object v3

    invoke-virtual {v3}, Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;->getCode()I

    move-result v14

    move-object/from16 v9, p0

    move-object/from16 v10, p1

    move-object/from16 v11, p2

    invoke-virtual/range {v9 .. v14}, Lcom/ning/http/client/providers/netty/handler/WebSocketProtocol;->exitAfterHandlingRedirect(Lorg/jboss/netty/channel/Channel;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Lorg/jboss/netty/handler/codec/http/HttpResponse;Lcom/ning/http/client/Request;I)Z

    move-result v3

    if-nez v3, :cond_0

    .line 89
    invoke-interface {v12}, Lorg/jboss/netty/handler/codec/http/HttpResponse;->getStatus()Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;

    move-result-object v3

    sget-object v4, Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;->SWITCHING_PROTOCOLS:Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;

    invoke-virtual {v3, v4}, Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;->equals(Ljava/lang/Object;)Z

    move-result v24

    .line 90
    .local v24, "validStatus":Z
    invoke-interface {v12}, Lorg/jboss/netty/handler/codec/http/HttpResponse;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v3

    const-string v4, "Upgrade"

    invoke-virtual {v3, v4}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_3

    const/16 v25, 0x1

    .line 91
    .local v25, "validUpgrade":Z
    :goto_1
    invoke-interface {v12}, Lorg/jboss/netty/handler/codec/http/HttpResponse;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v3

    const-string v4, "Connection"

    invoke-virtual {v3, v4}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 92
    .local v17, "connection":Ljava/lang/String;
    if-nez v17, :cond_2

    .line 93
    invoke-interface {v12}, Lorg/jboss/netty/handler/codec/http/HttpResponse;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v3

    const-string v4, "Connection"

    sget-object v5, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v4, v5}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v17

    .line 94
    :cond_2
    const-string v3, "Upgrade"

    move-object/from16 v0, v17

    invoke-virtual {v3, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v23

    .line 95
    .local v23, "validConnection":Z
    invoke-virtual {v6, v7}, Lcom/ning/http/client/ws/WebSocketUpgradeHandler;->onStatusReceived(Lcom/ning/http/client/HttpResponseStatus;)Lcom/ning/http/client/AsyncHandler$STATE;

    move-result-object v3

    sget-object v4, Lcom/ning/http/client/AsyncHandler$STATE;->UPGRADE:Lcom/ning/http/client/AsyncHandler$STATE;

    if-ne v3, v4, :cond_4

    const/16 v22, 0x1

    .line 97
    .local v22, "statusReceived":Z
    :goto_2
    if-nez v22, :cond_5

    .line 99
    :try_start_0
    invoke-virtual {v6}, Lcom/ning/http/client/ws/WebSocketUpgradeHandler;->onCompleted()Lcom/ning/http/client/ws/WebSocket;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 101
    invoke-virtual/range {p2 .. p2}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->done()V

    goto :goto_0

    .line 90
    .end local v17    # "connection":Ljava/lang/String;
    .end local v22    # "statusReceived":Z
    .end local v23    # "validConnection":Z
    .end local v25    # "validUpgrade":Z
    :cond_3
    const/16 v25, 0x0

    goto :goto_1

    .line 95
    .restart local v17    # "connection":Ljava/lang/String;
    .restart local v23    # "validConnection":Z
    .restart local v25    # "validUpgrade":Z
    :cond_4
    const/16 v22, 0x0

    goto :goto_2

    .line 101
    .restart local v22    # "statusReceived":Z
    :catchall_0
    move-exception v3

    invoke-virtual/range {p2 .. p2}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->done()V

    throw v3

    .line 106
    :cond_5
    invoke-virtual {v6, v8}, Lcom/ning/http/client/ws/WebSocketUpgradeHandler;->onHeadersReceived(Lcom/ning/http/client/HttpResponseHeaders;)Lcom/ning/http/client/AsyncHandler$STATE;

    move-result-object v3

    sget-object v4, Lcom/ning/http/client/AsyncHandler$STATE;->CONTINUE:Lcom/ning/http/client/AsyncHandler$STATE;

    if-ne v3, v4, :cond_7

    const/16 v19, 0x1

    .line 107
    .local v19, "headerOK":Z
    :goto_3
    if-eqz v19, :cond_6

    if-eqz v24, :cond_6

    if-eqz v25, :cond_6

    if-nez v23, :cond_8

    .line 108
    :cond_6
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/ning/http/client/providers/netty/handler/WebSocketProtocol;->requestSender:Lcom/ning/http/client/providers/netty/request/NettyRequestSender;

    new-instance v4, Ljava/io/IOException;

    const-string v5, "Invalid handshake response"

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    invoke-virtual {v3, v0, v1, v4}, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->abort(Lorg/jboss/netty/channel/Channel;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Ljava/lang/Throwable;)V

    goto/16 :goto_0

    .line 106
    .end local v19    # "headerOK":Z
    :cond_7
    const/16 v19, 0x0

    goto :goto_3

    .line 112
    .restart local v19    # "headerOK":Z
    :cond_8
    invoke-interface {v12}, Lorg/jboss/netty/handler/codec/http/HttpResponse;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v3

    const-string v4, "Sec-WebSocket-Accept"

    invoke-virtual {v3, v4}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    .line 113
    .local v15, "accept":Ljava/lang/String;
    invoke-virtual/range {p2 .. p2}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->getNettyRequest()Lcom/ning/http/client/providers/netty/request/NettyRequest;

    move-result-object v3

    invoke-virtual {v3}, Lcom/ning/http/client/providers/netty/request/NettyRequest;->getHttpRequest()Lorg/jboss/netty/handler/codec/http/HttpRequest;

    move-result-object v3

    invoke-interface {v3}, Lorg/jboss/netty/handler/codec/http/HttpRequest;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v3

    const-string v4, "Sec-WebSocket-Key"

    invoke-virtual {v3, v4}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/ning/http/client/providers/netty/ws/WebSocketUtils;->getAcceptKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    .line 114
    .local v20, "key":Ljava/lang/String;
    if-eqz v15, :cond_9

    move-object/from16 v0, v20

    invoke-virtual {v15, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_a

    .line 115
    :cond_9
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/ning/http/client/providers/netty/handler/WebSocketProtocol;->requestSender:Lcom/ning/http/client/providers/netty/request/NettyRequestSender;

    new-instance v4, Ljava/io/IOException;

    const-string v5, "Invalid challenge. Actual: %s. Expected: %s"

    const/4 v9, 0x2

    new-array v9, v9, [Ljava/lang/Object;

    const/4 v10, 0x0

    aput-object v15, v9, v10

    const/4 v10, 0x1

    aput-object v20, v9, v10

    invoke-static {v5, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    invoke-virtual {v3, v0, v1, v4}, Lcom/ning/http/client/providers/netty/request/NettyRequestSender;->abort(Lorg/jboss/netty/channel/Channel;Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Ljava/lang/Throwable;)V

    .line 118
    :cond_a
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/ning/http/client/providers/netty/handler/WebSocketProtocol;->channelManager:Lcom/ning/http/client/providers/netty/channel/ChannelManager;

    invoke-interface/range {p1 .. p1}, Lorg/jboss/netty/channel/Channel;->getPipeline()Lorg/jboss/netty/channel/ChannelPipeline;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/ning/http/client/providers/netty/channel/ChannelManager;->upgradePipelineForWebSockets(Lorg/jboss/netty/channel/ChannelPipeline;)V

    .line 120
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v6}, Lcom/ning/http/client/providers/netty/handler/WebSocketProtocol;->invokeOnSucces(Lorg/jboss/netty/channel/Channel;Lcom/ning/http/client/ws/WebSocketUpgradeHandler;)V

    .line 121
    invoke-virtual/range {p2 .. p2}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->done()V

    goto/16 :goto_0

    .line 123
    .end local v7    # "status":Lcom/ning/http/client/HttpResponseStatus;
    .end local v8    # "responseHeaders":Lcom/ning/http/client/HttpResponseHeaders;
    .end local v12    # "response":Lorg/jboss/netty/handler/codec/http/HttpResponse;
    .end local v15    # "accept":Ljava/lang/String;
    .end local v17    # "connection":Ljava/lang/String;
    .end local v19    # "headerOK":Z
    .end local v20    # "key":Ljava/lang/String;
    .end local v22    # "statusReceived":Z
    .end local v23    # "validConnection":Z
    .end local v24    # "validStatus":Z
    .end local v25    # "validUpgrade":Z
    :cond_b
    move-object/from16 v0, p3

    instance-of v3, v0, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketFrame;

    if-eqz v3, :cond_11

    move-object/from16 v18, p3

    .line 125
    check-cast v18, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketFrame;

    .line 126
    .local v18, "frame":Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketFrame;
    const-class v3, Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;

    invoke-virtual {v6}, Lcom/ning/http/client/ws/WebSocketUpgradeHandler;->onCompleted()Lcom/ning/http/client/ws/WebSocket;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v26

    check-cast v26, Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;

    .line 127
    .local v26, "webSocket":Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v6}, Lcom/ning/http/client/providers/netty/handler/WebSocketProtocol;->invokeOnSucces(Lorg/jboss/netty/channel/Channel;Lcom/ning/http/client/ws/WebSocketUpgradeHandler;)V

    .line 129
    if-eqz v26, :cond_10

    .line 130
    move-object/from16 v0, v18

    instance-of v3, v0, Lorg/jboss/netty/handler/codec/http/websocketx/CloseWebSocketFrame;

    if-eqz v3, :cond_c

    .line 131
    invoke-static/range {p1 .. p1}, Lcom/ning/http/client/providers/netty/channel/Channels;->setDiscard(Lorg/jboss/netty/channel/Channel;)V

    .line 132
    const-class v3, Lorg/jboss/netty/handler/codec/http/websocketx/CloseWebSocketFrame;

    move-object/from16 v0, v18

    invoke-virtual {v3, v0}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Lorg/jboss/netty/handler/codec/http/websocketx/CloseWebSocketFrame;

    .line 133
    .local v16, "closeFrame":Lorg/jboss/netty/handler/codec/http/websocketx/CloseWebSocketFrame;
    invoke-virtual/range {v16 .. v16}, Lorg/jboss/netty/handler/codec/http/websocketx/CloseWebSocketFrame;->getStatusCode()I

    move-result v3

    invoke-virtual/range {v16 .. v16}, Lorg/jboss/netty/handler/codec/http/websocketx/CloseWebSocketFrame;->getReasonText()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v0, v26

    invoke-virtual {v0, v3, v4}, Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;->onClose(ILjava/lang/String;)V

    goto/16 :goto_0

    .line 135
    .end local v16    # "closeFrame":Lorg/jboss/netty/handler/codec/http/websocketx/CloseWebSocketFrame;
    :cond_c
    invoke-virtual/range {v18 .. v18}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketFrame;->getBinaryData()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 136
    new-instance v27, Lcom/ning/http/client/providers/netty/handler/WebSocketProtocol$1;

    move-object/from16 v0, v27

    move-object/from16 v1, p0

    move-object/from16 v2, v18

    invoke-direct {v0, v1, v2}, Lcom/ning/http/client/providers/netty/handler/WebSocketProtocol$1;-><init>(Lcom/ning/http/client/providers/netty/handler/WebSocketProtocol;Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketFrame;)V

    .line 155
    .local v27, "webSocketChunk":Lorg/jboss/netty/handler/codec/http/HttpChunk;
    new-instance v21, Lcom/ning/http/client/providers/netty/response/NettyResponseBodyPart;

    const/4 v3, 0x0

    invoke-virtual/range {v18 .. v18}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketFrame;->isFinalFragment()Z

    move-result v4

    move-object/from16 v0, v21

    move-object/from16 v1, v27

    invoke-direct {v0, v3, v1, v4}, Lcom/ning/http/client/providers/netty/response/NettyResponseBodyPart;-><init>(Lorg/jboss/netty/handler/codec/http/HttpResponse;Lorg/jboss/netty/handler/codec/http/HttpChunk;Z)V

    .line 156
    .local v21, "part":Lcom/ning/http/client/providers/netty/response/NettyResponseBodyPart;
    move-object/from16 v0, v21

    invoke-virtual {v6, v0}, Lcom/ning/http/client/ws/WebSocketUpgradeHandler;->onBodyPartReceived(Lcom/ning/http/client/HttpResponseBodyPart;)Lcom/ning/http/client/AsyncHandler$STATE;

    .line 158
    move-object/from16 v0, v18

    instance-of v3, v0, Lorg/jboss/netty/handler/codec/http/websocketx/BinaryWebSocketFrame;

    if-eqz v3, :cond_d

    .line 159
    move-object/from16 v0, v26

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;->onBinaryFragment(Lcom/ning/http/client/HttpResponseBodyPart;)V

    goto/16 :goto_0

    .line 160
    :cond_d
    move-object/from16 v0, v18

    instance-of v3, v0, Lorg/jboss/netty/handler/codec/http/websocketx/TextWebSocketFrame;

    if-eqz v3, :cond_e

    .line 161
    move-object/from16 v0, v26

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;->onTextFragment(Lcom/ning/http/client/HttpResponseBodyPart;)V

    goto/16 :goto_0

    .line 162
    :cond_e
    move-object/from16 v0, v18

    instance-of v3, v0, Lorg/jboss/netty/handler/codec/http/websocketx/PingWebSocketFrame;

    if-eqz v3, :cond_f

    .line 163
    move-object/from16 v0, v26

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;->onPing(Lcom/ning/http/client/HttpResponseBodyPart;)V

    goto/16 :goto_0

    .line 164
    :cond_f
    move-object/from16 v0, v18

    instance-of v3, v0, Lorg/jboss/netty/handler/codec/http/websocketx/PongWebSocketFrame;

    if-eqz v3, :cond_0

    .line 165
    move-object/from16 v0, v26

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;->onPong(Lcom/ning/http/client/HttpResponseBodyPart;)V

    goto/16 :goto_0

    .line 169
    .end local v21    # "part":Lcom/ning/http/client/providers/netty/response/NettyResponseBodyPart;
    .end local v27    # "webSocketChunk":Lorg/jboss/netty/handler/codec/http/HttpChunk;
    :cond_10
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/ning/http/client/providers/netty/handler/WebSocketProtocol;->logger:Lorg/slf4j/Logger;

    const-string v4, "UpgradeHandler returned a null NettyWebSocket "

    invoke-interface {v3, v4}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;)V

    goto/16 :goto_0

    .line 172
    .end local v18    # "frame":Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketFrame;
    .end local v26    # "webSocket":Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;
    :cond_11
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/ning/http/client/providers/netty/handler/WebSocketProtocol;->logger:Lorg/slf4j/Logger;

    const-string v4, "Invalid message {}"

    move-object/from16 v0, p3

    invoke-interface {v3, v4, v0}, Lorg/slf4j/Logger;->error(Ljava/lang/String;Ljava/lang/Object;)V

    goto/16 :goto_0
.end method

.method public onClose(Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 195
    .local p1, "future":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<*>;"
    iget-object v3, p0, Lcom/ning/http/client/providers/netty/handler/WebSocketProtocol;->logger:Lorg/slf4j/Logger;

    const-string v4, "onClose {}"

    invoke-interface {v3, v4}, Lorg/slf4j/Logger;->trace(Ljava/lang/String;)V

    .line 198
    :try_start_0
    invoke-virtual {p1}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->getAsyncHandler()Lcom/ning/http/client/AsyncHandler;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/ws/WebSocketUpgradeHandler;

    .line 199
    .local v0, "h":Lcom/ning/http/client/ws/WebSocketUpgradeHandler;
    const-class v3, Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;

    invoke-virtual {v0}, Lcom/ning/http/client/ws/WebSocketUpgradeHandler;->onCompleted()Lcom/ning/http/client/ws/WebSocket;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;

    .line 201
    .local v2, "webSocket":Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;
    iget-object v3, p0, Lcom/ning/http/client/providers/netty/handler/WebSocketProtocol;->logger:Lorg/slf4j/Logger;

    const-string v4, "Connection was closed abnormally (that is, with no close frame being sent)."

    invoke-interface {v3, v4}, Lorg/slf4j/Logger;->trace(Ljava/lang/String;)V

    .line 202
    if-eqz v2, :cond_0

    .line 203
    const/16 v3, 0x3ee

    const-string v4, "Connection was closed abnormally (that is, with no close frame being sent)."

    invoke-virtual {v2, v3, v4}, Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;->close(ILjava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 207
    .end local v0    # "h":Lcom/ning/http/client/ws/WebSocketUpgradeHandler;
    .end local v2    # "webSocket":Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;
    :cond_0
    :goto_0
    return-void

    .line 204
    :catch_0
    move-exception v1

    .line 205
    .local v1, "t":Ljava/lang/Throwable;
    iget-object v3, p0, Lcom/ning/http/client/providers/netty/handler/WebSocketProtocol;->logger:Lorg/slf4j/Logger;

    const-string v4, "onError"

    invoke-interface {v3, v4, v1}, Lorg/slf4j/Logger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onError(Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;Ljava/lang/Throwable;)V
    .locals 5
    .param p2, "e"    # Ljava/lang/Throwable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture",
            "<*>;",
            "Ljava/lang/Throwable;",
            ")V"
        }
    .end annotation

    .prologue
    .line 178
    .local p1, "future":Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;, "Lcom/ning/http/client/providers/netty/future/NettyResponseFuture<*>;"
    iget-object v3, p0, Lcom/ning/http/client/providers/netty/handler/WebSocketProtocol;->logger:Lorg/slf4j/Logger;

    const-string v4, "onError {}"

    invoke-interface {v3, v4, p2}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 181
    :try_start_0
    invoke-virtual {p1}, Lcom/ning/http/client/providers/netty/future/NettyResponseFuture;->getAsyncHandler()Lcom/ning/http/client/AsyncHandler;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/ws/WebSocketUpgradeHandler;

    .line 183
    .local v0, "h":Lcom/ning/http/client/ws/WebSocketUpgradeHandler;
    const-class v3, Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;

    invoke-virtual {v0}, Lcom/ning/http/client/ws/WebSocketUpgradeHandler;->onCompleted()Lcom/ning/http/client/ws/WebSocket;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;

    .line 184
    .local v2, "webSocket":Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;
    if-eqz v2, :cond_0

    .line 185
    invoke-virtual {p2}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;->onError(Ljava/lang/Throwable;)V

    .line 186
    invoke-virtual {v2}, Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;->close()V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 191
    .end local v0    # "h":Lcom/ning/http/client/ws/WebSocketUpgradeHandler;
    .end local v2    # "webSocket":Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;
    :cond_0
    :goto_0
    return-void

    .line 188
    :catch_0
    move-exception v1

    .line 189
    .local v1, "t":Ljava/lang/Throwable;
    iget-object v3, p0, Lcom/ning/http/client/providers/netty/handler/WebSocketProtocol;->logger:Lorg/slf4j/Logger;

    const-string v4, "onError"

    invoke-interface {v3, v4, v1}, Lorg/slf4j/Logger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method
