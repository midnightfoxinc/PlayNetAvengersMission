.class public interface abstract Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpPostRequestDecoder;
.super Ljava/lang/Object;
.source "InterfaceHttpPostRequestDecoder.java"


# virtual methods
.method public abstract cleanFiles()V
.end method

.method public abstract getBodyHttpData(Ljava/lang/String;)Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$NotEnoughDataDecoderException;
        }
    .end annotation
.end method

.method public abstract getBodyHttpDatas()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$NotEnoughDataDecoderException;
        }
    .end annotation
.end method

.method public abstract getBodyHttpDatas(Ljava/lang/String;)Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$NotEnoughDataDecoderException;
        }
    .end annotation
.end method

.method public abstract hasNext()Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$EndOfDataDecoderException;
        }
    .end annotation
.end method

.method public abstract isMultipart()Z
.end method

.method public abstract next()Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$EndOfDataDecoderException;
        }
    .end annotation
.end method

.method public abstract offer(Lorg/jboss/netty/handler/codec/http/HttpChunk;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;
        }
    .end annotation
.end method

.method public abstract removeHttpDataFromClean(Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;)V
.end method
