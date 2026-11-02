.class public Lcom/ning/http/client/ws/WebSocketUpgradeHandler;
.super Ljava/lang/Object;
.source "WebSocketUpgradeHandler.java"

# interfaces
.implements Lcom/ning/http/client/UpgradeHandler;
.implements Lcom/ning/http/client/AsyncHandler;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ning/http/client/ws/WebSocketUpgradeHandler$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/ning/http/client/UpgradeHandler",
        "<",
        "Lcom/ning/http/client/ws/WebSocket;",
        ">;",
        "Lcom/ning/http/client/AsyncHandler",
        "<",
        "Lcom/ning/http/client/ws/WebSocket;",
        ">;"
    }
.end annotation


# instance fields
.field private final listeners:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/ning/http/client/ws/WebSocketListener;",
            ">;"
        }
    .end annotation
.end field

.field private final ok:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private onSuccessCalled:Z

.field private status:I

.field private webSocket:Lcom/ning/http/client/ws/WebSocket;


# direct methods
.method protected constructor <init>()V
    .locals 2

    .prologue
    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/ning/http/client/ws/WebSocketUpgradeHandler;->ok:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 38
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/ning/http/client/ws/WebSocketUpgradeHandler;->listeners:Ljava/util/List;

    .line 39
    return-void
.end method

