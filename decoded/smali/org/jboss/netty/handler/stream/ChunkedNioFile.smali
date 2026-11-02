.class public Lorg/jboss/netty/handler/stream/ChunkedNioFile;
.super Ljava/lang/Object;
.source "ChunkedNioFile.java"

# interfaces
.implements Lorg/jboss/netty/handler/stream/ChunkedInput;


# instance fields
.field private final chunkSize:I

.field private final endOffset:J

.field private final in:Ljava/nio/channels/FileChannel;

.field private offset:J

.field private final startOffset:J


# direct methods
.method public constructor <init>(Ljava/io/File;)V
    .locals 1
    .param p1, "in"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 48
    new-instance v0, Ljava/io/FileInputStream;

    invoke-direct {v0, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-virtual {v0}, Ljava/io/FileInputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/jboss/netty/handler/stream/ChunkedNioFile;-><init>(Ljava/nio/channels/FileChannel;)V

    .line 49
    return-void
.end method

.method public constructor <init>(Ljava/io/File;I)V
    .locals 1
    .param p1, "in"    # Ljava/io/File;
    .param p2, "chunkSize"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 58
    new-instance v0, Ljava/io/FileInputStream;

    invoke-direct {v0, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    invoke-virtual {v0}, Ljava/io/FileInputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v0

    invoke-direct {p0, v0, p2}, Lorg/jboss/netty/handler/stream/ChunkedNioFile;-><init>(Ljava/nio/channels/FileChannel;I)V

    .line 59
    return-void
.end method

.method public constructor <init>(Ljava/nio/channels/FileChannel;)V
    .locals 1
    .param p1, "in"    # Ljava/nio/channels/FileChannel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 65
    const/16 v0, 0x2000

    invoke-direct {p0, p1, v0}, Lorg/jboss/netty/handler/stream/ChunkedNioFile;-><init>(Ljava/nio/channels/FileChannel;I)V

    .line 66
    return-void
.end method

.method public constructor <init>(Ljava/nio/channels/FileChannel;I)V
    .locals 7
    .param p1, "in"    # Ljava/nio/channels/FileChannel;
    .param p2, "chunkSize"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 75
    const-wide/16 v2, 0x0

    invoke-virtual {p1}, Ljava/nio/channels/FileChannel;->size()J

    move-result-wide v4

    move-object v0, p0

    move-object v1, p1

    move v6, p2

    invoke-direct/range {v0 .. v6}, Lorg/jboss/netty/handler/stream/ChunkedNioFile;-><init>(Ljava/nio/channels/FileChannel;JJI)V

    .line 76
    return-void
.end method

.method public constructor <init>(Ljava/nio/channels/FileChannel;JJI)V
    .locals 4
    .param p1, "in"    # Ljava/nio/channels/FileChannel;
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

    .line 87
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 88
    if-nez p1, :cond_0

    .line 89
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "in"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 91
    :cond_0
    cmp-long v0, p2, v2

    if-gez v0, :cond_1

    .line 92
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

    .line 95
    :cond_1
    cmp-long v0, p4, v2

    if-gez v0, :cond_2

    .line 96
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

    .line 99
    :cond_2
    if-gtz p6, :cond_3

    .line 100
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

    .line 105
    :cond_3
    cmp-long v0, p2, v2

    if-eqz v0, :cond_4

    .line 106
    invoke-virtual {p1, p2, p3}, Ljava/nio/channels/FileChannel;->position(J)Ljava/nio/channels/FileChannel;

    .line 108
    :cond_4
    iput-object p1, p0, Lorg/jboss/netty/handler/stream/ChunkedNioFile;->in:Ljava/nio/channels/FileChannel;

    .line 109
    iput p6, p0, Lorg/jboss/netty/handler/stream/ChunkedNioFile;->chunkSize:I

    .line 110
    iput-wide p2, p0, Lorg/jboss/netty/handler/stream/ChunkedNioFile;->startOffset:J

    iput-wide p2, p0, Lorg/jboss/netty/handler/stream/ChunkedNioFile;->offset:J

    .line 111
    add-long v0, p2, p4

    iput-wide v0, p0, Lorg/jboss/netty/handler/stream/ChunkedNioFile;->endOffset:J

    .line 112
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
    .line 144
    iget-object v0, p0, Lorg/jboss/netty/handler/stream/ChunkedNioFile;->in:Ljava/nio/channels/FileChannel;

    invoke-virtual {v0}, Ljava/nio/channels/FileChannel;->close()V

    .line 145
    return-void
.end method

.method public getCurrentOffset()J
    .locals 2

    .prologue
    .line 132
    iget-wide v0, p0, Lorg/jboss/netty/handler/stream/ChunkedNioFile;->offset:J

    return-wide v0
.end method

.method public getEndOffset()J
    .locals 2

    .prologue
    .line 125
    iget-wide v0, p0, Lorg/jboss/netty/handler/stream/ChunkedNioFile;->endOffset:J

    return-wide v0
.end method

.method public getStartOffset()J
    .locals 2

    .prologue
    .line 118
    iget-wide v0, p0, Lorg/jboss/netty/handler/stream/ChunkedNioFile;->startOffset:J

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
    .line 136
    iget-wide v0, p0, Lorg/jboss/netty/handler/stream/ChunkedNioFile;->offset:J

    iget-wide v2, p0, Lorg/jboss/netty/handler/stream/ChunkedNioFile;->endOffset:J

    cmp-long v0, v0, v2

    if-gez v0, :cond_0

    iget-object v0, p0, Lorg/jboss/netty/handler/stream/ChunkedNioFile;->in:Ljava/nio/channels/FileChannel;

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
    .line 140
    invoke-virtual {p0}, Lorg/jboss/netty/handler/stream/ChunkedNioFile;->hasNextChunk()Z

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
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 148
    iget-wide v4, p0, Lorg/jboss/netty/handler/stream/ChunkedNioFile;->offset:J

    .line 149
    .local v4, "offset":J
    iget-wide v8, p0, Lorg/jboss/netty/handler/stream/ChunkedNioFile;->endOffset:J

    cmp-long v7, v4, v8

    if-ltz v7, :cond_0

    .line 150
    const/4 v7, 0x0

    .line 169
    :goto_0
    return-object v7

    .line 153
    :cond_0
    iget v7, p0, Lorg/jboss/netty/handler/stream/ChunkedNioFile;->chunkSize:I

    int-to-long v8, v7

    iget-wide v10, p0, Lorg/jboss/netty/handler/stream/ChunkedNioFile;->endOffset:J

    sub-long/2addr v10, v4

    invoke-static {v8, v9, v10, v11}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v8

    long-to-int v2, v8

    .line 154
    .local v2, "chunkSize":I
    new-array v1, v2, [B

    .line 155
    .local v1, "chunkArray":[B
    invoke-static {v1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 156
    .local v0, "chunk":Ljava/nio/ByteBuffer;
    const/4 v6, 0x0

    .line 158
    .local v6, "readBytes":I
    :cond_1
    iget-object v7, p0, Lorg/jboss/netty/handler/stream/ChunkedNioFile;->in:Ljava/nio/channels/FileChannel;

    invoke-virtual {v7, v0}, Ljava/nio/channels/FileChannel;->read(Ljava/nio/ByteBuffer;)I

    move-result v3

    .line 159
    .local v3, "localReadBytes":I
    if-gez v3, :cond_2

    .line 168
    :goto_1
    iget-wide v8, p0, Lorg/jboss/netty/handler/stream/ChunkedNioFile;->offset:J

    int-to-long v10, v6

    add-long/2addr v8, v10

    iput-wide v8, p0, Lorg/jboss/netty/handler/stream/ChunkedNioFile;->offset:J

    .line 169
    invoke-static {v1}, Lorg/jboss/netty/buffer/ChannelBuffers;->wrappedBuffer([B)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v7

    goto :goto_0

    .line 162
    :cond_2
    add-int/2addr v6, v3

    .line 163
    if-ne v6, v2, :cond_1

    goto :goto_1
.end method
