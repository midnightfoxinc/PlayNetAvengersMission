.class public Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;
.super Ljava/lang/Object;
.source "NettyWebSocket.java"

# interfaces
.implements Lcom/ning/http/client/ws/WebSocket;


# static fields
.field private static final LOGGER:Lorg/slf4j/Logger;


# instance fields
.field private _fragments:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/jboss/netty/buffer/ChannelBuffer;",
            ">;"
        }
    .end annotation
.end field

.field private bufferSize:I

.field protected final channel:Lorg/jboss/netty/channel/Channel;

.field private volatile interestedInByteMessages:Z

.field private volatile interestedInTextMessages:Z

.field protected final listeners:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection",
            "<",
            "Lcom/ning/http/client/ws/WebSocketListener;",
            ">;"
        }
    .end annotation
.end field

.field protected final maxBufferSize:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 51
    const-class v0, Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    sput-object v0, Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;->LOGGER:Lorg/slf4j/Logger;

    return-void
.end method

.method public constructor <init>(Lorg/jboss/netty/channel/Channel;Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;)V
    .locals 1
    .param p1, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p2, "nettyConfig"    # Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;

    .prologue
    .line 62
    new-instance v0, Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    invoke-direct {p0, p1, p2, v0}, Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;-><init>(Lorg/jboss/netty/channel/Channel;Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;Ljava/util/Collection;)V

    .line 63
    return-void
.end method

.method public constructor <init>(Lorg/jboss/netty/channel/Channel;Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;Ljava/util/Collection;)V
    .locals 1
    .param p1, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p2, "nettyConfig"    # Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jboss/netty/channel/Channel;",
            "Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;",
            "Ljava/util/Collection",
            "<",
            "Lcom/ning/http/client/ws/WebSocketListener;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 65
    .local p3, "listeners":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/ning/http/client/ws/WebSocketListener;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 66
    iput-object p1, p0, Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;->channel:Lorg/jboss/netty/channel/Channel;

    .line 67
    iput-object p3, p0, Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;->listeners:Ljava/util/Collection;

    .line 68
    invoke-virtual {p2}, Lcom/ning/http/client/providers/netty/NettyAsyncHttpProviderConfig;->getWebSocketMaxBufferSize()I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;->maxBufferSize:I

    .line 69
    return-void
.end method

.method private bufferFragment(Lorg/jboss/netty/buffer/ChannelBuffer;)V
    .locals 3
    .param p1, "buffer"    # Lorg/jboss/netty/buffer/ChannelBuffer;

    .prologue
    .line 213
    iget v0, p0, Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;->bufferSize:I

    invoke-interface {p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v1

    add-int/2addr v0, v1

    iput v0, p0, Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;->bufferSize:I

    .line 214
    iget v0, p0, Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;->bufferSize:I

    iget v1, p0, Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;->maxBufferSize:I

    if-le v0, v1, :cond_0

    .line 215
    new-instance v0, Ljava/lang/Exception;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Exceeded Netty Web Socket maximum buffer size of "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;->maxBufferSize:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0}, Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;->onError(Ljava/lang/Throwable;)V

    .line 216
    invoke-direct {p0}, Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;->reset()V

    .line 217
    invoke-virtual {p0}, Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;->close()V

    .line 221
    :goto_0
    return-void

    .line 219
    :cond_0
    invoke-direct {p0}, Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;->fragments()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method private fragments()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/jboss/netty/buffer/ChannelBuffer;",
            ">;"
        }
    .end annotation

    .prologue
    .line 207
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;->_fragments:Ljava/util/List;

    if-nez v0, :cond_0

    .line 208
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x2

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;->_fragments:Ljava/util/List;

    .line 209
    :cond_0
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;->_fragments:Ljava/util/List;

    return-object v0
.end method