.method protected constructor <init>(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/ning/http/client/ws/WebSocketListener;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 41
    .local p1, "listeners":Ljava/util/List;, "Ljava/util/List<Lcom/ning/http/client/ws/WebSocketListener;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lcom/ning/http/client/ws/WebSocketUpgradeHandler;->ok:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 42
    iput-object p1, p0, Lcom/ning/http/client/ws/WebSocketUpgradeHandler;->listeners:Ljava/util/List;

    .line 43
    return-void
.end method


# virtual methods
.method public onBodyPartReceived(Lcom/ning/http/client/HttpResponseBodyPart;)Lcom/ning/http/client/AsyncHandler$STATE;
    .locals 1
    .param p1, "bodyPart"    # Lcom/ning/http/client/HttpResponseBodyPart;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 58
    sget-object v0, Lcom/ning/http/client/AsyncHandler$STATE;->CONTINUE:Lcom/ning/http/client/AsyncHandler$STATE;

    return-object v0
.end method

.method public onClose(Lcom/ning/http/client/ws/WebSocket;ILjava/lang/String;)V
    .locals 3
    .param p1, "webSocket"    # Lcom/ning/http/client/ws/WebSocket;
    .param p2, "status"    # I
    .param p3, "reasonPhrase"    # Ljava/lang/String;

    .prologue
    .line 111
    iget-object v2, p0, Lcom/ning/http/client/ws/WebSocketUpgradeHandler;->webSocket:Lcom/ning/http/client/ws/WebSocket;

    if-nez v2, :cond_0

    iput-object p1, p0, Lcom/ning/http/client/ws/WebSocketUpgradeHandler;->webSocket:Lcom/ning/http/client/ws/WebSocket;

    .line 113
    :cond_0
    iget-object v2, p0, Lcom/ning/http/client/ws/WebSocketUpgradeHandler;->listeners:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/ning/http/client/ws/WebSocketListener;

    .line 114
    .local v1, "listener":Lcom/ning/http/client/ws/WebSocketListener;
    if-eqz p1, :cond_2

    .line 115
    invoke-interface {p1, v1}, Lcom/ning/http/client/ws/WebSocket;->addWebSocketListener(Lcom/ning/http/client/ws/WebSocketListener;)Lcom/ning/http/client/ws/WebSocket;

    .line 117
    :cond_2
    invoke-interface {v1, p1}, Lcom/ning/http/client/ws/WebSocketListener;->onClose(Lcom/ning/http/client/ws/WebSocket;)V

    .line 118
    instance-of v2, v1, Lcom/ning/http/client/ws/WebSocketCloseCodeReasonListener;

    if-eqz v2, :cond_1

    .line 119
    const-class v2, Lcom/ning/http/client/ws/WebSocketCloseCodeReasonListener;

    invoke-virtual {v2, v1}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/ning/http/client/ws/WebSocketCloseCodeReasonListener;

    invoke-interface {v2, p1, p2, p3}, Lcom/ning/http/client/ws/WebSocketCloseCodeReasonListener;->onClose(Lcom/ning/http/client/ws/WebSocket;ILjava/lang/String;)V

    goto :goto_0

    .line 122
    .end local v1    # "listener":Lcom/ning/http/client/ws/WebSocketListener;
    :cond_3
    return-void
.end method

.method public onCompleted()Lcom/ning/http/client/ws/WebSocket;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 75
    iget v3, p0, Lcom/ning/http/client/ws/WebSocketUpgradeHandler;->status:I

    const/16 v4, 0x65

    if-eq v3, v4, :cond_1

    .line 76
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Invalid Status Code "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget v4, p0, Lcom/ning/http/client/ws/WebSocketUpgradeHandler;->status:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 77
    .local v0, "e":Ljava/lang/IllegalStateException;
    iget-object v3, p0, Lcom/ning/http/client/ws/WebSocketUpgradeHandler;->listeners:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/ning/http/client/ws/WebSocketListener;

    .line 78
    .local v2, "listener":Lcom/ning/http/client/ws/WebSocketListener;
    invoke-interface {v2, v0}, Lcom/ning/http/client/ws/WebSocketListener;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 80
    .end local v2    # "listener":Lcom/ning/http/client/ws/WebSocketListener;
    :cond_0
    const/4 v3, 0x0

    .line 86
    .end local v0    # "e":Ljava/lang/IllegalStateException;
    .end local v1    # "i$":Ljava/util/Iterator;
    :goto_1
    return-object v3

    .line 83
    :cond_1
    iget-object v3, p0, Lcom/ning/http/client/ws/WebSocketUpgradeHandler;->webSocket:Lcom/ning/http/client/ws/WebSocket;

    if-nez v3, :cond_2

    .line 84
    new-instance v3, Ljava/lang/IllegalStateException;

    const-string v4, "WebSocket is null"

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 86
    :cond_2
    iget-object v3, p0, Lcom/ning/http/client/ws/WebSocketUpgradeHandler;->webSocket:Lcom/ning/http/client/ws/WebSocket;

    goto :goto_1
.end method

.method public bridge synthetic onCompleted()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 29
    invoke-virtual {p0}, Lcom/ning/http/client/ws/WebSocketUpgradeHandler;->onCompleted()Lcom/ning/http/client/ws/WebSocket;

    move-result-object v0

    return-object v0
.end method

.method public onFailure(Ljava/lang/Throwable;)V
    .locals 3
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 101
    iget-object v2, p0, Lcom/ning/http/client/ws/WebSocketUpgradeHandler;->listeners:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/ning/http/client/ws/WebSocketListener;

    .line 102
    .local v1, "w":Lcom/ning/http/client/ws/WebSocketListener;
    iget-object v2, p0, Lcom/ning/http/client/ws/WebSocketUpgradeHandler;->ok:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v2

    if-nez v2, :cond_0

    iget-object v2, p0, Lcom/ning/http/client/ws/WebSocketUpgradeHandler;->webSocket:Lcom/ning/http/client/ws/WebSocket;

    if-eqz v2, :cond_0

    .line 103
    iget-object v2, p0, Lcom/ning/http/client/ws/WebSocketUpgradeHandler;->webSocket:Lcom/ning/http/client/ws/WebSocket;

    invoke-interface {v2, v1}, Lcom/ning/http/client/ws/WebSocket;->addWebSocketListener(Lcom/ning/http/client/ws/WebSocketListener;)Lcom/ning/http/client/ws/WebSocket;

    .line 105
    :cond_0
    invoke-interface {v1, p1}, Lcom/ning/http/client/ws/WebSocketListener;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 107
    .end local v1    # "w":Lcom/ning/http/client/ws/WebSocketListener;
    :cond_1
    return-void
.end method

.method public onHeadersReceived(Lcom/ning/http/client/HttpResponseHeaders;)Lcom/ning/http/client/AsyncHandler$STATE;
    .locals 1
    .param p1, "headers"    # Lcom/ning/http/client/HttpResponseHeaders;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 69
    sget-object v0, Lcom/ning/http/client/AsyncHandler$STATE;->CONTINUE:Lcom/ning/http/client/AsyncHandler$STATE;

    return-object v0
.end method

.method public onStatusReceived(Lcom/ning/http/client/HttpResponseStatus;)Lcom/ning/http/client/AsyncHandler$STATE;
    .locals 2
    .param p1, "responseStatus"    # Lcom/ning/http/client/HttpResponseStatus;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 63
    invoke-virtual {p1}, Lcom/ning/http/client/HttpResponseStatus;->getStatusCode()I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/ws/WebSocketUpgradeHandler;->status:I

    .line 64
    iget v0, p0, Lcom/ning/http/client/ws/WebSocketUpgradeHandler;->status:I

    const/16 v1, 0x65

    if-ne v0, v1, :cond_0

    sget-object v0, Lcom/ning/http/client/AsyncHandler$STATE;->UPGRADE:Lcom/ning/http/client/AsyncHandler$STATE;

    :goto_0
    return-object v0

    :cond_0
    sget-object v0, Lcom/ning/http/client/AsyncHandler$STATE;->ABORT:Lcom/ning/http/client/AsyncHandler$STATE;

    goto :goto_0
.end method

.method public onSuccess(Lcom/ning/http/client/ws/WebSocket;)V
    .locals 4
    .param p1, "webSocket"    # Lcom/ning/http/client/ws/WebSocket;

    .prologue
    .line 91
    iput-object p1, p0, Lcom/ning/http/client/ws/WebSocketUpgradeHandler;->webSocket:Lcom/ning/http/client/ws/WebSocket;

    .line 92
    iget-object v2, p0, Lcom/ning/http/client/ws/WebSocketUpgradeHandler;->listeners:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/ning/http/client/ws/WebSocketListener;

    .line 93
    .local v1, "listener":Lcom/ning/http/client/ws/WebSocketListener;
    invoke-interface {p1, v1}, Lcom/ning/http/client/ws/WebSocket;->addWebSocketListener(Lcom/ning/http/client/ws/WebSocketListener;)Lcom/ning/http/client/ws/WebSocket;

    .line 94
    invoke-interface {v1, p1}, Lcom/ning/http/client/ws/WebSocketListener;->onOpen(Lcom/ning/http/client/ws/WebSocket;)V

    goto :goto_0

    .line 96
    .end local v1    # "listener":Lcom/ning/http/client/ws/WebSocketListener;
    :cond_0
    iget-object v2, p0, Lcom/ning/http/client/ws/WebSocketUpgradeHandler;->ok:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 97
    return-void
.end method

.method public bridge synthetic onSuccess(Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 29
    check-cast p1, Lcom/ning/http/client/ws/WebSocket;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/ning/http/client/ws/WebSocketUpgradeHandler;->onSuccess(Lcom/ning/http/client/ws/WebSocket;)V

    return-void
.end method

.method public onThrowable(Ljava/lang/Throwable;)V
    .locals 0
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 47
    invoke-virtual {p0, p1}, Lcom/ning/http/client/ws/WebSocketUpgradeHandler;->onFailure(Ljava/lang/Throwable;)V

    .line 48
    return-void
.end method

.method public touchSuccess()Z
    .locals 2

    .prologue
    .line 51
    iget-boolean v0, p0, Lcom/ning/http/client/ws/WebSocketUpgradeHandler;->onSuccessCalled:Z

    .line 52
    .local v0, "prev":Z
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/ning/http/client/ws/WebSocketUpgradeHandler;->onSuccessCalled:Z

    .line 53
    return v0
.end method
