.class public abstract Lcom/ning/http/client/HttpResponseBodyPart;
.super Ljava/lang/Object;
.source "HttpResponseBodyPart.java"


# instance fields
.field private closeConnection:Z

.field private final last:Z


# direct methods
.method public constructor <init>(Z)V
    .locals 0
    .param p1, "last"    # Z

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    iput-boolean p1, p0, Lcom/ning/http/client/HttpResponseBodyPart;->last:Z

    .line 32
    return-void
.end method


# virtual methods
.method public abstract getBodyByteBuffer()Ljava/nio/ByteBuffer;
.end method

.method public abstract getBodyPartBytes()[B
.end method

.method public isLast()Z
    .locals 1

    .prologue
    .line 58
    iget-boolean v0, p0, Lcom/ning/http/client/HttpResponseBodyPart;->last:Z

    return v0
.end method

.method public isUnderlyingConnectionToBeClosed()Z
    .locals 1

    .prologue
    .line 49
    iget-boolean v0, p0, Lcom/ning/http/client/HttpResponseBodyPart;->closeConnection:Z

    return v0
.end method

.method public abstract length()I
.end method

.method public markUnderlyingConnectionAsToBeClosed()V
    .locals 1

    .prologue
    .line 40
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/ning/http/client/HttpResponseBodyPart;->closeConnection:Z

    .line 41
    return-void
.end method

.method public abstract writeTo(Ljava/io/OutputStream;)I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
