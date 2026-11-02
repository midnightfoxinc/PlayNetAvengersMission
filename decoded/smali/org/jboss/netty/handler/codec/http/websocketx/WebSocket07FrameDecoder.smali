.class public Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket07FrameDecoder;
.super Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;
.source "WebSocket07FrameDecoder.java"


# direct methods
.method public constructor <init>(ZZJ)V
    .locals 1
    .param p1, "maskedPayload"    # Z
    .param p2, "allowExtensions"    # Z
    .param p3, "maxFramePayloadLength"    # J

    .prologue
    .line 74
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/jboss/netty/handler/codec/http/websocketx/WebSocket08FrameDecoder;-><init>(ZZJ)V

    .line 75
    return-void
.end method
