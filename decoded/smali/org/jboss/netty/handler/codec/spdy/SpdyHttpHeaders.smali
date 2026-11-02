.class public final Lorg/jboss/netty/handler/codec/spdy/SpdyHttpHeaders;
.super Ljava/lang/Object;
.source "SpdyHttpHeaders.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jboss/netty/handler/codec/spdy/SpdyHttpHeaders$Names;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 59
    return-void
.end method

.method public static getAssociatedToStreamId(Lorg/jboss/netty/handler/codec/http/HttpMessage;)I
    .locals 2
    .param p0, "message"    # Lorg/jboss/netty/handler/codec/http/HttpMessage;

    .prologue
    .line 96
    const-string v0, "X-SPDY-Associated-To-Stream-ID"

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->getIntHeader(Lorg/jboss/netty/handler/codec/http/HttpMessage;Ljava/lang/String;I)I

    move-result v0

    return v0
.end method

.method public static getPriority(Lorg/jboss/netty/handler/codec/http/HttpMessage;)B
    .locals 2
    .param p0, "message"    # Lorg/jboss/netty/handler/codec/http/HttpMessage;

    .prologue
    .line 120
    const-string v0, "X-SPDY-Priority"

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->getIntHeader(Lorg/jboss/netty/handler/codec/http/HttpMessage;Ljava/lang/String;I)I

    move-result v0

    int-to-byte v0, v0

    return v0
.end method

.method public static getScheme(Lorg/jboss/netty/handler/codec/http/HttpMessage;)Ljava/lang/String;
    .locals 2
    .param p0, "message"    # Lorg/jboss/netty/handler/codec/http/HttpMessage;

    .prologue
    .line 162
    invoke-interface {p0}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v0

    const-string v1, "X-SPDY-Scheme"

    invoke-virtual {v0, v1}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getStreamId(Lorg/jboss/netty/handler/codec/http/HttpMessage;)I
    .locals 1
    .param p0, "message"    # Lorg/jboss/netty/handler/codec/http/HttpMessage;

    .prologue
    .line 72
    const-string v0, "X-SPDY-Stream-ID"

    invoke-static {p0, v0}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->getIntHeader(Lorg/jboss/netty/handler/codec/http/HttpMessage;Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public static getUrl(Lorg/jboss/netty/handler/codec/http/HttpMessage;)Ljava/lang/String;
    .locals 2
    .param p0, "message"    # Lorg/jboss/netty/handler/codec/http/HttpMessage;

    .prologue
    .line 141
    invoke-interface {p0}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v0

    const-string v1, "X-SPDY-URL"

    invoke-virtual {v0, v1}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static removeAssociatedToStreamId(Lorg/jboss/netty/handler/codec/http/HttpMessage;)V
    .locals 2
    .param p0, "message"    # Lorg/jboss/netty/handler/codec/http/HttpMessage;

    .prologue
    .line 86
    invoke-interface {p0}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v0

    const-string v1, "X-SPDY-Associated-To-Stream-ID"

    invoke-virtual {v0, v1}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->remove(Ljava/lang/String;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .line 87
    return-void
.end method

.method public static removePriority(Lorg/jboss/netty/handler/codec/http/HttpMessage;)V
    .locals 2
    .param p0, "message"    # Lorg/jboss/netty/handler/codec/http/HttpMessage;

    .prologue
    .line 110
    invoke-interface {p0}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v0

    const-string v1, "X-SPDY-Priority"

    invoke-virtual {v0, v1}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->remove(Ljava/lang/String;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .line 111
    return-void
.end method

.method public static removeScheme(Lorg/jboss/netty/handler/codec/http/HttpMessage;)V
    .locals 2
    .param p0, "message"    # Lorg/jboss/netty/handler/codec/http/HttpMessage;

    .prologue
    .line 155
    invoke-interface {p0}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v0

    const-string v1, "X-SPDY-Scheme"

    invoke-virtual {v0, v1}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->remove(Ljava/lang/String;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .line 156
    return-void
.end method

.method public static removeStreamId(Lorg/jboss/netty/handler/codec/http/HttpMessage;)V
    .locals 2
    .param p0, "message"    # Lorg/jboss/netty/handler/codec/http/HttpMessage;

    .prologue
    .line 65
    invoke-interface {p0}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v0

    const-string v1, "X-SPDY-Stream-ID"

    invoke-virtual {v0, v1}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->remove(Ljava/lang/String;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .line 66
    return-void
.end method

.method public static removeUrl(Lorg/jboss/netty/handler/codec/http/HttpMessage;)V
    .locals 2
    .param p0, "message"    # Lorg/jboss/netty/handler/codec/http/HttpMessage;

    .prologue
    .line 134
    invoke-interface {p0}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v0

    const-string v1, "X-SPDY-URL"

    invoke-virtual {v0, v1}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->remove(Ljava/lang/String;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .line 135
    return-void
.end method

.method public static setAssociatedToStreamId(Lorg/jboss/netty/handler/codec/http/HttpMessage;I)V
    .locals 1
    .param p0, "message"    # Lorg/jboss/netty/handler/codec/http/HttpMessage;
    .param p1, "associatedToStreamId"    # I

    .prologue
    .line 103
    const-string v0, "X-SPDY-Associated-To-Stream-ID"

    invoke-static {p0, v0, p1}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->setIntHeader(Lorg/jboss/netty/handler/codec/http/HttpMessage;Ljava/lang/String;I)V

    .line 104
    return-void
.end method

.method public static setPriority(Lorg/jboss/netty/handler/codec/http/HttpMessage;B)V
    .locals 1
    .param p0, "message"    # Lorg/jboss/netty/handler/codec/http/HttpMessage;
    .param p1, "priority"    # B

    .prologue
    .line 127
    const-string v0, "X-SPDY-Priority"

    invoke-static {p0, v0, p1}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->setIntHeader(Lorg/jboss/netty/handler/codec/http/HttpMessage;Ljava/lang/String;I)V

    .line 128
    return-void
.end method

.method public static setScheme(Lorg/jboss/netty/handler/codec/http/HttpMessage;Ljava/lang/String;)V
    .locals 2
    .param p0, "message"    # Lorg/jboss/netty/handler/codec/http/HttpMessage;
    .param p1, "scheme"    # Ljava/lang/String;

    .prologue
    .line 169
    invoke-interface {p0}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v0

    const-string v1, "X-SPDY-Scheme"

    invoke-virtual {v0, v1, p1}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->set(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .line 170
    return-void
.end method

.method public static setStreamId(Lorg/jboss/netty/handler/codec/http/HttpMessage;I)V
    .locals 1
    .param p0, "message"    # Lorg/jboss/netty/handler/codec/http/HttpMessage;
    .param p1, "streamId"    # I

    .prologue
    .line 79
    const-string v0, "X-SPDY-Stream-ID"

    invoke-static {p0, v0, p1}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->setIntHeader(Lorg/jboss/netty/handler/codec/http/HttpMessage;Ljava/lang/String;I)V

    .line 80
    return-void
.end method

.method public static setUrl(Lorg/jboss/netty/handler/codec/http/HttpMessage;Ljava/lang/String;)V
    .locals 2
    .param p0, "message"    # Lorg/jboss/netty/handler/codec/http/HttpMessage;
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 148
    invoke-interface {p0}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v0

    const-string v1, "X-SPDY-URL"

    invoke-virtual {v0, v1, p1}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->set(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .line 149
    return-void
.end method
