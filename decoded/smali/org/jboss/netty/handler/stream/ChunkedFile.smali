.class public Lorg/jboss/netty/handler/stream/ChunkedFile;
.super Ljava/lang/Object;
.source "ChunkedFile.java"

# interfaces
.implements Lorg/jboss/netty/handler/stream/ChunkedInput;


# instance fields
.field private final chunkSize:I

.field private final endOffset:J

.field private final file:Ljava/io/RandomAccessFile;

.field private offset:J

.field private final startOffset:J


# direct methods
.method public constructor <init>(Ljava/io/File;)V
    .locals 1
    .param p1, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 45
    const/16 v0, 0x2000

    invoke-direct {p0, p1, v0}, Lorg/jboss/netty/handler/stream/ChunkedFile;-><init>(Ljava/io/File;I)V

    .line 46
    return-void
.end method

.method public constructor <init>(Ljava/io/File;I)V
    .locals 2
    .param p1, "file"    # Ljava/io/File;
    .param p2, "chunkSize"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 55
    new-instance v0, Ljava/io/RandomAccessFile;

    const-string v1, "r"

    invoke-direct {v0, p1, v1}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-direct {p0, v0, p2}, Lorg/jboss/netty/handler/stream/ChunkedFile;-><init>(Ljava/io/RandomAccessFile;I)V

    .line 56
    return-void
.end method

.method public constructor <init>(Ljava/io/RandomAccessFile;)V
    .locals 1
    .param p1, "file"    # Ljava/io/RandomAccessFile;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 62
    const/16 v0, 0x2000

    invoke-direct {p0, p1, v0}, Lorg/jboss/netty/handler/stream/ChunkedFile;-><init>(Ljava/io/RandomAccessFile;I)V

    .line 63
    return-void
.end method

.method public constructor <init>(Ljava/io/RandomAccessFile;I)V
    .locals 7
    .param p1, "file"    # Ljava/io/RandomAccessFile;
    .param p2, "chunkSize"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 72
    const-wide/16 v2, 0x0

    invoke-virtual {p1}, Ljava/io/RandomAccessFile;->length()J

    move-result-wide v4

    move-object v0, p0

    move-object v1, p1

    move v6, p2

    invoke-direct/range {v0 .. v6}, Lorg/jboss/netty/handler/stream/ChunkedFile;-><init>(Ljava/io/RandomAccessFile;JJI)V

    .line 73
    return-void
.end method

.method public constructor <init>(Ljava/io/RandomAccessFile;JJI)V
    .locals 4
    .param p1, "file"    # Ljava/io/RandomAccessFile;
    .param p2, "offset"    # J
    .param p4, "length"    # J
    .param p6, "chunkSize"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const-wide/16 v2, 0x0

    .line 83
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 84
    if-nez p1, :cond_0

    .line 85
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "file"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 87
    :cond_0
    cmp-long v0, p2, v2

    if-gez v0, :cond_1

    .line 88
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "offset: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " (expected: 0 or greater)"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 91
    :cond_1
    cmp-long v0, p4, v2

    if-gez v0, :cond_2

    .line 92
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "length: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p4, p5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " (expected: 0 or greater)"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 95
    :cond_2
    if-gtz p6, :cond_3

    .line 96
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "chunkSize: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " (expected: a positive integer)"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 101
    :cond_3
    iput-object p1, p0, Lorg/jboss/netty/handler/stream/ChunkedFile;->file:Ljava/io/RandomAccessFile;

    .line 102
    iput-wide p2, p0, Lorg/jboss/netty/handler/stream/ChunkedFile;->startOffset:J

    iput-wide p2, p0, Lorg/jboss/netty/handler/stream/ChunkedFile;->offset:J

    .line 103
    add-long v0, p2, p4

    iput-wide v0, p0, Lorg/jboss/netty/handler/stream/ChunkedFile;->endOffset:J

    .line 104
    iput p6, p0, Lorg/jboss/netty/handler/stream/ChunkedFile;->chunkSize:I

    .line 106
    invoke-virtual {p1, p2, p3}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 107
    return-void
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
    .line 139
    iget-object v0, p0, Lorg/jboss/netty/handler/stream/ChunkedFile;->file:Ljava/io/RandomAccessFile;

    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->close()V

    .line 140
    return-void
.end method

.method public getCurrentOffset()J
    .locals 2

    .prologue
    .line 127
    iget-wide v0, p0, Lorg/jboss/netty/handler/stream/ChunkedFile;->offset:J

    return-wide v0
.end method

.method public getEndOffset()J
    .locals 2

    .prologue
    .line 120
    iget-wide v0, p0, Lorg/jboss/netty/handler/stream/ChunkedFile;->endOffset:J

    return-wide v0
.end method

.method public getStartOffset()J
    .locals 2

    .prologue
    .line 113
    iget-wide v0, p0, Lorg/jboss/netty/handler/stream/ChunkedFile;->startOffset:J

    return-wide v0
.end method

.method public hasNextChunk()Z
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 131
    iget-wide v0, p0, Lorg/jboss/netty/handler/stream/ChunkedFile;->offset:J

    iget-wide v2, p0, Lorg/jboss/netty/handler/stream/ChunkedFile;->endOffset:J

    cmp-long v0, v0, v2

    if-gez v0, :cond_0

    iget-object v0, p0, Lorg/jboss/netty/handler/stream/ChunkedFile;->file:Ljava/io/RandomAccessFile;

    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v0

    invoke-virtual {v0}, Ljava/nio/channels/FileChannel;->isOpen()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isEndOfInput()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 135
    invoke-virtual {p0}, Lorg/jboss/netty/handler/stream/ChunkedFile;->hasNextChunk()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public nextChunk()Ljava/lang/Object;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 143
    iget-wide v2, p0, Lorg/jboss/netty/handler/stream/ChunkedFile;->offset:J

    .line 144
    .local v2, "offset":J
    iget-wide v4, p0, Lorg/jboss/netty/handler/stream/ChunkedFile;->endOffset:J

    cmp-long v4, v2, v4

    if-ltz v4, :cond_0

    .line 145
    const/4 v4, 0x0

    .line 152
    :goto_0
    return-object v4

    .line 148
    :cond_0
    iget v4, p0, Lorg/jboss/netty/handler/stream/ChunkedFile;->chunkSize:I

    int-to-long v4, v4

    iget-wide v6, p0, Lorg/jboss/netty/handler/stream/ChunkedFile;->endOffset:J

    sub-long/2addr v6, v2

    invoke-static {v4, v5, v6, v7}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v4

    long-to-int v1, v4

    .line 149
    .local v1, "chunkSize":I
    new-array v0, v1, [B

    .line 150
    .local v0, "chunk":[B
    iget-object v4, p0, Lorg/jboss/netty/handler/stream/ChunkedFile;->file:Ljava/io/RandomAccessFile;

    invoke-virtual {v4, v0}, Ljava/io/RandomAccessFile;->readFully([B)V

    .line 151
    int-to-long v4, v1

    add-long/2addr v4, v2

    iput-wide v4, p0, Lorg/jboss/netty/handler/stream/ChunkedFile;->offset:J

    .line 152
    invoke-static {v0}, Lorg/jboss/netty/buffer/ChannelBuffers;->wrappedBuffer([B)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v4

    goto :goto_0
.end method
