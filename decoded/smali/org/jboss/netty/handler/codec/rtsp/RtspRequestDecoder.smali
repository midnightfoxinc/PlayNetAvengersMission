.class public Lorg/jboss/netty/handler/codec/rtsp/RtspRequestDecoder;
.super Lorg/jboss/netty/handler/codec/rtsp/RtspMessageDecoder;
.source "RtspRequestDecoder.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 58
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/rtsp/RtspMessageDecoder;-><init>()V

    .line 59
    return-void
.end method

.method public constructor <init>(III)V
    .locals 0
    .param p1, "maxInitialLineLength"    # I
    .param p2, "maxHeaderSize"    # I
    .param p3, "maxContentLength"    # I

    .prologue
    .line 65
    invoke-direct {p0, p1, p2, p3}, Lorg/jboss/netty/handler/codec/rtsp/RtspMessageDecoder;-><init>(III)V

    .line 66
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
    .line 70
    new-instance v0, Lorg/jboss/netty/handler/codec/http/DefaultHttpRequest;

    const/4 v1, 0x2

    aget-object v1, p1, v1

    invoke-static {v1}, Lorg/jboss/netty/handler/codec/rtsp/RtspVersions;->valueOf(Ljava/lang/String;)Lorg/jboss/netty/handler/codec/http/HttpVersion;

    move-result-object v1

    const/4 v2, 0x0

    aget-object v2, p1, v2

    invoke-static {v2}, Lorg/jboss/netty/handler/codec/rtsp/RtspMethods;->valueOf(Ljava/lang/String;)Lorg/jboss/netty/handler/codec/http/HttpMethod;

    move-result-object v2

    const/4 v3, 0x1

    aget-object v3, p1, v3

    invoke-direct {v0, v1, v2, v3}, Lorg/jboss/netty/handler/codec/http/DefaultHttpRequest;-><init>(Lorg/jboss/netty/handler/codec/http/HttpVersion;Lorg/jboss/netty/handler/codec/http/HttpMethod;Ljava/lang/String;)V

    return-object v0
.end method

.method protected isDecodingRequest()Z
    .locals 1

    .prologue
    .line 76
    const/4 v0, 0x1

    return v0
.end method
