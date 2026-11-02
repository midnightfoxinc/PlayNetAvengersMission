.class final Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AHCWebSocketListenerAdapter;
.super Ljava/lang/Object;
.source "GrizzlyAsyncHttpProvider.java"

# interfaces
.implements Lorg/glassfish/grizzly/websockets/WebSocketListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "AHCWebSocketListenerAdapter"
.end annotation


# instance fields
.field private final ahcListener:Lcom/ning/http/client/ws/WebSocketListener;

.field private final byteArrayOutputStream:Ljava/io/ByteArrayOutputStream;

.field private final stringBuffer:Ljava/lang/StringBuilder;

.field private final webSocket:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$GrizzlyWebSocketAdapter;


# direct methods
.method constructor <init>(Lcom/ning/http/client/ws/WebSocketListener;Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$GrizzlyWebSocketAdapter;)V
    .locals 2
    .param p1, "ahcListener"    # Lcom/ning/http/client/ws/WebSocketListener;
    .param p2, "webSocket"    # Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$GrizzlyWebSocketAdapter;

    .prologue
    const/4 v1, 0x0

    .line 2355
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2356
    iput-object p1, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AHCWebSocketListenerAdapter;->ahcListener:Lcom/ning/http/client/ws/WebSocketListener;

    .line 2357
    iput-object p2, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AHCWebSocketListenerAdapter;->webSocket:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$GrizzlyWebSocketAdapter;

    .line 2358
    iget-boolean v0, p2, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$GrizzlyWebSocketAdapter;->bufferFragments:Z

    if-eqz v0, :cond_0

    .line 2359
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iput-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AHCWebSocketListenerAdapter;->stringBuffer:Ljava/lang/StringBuilder;

    .line 2360
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    iput-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AHCWebSocketListenerAdapter;->byteArrayOutputStream:Ljava/io/ByteArrayOutputStream;

    .line 2365
    :goto_0
    return-void

    .line 2362
    :cond_0
    iput-object v1, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AHCWebSocketListenerAdapter;->stringBuffer:Ljava/lang/StringBuilder;

    .line 2363
    iput-object v1, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AHCWebSocketListenerAdapter;->byteArrayOutputStream:Ljava/io/ByteArrayOutputStream;

    goto :goto_0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 2480
    if-ne p0, p1, :cond_1

    .line 2490
    :cond_0
    :goto_0
    return v1

    .line 2481
    :cond_1
    if-eqz p1, :cond_2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_3

    :cond_2
    move v1, v2

    goto :goto_0

    :cond_3
    move-object v0, p1

    .line 2483
    check-cast v0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AHCWebSocketListenerAdapter;

    .line 2485
    .local v0, "that":Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AHCWebSocketListenerAdapter;
    iget-object v3, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AHCWebSocketListenerAdapter;->ahcListener:Lcom/ning/http/client/ws/WebSocketListener;

    if-eqz v3, :cond_5

    iget-object v3, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AHCWebSocketListenerAdapter;->ahcListener:Lcom/ning/http/client/ws/WebSocketListener;

    iget-object v4, v0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AHCWebSocketListenerAdapter;->ahcListener:Lcom/ning/http/client/ws/WebSocketListener;

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_6

    :cond_4
    move v1, v2

    .line 2486
    goto :goto_0

    .line 2485
    :cond_5
    iget-object v3, v0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AHCWebSocketListenerAdapter;->ahcListener:Lcom/ning/http/client/ws/WebSocketListener;

    if-nez v3, :cond_4

    .line 2487
    :cond_6
    iget-object v3, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AHCWebSocketListenerAdapter;->webSocket:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$GrizzlyWebSocketAdapter;

    if-eqz v3, :cond_7

    iget-object v3, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AHCWebSocketListenerAdapter;->webSocket:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$GrizzlyWebSocketAdapter;

    iget-object v4, v0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AHCWebSocketListenerAdapter;->webSocket:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$GrizzlyWebSocketAdapter;

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    :goto_1
    move v1, v2

    .line 2488
    goto :goto_0

    .line 2487
    :cond_7
    iget-object v3, v0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AHCWebSocketListenerAdapter;->webSocket:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$GrizzlyWebSocketAdapter;

    if-eqz v3, :cond_0

    goto :goto_1