.method private hasWebSocketByteListener()Z
    .locals 3

    .prologue
    .line 171
    iget-object v2, p0, Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;->listeners:Ljava/util/Collection;

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/ning/http/client/ws/WebSocketListener;

    .line 172
    .local v1, "listener":Lcom/ning/http/client/ws/WebSocketListener;
    instance-of v2, v1, Lcom/ning/http/client/ws/WebSocketByteListener;

    if-eqz v2, :cond_0

    .line 173
    const/4 v2, 0x1

    .line 175
    .end local v1    # "listener":Lcom/ning/http/client/ws/WebSocketListener;
    :goto_0
    return v2

    :cond_1
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private hasWebSocketTextListener()Z
    .locals 3

    .prologue
    .line 179
    iget-object v2, p0, Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;->listeners:Ljava/util/Collection;

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/ning/http/client/ws/WebSocketListener;

    .line 180
    .local v1, "listener":Lcom/ning/http/client/ws/WebSocketListener;
    instance-of v2, v1, Lcom/ning/http/client/ws/WebSocketTextListener;

    if-eqz v2, :cond_0

    .line 181
    const/4 v2, 0x1

    .line 183
    .end local v1    # "listener":Lcom/ning/http/client/ws/WebSocketListener;
    :goto_0
    return v2

    :cond_1
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private notifyByteListeners(Lorg/jboss/netty/buffer/ChannelBuffer;)V
    .locals 4
    .param p1, "channelBuffer"    # Lorg/jboss/netty/buffer/ChannelBuffer;

    .prologue
    .line 229
    invoke-static {p1}, Lcom/ning/http/client/providers/netty/util/ChannelBufferUtils;->channelBuffer2bytes(Lorg/jboss/netty/buffer/ChannelBuffer;)[B

    move-result-object v2

    .line 230
    .local v2, "message":[B
    iget-object v3, p0, Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;->listeners:Ljava/util/Collection;

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/ning/http/client/ws/WebSocketListener;

    .line 231
    .local v1, "listener":Lcom/ning/http/client/ws/WebSocketListener;
    instance-of v3, v1, Lcom/ning/http/client/ws/WebSocketByteListener;

    if-eqz v3, :cond_0

    .line 232
    const-class v3, Lcom/ning/http/client/ws/WebSocketByteListener;

    invoke-virtual {v3, v1}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/ning/http/client/ws/WebSocketByteListener;

    invoke-interface {v3, v2}, Lcom/ning/http/client/ws/WebSocketByteListener;->onMessage([B)V

    goto :goto_0

    .line 234
    .end local v1    # "listener":Lcom/ning/http/client/ws/WebSocketListener;
    :cond_1
    return-void
.end method

.method private notifyTextListeners(Lorg/jboss/netty/buffer/ChannelBuffer;)V
    .locals 4
    .param p1, "channelBuffer"    # Lorg/jboss/netty/buffer/ChannelBuffer;

    .prologue
    .line 237
    sget-object v3, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-interface {p1, v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->toString(Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v2

    .line 238
    .local v2, "message":Ljava/lang/String;
    iget-object v3, p0, Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;->listeners:Ljava/util/Collection;

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/ning/http/client/ws/WebSocketListener;

    .line 239
    .local v1, "listener":Lcom/ning/http/client/ws/WebSocketListener;
    instance-of v3, v1, Lcom/ning/http/client/ws/WebSocketTextListener;

    if-eqz v3, :cond_0

    .line 240
    const-class v3, Lcom/ning/http/client/ws/WebSocketTextListener;

    invoke-virtual {v3, v1}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/ning/http/client/ws/WebSocketTextListener;

    invoke-interface {v3, v2}, Lcom/ning/http/client/ws/WebSocketTextListener;->onMessage(Ljava/lang/String;)V

    goto :goto_0

    .line 242
    .end local v1    # "listener":Lcom/ning/http/client/ws/WebSocketListener;
    :cond_1
    return-void
.end method

.method private reset()V
    .locals 1

    .prologue
    .line 224
    invoke-direct {p0}, Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;->fragments()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 225
    const/4 v0, 0x0

    iput v0, p0, Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;->bufferSize:I

    .line 226
    return-void
.end method


# virtual methods
.method public addWebSocketListener(Lcom/ning/http/client/ws/WebSocketListener;)Lcom/ning/http/client/ws/WebSocket;
    .locals 3
    .param p1, "l"    # Lcom/ning/http/client/ws/WebSocketListener;

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 188
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;->listeners:Ljava/util/Collection;

    invoke-interface {v0, p1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 189
    iget-boolean v0, p0, Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;->interestedInByteMessages:Z

    if-nez v0, :cond_0

    instance-of v0, p1, Lcom/ning/http/client/ws/WebSocketByteListener;

    if-eqz v0, :cond_3

    :cond_0
    move v0, v2

    :goto_0
    iput-boolean v0, p0, Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;->interestedInByteMessages:Z

    .line 190
    iget-boolean v0, p0, Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;->interestedInTextMessages:Z

    if-nez v0, :cond_1

    instance-of v0, p1, Lcom/ning/http/client/ws/WebSocketTextListener;

    if-eqz v0, :cond_2

    :cond_1
    move v1, v2

    :cond_2
    iput-boolean v1, p0, Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;->interestedInTextMessages:Z

    .line 191
    return-object p0

    :cond_3
    move v0, v1

    .line 189
    goto :goto_0
.end method

.method public close()V
    .locals 2

    .prologue
    .line 126
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;->channel:Lorg/jboss/netty/channel/Channel;

    invoke-interface {v0}, Lorg/jboss/netty/channel/Channel;->isOpen()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 127
    invoke-virtual {p0}, Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;->onClose()V

    .line 128
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;->listeners:Ljava/util/Collection;

    invoke-interface {v0}, Ljava/util/Collection;->clear()V

    .line 129
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;->channel:Lorg/jboss/netty/channel/Channel;

    new-instance v1, Lorg/jboss/netty/handler/codec/http/websocketx/CloseWebSocketFrame;

    invoke-direct {v1}, Lorg/jboss/netty/handler/codec/http/websocketx/CloseWebSocketFrame;-><init>()V

    invoke-interface {v0, v1}, Lorg/jboss/netty/channel/Channel;->write(Ljava/lang/Object;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v0

    sget-object v1, Lorg/jboss/netty/channel/ChannelFutureListener;->CLOSE:Lorg/jboss/netty/channel/ChannelFutureListener;

    invoke-interface {v0, v1}, Lorg/jboss/netty/channel/ChannelFuture;->addListener(Lorg/jboss/netty/channel/ChannelFutureListener;)V

    .line 131
    :cond_0
    return-void
.end method

.method public close(ILjava/lang/String;)V
    .locals 1
    .param p1, "statusCode"    # I
    .param p2, "reason"    # Ljava/lang/String;

    .prologue
    .line 134
    invoke-virtual {p0, p1, p2}, Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;->onClose(ILjava/lang/String;)V

    .line 135
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;->listeners:Ljava/util/Collection;

    invoke-interface {v0}, Ljava/util/Collection;->clear()V

    .line 136
    return-void
.end method

.method public isOpen()Z
    .locals 1

    .prologue
    .line 121
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;->channel:Lorg/jboss/netty/channel/Channel;

    invoke-interface {v0}, Lorg/jboss/netty/channel/Channel;->isOpen()Z

    move-result v0

    return v0
.end method

.method public onBinaryFragment(Lcom/ning/http/client/HttpResponseBodyPart;)V
    .locals 5
    .param p1, "part"    # Lcom/ning/http/client/HttpResponseBodyPart;

    .prologue
    .line 246
    iget-object v3, p0, Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;->listeners:Ljava/util/Collection;

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/ning/http/client/ws/WebSocketListener;

    .line 247
    .local v2, "listener":Lcom/ning/http/client/ws/WebSocketListener;
    instance-of v3, v2, Lcom/ning/http/client/ws/WebSocketByteFragmentListener;

    if-eqz v3, :cond_0

    .line 248
    const-class v3, Lcom/ning/http/client/ws/WebSocketByteFragmentListener;

    invoke-virtual {v3, v2}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/ning/http/client/ws/WebSocketByteFragmentListener;

    invoke-interface {v3, p1}, Lcom/ning/http/client/ws/WebSocketByteFragmentListener;->onFragment(Lcom/ning/http/client/HttpResponseBodyPart;)V

    goto :goto_0

    .line 251
    .end local v2    # "listener":Lcom/ning/http/client/ws/WebSocketListener;
    :cond_1
    iget-boolean v3, p0, Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;->interestedInByteMessages:Z

    if-eqz v3, :cond_2

    .line 252
    const-class v3, Lcom/ning/http/client/providers/netty/response/NettyResponseBodyPart;

    invoke-virtual {v3, p1}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/ning/http/client/providers/netty/response/NettyResponseBodyPart;

    invoke-virtual {v3}, Lcom/ning/http/client/providers/netty/response/NettyResponseBodyPart;->getChannelBuffer()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    .line 254
    .local v0, "fragment":Lorg/jboss/netty/buffer/ChannelBuffer;
    invoke-virtual {p1}, Lcom/ning/http/client/HttpResponseBodyPart;->isLast()Z

    move-result v3

    if-eqz v3, :cond_4

    .line 255
    iget v3, p0, Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;->bufferSize:I

    if-nez v3, :cond_3

    .line 256
    invoke-direct {p0, v0}, Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;->notifyByteListeners(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    .line 263
    :goto_1
    invoke-direct {p0}, Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;->reset()V

    .line 268
    .end local v0    # "fragment":Lorg/jboss/netty/buffer/ChannelBuffer;
    :cond_2
    :goto_2
    return-void

    .line 259
    .restart local v0    # "fragment":Lorg/jboss/netty/buffer/ChannelBuffer;
    :cond_3
    invoke-direct {p0, v0}, Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;->bufferFragment(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    .line 260
    invoke-direct {p0}, Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;->fragments()Ljava/util/List;

    move-result-object v3

    invoke-direct {p0}, Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;->fragments()Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    new-array v4, v4, [Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v3, v4}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-static {v3}, Lorg/jboss/netty/buffer/ChannelBuffers;->wrappedBuffer([Lorg/jboss/netty/buffer/ChannelBuffer;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;->notifyByteListeners(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    goto :goto_1

    .line 266
    :cond_4
    invoke-direct {p0, v0}, Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;->bufferFragment(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    goto :goto_2
.end method

.method protected onClose()V
    .locals 2

    .prologue
    .line 149
    const/16 v0, 0x3e8

    const-string v1, "Normal closure; the connection successfully completed whatever purpose for which it was created."

    invoke-virtual {p0, v0, v1}, Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;->onClose(ILjava/lang/String;)V

    .line 150
    return-void
.end method

.method public onClose(ILjava/lang/String;)V
    .locals 4
    .param p1, "code"    # I
    .param p2, "reason"    # Ljava/lang/String;

    .prologue
    .line 153
    iget-object v3, p0, Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;->listeners:Ljava/util/Collection;

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/ning/http/client/ws/WebSocketListener;

    .line 155
    .local v1, "l":Lcom/ning/http/client/ws/WebSocketListener;
    :try_start_0
    instance-of v3, v1, Lcom/ning/http/client/ws/WebSocketCloseCodeReasonListener;

    if-eqz v3, :cond_0

    .line 156
    const-class v3, Lcom/ning/http/client/ws/WebSocketCloseCodeReasonListener;

    invoke-virtual {v3, v1}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/ning/http/client/ws/WebSocketCloseCodeReasonListener;

    invoke-interface {v3, p0, p1, p2}, Lcom/ning/http/client/ws/WebSocketCloseCodeReasonListener;->onClose(Lcom/ning/http/client/ws/WebSocket;ILjava/lang/String;)V

    .line 158
    :cond_0
    invoke-interface {v1, p0}, Lcom/ning/http/client/ws/WebSocketListener;->onClose(Lcom/ning/http/client/ws/WebSocket;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 159
    :catch_0
    move-exception v2

    .line 160
    .local v2, "t":Ljava/lang/Throwable;
    invoke-interface {v1, v2}, Lcom/ning/http/client/ws/WebSocketListener;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 163
    .end local v1    # "l":Lcom/ning/http/client/ws/WebSocketListener;
    .end local v2    # "t":Ljava/lang/Throwable;
    :cond_1
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 5
    .param p1, "t"    # Ljava/lang/Throwable;

    .prologue
    .line 139
    iget-object v3, p0, Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;->listeners:Ljava/util/Collection;

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/ning/http/client/ws/WebSocketListener;

    .line 141
    .local v1, "listener":Lcom/ning/http/client/ws/WebSocketListener;
    :try_start_0
    invoke-interface {v1, p1}, Lcom/ning/http/client/ws/WebSocketListener;->onError(Ljava/lang/Throwable;)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 142
    :catch_0
    move-exception v2

    .line 143
    .local v2, "t2":Ljava/lang/Throwable;
    sget-object v3, Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;->LOGGER:Lorg/slf4j/Logger;

    const-string v4, ""

    invoke-interface {v3, v4, v2}, Lorg/slf4j/Logger;->error(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 146
    .end local v1    # "listener":Lcom/ning/http/client/ws/WebSocketListener;
    .end local v2    # "t2":Ljava/lang/Throwable;
    :cond_0
    return-void
.end method

.method public onPing(Lcom/ning/http/client/HttpResponseBodyPart;)V
    .locals 4
    .param p1, "part"    # Lcom/ning/http/client/HttpResponseBodyPart;

    .prologue
    .line 296
    iget-object v2, p0, Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;->listeners:Ljava/util/Collection;

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/ning/http/client/ws/WebSocketListener;

    .line 297
    .local v1, "listener":Lcom/ning/http/client/ws/WebSocketListener;
    instance-of v2, v1, Lcom/ning/http/client/ws/WebSocketPingListener;

    if-eqz v2, :cond_0

    .line 299
    const-class v2, Lcom/ning/http/client/ws/WebSocketPingListener;

    invoke-virtual {v2, v1}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/ning/http/client/ws/WebSocketPingListener;

    invoke-virtual {p1}, Lcom/ning/http/client/HttpResponseBodyPart;->getBodyPartBytes()[B

    move-result-object v3

    invoke-interface {v2, v3}, Lcom/ning/http/client/ws/WebSocketPingListener;->onPing([B)V

    goto :goto_0

    .line 301
    .end local v1    # "listener":Lcom/ning/http/client/ws/WebSocketListener;
    :cond_1
    return-void
.end method

.method public onPong(Lcom/ning/http/client/HttpResponseBodyPart;)V
    .locals 4
    .param p1, "part"    # Lcom/ning/http/client/HttpResponseBodyPart;

    .prologue
    .line 304
    iget-object v2, p0, Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;->listeners:Ljava/util/Collection;

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/ning/http/client/ws/WebSocketListener;

    .line 305
    .local v1, "listener":Lcom/ning/http/client/ws/WebSocketListener;
    instance-of v2, v1, Lcom/ning/http/client/ws/WebSocketPongListener;

    if-eqz v2, :cond_0

    .line 307
    const-class v2, Lcom/ning/http/client/ws/WebSocketPongListener;

    invoke-virtual {v2, v1}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/ning/http/client/ws/WebSocketPongListener;

    invoke-virtual {p1}, Lcom/ning/http/client/HttpResponseBodyPart;->getBodyPartBytes()[B

    move-result-object v3

    invoke-interface {v2, v3}, Lcom/ning/http/client/ws/WebSocketPongListener;->onPong([B)V

    goto :goto_0

    .line 309
    .end local v1    # "listener":Lcom/ning/http/client/ws/WebSocketListener;
    :cond_1
    return-void
.end method

.method public onTextFragment(Lcom/ning/http/client/HttpResponseBodyPart;)V
    .locals 5
    .param p1, "part"    # Lcom/ning/http/client/HttpResponseBodyPart;

    .prologue
    .line 271
    iget-object v3, p0, Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;->listeners:Ljava/util/Collection;

    invoke-interface {v3}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/ning/http/client/ws/WebSocketListener;

    .line 272
    .local v2, "listener":Lcom/ning/http/client/ws/WebSocketListener;
    instance-of v3, v2, Lcom/ning/http/client/ws/WebSocketTextFragmentListener;

    if-eqz v3, :cond_0

    .line 273
    const-class v3, Lcom/ning/http/client/ws/WebSocketTextFragmentListener;

    invoke-virtual {v3, v2}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/ning/http/client/ws/WebSocketTextFragmentListener;

    invoke-interface {v3, p1}, Lcom/ning/http/client/ws/WebSocketTextFragmentListener;->onFragment(Lcom/ning/http/client/HttpResponseBodyPart;)V

    goto :goto_0

    .line 276
    .end local v2    # "listener":Lcom/ning/http/client/ws/WebSocketListener;
    :cond_1
    iget-boolean v3, p0, Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;->interestedInTextMessages:Z

    if-eqz v3, :cond_2

    .line 277
    const-class v3, Lcom/ning/http/client/providers/netty/response/NettyResponseBodyPart;

    invoke-virtual {v3, p1}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/ning/http/client/providers/netty/response/NettyResponseBodyPart;

    invoke-virtual {v3}, Lcom/ning/http/client/providers/netty/response/NettyResponseBodyPart;->getChannelBuffer()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    .line 279
    .local v0, "fragment":Lorg/jboss/netty/buffer/ChannelBuffer;
    invoke-virtual {p1}, Lcom/ning/http/client/HttpResponseBodyPart;->isLast()Z

    move-result v3

    if-eqz v3, :cond_4

    .line 280
    iget v3, p0, Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;->bufferSize:I

    if-nez v3, :cond_3

    .line 281
    invoke-direct {p0, v0}, Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;->notifyTextListeners(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    .line 288
    :goto_1
    invoke-direct {p0}, Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;->reset()V

    .line 293
    .end local v0    # "fragment":Lorg/jboss/netty/buffer/ChannelBuffer;
    :cond_2
    :goto_2
    return-void

    .line 284
    .restart local v0    # "fragment":Lorg/jboss/netty/buffer/ChannelBuffer;
    :cond_3
    invoke-direct {p0, v0}, Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;->bufferFragment(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    .line 285
    invoke-direct {p0}, Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;->fragments()Ljava/util/List;

    move-result-object v3

    invoke-direct {p0}, Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;->fragments()Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    new-array v4, v4, [Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v3, v4}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v3

    check-cast v3, [Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-static {v3}, Lorg/jboss/netty/buffer/ChannelBuffers;->wrappedBuffer([Lorg/jboss/netty/buffer/ChannelBuffer;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;->notifyTextListeners(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    goto :goto_1

    .line 291
    :cond_4
    invoke-direct {p0, v0}, Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;->bufferFragment(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    goto :goto_2
.end method

.method public removeWebSocketListener(Lcom/ning/http/client/ws/WebSocketListener;)Lcom/ning/http/client/ws/WebSocket;
    .locals 1
    .param p1, "l"    # Lcom/ning/http/client/ws/WebSocketListener;

    .prologue
    .line 196
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;->listeners:Ljava/util/Collection;

    invoke-interface {v0, p1}, Ljava/util/Collection;->remove(Ljava/lang/Object;)Z

    .line 198
    instance-of v0, p1, Lcom/ning/http/client/ws/WebSocketByteListener;

    if-eqz v0, :cond_0

    .line 199
    invoke-direct {p0}, Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;->hasWebSocketByteListener()Z

    move-result v0

    iput-boolean v0, p0, Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;->interestedInByteMessages:Z

    .line 200
    :cond_0
    instance-of v0, p1, Lcom/ning/http/client/ws/WebSocketTextListener;

    if-eqz v0, :cond_1

    .line 201
    invoke-direct {p0}, Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;->hasWebSocketTextListener()Z

    move-result v0

    iput-boolean v0, p0, Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;->interestedInTextMessages:Z

    .line 203
    :cond_1
    return-object p0
.end method

.method public sendMessage(Ljava/lang/String;)Lcom/ning/http/client/ws/WebSocket;
    .locals 2
    .param p1, "message"    # Ljava/lang/String;

    .prologue
    .line 95
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;->channel:Lorg/jboss/netty/channel/Channel;

    new-instance v1, Lorg/jboss/netty/handler/codec/http/websocketx/TextWebSocketFrame;

    invoke-direct {v1, p1}, Lorg/jboss/netty/handler/codec/http/websocketx/TextWebSocketFrame;-><init>(Ljava/lang/String;)V

    invoke-interface {v0, v1}, Lorg/jboss/netty/channel/Channel;->write(Ljava/lang/Object;)Lorg/jboss/netty/channel/ChannelFuture;

    .line 96
    return-object p0
.end method

.method public sendMessage([B)Lcom/ning/http/client/ws/WebSocket;
    .locals 3
    .param p1, "message"    # [B

    .prologue
    .line 73
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;->channel:Lorg/jboss/netty/channel/Channel;

    new-instance v1, Lorg/jboss/netty/handler/codec/http/websocketx/BinaryWebSocketFrame;

    invoke-static {p1}, Lorg/jboss/netty/buffer/ChannelBuffers;->wrappedBuffer([B)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/jboss/netty/handler/codec/http/websocketx/BinaryWebSocketFrame;-><init>(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    invoke-interface {v0, v1}, Lorg/jboss/netty/channel/Channel;->write(Ljava/lang/Object;)Lorg/jboss/netty/channel/ChannelFuture;

    .line 74
    return-object p0
.end method

.method public sendPing([B)Lcom/ning/http/client/ws/WebSocket;
    .locals 3
    .param p1, "payload"    # [B

    .prologue
    .line 109
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;->channel:Lorg/jboss/netty/channel/Channel;

    new-instance v1, Lorg/jboss/netty/handler/codec/http/websocketx/PingWebSocketFrame;

    invoke-static {p1}, Lorg/jboss/netty/buffer/ChannelBuffers;->wrappedBuffer([B)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/jboss/netty/handler/codec/http/websocketx/PingWebSocketFrame;-><init>(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    invoke-interface {v0, v1}, Lorg/jboss/netty/channel/Channel;->write(Ljava/lang/Object;)Lorg/jboss/netty/channel/ChannelFuture;

    .line 110
    return-object p0
.end method

.method public sendPong([B)Lcom/ning/http/client/ws/WebSocket;
    .locals 3
    .param p1, "payload"    # [B

    .prologue
    .line 115
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;->channel:Lorg/jboss/netty/channel/Channel;

    new-instance v1, Lorg/jboss/netty/handler/codec/http/websocketx/PongWebSocketFrame;

    invoke-static {p1}, Lorg/jboss/netty/buffer/ChannelBuffers;->wrappedBuffer([B)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/jboss/netty/handler/codec/http/websocketx/PongWebSocketFrame;-><init>(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    invoke-interface {v0, v1}, Lorg/jboss/netty/channel/Channel;->write(Ljava/lang/Object;)Lorg/jboss/netty/channel/ChannelFuture;

    .line 116
    return-object p0
.end method

.method public stream(Ljava/lang/String;Z)Lcom/ning/http/client/ws/WebSocket;
    .locals 2
    .param p1, "fragment"    # Ljava/lang/String;
    .param p2, "last"    # Z

    .prologue
    .line 101
    new-instance v0, Lorg/jboss/netty/handler/codec/http/websocketx/TextWebSocketFrame;

    invoke-direct {v0, p1}, Lorg/jboss/netty/handler/codec/http/websocketx/TextWebSocketFrame;-><init>(Ljava/lang/String;)V

    .line 102
    .local v0, "frame":Lorg/jboss/netty/handler/codec/http/websocketx/TextWebSocketFrame;
    invoke-virtual {v0, p2}, Lorg/jboss/netty/handler/codec/http/websocketx/TextWebSocketFrame;->setFinalFragment(Z)V

    .line 103
    iget-object v1, p0, Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;->channel:Lorg/jboss/netty/channel/Channel;

    invoke-interface {v1, v0}, Lorg/jboss/netty/channel/Channel;->write(Ljava/lang/Object;)Lorg/jboss/netty/channel/ChannelFuture;

    .line 104
    return-object p0
.end method

.method public stream([BIIZ)Lcom/ning/http/client/ws/WebSocket;
    .locals 2
    .param p1, "fragment"    # [B
    .param p2, "offset"    # I
    .param p3, "len"    # I
    .param p4, "last"    # Z

    .prologue
    .line 87
    new-instance v0, Lorg/jboss/netty/handler/codec/http/websocketx/BinaryWebSocketFrame;

    invoke-static {p1, p2, p3}, Lorg/jboss/netty/buffer/ChannelBuffers;->wrappedBuffer([BII)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/jboss/netty/handler/codec/http/websocketx/BinaryWebSocketFrame;-><init>(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    .line 88
    .local v0, "frame":Lorg/jboss/netty/handler/codec/http/websocketx/BinaryWebSocketFrame;
    invoke-virtual {v0, p4}, Lorg/jboss/netty/handler/codec/http/websocketx/BinaryWebSocketFrame;->setFinalFragment(Z)V

    .line 89
    iget-object v1, p0, Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;->channel:Lorg/jboss/netty/channel/Channel;

    invoke-interface {v1, v0}, Lorg/jboss/netty/channel/Channel;->write(Ljava/lang/Object;)Lorg/jboss/netty/channel/ChannelFuture;

    .line 90
    return-object p0
.end method

.method public stream([BZ)Lcom/ning/http/client/ws/WebSocket;
    .locals 2
    .param p1, "fragment"    # [B
    .param p2, "last"    # Z

    .prologue
    .line 79
    new-instance v0, Lorg/jboss/netty/handler/codec/http/websocketx/BinaryWebSocketFrame;

    invoke-static {p1}, Lorg/jboss/netty/buffer/ChannelBuffers;->wrappedBuffer([B)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/jboss/netty/handler/codec/http/websocketx/BinaryWebSocketFrame;-><init>(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    .line 80
    .local v0, "frame":Lorg/jboss/netty/handler/codec/http/websocketx/BinaryWebSocketFrame;
    invoke-virtual {v0, p2}, Lorg/jboss/netty/handler/codec/http/websocketx/BinaryWebSocketFrame;->setFinalFragment(Z)V

    .line 81
    iget-object v1, p0, Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;->channel:Lorg/jboss/netty/channel/Channel;

    invoke-interface {v1, v0}, Lorg/jboss/netty/channel/Channel;->write(Ljava/lang/Object;)Lorg/jboss/netty/channel/ChannelFuture;

    .line 82
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 167
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "NettyWebSocket{channel="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/ning/http/client/providers/netty/ws/NettyWebSocket;->channel:Lorg/jboss/netty/channel/Channel;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
