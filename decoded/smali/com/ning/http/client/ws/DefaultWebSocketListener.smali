.class public Lcom/ning/http/client/ws/DefaultWebSocketListener;
.super Ljava/lang/Object;
.source "DefaultWebSocketListener.java"

# interfaces
.implements Lcom/ning/http/client/ws/WebSocketByteListener;
.implements Lcom/ning/http/client/ws/WebSocketTextListener;
.implements Lcom/ning/http/client/ws/WebSocketPingListener;
.implements Lcom/ning/http/client/ws/WebSocketPongListener;


# instance fields
.field protected webSocket:Lcom/ning/http/client/ws/WebSocket;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClose(Lcom/ning/http/client/ws/WebSocket;)V
    .locals 1
    .param p1, "websocket"    # Lcom/ning/http/client/ws/WebSocket;

    .prologue
    .line 63
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/ning/http/client/ws/DefaultWebSocketListener;->webSocket:Lcom/ning/http/client/ws/WebSocket;

    .line 64
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 0
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 68
    return-void
.end method

.method public onMessage(Ljava/lang/String;)V
    .locals 0
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 52
    return-void
.end method

.method public onMessage([B)V
    .locals 0
    .param p1, "message"    # [B

    .prologue
    .line 31
    return-void
.end method

.method public onOpen(Lcom/ning/http/client/ws/WebSocket;)V
    .locals 0
    .param p1, "websocket"    # Lcom/ning/http/client/ws/WebSocket;

    .prologue
    .line 58
    iput-object p1, p0, Lcom/ning/http/client/ws/DefaultWebSocketListener;->webSocket:Lcom/ning/http/client/ws/WebSocket;

    .line 59
    return-void
.end method

.method public onPing([B)V
    .locals 0
    .param p1, "message"    # [B

    .prologue
    .line 37
    return-void
.end method

.method public onPong([B)V
    .locals 0
    .param p1, "message"    # [B

    .prologue
    .line 44
    return-void
.end method