.end method

.method public hashCode()I
    .locals 4

    .prologue
    const/4 v1, 0x0

    .line 2495
    iget-object v2, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AHCWebSocketListenerAdapter;->ahcListener:Lcom/ning/http/client/ws/WebSocketListener;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AHCWebSocketListenerAdapter;->ahcListener:Lcom/ning/http/client/ws/WebSocketListener;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v0

    .line 2496
    .local v0, "result":I
    :goto_0
    mul-int/lit8 v2, v0, 0x1f

    iget-object v3, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AHCWebSocketListenerAdapter;->webSocket:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$GrizzlyWebSocketAdapter;

    if-eqz v3, :cond_0

    iget-object v1, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AHCWebSocketListenerAdapter;->webSocket:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$GrizzlyWebSocketAdapter;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    :cond_0
    add-int v0, v2, v1

    .line 2497
    return v0

    .end local v0    # "result":I
    :cond_1
    move v0, v1

    .line 2495
    goto :goto_0
.end method

.method public onClose(Lorg/glassfish/grizzly/websockets/WebSocket;Lorg/glassfish/grizzly/websockets/DataFrame;)V
    .locals 6
    .param p1, "gWebSocket"    # Lorg/glassfish/grizzly/websockets/WebSocket;
    .param p2, "dataFrame"    # Lorg/glassfish/grizzly/websockets/DataFrame;

    .prologue
    .line 2374
    :try_start_0
    iget-object v2, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AHCWebSocketListenerAdapter;->ahcListener:Lcom/ning/http/client/ws/WebSocketListener;

    instance-of v2, v2, Lcom/ning/http/client/ws/WebSocketCloseCodeReasonListener;

    if-eqz v2, :cond_0

    .line 2375
    const-class v2, Lorg/glassfish/grizzly/websockets/ClosingFrame;

    invoke-virtual {v2, p2}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/glassfish/grizzly/websockets/ClosingFrame;

    .line 2376
    .local v0, "cf":Lorg/glassfish/grizzly/websockets/ClosingFrame;
    const-class v2, Lcom/ning/http/client/ws/WebSocketCloseCodeReasonListener;

    iget-object v3, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AHCWebSocketListenerAdapter;->ahcListener:Lcom/ning/http/client/ws/WebSocketListener;

    invoke-virtual {v2, v3}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/ning/http/client/ws/WebSocketCloseCodeReasonListener;

    iget-object v3, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AHCWebSocketListenerAdapter;->webSocket:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$GrizzlyWebSocketAdapter;

    invoke-virtual {v0}, Lorg/glassfish/grizzly/websockets/ClosingFrame;->getCode()I

    move-result v4

    invoke-virtual {v0}, Lorg/glassfish/grizzly/websockets/ClosingFrame;->getReason()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v2, v3, v4, v5}, Lcom/ning/http/client/ws/WebSocketCloseCodeReasonListener;->onClose(Lcom/ning/http/client/ws/WebSocket;ILjava/lang/String;)V

    .line 2383
    .end local v0    # "cf":Lorg/glassfish/grizzly/websockets/ClosingFrame;
    :goto_0
    return-void

    .line 2378
    :cond_0
    iget-object v2, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AHCWebSocketListenerAdapter;->ahcListener:Lcom/ning/http/client/ws/WebSocketListener;

    iget-object v3, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AHCWebSocketListenerAdapter;->webSocket:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$GrizzlyWebSocketAdapter;

    invoke-interface {v2, v3}, Lcom/ning/http/client/ws/WebSocketListener;->onClose(Lcom/ning/http/client/ws/WebSocket;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 2380
    :catch_0
    move-exception v1

    .line 2381
    .local v1, "e":Ljava/lang/Throwable;
    iget-object v2, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AHCWebSocketListenerAdapter;->ahcListener:Lcom/ning/http/client/ws/WebSocketListener;

    invoke-interface {v2, v1}, Lcom/ning/http/client/ws/WebSocketListener;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onConnect(Lorg/glassfish/grizzly/websockets/WebSocket;)V
    .locals 3
    .param p1, "gWebSocket"    # Lorg/glassfish/grizzly/websockets/WebSocket;

    .prologue
    .line 2388
    :try_start_0
    iget-object v1, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AHCWebSocketListenerAdapter;->ahcListener:Lcom/ning/http/client/ws/WebSocketListener;

    iget-object v2, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AHCWebSocketListenerAdapter;->webSocket:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$GrizzlyWebSocketAdapter;

    invoke-interface {v1, v2}, Lcom/ning/http/client/ws/WebSocketListener;->onOpen(Lcom/ning/http/client/ws/WebSocket;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 2392
    :goto_0
    return-void

    .line 2389
    :catch_0
    move-exception v0

    .line 2390
    .local v0, "e":Ljava/lang/Throwable;
    iget-object v1, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AHCWebSocketListenerAdapter;->ahcListener:Lcom/ning/http/client/ws/WebSocketListener;

    invoke-interface {v1, v0}, Lcom/ning/http/client/ws/WebSocketListener;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onFragment(Lorg/glassfish/grizzly/websockets/WebSocket;Ljava/lang/String;Z)V
    .locals 5
    .param p1, "webSocket"    # Lorg/glassfish/grizzly/websockets/WebSocket;
    .param p2, "s"    # Ljava/lang/String;
    .param p3, "last"    # Z

    .prologue
    .line 2441
    :try_start_0
    iget-object v2, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AHCWebSocketListenerAdapter;->webSocket:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$GrizzlyWebSocketAdapter;

    iget-boolean v2, v2, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$GrizzlyWebSocketAdapter;->bufferFragments:Z

    if-eqz v2, :cond_1

    .line 2442
    iget-object v3, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AHCWebSocketListenerAdapter;->webSocket:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$GrizzlyWebSocketAdapter;

    monitor-enter v3
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 2443
    :try_start_1
    iget-object v2, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AHCWebSocketListenerAdapter;->stringBuffer:Ljava/lang/StringBuilder;

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 2444
    if-eqz p3, :cond_0

    .line 2445
    iget-object v2, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AHCWebSocketListenerAdapter;->ahcListener:Lcom/ning/http/client/ws/WebSocketListener;

    instance-of v2, v2, Lcom/ning/http/client/ws/WebSocketTextListener;

    if-eqz v2, :cond_0

    .line 2446
    iget-object v2, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AHCWebSocketListenerAdapter;->stringBuffer:Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 2447
    .local v1, "message":Ljava/lang/String;
    iget-object v2, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AHCWebSocketListenerAdapter;->stringBuffer:Ljava/lang/StringBuilder;

    const/4 v4, 0x0

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 2448
    const-class v2, Lcom/ning/http/client/ws/WebSocketTextListener;

    iget-object v4, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AHCWebSocketListenerAdapter;->ahcListener:Lcom/ning/http/client/ws/WebSocketListener;

    invoke-virtual {v2, v4}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/ning/http/client/ws/WebSocketTextListener;

    invoke-interface {v2, v1}, Lcom/ning/http/client/ws/WebSocketTextListener;->onMessage(Ljava/lang/String;)V

    .line 2451
    .end local v1    # "message":Ljava/lang/String;
    :cond_0
    monitor-exit v3

    .line 2456
    :cond_1
    :goto_0
    return-void

    .line 2451
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw v2
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_0

    .line 2453
    :catch_0
    move-exception v0

    .line 2454
    .local v0, "e":Ljava/lang/Throwable;
    iget-object v2, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AHCWebSocketListenerAdapter;->ahcListener:Lcom/ning/http/client/ws/WebSocketListener;

    invoke-interface {v2, v0}, Lcom/ning/http/client/ws/WebSocketListener;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onFragment(Lorg/glassfish/grizzly/websockets/WebSocket;[BZ)V
    .locals 5
    .param p1, "webSocket"    # Lorg/glassfish/grizzly/websockets/WebSocket;
    .param p2, "bytes"    # [B
    .param p3, "last"    # Z

    .prologue
    .line 2461
    :try_start_0
    iget-object v2, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AHCWebSocketListenerAdapter;->webSocket:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$GrizzlyWebSocketAdapter;

    iget-boolean v2, v2, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$GrizzlyWebSocketAdapter;->bufferFragments:Z

    if-eqz v2, :cond_1

    .line 2462
    iget-object v3, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AHCWebSocketListenerAdapter;->webSocket:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$GrizzlyWebSocketAdapter;

    monitor-enter v3
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 2463
    :try_start_1
    iget-object v2, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AHCWebSocketListenerAdapter;->byteArrayOutputStream:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v2, p2}, Ljava/io/ByteArrayOutputStream;->write([B)V

    .line 2464
    if-eqz p3, :cond_0

    .line 2465
    iget-object v2, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AHCWebSocketListenerAdapter;->ahcListener:Lcom/ning/http/client/ws/WebSocketListener;

    instance-of v2, v2, Lcom/ning/http/client/ws/WebSocketByteListener;

    if-eqz v2, :cond_0

    .line 2466
    iget-object v2, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AHCWebSocketListenerAdapter;->byteArrayOutputStream:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0

    .line 2467
    .local v0, "bytesLocal":[B
    iget-object v2, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AHCWebSocketListenerAdapter;->byteArrayOutputStream:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->reset()V

    .line 2468
    const-class v2, Lcom/ning/http/client/ws/WebSocketByteListener;

    iget-object v4, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AHCWebSocketListenerAdapter;->ahcListener:Lcom/ning/http/client/ws/WebSocketListener;

    invoke-virtual {v2, v4}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/ning/http/client/ws/WebSocketByteListener;

    invoke-interface {v2, v0}, Lcom/ning/http/client/ws/WebSocketByteListener;->onMessage([B)V

    .line 2471
    .end local v0    # "bytesLocal":[B
    :cond_0
    monitor-exit v3

    .line 2476
    :cond_1
    :goto_0
    return-void

    .line 2471
    :catchall_0
    move-exception v2

    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw v2
    :try_end_2
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_2} :catch_0

    .line 2473
    :catch_0
    move-exception v1

    .line 2474
    .local v1, "e":Ljava/lang/Throwable;
    iget-object v2, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AHCWebSocketListenerAdapter;->ahcListener:Lcom/ning/http/client/ws/WebSocketListener;

    invoke-interface {v2, v1}, Lcom/ning/http/client/ws/WebSocketListener;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onMessage(Lorg/glassfish/grizzly/websockets/WebSocket;Ljava/lang/String;)V
    .locals 3
    .param p1, "webSocket"    # Lorg/glassfish/grizzly/websockets/WebSocket;
    .param p2, "s"    # Ljava/lang/String;

    .prologue
    .line 2397
    :try_start_0
    iget-object v1, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AHCWebSocketListenerAdapter;->ahcListener:Lcom/ning/http/client/ws/WebSocketListener;

    instance-of v1, v1, Lcom/ning/http/client/ws/WebSocketTextListener;

    if-eqz v1, :cond_0

    .line 2398
    const-class v1, Lcom/ning/http/client/ws/WebSocketTextListener;

    iget-object v2, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AHCWebSocketListenerAdapter;->ahcListener:Lcom/ning/http/client/ws/WebSocketListener;

    invoke-virtual {v1, v2}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/ning/http/client/ws/WebSocketTextListener;

    invoke-interface {v1, p2}, Lcom/ning/http/client/ws/WebSocketTextListener;->onMessage(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 2403
    :cond_0
    :goto_0
    return-void

    .line 2400
    :catch_0
    move-exception v0

    .line 2401
    .local v0, "e":Ljava/lang/Throwable;
    iget-object v1, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AHCWebSocketListenerAdapter;->ahcListener:Lcom/ning/http/client/ws/WebSocketListener;

    invoke-interface {v1, v0}, Lcom/ning/http/client/ws/WebSocketListener;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onMessage(Lorg/glassfish/grizzly/websockets/WebSocket;[B)V
    .locals 3
    .param p1, "webSocket"    # Lorg/glassfish/grizzly/websockets/WebSocket;
    .param p2, "bytes"    # [B

    .prologue
    .line 2408
    :try_start_0
    iget-object v1, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AHCWebSocketListenerAdapter;->ahcListener:Lcom/ning/http/client/ws/WebSocketListener;

    instance-of v1, v1, Lcom/ning/http/client/ws/WebSocketByteListener;

    if-eqz v1, :cond_0

    .line 2409
    const-class v1, Lcom/ning/http/client/ws/WebSocketByteListener;

    iget-object v2, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AHCWebSocketListenerAdapter;->ahcListener:Lcom/ning/http/client/ws/WebSocketListener;

    invoke-virtual {v1, v2}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/ning/http/client/ws/WebSocketByteListener;

    invoke-interface {v1, p2}, Lcom/ning/http/client/ws/WebSocketByteListener;->onMessage([B)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 2414
    :cond_0
    :goto_0
    return-void

    .line 2411
    :catch_0
    move-exception v0

    .line 2412
    .local v0, "e":Ljava/lang/Throwable;
    iget-object v1, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AHCWebSocketListenerAdapter;->ahcListener:Lcom/ning/http/client/ws/WebSocketListener;

    invoke-interface {v1, v0}, Lcom/ning/http/client/ws/WebSocketListener;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onPing(Lorg/glassfish/grizzly/websockets/WebSocket;[B)V
    .locals 3
    .param p1, "webSocket"    # Lorg/glassfish/grizzly/websockets/WebSocket;
    .param p2, "bytes"    # [B

    .prologue
    .line 2419
    :try_start_0
    iget-object v1, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AHCWebSocketListenerAdapter;->ahcListener:Lcom/ning/http/client/ws/WebSocketListener;

    instance-of v1, v1, Lcom/ning/http/client/ws/WebSocketPingListener;

    if-eqz v1, :cond_0

    .line 2420
    const-class v1, Lcom/ning/http/client/ws/WebSocketPingListener;

    iget-object v2, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AHCWebSocketListenerAdapter;->ahcListener:Lcom/ning/http/client/ws/WebSocketListener;

    invoke-virtual {v1, v2}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/ning/http/client/ws/WebSocketPingListener;

    invoke-interface {v1, p2}, Lcom/ning/http/client/ws/WebSocketPingListener;->onPing([B)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 2425
    :cond_0
    :goto_0
    return-void

    .line 2422
    :catch_0
    move-exception v0

    .line 2423
    .local v0, "e":Ljava/lang/Throwable;
    iget-object v1, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AHCWebSocketListenerAdapter;->ahcListener:Lcom/ning/http/client/ws/WebSocketListener;

    invoke-interface {v1, v0}, Lcom/ning/http/client/ws/WebSocketListener;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public onPong(Lorg/glassfish/grizzly/websockets/WebSocket;[B)V
    .locals 3
    .param p1, "webSocket"    # Lorg/glassfish/grizzly/websockets/WebSocket;
    .param p2, "bytes"    # [B

    .prologue
    .line 2430
    :try_start_0
    iget-object v1, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AHCWebSocketListenerAdapter;->ahcListener:Lcom/ning/http/client/ws/WebSocketListener;

    instance-of v1, v1, Lcom/ning/http/client/ws/WebSocketPongListener;

    if-eqz v1, :cond_0

    .line 2431
    const-class v1, Lcom/ning/http/client/ws/WebSocketPongListener;

    iget-object v2, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AHCWebSocketListenerAdapter;->ahcListener:Lcom/ning/http/client/ws/WebSocketListener;

    invoke-virtual {v1, v2}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/ning/http/client/ws/WebSocketPongListener;

    invoke-interface {v1, p2}, Lcom/ning/http/client/ws/WebSocketPongListener;->onPong([B)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 2436
    :cond_0
    :goto_0
    return-void

    .line 2433
    :catch_0
    move-exception v0

    .line 2434
    .local v0, "e":Ljava/lang/Throwable;
    iget-object v1, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AHCWebSocketListenerAdapter;->ahcListener:Lcom/ning/http/client/ws/WebSocketListener;

    invoke-interface {v1, v0}, Lcom/ning/http/client/ws/WebSocketListener;->onError(Ljava/lang/Throwable;)V

    goto :goto_0
.end method
