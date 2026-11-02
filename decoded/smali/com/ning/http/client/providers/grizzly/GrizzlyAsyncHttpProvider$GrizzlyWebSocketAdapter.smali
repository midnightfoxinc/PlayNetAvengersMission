.class final Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$GrizzlyWebSocketAdapter;
.super Ljava/lang/Object;
.source "GrizzlyAsyncHttpProvider.java"

# interfaces
.implements Lcom/ning/http/client/ws/WebSocket;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "GrizzlyWebSocketAdapter"
.end annotation


# instance fields
.field final bufferFragments:Z

.field final gWebSocket:Lorg/glassfish/grizzly/websockets/SimpleWebSocket;


# direct methods
.method constructor <init>(Lorg/glassfish/grizzly/websockets/SimpleWebSocket;Z)V
    .locals 0
    .param p1, "gWebSocket"    # Lorg/glassfish/grizzly/websockets/SimpleWebSocket;
    .param p2, "bufferFragments"    # Z

    .prologue
    .line 2263
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2264
    iput-object p1, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$GrizzlyWebSocketAdapter;->gWebSocket:Lorg/glassfish/grizzly/websockets/SimpleWebSocket;

    .line 2265
    iput-boolean p2, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$GrizzlyWebSocketAdapter;->bufferFragments:Z

    .line 2266
    return-void
.end method


# virtual methods
.method public addWebSocketListener(Lcom/ning/http/client/ws/WebSocketListener;)Lcom/ning/http/client/ws/WebSocket;
    .locals 2
    .param p1, "l"    # Lcom/ning/http/client/ws/WebSocketListener;

    .prologue
    .line 2320
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$GrizzlyWebSocketAdapter;->gWebSocket:Lorg/glassfish/grizzly/websockets/SimpleWebSocket;

    new-instance v1, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AHCWebSocketListenerAdapter;

    invoke-direct {v1, p1, p0}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AHCWebSocketListenerAdapter;-><init>(Lcom/ning/http/client/ws/WebSocketListener;Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$GrizzlyWebSocketAdapter;)V

    invoke-virtual {v0, v1}, Lorg/glassfish/grizzly/websockets/SimpleWebSocket;->add(Lorg/glassfish/grizzly/websockets/WebSocketListener;)Z

    .line 2321
    return-object p0
.end method

.method public close()V
    .locals 1

    .prologue
    .line 2337
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$GrizzlyWebSocketAdapter;->gWebSocket:Lorg/glassfish/grizzly/websockets/SimpleWebSocket;

    invoke-virtual {v0}, Lorg/glassfish/grizzly/websockets/SimpleWebSocket;->close()V

    .line 2338
    return-void
.end method

.method public isOpen()Z
    .locals 1

    .prologue
    .line 2332
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$GrizzlyWebSocketAdapter;->gWebSocket:Lorg/glassfish/grizzly/websockets/SimpleWebSocket;

    invoke-virtual {v0}, Lorg/glassfish/grizzly/websockets/SimpleWebSocket;->isConnected()Z

    move-result v0

    return v0
.end method

.method public removeWebSocketListener(Lcom/ning/http/client/ws/WebSocketListener;)Lcom/ning/http/client/ws/WebSocket;
    .locals 2
    .param p1, "l"    # Lcom/ning/http/client/ws/WebSocketListener;

    .prologue
    .line 2326
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$GrizzlyWebSocketAdapter;->gWebSocket:Lorg/glassfish/grizzly/websockets/SimpleWebSocket;

    new-instance v1, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AHCWebSocketListenerAdapter;

    invoke-direct {v1, p1, p0}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AHCWebSocketListenerAdapter;-><init>(Lcom/ning/http/client/ws/WebSocketListener;Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$GrizzlyWebSocketAdapter;)V

    invoke-virtual {v0, v1}, Lorg/glassfish/grizzly/websockets/SimpleWebSocket;->remove(Lorg/glassfish/grizzly/websockets/WebSocketListener;)Z

    .line 2327
    return-object p0
.end method

