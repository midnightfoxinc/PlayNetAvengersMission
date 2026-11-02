.class public Lcom/ning/http/client/providers/netty/request/body/BodyChunkedInput;
.super Ljava/lang/Object;
.source "BodyChunkedInput.java"

# interfaces
.implements Lorg/jboss/netty/handler/stream/ChunkedInput;


# static fields
.field private static final DEFAULT_CHUNK_SIZE:I = 0x2000


# instance fields
.field private final body:Lcom/ning/http/client/Body;

.field private final chunkSize:I

.field private final contentLength:I

.field private endOfInput:Z


# direct methods
.method public constructor <init>(Lcom/ning/http/client/Body;)V
    .locals 3
    .param p1, "body"    # Lcom/ning/http/client/Body;

    .prologue
    const/16 v2, 0x2000

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    if-nez p1, :cond_0

    .line 37
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "body"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 38
    :cond_0
    iput-object p1, p0, Lcom/ning/http/client/providers/netty/request/body/BodyChunkedInput;->body:Lcom/ning/http/client/Body;

    .line 39
    invoke-interface {p1}, Lcom/ning/http/client/Body;->getContentLength()J

    move-result-wide v0

    long-to-int v0, v0

    iput v0, p0, Lcom/ning/http/client/providers/netty/request/body/BodyChunkedInput;->contentLength:I

    .line 40
    iget v0, p0, Lcom/ning/http/client/providers/netty/request/body/BodyChunkedInput;->contentLength:I

    if-gtz v0, :cond_1

    .line 41
    iput v2, p0, Lcom/ning/http/client/providers/netty/request/body/BodyChunkedInput;->chunkSize:I

    .line 44
    :goto_0
    return-void

    .line 43
    :cond_1
    iget v0, p0, Lcom/ning/http/client/providers/netty/request/body/BodyChunkedInput;->contentLength:I

    invoke-static {v0, v2}, Ljava/lang/Math;->min(II)I

    move-result v0

    iput v0, p0, Lcom/ning/http/client/providers/netty/request/body/BodyChunkedInput;->chunkSize:I

    goto :goto_0
.end method


# virtual methods
.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 74
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/request/body/BodyChunkedInput;->body:Lcom/ning/http/client/Body;

    invoke-interface {v0}, Lcom/ning/http/client/Body;->close()V

    .line 75
    return-void
.end method

.method public hasNextChunk()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 48
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method public isEndOfInput()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 70
    iget-boolean v0, p0, Lcom/ning/http/client/providers/netty/request/body/BodyChunkedInput;->endOfInput:Z

    return v0
.end method

.method public nextChunk()Ljava/lang/Object;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    const/4 v1, 0x1

    .line 52
    iget-boolean v5, p0, Lcom/ning/http/client/providers/netty/request/body/BodyChunkedInput;->endOfInput:Z

    if-eqz v5, :cond_0

    move-object v1, v4

    .line 63
    :goto_0
    return-object v1

    .line 55
    :cond_0
    iget v5, p0, Lcom/ning/http/client/providers/netty/request/body/BodyChunkedInput;->chunkSize:I

    invoke-static {v5}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 56
    .local v0, "buffer":Ljava/nio/ByteBuffer;
    iget-object v5, p0, Lcom/ning/http/client/providers/netty/request/body/BodyChunkedInput;->body:Lcom/ning/http/client/Body;

    invoke-interface {v5, v0}, Lcom/ning/http/client/Body;->read(Ljava/nio/ByteBuffer;)J

    move-result-wide v2

    .line 57
    .local v2, "r":J
    const-wide/16 v6, 0x0

    cmp-long v5, v2, v6

    if-gez v5, :cond_1

    .line 58
    iput-boolean v1, p0, Lcom/ning/http/client/providers/netty/request/body/BodyChunkedInput;->endOfInput:Z

    move-object v1, v4

    .line 59
    goto :goto_0

    .line 61
    :cond_1
    iget v4, p0, Lcom/ning/http/client/providers/netty/request/body/BodyChunkedInput;->contentLength:I

    int-to-long v4, v4

    cmp-long v4, v2, v4

    if-eqz v4, :cond_2

    iget v4, p0, Lcom/ning/http/client/providers/netty/request/body/BodyChunkedInput;->chunkSize:I

    int-to-long v4, v4

    cmp-long v4, v2, v4

    if-gez v4, :cond_3

    iget v4, p0, Lcom/ning/http/client/providers/netty/request/body/BodyChunkedInput;->contentLength:I

    if-lez v4, :cond_3

    :cond_2
    :goto_1
    iput-boolean v1, p0, Lcom/ning/http/client/providers/netty/request/body/BodyChunkedInput;->endOfInput:Z

    .line 62
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 63
    invoke-static {v0}, Lorg/jboss/netty/buffer/ChannelBuffers;->wrappedBuffer(Ljava/nio/ByteBuffer;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v1

    goto :goto_0

    .line 61
    :cond_3
    const/4 v1, 0x0

    goto :goto_1
.end method
