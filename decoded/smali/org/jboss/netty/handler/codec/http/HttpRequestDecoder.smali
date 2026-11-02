.class public Lorg/jboss/netty/handler/codec/http/HttpRequestDecoder;
.super Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;
.source "HttpRequestDecoder.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 62
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;-><init>()V

    .line 63
    return-void
.end method

.method public constructor <init>(III)V
    .locals 0
    .param p1, "maxInitialLineLength"    # I
    .param p2, "maxHeaderSize"    # I
    .param p3, "maxChunkSize"    # I

    .prologue
    .line 70
    invoke-direct {p0, p1, p2, p3}, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;-><init>(III)V

    .line 71
    return-void
.end method


# virtual methods
.method protected createMessage([Ljava/lang/String;)Lorg/jboss/netty/handler/codec/http/HttpMessage;
    .locals 4
    .param p1, "initialLine"    # [Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 75
    new-instance v0, Lorg/jboss/netty/handler/codec/http/DefaultHttpRequest;

    const/4 v1, 0x2

    aget-object v1, p1, v1

    invoke-static {v1}, Lorg/jboss/netty/handler/codec/http/HttpVersion;->valueOf(Ljava/lang/String;)Lorg/jboss/netty/handler/codec/http/HttpVersion;

    move-result-object v1

    const/4 v2, 0x0

    aget-object v2, p1, v2

    invoke-static {v2}, Lorg/jboss/netty/handler/codec/http/HttpMethod;->valueOf(Ljava/lang/String;)Lorg/jboss/netty/handler/codec/http/HttpMethod;

    move-result-object v2

    const/4 v3, 0x1

    aget-object v3, p1, v3

    invoke-direct {v0, v1, v2, v3}, Lorg/jboss/netty/handler/codec/http/DefaultHttpRequest;-><init>(Lorg/jboss/netty/handler/codec/http/HttpVersion;Lorg/jboss/netty/handler/codec/http/HttpMethod;Ljava/lang/String;)V

    return-object v0
.end method

.method protected isDecodingRequest()Z
    .locals 1

    .prologue
    .line 81
    const/4 v0, 0x1

    return v0
.end method
