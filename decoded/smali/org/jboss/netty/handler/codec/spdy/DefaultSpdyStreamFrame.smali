.class public abstract Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyStreamFrame;
.super Ljava/lang/Object;
.source "DefaultSpdyStreamFrame.java"

# interfaces
.implements Lorg/jboss/netty/handler/codec/spdy/SpdyStreamFrame;


# instance fields
.field private last:Z

.field private streamId:I


# direct methods
.method protected constructor <init>(I)V
    .locals 0
    .param p1, "streamId"    # I

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    invoke-virtual {p0, p1}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyStreamFrame;->setStreamId(I)V

    .line 33
    return-void
.end method


# virtual methods
.method public getStreamId()I
    .locals 1

    .prologue
    .line 36
    iget v0, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyStreamFrame;->streamId:I

    return v0
.end method

.method public isLast()Z
    .locals 1

    .prologue
    .line 48
    iget-boolean v0, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyStreamFrame;->last:Z

    return v0
.end method

.method public setLast(Z)V
    .locals 0
    .param p1, "last"    # Z

    .prologue
    .line 52
    iput-boolean p1, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyStreamFrame;->last:Z

    .line 53
    return-void
.end method

.method public setStreamId(I)V
    .locals 3
    .param p1, "streamId"    # I

    .prologue
    .line 40
    if-gtz p1, :cond_0

    .line 41
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Stream-ID must be positive: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 44
    :cond_0
    iput p1, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyStreamFrame;->streamId:I

    .line 45
    return-void
.end method
