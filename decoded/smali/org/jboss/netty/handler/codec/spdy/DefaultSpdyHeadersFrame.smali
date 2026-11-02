.class public Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeadersFrame;
.super Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyStreamFrame;
.source "DefaultSpdyHeadersFrame.java"

# interfaces
.implements Lorg/jboss/netty/handler/codec/spdy/SpdyHeadersFrame;


# instance fields
.field private final headers:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;

.field private invalid:Z

.field private truncated:Z


# direct methods
.method public constructor <init>(I)V
    .locals 1
    .param p1, "streamId"    # I

    .prologue
    .line 40
    invoke-direct {p0, p1}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyStreamFrame;-><init>(I)V

    .line 32
    new-instance v0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders;

    invoke-direct {v0}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeaders;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeadersFrame;->headers:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;

    .line 41
    return-void
.end method


# virtual methods
.method protected appendHeaders(Ljava/lang/StringBuilder;)V
    .locals 3
    .param p1, "buf"    # Ljava/lang/StringBuilder;

    .prologue
    .line 84
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeadersFrame;->headers()Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;

    move-result-object v2

    invoke-virtual {v2}, Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 85
    .local v0, "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v2, "    "

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    const-string v2, ": "

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    sget-object v2, Lorg/jboss/netty/util/internal/StringUtil;->NEWLINE:Ljava/lang/String;

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 91
    .end local v0    # "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_0
    return-void
.end method

.method public headers()Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;
    .locals 1

    .prologue
    .line 60
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeadersFrame;->headers:Lorg/jboss/netty/handler/codec/spdy/SpdyHeaders;

    return-object v0
.end method

.method public isInvalid()Z
    .locals 1

    .prologue
    .line 44
    iget-boolean v0, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeadersFrame;->invalid:Z

    return v0
.end method

.method public isTruncated()Z
    .locals 1

    .prologue
    .line 52
    iget-boolean v0, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeadersFrame;->truncated:Z

    return v0
.end method

.method public setInvalid()V
    .locals 1

    .prologue
    .line 48
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeadersFrame;->invalid:Z

    .line 49
    return-void
.end method

.method public setTruncated()V
    .locals 1

    .prologue
    .line 56
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeadersFrame;->truncated:Z

    .line 57
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 65
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 66
    .local v0, "buf":Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    const-string v1, "(last: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeadersFrame;->isLast()Z

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 69
    const/16 v1, 0x29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 70
    sget-object v1, Lorg/jboss/netty/util/internal/StringUtil;->NEWLINE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    const-string v1, "--> Stream-ID = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeadersFrame;->getStreamId()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 73
    sget-object v1, Lorg/jboss/netty/util/internal/StringUtil;->NEWLINE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    const-string v1, "--> Headers:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    sget-object v1, Lorg/jboss/netty/util/internal/StringUtil;->NEWLINE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    invoke-virtual {p0, v0}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeadersFrame;->appendHeaders(Ljava/lang/StringBuilder;)V

    .line 79
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    sget-object v2, Lorg/jboss/netty/util/internal/StringUtil;->NEWLINE:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    sub-int/2addr v1, v2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 80
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
