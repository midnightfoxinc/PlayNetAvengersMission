.class public Lorg/jboss/netty/handler/codec/http/websocketx/TextWebSocketFrame;
.super Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketFrame;
.source "TextWebSocketFrame.java"


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 30
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketFrame;-><init>()V

    .line 31
    sget-object v0, Lorg/jboss/netty/buffer/ChannelBuffers;->EMPTY_BUFFER:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-virtual {p0, v0}, Lorg/jboss/netty/handler/codec/http/websocketx/TextWebSocketFrame;->setBinaryData(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    .line 32
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 40
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketFrame;-><init>()V

    .line 41
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_1

    .line 42
    :cond_0
    sget-object v0, Lorg/jboss/netty/buffer/ChannelBuffers;->EMPTY_BUFFER:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-virtual {p0, v0}, Lorg/jboss/netty/handler/codec/http/websocketx/TextWebSocketFrame;->setBinaryData(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    .line 46
    :goto_0
    return-void

    .line 44
    :cond_1
    sget-object v0, Lorg/jboss/netty/util/CharsetUtil;->UTF_8:Ljava/nio/charset/Charset;

    invoke-static {p1, v0}, Lorg/jboss/netty/buffer/ChannelBuffers;->copiedBuffer(Ljava/lang/CharSequence;Ljava/nio/charset/Charset;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/jboss/netty/handler/codec/http/websocketx/TextWebSocketFrame;->setBinaryData(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    goto :goto_0
.end method

.method public constructor <init>(Lorg/jboss/netty/buffer/ChannelBuffer;)V
    .locals 0
    .param p1, "binaryData"    # Lorg/jboss/netty/buffer/ChannelBuffer;

    .prologue
    .line 54
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketFrame;-><init>()V

    .line 55
    invoke-virtual {p0, p1}, Lorg/jboss/netty/handler/codec/http/websocketx/TextWebSocketFrame;->setBinaryData(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    .line 56
    return-void
.end method

.method public constructor <init>(ZILjava/lang/String;)V
    .locals 1
    .param p1, "finalFragment"    # Z
    .param p2, "rsv"    # I
    .param p3, "text"    # Ljava/lang/String;

    .prologue
    .line 68
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketFrame;-><init>()V

    .line 69
    invoke-virtual {p0, p1}, Lorg/jboss/netty/handler/codec/http/websocketx/TextWebSocketFrame;->setFinalFragment(Z)V

    .line 70
    invoke-virtual {p0, p2}, Lorg/jboss/netty/handler/codec/http/websocketx/TextWebSocketFrame;->setRsv(I)V

    .line 71
    if-eqz p3, :cond_0

    invoke-virtual {p3}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_1

    .line 72
    :cond_0
    sget-object v0, Lorg/jboss/netty/buffer/ChannelBuffers;->EMPTY_BUFFER:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-virtual {p0, v0}, Lorg/jboss/netty/handler/codec/http/websocketx/TextWebSocketFrame;->setBinaryData(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    .line 76
    :goto_0
    return-void

    .line 74
    :cond_1
    sget-object v0, Lorg/jboss/netty/util/CharsetUtil;->UTF_8:Ljava/nio/charset/Charset;

    invoke-static {p3, v0}, Lorg/jboss/netty/buffer/ChannelBuffers;->copiedBuffer(Ljava/lang/CharSequence;Ljava/nio/charset/Charset;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/jboss/netty/handler/codec/http/websocketx/TextWebSocketFrame;->setBinaryData(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    goto :goto_0
.end method

.method public constructor <init>(ZILorg/jboss/netty/buffer/ChannelBuffer;)V
    .locals 0
    .param p1, "finalFragment"    # Z
    .param p2, "rsv"    # I
    .param p3, "binaryData"    # Lorg/jboss/netty/buffer/ChannelBuffer;

    .prologue
    .line 88
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketFrame;-><init>()V

    .line 89
    invoke-virtual {p0, p1}, Lorg/jboss/netty/handler/codec/http/websocketx/TextWebSocketFrame;->setFinalFragment(Z)V

    .line 90
    invoke-virtual {p0, p2}, Lorg/jboss/netty/handler/codec/http/websocketx/TextWebSocketFrame;->setRsv(I)V

    .line 91
    invoke-virtual {p0, p3}, Lorg/jboss/netty/handler/codec/http/websocketx/TextWebSocketFrame;->setBinaryData(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    .line 92
    return-void
.end method


# virtual methods
.method public getText()Ljava/lang/String;
    .locals 2

    .prologue
    .line 98
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/websocketx/TextWebSocketFrame;->getBinaryData()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    if-nez v0, :cond_0

    .line 99
    const/4 v0, 0x0

    .line 101
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/websocketx/TextWebSocketFrame;->getBinaryData()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    sget-object v1, Lorg/jboss/netty/util/CharsetUtil;->UTF_8:Ljava/nio/charset/Charset;

    invoke-interface {v0, v1}, Lorg/jboss/netty/buffer/ChannelBuffer;->toString(Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public setText(Ljava/lang/String;)V
    .locals 2
    .param p1, "text"    # Ljava/lang/String;

    .prologue
    .line 111
    if-nez p1, :cond_0

    .line 112
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "text"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 114
    :cond_0
    sget-object v0, Lorg/jboss/netty/util/CharsetUtil;->UTF_8:Ljava/nio/charset/Charset;

    invoke-static {p1, v0}, Lorg/jboss/netty/buffer/ChannelBuffers;->copiedBuffer(Ljava/lang/CharSequence;Ljava/nio/charset/Charset;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/jboss/netty/handler/codec/http/websocketx/TextWebSocketFrame;->setBinaryData(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    .line 115
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 119
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "(text: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/websocketx/TextWebSocketFrame;->getText()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
