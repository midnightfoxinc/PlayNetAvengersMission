.class public Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyRstStreamFrame;
.super Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyStreamFrame;
.source "DefaultSpdyRstStreamFrame.java"

# interfaces
.implements Lorg/jboss/netty/handler/codec/spdy/SpdyRstStreamFrame;


# instance fields
.field private status:Lorg/jboss/netty/handler/codec/spdy/SpdyStreamStatus;


# direct methods
.method public constructor <init>(II)V
    .locals 1
    .param p1, "streamId"    # I
    .param p2, "statusCode"    # I

    .prologue
    .line 35
    invoke-static {p2}, Lorg/jboss/netty/handler/codec/spdy/SpdyStreamStatus;->valueOf(I)Lorg/jboss/netty/handler/codec/spdy/SpdyStreamStatus;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyRstStreamFrame;-><init>(ILorg/jboss/netty/handler/codec/spdy/SpdyStreamStatus;)V

    .line 36
    return-void
.end method

.method public constructor <init>(ILorg/jboss/netty/handler/codec/spdy/SpdyStreamStatus;)V
    .locals 0
    .param p1, "streamId"    # I
    .param p2, "status"    # Lorg/jboss/netty/handler/codec/spdy/SpdyStreamStatus;

    .prologue
    .line 45
    invoke-direct {p0, p1}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyStreamFrame;-><init>(I)V

    .line 46
    invoke-virtual {p0, p2}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyRstStreamFrame;->setStatus(Lorg/jboss/netty/handler/codec/spdy/SpdyStreamStatus;)V

    .line 47
    return-void
.end method


# virtual methods
.method public getStatus()Lorg/jboss/netty/handler/codec/spdy/SpdyStreamStatus;
    .locals 1

    .prologue
    .line 50
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyRstStreamFrame;->status:Lorg/jboss/netty/handler/codec/spdy/SpdyStreamStatus;

    return-object v0
.end method

.method public setStatus(Lorg/jboss/netty/handler/codec/spdy/SpdyStreamStatus;)V
    .locals 0
    .param p1, "status"    # Lorg/jboss/netty/handler/codec/spdy/SpdyStreamStatus;

    .prologue
    .line 54
    iput-object p1, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyRstStreamFrame;->status:Lorg/jboss/netty/handler/codec/spdy/SpdyStreamStatus;

    .line 55
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 59
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 60
    .local v0, "buf":Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    sget-object v1, Lorg/jboss/netty/util/internal/StringUtil;->NEWLINE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    const-string v1, "--> Stream-ID = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyRstStreamFrame;->getStreamId()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 64
    sget-object v1, Lorg/jboss/netty/util/internal/StringUtil;->NEWLINE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    const-string v1, "--> Status: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyRstStreamFrame;->getStatus()Lorg/jboss/netty/handler/codec/spdy/SpdyStreamStatus;

    move-result-object v1

    invoke-virtual {v1}, Lorg/jboss/netty/handler/codec/spdy/SpdyStreamStatus;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
