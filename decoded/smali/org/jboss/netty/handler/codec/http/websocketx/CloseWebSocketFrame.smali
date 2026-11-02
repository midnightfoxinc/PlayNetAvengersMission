.class public Lorg/jboss/netty/handler/codec/http/websocketx/CloseWebSocketFrame;
.super Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketFrame;
.source "CloseWebSocketFrame.java"


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 31
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketFrame;-><init>()V

    .line 32
    sget-object v0, Lorg/jboss/netty/buffer/ChannelBuffers;->EMPTY_BUFFER:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-virtual {p0, v0}, Lorg/jboss/netty/handler/codec/http/websocketx/CloseWebSocketFrame;->setBinaryData(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    .line 33
    return-void
.end method

.method public constructor <init>(ILjava/lang/String;)V
    .locals 2
    .param p1, "statusCode"    # I
    .param p2, "reasonText"    # Ljava/lang/String;

    .prologue
    .line 45
    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1, p1, p2}, Lorg/jboss/netty/handler/codec/http/websocketx/CloseWebSocketFrame;-><init>(ZIILjava/lang/String;)V

    .line 46
    return-void
.end method

.method public constructor <init>(ZI)V
    .locals 1
    .param p1, "finalFragment"    # Z
    .param p2, "rsv"    # I

    .prologue
    .line 57
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lorg/jboss/netty/handler/codec/http/websocketx/CloseWebSocketFrame;-><init>(ZILorg/jboss/netty/buffer/ChannelBuffer;)V

    .line 58
    return-void
.end method

.method public constructor <init>(ZIILjava/lang/String;)V
    .locals 5
    .param p1, "finalFragment"    # Z
    .param p2, "rsv"    # I
    .param p3, "statusCode"    # I
    .param p4, "reasonText"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    .line 73
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketFrame;-><init>()V

    .line 74
    invoke-virtual {p0, p1}, Lorg/jboss/netty/handler/codec/http/websocketx/CloseWebSocketFrame;->setFinalFragment(Z)V

    .line 75
    invoke-virtual {p0, p2}, Lorg/jboss/netty/handler/codec/http/websocketx/CloseWebSocketFrame;->setRsv(I)V

    .line 77
    new-array v2, v4, [B

    .line 78
    .local v2, "reasonBytes":[B
    if-eqz p4, :cond_0

    .line 80
    :try_start_0
    const-string v3, "UTF-8"

    invoke-virtual {p4, v3}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 87
    :cond_0
    :goto_0
    array-length v3, v2

    add-int/lit8 v3, v3, 0x2

    invoke-static {v3}, Lorg/jboss/netty/buffer/ChannelBuffers;->buffer(I)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    .line 88
    .local v0, "binaryData":Lorg/jboss/netty/buffer/ChannelBuffer;
    invoke-interface {v0, p3}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeShort(I)V

    .line 89
    array-length v3, v2

    if-lez v3, :cond_1

    .line 90
    invoke-interface {v0, v2}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeBytes([B)V

    .line 93
    :cond_1
    invoke-interface {v0, v4}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex(I)V

    .line 94
    invoke-virtual {p0, v0}, Lorg/jboss/netty/handler/codec/http/websocketx/CloseWebSocketFrame;->setBinaryData(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    .line 95
    return-void

    .line 81
    .end local v0    # "binaryData":Lorg/jboss/netty/buffer/ChannelBuffer;
    :catch_0
    move-exception v1

    .line 83
    .local v1, "e":Ljava/io/UnsupportedEncodingException;
    invoke-virtual {p4}, Ljava/lang/String;->getBytes()[B

    move-result-object v2

    goto :goto_0
.end method

.method public constructor <init>(ZILorg/jboss/netty/buffer/ChannelBuffer;)V
    .locals 1
    .param p1, "finalFragment"    # Z
    .param p2, "rsv"    # I
    .param p3, "binaryData"    # Lorg/jboss/netty/buffer/ChannelBuffer;

    .prologue
    .line 107
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocketFrame;-><init>()V

    .line 108
    invoke-virtual {p0, p1}, Lorg/jboss/netty/handler/codec/http/websocketx/CloseWebSocketFrame;->setFinalFragment(Z)V

    .line 109
    invoke-virtual {p0, p2}, Lorg/jboss/netty/handler/codec/http/websocketx/CloseWebSocketFrame;->setRsv(I)V

    .line 110
    if-nez p3, :cond_0

    .line 111
    sget-object v0, Lorg/jboss/netty/buffer/ChannelBuffers;->EMPTY_BUFFER:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-virtual {p0, v0}, Lorg/jboss/netty/handler/codec/http/websocketx/CloseWebSocketFrame;->setBinaryData(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    .line 115
    :goto_0
    return-void

    .line 113
    :cond_0
    invoke-virtual {p0, p3}, Lorg/jboss/netty/handler/codec/http/websocketx/CloseWebSocketFrame;->setBinaryData(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    goto :goto_0
.end method


# virtual methods
.method public getReasonText()Ljava/lang/String;
    .locals 4

    .prologue
    const/4 v3, 0x2

    .line 139
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/websocketx/CloseWebSocketFrame;->getBinaryData()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    .line 140
    .local v0, "binaryData":Lorg/jboss/netty/buffer/ChannelBuffer;
    if-eqz v0, :cond_0

    invoke-interface {v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->capacity()I

    move-result v2

    if-gt v2, v3, :cond_1

    .line 141
    :cond_0
    const-string v1, ""

    .line 148
    :goto_0
    return-object v1

    .line 144
    :cond_1
    invoke-interface {v0, v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex(I)V

    .line 145
    sget-object v2, Lorg/jboss/netty/util/CharsetUtil;->UTF_8:Ljava/nio/charset/Charset;

    invoke-interface {v0, v2}, Lorg/jboss/netty/buffer/ChannelBuffer;->toString(Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v1

    .line 146
    .local v1, "reasonText":Ljava/lang/String;
    const/4 v2, 0x0

    invoke-interface {v0, v2}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex(I)V

    goto :goto_0
.end method

.method public getStatusCode()I
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 122
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/websocketx/CloseWebSocketFrame;->getBinaryData()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    .line 123
    .local v0, "binaryData":Lorg/jboss/netty/buffer/ChannelBuffer;
    if-eqz v0, :cond_0

    invoke-interface {v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->capacity()I

    move-result v2

    if-nez v2, :cond_1

    .line 124
    :cond_0
    const/4 v1, -0x1

    .line 131
    :goto_0
    return v1

    .line 127
    :cond_1
    invoke-interface {v0, v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex(I)V

    .line 128
    invoke-interface {v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->readShort()S

    move-result v1

    .line 129
    .local v1, "statusCode":I
    invoke-interface {v0, v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex(I)V

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 153
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
