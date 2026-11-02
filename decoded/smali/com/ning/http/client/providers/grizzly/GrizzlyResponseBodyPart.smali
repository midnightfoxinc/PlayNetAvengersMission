.class public Lcom/ning/http/client/providers/grizzly/GrizzlyResponseBodyPart;
.super Lcom/ning/http/client/HttpResponseBodyPart;
.source "GrizzlyResponseBodyPart.java"


# instance fields
.field private final connection:Lorg/glassfish/grizzly/Connection;

.field private final content:Lorg/glassfish/grizzly/http/HttpContent;

.field private final contentBytes:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference",
            "<[B>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lorg/glassfish/grizzly/http/HttpContent;Lorg/glassfish/grizzly/Connection;)V
    .locals 1
    .param p1, "content"    # Lorg/glassfish/grizzly/http/HttpContent;
    .param p2, "connection"    # Lorg/glassfish/grizzly/Connection;

    .prologue
    .line 50
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/ning/http/client/HttpResponseBodyPart;-><init>(Z)V

    .line 41
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    iput-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyResponseBodyPart;->contentBytes:Ljava/util/concurrent/atomic/AtomicReference;

    .line 51
    iput-object p1, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyResponseBodyPart;->content:Lorg/glassfish/grizzly/http/HttpContent;

    .line 52
    iput-object p2, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyResponseBodyPart;->connection:Lorg/glassfish/grizzly/Connection;

    .line 54
    return-void
.end method


# virtual methods
.method getBodyBuffer()Lorg/glassfish/grizzly/Buffer;
    .locals 1

    .prologue
    .line 116
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyResponseBodyPart;->content:Lorg/glassfish/grizzly/http/HttpContent;

    invoke-virtual {v0}, Lorg/glassfish/grizzly/http/HttpContent;->getContent()Lorg/glassfish/grizzly/Buffer;

    move-result-object v0

    return-object v0
.end method

.method public getBodyByteBuffer()Ljava/nio/ByteBuffer;
    .locals 1

    .prologue
    .line 92
    invoke-virtual {p0}, Lcom/ning/http/client/providers/grizzly/GrizzlyResponseBodyPart;->getBodyPartBytes()[B

    move-result-object v0

    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    return-object v0
.end method

.method public getBodyPartBytes()[B
    .locals 6

    .prologue
    .line 63
    iget-object v4, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyResponseBodyPart;->contentBytes:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [B

    .line 64
    .local v1, "bytes":[B
    if-eqz v1, :cond_0

    move-object v2, v1

    .line 74
    .end local v1    # "bytes":[B
    .local v2, "bytes":[B
    :goto_0
    return-object v2

    .line 67
    .end local v2    # "bytes":[B
    .restart local v1    # "bytes":[B
    :cond_0
    iget-object v4, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyResponseBodyPart;->content:Lorg/glassfish/grizzly/http/HttpContent;

    invoke-virtual {v4}, Lorg/glassfish/grizzly/http/HttpContent;->getContent()Lorg/glassfish/grizzly/Buffer;

    move-result-object v0

    .line 68
    .local v0, "b":Lorg/glassfish/grizzly/Buffer;
    invoke-interface {v0}, Lorg/glassfish/grizzly/Buffer;->position()I

    move-result v3

    .line 69
    .local v3, "origPos":I
    invoke-interface {v0}, Lorg/glassfish/grizzly/Buffer;->remaining()I

    move-result v4

    new-array v1, v4, [B

    .line 70
    invoke-interface {v0, v1}, Lorg/glassfish/grizzly/Buffer;->get([B)Lorg/glassfish/grizzly/Buffer;

    .line 71
    invoke-interface {v0}, Lorg/glassfish/grizzly/Buffer;->flip()Lorg/glassfish/grizzly/Buffer;

    .line 72
    invoke-interface {v0, v3}, Lorg/glassfish/grizzly/Buffer;->position(I)Lorg/glassfish/grizzly/Buffer;

    .line 73
    iget-object v4, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyResponseBodyPart;->contentBytes:Ljava/util/concurrent/atomic/AtomicReference;

    const/4 v5, 0x0

    invoke-virtual {v4, v5, v1}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-object v2, v1

    .line 74
    .end local v1    # "bytes":[B
    .restart local v2    # "bytes":[B
    goto :goto_0
.end method

.method public isLast()Z
    .locals 1

    .prologue
    .line 98
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyResponseBodyPart;->content:Lorg/glassfish/grizzly/http/HttpContent;

    invoke-virtual {v0}, Lorg/glassfish/grizzly/http/HttpContent;->isLast()Z

    move-result v0

    return v0
.end method

.method public isUnderlyingConnectionToBeClosed()Z
    .locals 1

    .prologue
    .line 108
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyResponseBodyPart;->connection:Lorg/glassfish/grizzly/Connection;

    invoke-static {v0}, Lcom/ning/http/client/providers/grizzly/ConnectionManager;->isConnectionCacheable(Lorg/glassfish/grizzly/Connection;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public length()I
    .locals 1

    .prologue
    .line 122
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyResponseBodyPart;->content:Lorg/glassfish/grizzly/http/HttpContent;

    invoke-virtual {v0}, Lorg/glassfish/grizzly/http/HttpContent;->getContent()Lorg/glassfish/grizzly/Buffer;

    move-result-object v0

    invoke-interface {v0}, Lorg/glassfish/grizzly/Buffer;->remaining()I

    move-result v0

    return v0
.end method

.method public markUnderlyingConnectionAsToBeClosed()V
    .locals 1

    .prologue
    .line 103
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyResponseBodyPart;->connection:Lorg/glassfish/grizzly/Connection;

    invoke-static {v0}, Lcom/ning/http/client/providers/grizzly/ConnectionManager;->markConnectionAsDoNotCache(Lorg/glassfish/grizzly/Connection;)V

    .line 104
    return-void
.end method

.method public writeTo(Ljava/io/OutputStream;)I
    .locals 2
    .param p1, "outputStream"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 82
    invoke-virtual {p0}, Lcom/ning/http/client/providers/grizzly/GrizzlyResponseBodyPart;->getBodyPartBytes()[B

    move-result-object v0

    .line 83
    .local v0, "bytes":[B
    invoke-virtual {p0}, Lcom/ning/http/client/providers/grizzly/GrizzlyResponseBodyPart;->getBodyPartBytes()[B

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/io/OutputStream;->write([B)V

    .line 84
    array-length v1, v0

    return v1
.end method
