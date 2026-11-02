.class public Lorg/jboss/netty/handler/codec/spdy/DefaultSpdySynStreamFrame;
.super Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeadersFrame;
.source "DefaultSpdySynStreamFrame.java"

# interfaces
.implements Lorg/jboss/netty/handler/codec/spdy/SpdySynStreamFrame;


# instance fields
.field private associatedToStreamId:I

.field private priority:B

.field private unidirectional:Z


# direct methods
.method public constructor <init>(IIB)V
    .locals 0
    .param p1, "streamId"    # I
    .param p2, "associatedToStreamId"    # I
    .param p3, "priority"    # B

    .prologue
    .line 39
    invoke-direct {p0, p1}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdyHeadersFrame;-><init>(I)V

    .line 40
    invoke-virtual {p0, p2}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdySynStreamFrame;->setAssociatedToStreamId(I)V

    .line 41
    invoke-virtual {p0, p3}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdySynStreamFrame;->setPriority(B)V

    .line 42
    return-void
.end method


# virtual methods
.method public getAssociatedToStreamId()I
    .locals 1

    .prologue
    .line 45
    iget v0, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdySynStreamFrame;->associatedToStreamId:I

    return v0
.end method

.method public getPriority()B
    .locals 1

    .prologue
    .line 58
    iget-byte v0, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdySynStreamFrame;->priority:B

    return v0
.end method

.method public isUnidirectional()Z
    .locals 1

    .prologue
    .line 70
    iget-boolean v0, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdySynStreamFrame;->unidirectional:Z

    return v0
.end method

.method public setAssociatedToStreamId(I)V
    .locals 3
    .param p1, "associatedToStreamId"    # I

    .prologue
    .line 49
    if-gez p1, :cond_0

    .line 50
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Associated-To-Stream-ID cannot be negative: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 54
    :cond_0
    iput p1, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdySynStreamFrame;->associatedToStreamId:I

    .line 55
    return-void
.end method

.method public setPriority(B)V
    .locals 3
    .param p1, "priority"    # B

    .prologue
    .line 62
    if-ltz p1, :cond_0

    const/4 v0, 0x7

    if-le p1, v0, :cond_1

    .line 63
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Priority must be between 0 and 7 inclusive: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 66
    :cond_1
    iput-byte p1, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdySynStreamFrame;->priority:B

    .line 67
    return-void
.end method

.method public setUnidirectional(Z)V
    .locals 0
    .param p1, "unidirectional"    # Z

    .prologue
    .line 74
    iput-boolean p1, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdySynStreamFrame;->unidirectional:Z

    .line 75
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 79
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 80
    .local v0, "buf":Ljava/lang/StringBuilder;
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    const-string v1, "(last: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdySynStreamFrame;->isLast()Z

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 83
    const-string v1, "; unidirectional: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdySynStreamFrame;->isUnidirectional()Z

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 85
    const/16 v1, 0x29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 86
    sget-object v1, Lorg/jboss/netty/util/internal/StringUtil;->NEWLINE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    const-string v1, "--> Stream-ID = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdySynStreamFrame;->getStreamId()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 89
    sget-object v1, Lorg/jboss/netty/util/internal/StringUtil;->NEWLINE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    iget v1, p0, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdySynStreamFrame;->associatedToStreamId:I

    if-eqz v1, :cond_0

    .line 91
    const-string v1, "--> Associated-To-Stream-ID = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 92
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdySynStreamFrame;->getAssociatedToStreamId()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 93
    sget-object v1, Lorg/jboss/netty/util/internal/StringUtil;->NEWLINE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 95
    :cond_0
    const-string v1, "--> Priority = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdySynStreamFrame;->getPriority()B

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 97
    sget-object v1, Lorg/jboss/netty/util/internal/StringUtil;->NEWLINE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 98
    const-string v1, "--> Headers:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 99
    sget-object v1, Lorg/jboss/netty/util/internal/StringUtil;->NEWLINE:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    invoke-virtual {p0, v0}, Lorg/jboss/netty/handler/codec/spdy/DefaultSpdySynStreamFrame;->appendHeaders(Ljava/lang/StringBuilder;)V

    .line 103
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    sget-object v2, Lorg/jboss/netty/util/internal/StringUtil;->NEWLINE:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    sub-int/2addr v1, v2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 104
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