.method public sendMessage(Ljava/lang/String;)Lcom/ning/http/client/ws/WebSocket;
    .locals 1
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 2296
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$GrizzlyWebSocketAdapter;->gWebSocket:Lorg/glassfish/grizzly/websockets/SimpleWebSocket;

    invoke-virtual {v0, p1}, Lorg/glassfish/grizzly/websockets/SimpleWebSocket;->send(Ljava/lang/String;)Lorg/glassfish/grizzly/GrizzlyFuture;

    .line 2297
    return-object p0
.end method

.method public sendMessage([B)Lcom/ning/http/client/ws/WebSocket;
    .locals 1
    .param p1, "message"    # [B

    .prologue
    .line 2274
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$GrizzlyWebSocketAdapter;->gWebSocket:Lorg/glassfish/grizzly/websockets/SimpleWebSocket;

    invoke-virtual {v0, p1}, Lorg/glassfish/grizzly/websockets/SimpleWebSocket;->send([B)Lorg/glassfish/grizzly/GrizzlyFuture;

    .line 2275
    return-object p0
.end method

.method public sendPing([B)Lcom/ning/http/client/ws/WebSocket;
    .locals 1
    .param p1, "payload"    # [B

    .prologue
    .line 2308
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$GrizzlyWebSocketAdapter;->gWebSocket:Lorg/glassfish/grizzly/websockets/SimpleWebSocket;

    invoke-virtual {v0, p1}, Lorg/glassfish/grizzly/websockets/SimpleWebSocket;->sendPing([B)Lorg/glassfish/grizzly/GrizzlyFuture;

    .line 2309
    return-object p0
.end method

.method public sendPong([B)Lcom/ning/http/client/ws/WebSocket;
    .locals 1
    .param p1, "payload"    # [B

    .prologue
    .line 2314
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$GrizzlyWebSocketAdapter;->gWebSocket:Lorg/glassfish/grizzly/websockets/SimpleWebSocket;

    invoke-virtual {v0, p1}, Lorg/glassfish/grizzly/websockets/SimpleWebSocket;->sendPong([B)Lorg/glassfish/grizzly/GrizzlyFuture;

    .line 2315
    return-object p0
.end method

.method public stream(Ljava/lang/String;Z)Lcom/ning/http/client/ws/WebSocket;
    .locals 1
    .param p1, "fragment"    # Ljava/lang/String;
    .param p2, "last"    # Z

    .prologue
    .line 2302
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$GrizzlyWebSocketAdapter;->gWebSocket:Lorg/glassfish/grizzly/websockets/SimpleWebSocket;

    invoke-virtual {v0, p2, p1}, Lorg/glassfish/grizzly/websockets/SimpleWebSocket;->stream(ZLjava/lang/String;)Lorg/glassfish/grizzly/GrizzlyFuture;

    .line 2303
    return-object p0
.end method

.method public stream([BIIZ)Lcom/ning/http/client/ws/WebSocket;
    .locals 1
    .param p1, "fragment"    # [B
    .param p2, "offset"    # I
    .param p3, "len"    # I
    .param p4, "last"    # Z

    .prologue
    .line 2288
    invoke-static {p1}, Lcom/ning/http/util/MiscUtils;->isNonEmpty([B)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2289
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$GrizzlyWebSocketAdapter;->gWebSocket:Lorg/glassfish/grizzly/websockets/SimpleWebSocket;

    invoke-virtual {v0, p4, p1, p2, p3}, Lorg/glassfish/grizzly/websockets/SimpleWebSocket;->stream(Z[BII)Lorg/glassfish/grizzly/GrizzlyFuture;

    .line 2291
    :cond_0
    return-object p0
.end method

.method public stream([BZ)Lcom/ning/http/client/ws/WebSocket;
    .locals 3
    .param p1, "fragment"    # [B
    .param p2, "last"    # Z

    .prologue
    .line 2280
    invoke-static {p1}, Lcom/ning/http/util/MiscUtils;->isNonEmpty([B)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2281
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$GrizzlyWebSocketAdapter;->gWebSocket:Lorg/glassfish/grizzly/websockets/SimpleWebSocket;

    const/4 v1, 0x0

    array-length v2, p1

    invoke-virtual {v0, p2, p1, v1, v2}, Lorg/glassfish/grizzly/websockets/SimpleWebSocket;->stream(Z[BII)Lorg/glassfish/grizzly/GrizzlyFuture;

    .line 2283
    :cond_0
    return-object p0
.end method
