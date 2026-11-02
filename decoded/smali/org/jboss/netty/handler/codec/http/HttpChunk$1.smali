.class final Lorg/jboss/netty/handler/codec/http/HttpChunk$1;
.super Ljava/lang/Object;
.source "HttpChunk.java"

# interfaces
.implements Lorg/jboss/netty/handler/codec/http/HttpChunkTrailer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jboss/netty/handler/codec/http/HttpChunk;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getContent()Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 1

    .prologue
    .line 43
    sget-object v0, Lorg/jboss/netty/buffer/ChannelBuffers;->EMPTY_BUFFER:Lorg/jboss/netty/buffer/ChannelBuffer;

    return-object v0
.end method

.method public isLast()Z
    .locals 1

    .prologue
    .line 51
    const/4 v0, 0x1

    return v0
.end method

.method public setContent(Lorg/jboss/netty/buffer/ChannelBuffer;)V
    .locals 2
    .param p1, "content"    # Lorg/jboss/netty/buffer/ChannelBuffer;

    .prologue
    .line 47
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "read-only"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public trailingHeaders()Lorg/jboss/netty/handler/codec/http/HttpHeaders;
    .locals 1

    .prologue
    .line 55
    sget-object v0, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->EMPTY_HEADERS:Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    return-object v0
.end method
