.class public interface abstract Lcom/ning/http/client/ws/WebSocket;
.super Ljava/lang/Object;
.source "WebSocket.java"

# interfaces
.implements Ljava/io/Closeable;


# virtual methods
.method public abstract addWebSocketListener(Lcom/ning/http/client/ws/WebSocketListener;)Lcom/ning/http/client/ws/WebSocket;
.end method

.method public abstract close()V
.end method

.method public abstract isOpen()Z
.end method

.method public abstract removeWebSocketListener(Lcom/ning/http/client/ws/WebSocketListener;)Lcom/ning/http/client/ws/WebSocket;
.end method

.method public abstract sendMessage(Ljava/lang/String;)Lcom/ning/http/client/ws/WebSocket;
.end method

.method public abstract sendMessage([B)Lcom/ning/http/client/ws/WebSocket;
.end method

.method public abstract sendPing([B)Lcom/ning/http/client/ws/WebSocket;
.end method

.method public abstract sendPong([B)Lcom/ning/http/client/ws/WebSocket;
.end method

.method public abstract stream(Ljava/lang/String;Z)Lcom/ning/http/client/ws/WebSocket;
.end method

.method public abstract stream([BIIZ)Lcom/ning/http/client/ws/WebSocket;
.end method

.method public abstract stream([BZ)Lcom/ning/http/client/ws/WebSocket;
.end method
