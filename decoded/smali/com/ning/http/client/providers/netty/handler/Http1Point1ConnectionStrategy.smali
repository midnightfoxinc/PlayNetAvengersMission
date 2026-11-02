.class public Lcom/ning/http/client/providers/netty/handler/Http1Point1ConnectionStrategy;
.super Ljava/lang/Object;
.source "Http1Point1ConnectionStrategy.java"

# interfaces
.implements Lcom/ning/http/client/providers/netty/handler/ConnectionStrategy;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public isConnectionKeepAlive(Lorg/jboss/netty/handler/codec/http/HttpMessage;)Z
    .locals 3
    .param p1, "message"    # Lorg/jboss/netty/handler/codec/http/HttpMessage;

    .prologue
    .line 36
    const-string v0, "close"

    invoke-interface {p1}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v1

    const-string v2, "Connection"

    invoke-virtual {v1, v2}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public keepAlive(Lorg/jboss/netty/handler/codec/http/HttpRequest;Lorg/jboss/netty/handler/codec/http/HttpResponse;)Z
    .locals 1
    .param p1, "httpRequest"    # Lorg/jboss/netty/handler/codec/http/HttpRequest;
    .param p2, "response"    # Lorg/jboss/netty/handler/codec/http/HttpResponse;

    .prologue
    .line 32
    invoke-virtual {p0, p1}, Lcom/ning/http/client/providers/netty/handler/Http1Point1ConnectionStrategy;->isConnectionKeepAlive(Lorg/jboss/netty/handler/codec/http/HttpMessage;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0, p2}, Lcom/ning/http/client/providers/netty/handler/Http1Point1ConnectionStrategy;->isConnectionKeepAlive(Lorg/jboss/netty/handler/codec/http/HttpMessage;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
