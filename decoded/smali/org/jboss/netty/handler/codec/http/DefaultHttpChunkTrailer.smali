.class public Lorg/jboss/netty/handler/codec/http/DefaultHttpChunkTrailer;
.super Ljava/lang/Object;
.source "DefaultHttpChunkTrailer.java"

# interfaces
.implements Lorg/jboss/netty/handler/codec/http/HttpChunkTrailer;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jboss/netty/handler/codec/http/DefaultHttpChunkTrailer$TrailingHeaders;
    }
.end annotation


# instance fields
.field private final trailingHeaders:Lorg/jboss/netty/handler/codec/http/HttpHeaders;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    new-instance v0, Lorg/jboss/netty/handler/codec/http/DefaultHttpChunkTrailer$TrailingHeaders;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lorg/jboss/netty/handler/codec/http/DefaultHttpChunkTrailer$TrailingHeaders;-><init>(Z)V

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/http/DefaultHttpChunkTrailer;->trailingHeaders:Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .line 69
    return-void
.end method

.method private appendHeaders(Ljava/lang/StringBuilder;)V
    .locals 3
    .param p1, "buf"    # Ljava/lang/StringBuilder;

    .prologue
    .line 61
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/DefaultHttpChunkTrailer;->trailingHeaders()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

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

    .line 62
    .local v0, "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    const-string v2, ": "

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    sget-object v2, Lorg/jboss/netty/util/internal/StringUtil;->NEWLINE:Ljava/lang/String;

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 67
    .end local v0    # "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_0
    return-void
.end method


# virtual methods
.method public getContent()Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 1

    .prologue
    .line 38
    sget-object v0, Lorg/jboss/netty/buffer/ChannelBuffers;->EMPTY_BUFFER:Lorg/jboss/netty/buffer/ChannelBuffer;

    return-object v0
.end method

.method public isLast()Z
    .locals 1

    .prologue
    .line 34
    const/4 v0, 0x1

    return v0
.end method

.method public setContent(Lorg/jboss/netty/buffer/ChannelBuffer;)V
    .locals 2
    .param p1, "content"    # Lorg/jboss/netty/buffer/ChannelBuffer;

    .prologue
    .line 42
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "read-only"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 51
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 52
    .local v0, "buf":Ljava/lang/StringBuilder;
    sget-object v1, Lorg/jboss/netty/util/internal/StringUtil;->NEWLINE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    invoke-direct {p0, v0}, Lorg/jboss/netty/handler/codec/http/DefaultHttpChunkTrailer;->appendHeaders(Ljava/lang/StringBuilder;)V

    .line 56
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    sget-object v2, Lorg/jboss/netty/util/internal/StringUtil;->NEWLINE:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    sub-int/2addr v1, v2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 57
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public trailingHeaders()Lorg/jboss/netty/handler/codec/http/HttpHeaders;
    .locals 1

    .prologue
    .line 46
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/DefaultHttpChunkTrailer;->trailingHeaders:Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    return-object v0
.end method
