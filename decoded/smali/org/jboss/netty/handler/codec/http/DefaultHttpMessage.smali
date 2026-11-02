.class public Lorg/jboss/netty/handler/codec/http/DefaultHttpMessage;
.super Ljava/lang/Object;
.source "DefaultHttpMessage.java"

# interfaces
.implements Lorg/jboss/netty/handler/codec/http/HttpMessage;


# instance fields
.field private chunked:Z

.field private content:Lorg/jboss/netty/buffer/ChannelBuffer;

.field private final headers:Lorg/jboss/netty/handler/codec/http/HttpHeaders;

.field private version:Lorg/jboss/netty/handler/codec/http/HttpVersion;


# direct methods
.method protected constructor <init>(Lorg/jboss/netty/handler/codec/http/HttpVersion;)V
    .locals 2
    .param p1, "version"    # Lorg/jboss/netty/handler/codec/http/HttpVersion;

    .prologue
    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    new-instance v0, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lorg/jboss/netty/handler/codec/http/DefaultHttpHeaders;-><init>(Z)V

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/http/DefaultHttpMessage;->headers:Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .line 33
    sget-object v0, Lorg/jboss/netty/buffer/ChannelBuffers;->EMPTY_BUFFER:Lorg/jboss/netty/buffer/ChannelBuffer;

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/http/DefaultHttpMessage;->content:Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 40
    invoke-virtual {p0, p1}, Lorg/jboss/netty/handler/codec/http/DefaultHttpMessage;->setProtocolVersion(Lorg/jboss/netty/handler/codec/http/HttpVersion;)V

    .line 41
    return-void
.end method


# virtual methods
.method appendHeaders(Ljava/lang/StringBuilder;)V
    .locals 3
    .param p1, "buf"    # Ljava/lang/StringBuilder;

    .prologue
    .line 108
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/DefaultHttpMessage;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v2

    invoke-virtual {v2}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 109
    .local v0, "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 110
    const-string v2, ": "

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    sget-object v2, Lorg/jboss/netty/util/internal/StringUtil;->NEWLINE:Ljava/lang/String;

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 114
    .end local v0    # "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_0
    return-void
.end method

.method public getContent()Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 1

    .prologue
    .line 85
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/DefaultHttpMessage;->content:Lorg/jboss/netty/buffer/ChannelBuffer;

    return-object v0
.end method

.method public getProtocolVersion()Lorg/jboss/netty/handler/codec/http/HttpVersion;
    .locals 1

    .prologue
    .line 74
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/DefaultHttpMessage;->version:Lorg/jboss/netty/handler/codec/http/HttpVersion;

    return-object v0
.end method

.method public headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;
    .locals 1

    .prologue
    .line 44
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/DefaultHttpMessage;->headers:Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    return-object v0
.end method

.method public isChunked()Z
    .locals 1

    .prologue
    .line 48
    iget-boolean v0, p0, Lorg/jboss/netty/handler/codec/http/DefaultHttpMessage;->chunked:Z

    if-eqz v0, :cond_0

    .line 49
    const/4 v0, 0x1

    .line 51
    :goto_0
    return v0

    :cond_0
    invoke-static {p0}, Lorg/jboss/netty/handler/codec/http/HttpCodecUtil;->isTransferEncodingChunked(Lorg/jboss/netty/handler/codec/http/HttpMessage;)Z

    move-result v0

    goto :goto_0
.end method

.method public setChunked(Z)V
    .locals 1
    .param p1, "chunked"    # Z

    .prologue
    .line 56
    iput-boolean p1, p0, Lorg/jboss/netty/handler/codec/http/DefaultHttpMessage;->chunked:Z

    .line 57
    if-eqz p1, :cond_0

    .line 58
    sget-object v0, Lorg/jboss/netty/buffer/ChannelBuffers;->EMPTY_BUFFER:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-virtual {p0, v0}, Lorg/jboss/netty/handler/codec/http/DefaultHttpMessage;->setContent(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    .line 60
    :cond_0
    return-void
.end method

.method public setContent(Lorg/jboss/netty/buffer/ChannelBuffer;)V
    .locals 2
    .param p1, "content"    # Lorg/jboss/netty/buffer/ChannelBuffer;

    .prologue
    .line 63
    if-nez p1, :cond_0

    .line 64
    sget-object p1, Lorg/jboss/netty/buffer/ChannelBuffers;->EMPTY_BUFFER:Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 66
    :cond_0
    invoke-interface {p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readable()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/DefaultHttpMessage;->isChunked()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 67
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "non-empty content disallowed if this.chunked == true"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 70
    :cond_1
    iput-object p1, p0, Lorg/jboss/netty/handler/codec/http/DefaultHttpMessage;->content:Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 71
    return-void
.end method

.method public setProtocolVersion(Lorg/jboss/netty/handler/codec/http/HttpVersion;)V
    .locals 2
    .param p1, "version"    # Lorg/jboss/netty/handler/codec/http/HttpVersion;

    .prologue
    .line 78
    if-nez p1, :cond_0

    .line 79
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "version"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 81
    :cond_0
    iput-object p1, p0, Lorg/jboss/netty/handler/codec/http/DefaultHttpMessage;->version:Lorg/jboss/netty/handler/codec/http/HttpVersion;

    .line 82
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 90
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 91
    .local v0, "buf":Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 92
    const-string v1, "(version: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 93
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/DefaultHttpMessage;->getProtocolVersion()Lorg/jboss/netty/handler/codec/http/HttpVersion;

    move-result-object v1

    invoke-virtual {v1}, Lorg/jboss/netty/handler/codec/http/HttpVersion;->getText()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    const-string v1, ", keepAlive: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 95
    invoke-static {p0}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->isKeepAlive(Lorg/jboss/netty/handler/codec/http/HttpMessage;)Z

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 96
    const-string v1, ", chunked: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/DefaultHttpMessage;->isChunked()Z

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 98
    const/16 v1, 0x29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 99
    sget-object v1, Lorg/jboss/netty/util/internal/StringUtil;->NEWLINE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    invoke-virtual {p0, v0}, Lorg/jboss/netty/handler/codec/http/DefaultHttpMessage;->appendHeaders(Ljava/lang/StringBuilder;)V

    .line 103
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    sget-object v2, Lorg/jboss/netty/util/internal/StringUtil;->NEWLINE:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    sub-int/2addr v1, v2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 104
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
