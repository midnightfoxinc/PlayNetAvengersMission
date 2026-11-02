.class public interface abstract Lorg/jboss/netty/handler/codec/http/HttpMessage;
.super Ljava/lang/Object;
.source "HttpMessage.java"


# virtual methods
.method public abstract getContent()Lorg/jboss/netty/buffer/ChannelBuffer;
.end method

.method public abstract getProtocolVersion()Lorg/jboss/netty/handler/codec/http/HttpVersion;
.end method

.method public abstract headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;
.end method

.method public abstract isChunked()Z
.end method

.method public abstract setChunked(Z)V
.end method

.method public abstract setContent(Lorg/jboss/netty/buffer/ChannelBuffer;)V
.end method

.method public abstract setProtocolVersion(Lorg/jboss/netty/handler/codec/http/HttpVersion;)V
.end method
