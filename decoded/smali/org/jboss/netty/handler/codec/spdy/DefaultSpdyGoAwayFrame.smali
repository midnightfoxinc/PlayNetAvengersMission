.class public Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyGoAwayFrame;
.super Ljava/lang/Object;
.source "DefaultSpdyGoAwayFrame.java"

# interfaces
.implements Lorg/jboss/netty/handler/codec/spdy/SpdyGoAwayFrame;


# instance fields
.field private lastGoodStreamId:I

.field private status:Lorg/jboss/netty/handler/codec/spdy/SpdySessionStatus;


# direct methods
.method public constructor <init>(I)V
    .locals 1
    .param p1, "lastGoodStreamId"    # I

    .prologue
    .line 34
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyGoAwayFrame;-><init>(II)V

    .line 35
    return-void
.end method

.method public constructor <init>(II)V
    .locals 1
    .param p1, "lastGoodStreamId"    # I
    .param p2, "statusCode"    # I

    .prologue
    .line 44
    invoke-static {p2}, Lorg/jboss/netty/handler/codec/spdy/SpdySessionStatus;->valueOf(I)Lorg/jboss/netty/handler/codec/spdy/SpdySessionStatus;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyGoAwayFrame;-><init>(ILorg/jboss/netty/handler/codec/spdy/SpdySessionStatus;)V

    .line 45
    return-void
.end method

.method public constructor <init>(ILorg/jboss/netty/handler/codec/spdy/SpdySessionStatus;)V
    .locals 0
    .param p1, "lastGoodStreamId"    # I
    .param p2, "status"    # Lorg/jboss/netty/handler/codec/spdy/SpdySessionStatus;

    .prologue
    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    invoke-virtual {p0, p1}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyGoAwayFrame;->setLastGoodStreamId(I)V

    .line 55
    invoke-virtual {p0, p2}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyGoAwayFrame;->setStatus(Lorg/jboss/netty/handler/codec/spdy/SpdySessionStatus;)V

    .line 56
    return-void
.end method


# virtual methods
.method public getLastGoodStreamId()I
    .locals 1

    .prologue
    .line 59
    iget v0, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyGoAwayFrame;->lastGoodStreamId:I

    return v0
.end method

.method public getStatus()Lorg/jboss/netty/handler/codec/spdy/SpdySessionStatus;
    .locals 1

    .prologue
    .line 71
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyGoAwayFrame;->status:Lorg/jboss/netty/handler/codec/spdy/SpdySessionStatus;

    return-object v0
.end method

.method public setLastGoodStreamId(I)V
    .locals 3
    .param p1, "lastGoodStreamId"    # I

    .prologue
    .line 63
    if-gez p1, :cond_0

    .line 64
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Last-good-stream-ID cannot be negative: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 67
    :cond_0
    iput p1, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyGoAwayFrame;->lastGoodStreamId:I

    .line 68
    return-void
.end method

.method public setStatus(Lorg/jboss/netty/handler/codec/spdy/SpdySessionStatus;)V
    .locals 0
    .param p1, "status"    # Lorg/jboss/netty/handler/codec/spdy/SpdySessionStatus;

    .prologue
    .line 75
    iput-object p1, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyGoAwayFrame;->status:Lorg/jboss/netty/handler/codec/spdy/SpdySessionStatus;

    .line 76
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 80
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 81
    .local v0, "buf":Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    sget-object v1, Lorg/jboss/netty/util/internal/StringUtil;->NEWLINE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    const-string v1, "--> Last-good-stream-ID = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyGoAwayFrame;->getLastGoodStreamId()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 85
    sget-object v1, Lorg/jboss/netty/util/internal/StringUtil;->NEWLINE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    const-string v1, "--> Status: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyGoAwayFrame;->getStatus()Lorg/jboss/netty/handler/codec/spdy/SpdySessionStatus;

    move-result-object v1

    invoke-virtual {v1}, Lorg/jboss/netty/handler/codec/spdy/SpdySessionStatus;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
