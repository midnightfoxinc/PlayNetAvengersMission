.class public abstract Lorg/jboss/netty/handler/codec/http/multipart/AbstractMemoryHttpData;
.super Lorg/jboss/netty/handler/codec/http/multipart/AbstractHttpData;
.source "AbstractMemoryHttpData.java"


# instance fields
.field private channelBuffer:Lorg/jboss/netty/buffer/ChannelBuffer;

.field private chunkPosition:I

.field protected isRenamed:Z


# direct methods
.method protected constructor <init>(Ljava/lang/String;Ljava/nio/charset/Charset;J)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "charset"    # Ljava/nio/charset/Charset;
    .param p3, "size"    # J

    .prologue
    .line 41
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/jboss/netty/handler/codec/http/multipart/AbstractHttpData;-><init>(Ljava/lang/String;Ljava/nio/charset/Charset;J)V

    .line 42
    return-void
.end method


# virtual methods
.method public addContent(Lorg/jboss/netty/buffer/ChannelBuffer;Z)V
    .locals 7
    .param p1, "buffer"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p2, "last"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x1

    .line 83
    if-eqz p1, :cond_1

    .line 84
    invoke-interface {p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v2

    int-to-long v0, v2

    .line 85
    .local v0, "localsize":J
    iget-wide v2, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractMemoryHttpData;->size:J

    add-long/2addr v2, v0

    invoke-virtual {p0, v2, v3}, Lorg/jboss/netty/handler/codec/http/multipart/AbstractMemoryHttpData;->checkSize(J)V

    .line 86
    iget-wide v2, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractMemoryHttpData;->definedSize:J

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-lez v2, :cond_0

    iget-wide v2, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractMemoryHttpData;->definedSize:J

    iget-wide v4, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractMemoryHttpData;->size:J

    add-long/2addr v4, v0

    cmp-long v2, v2, v4

    if-gez v2, :cond_0

    .line 87
    new-instance v2, Ljava/io/IOException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Out of size: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-wide v4, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractMemoryHttpData;->size:J

    add-long/2addr v4, v0

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " > "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-wide v4, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractMemoryHttpData;->definedSize:J

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 90
    :cond_0
    iget-wide v2, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractMemoryHttpData;->size:J

    add-long/2addr v2, v0

    iput-wide v2, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractMemoryHttpData;->size:J

    .line 91
    iget-object v2, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractMemoryHttpData;->channelBuffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    if-nez v2, :cond_3

    .line 92
    iput-object p1, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractMemoryHttpData;->channelBuffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 98
    .end local v0    # "localsize":J
    :cond_1
    :goto_0
    if-eqz p2, :cond_4

    .line 99
    iput-boolean v6, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractMemoryHttpData;->completed:Z

    .line 105
    :cond_2
    return-void

    .line 94
    .restart local v0    # "localsize":J
    :cond_3
    const/4 v2, 0x2

    new-array v2, v2, [Lorg/jboss/netty/buffer/ChannelBuffer;

    const/4 v3, 0x0

    iget-object v4, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractMemoryHttpData;->channelBuffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    aput-object v4, v2, v3

    aput-object p1, v2, v6

    invoke-static {v2}, Lorg/jboss/netty/buffer/ChannelBuffers;->wrappedBuffer([Lorg/jboss/netty/buffer/ChannelBuffer;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v2

    iput-object v2, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractMemoryHttpData;->channelBuffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    goto :goto_0

    .line 101
    .end local v0    # "localsize":J
    :cond_4
    if-nez p1, :cond_2

    .line 102
    new-instance v2, Ljava/lang/NullPointerException;

    const-string v3, "buffer"

    invoke-direct {v2, v3}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public delete()V
    .locals 0

    .prologue
    .line 135
    return-void
.end method

.method public get()[B
    .locals 3

    .prologue
    .line 138
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractMemoryHttpData;->channelBuffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    if-nez v1, :cond_0

    .line 139
    const/4 v1, 0x0

    new-array v0, v1, [B

    .line 143
    :goto_0
    return-object v0

    .line 141
    :cond_0
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractMemoryHttpData;->channelBuffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v1

    new-array v0, v1, [B

    .line 142
    .local v0, "array":[B
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractMemoryHttpData;->channelBuffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    iget-object v2, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractMemoryHttpData;->channelBuffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v2}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v2

    invoke-interface {v1, v2, v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->getBytes(I[B)V

    goto :goto_0
.end method

.method public getChannelBuffer()Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 1

    .prologue
    .line 166
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractMemoryHttpData;->channelBuffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    return-object v0
.end method

.method public getChunk(I)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 6
    .param p1, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 170
    iget-object v3, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractMemoryHttpData;->channelBuffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    if-eqz v3, :cond_0

    if-eqz p1, :cond_0

    iget-object v3, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractMemoryHttpData;->channelBuffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v3

    if-nez v3, :cond_1

    .line 171
    :cond_0
    iput v5, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractMemoryHttpData;->chunkPosition:I

    .line 172
    sget-object v0, Lorg/jboss/netty/buffer/ChannelBuffers;->EMPTY_BUFFER:Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 185
    :goto_0
    return-object v0

    .line 174
    :cond_1
    iget-object v3, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractMemoryHttpData;->channelBuffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v3

    iget v4, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractMemoryHttpData;->chunkPosition:I

    sub-int v1, v3, v4

    .line 175
    .local v1, "sizeLeft":I
    if-nez v1, :cond_2

    .line 176
    iput v5, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractMemoryHttpData;->chunkPosition:I

    .line 177
    sget-object v0, Lorg/jboss/netty/buffer/ChannelBuffers;->EMPTY_BUFFER:Lorg/jboss/netty/buffer/ChannelBuffer;

    goto :goto_0

    .line 179
    :cond_2
    move v2, p1

    .line 180
    .local v2, "sliceLength":I
    if-ge v1, p1, :cond_3

    .line 181
    move v2, v1

    .line 183
    :cond_3
    iget-object v3, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractMemoryHttpData;->channelBuffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    iget v4, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractMemoryHttpData;->chunkPosition:I

    invoke-interface {v3, v4, v2}, Lorg/jboss/netty/buffer/ChannelBuffer;->slice(II)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    .line 184
    .local v0, "chunk":Lorg/jboss/netty/buffer/ChannelBuffer;
    iget v3, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractMemoryHttpData;->chunkPosition:I

    add-int/2addr v3, v2

    iput v3, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractMemoryHttpData;->chunkPosition:I

    goto :goto_0
.end method

.method public getFile()Ljava/io/File;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 218
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Not represented by a file"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 147
    sget-object v0, Lorg/jboss/netty/handler/codec/http/HttpConstants;->DEFAULT_CHARSET:Ljava/nio/charset/Charset;

    invoke-virtual {p0, v0}, Lorg/jboss/netty/handler/codec/http/multipart/AbstractMemoryHttpData;->getString(Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getString(Ljava/nio/charset/Charset;)Ljava/lang/String;
    .locals 1
    .param p1, "encoding"    # Ljava/nio/charset/Charset;

    .prologue
    .line 151
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractMemoryHttpData;->channelBuffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    if-nez v0, :cond_0

    .line 152
    const-string v0, ""

    .line 157
    :goto_0
    return-object v0

    .line 154
    :cond_0
    if-nez p1, :cond_1

    .line 155
    sget-object p1, Lorg/jboss/netty/handler/codec/http/HttpConstants;->DEFAULT_CHARSET:Ljava/nio/charset/Charset;

    .line 157
    :cond_1
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractMemoryHttpData;->channelBuffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v0, p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->toString(Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public isInMemory()Z
    .locals 1

    .prologue
    .line 189
    const/4 v0, 0x1

    return v0
.end method

.method public renameTo(Ljava/io/File;)Z
    .locals 8
    .param p1, "dest"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    const/4 v5, 0x1

    .line 193
    if-nez p1, :cond_0

    .line 194
    new-instance v5, Ljava/lang/NullPointerException;

    const-string v6, "dest"

    invoke-direct {v5, v6}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 196
    :cond_0
    iget-object v7, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractMemoryHttpData;->channelBuffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    if-nez v7, :cond_2

    .line 198
    invoke-virtual {p1}, Ljava/io/File;->createNewFile()Z

    .line 199
    iput-boolean v5, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractMemoryHttpData;->isRenamed:Z

    .line 214
    :cond_1
    :goto_0
    return v5

    .line 202
    :cond_2
    iget-object v7, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractMemoryHttpData;->channelBuffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v7}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v2

    .line 203
    .local v2, "length":I
    new-instance v3, Ljava/io/FileOutputStream;

    invoke-direct {v3, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 204
    .local v3, "outputStream":Ljava/io/FileOutputStream;
    invoke-virtual {v3}, Ljava/io/FileOutputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v1

    .line 205
    .local v1, "fileChannel":Ljava/nio/channels/FileChannel;
    iget-object v7, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractMemoryHttpData;->channelBuffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v7}, Lorg/jboss/netty/buffer/ChannelBuffer;->toByteBuffer()Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 206
    .local v0, "byteBuffer":Ljava/nio/ByteBuffer;
    const/4 v4, 0x0

    .line 207
    .local v4, "written":I
    :goto_1
    if-ge v4, v2, :cond_3

    .line 208
    invoke-virtual {v1, v0}, Ljava/nio/channels/FileChannel;->write(Ljava/nio/ByteBuffer;)I

    move-result v7

    add-int/2addr v4, v7

    goto :goto_1

    .line 210
    :cond_3
    invoke-virtual {v1, v6}, Ljava/nio/channels/FileChannel;->force(Z)V

    .line 211
    invoke-virtual {v1}, Ljava/nio/channels/FileChannel;->close()V

    .line 212
    invoke-virtual {v3}, Ljava/io/FileOutputStream;->close()V

    .line 213
    iput-boolean v5, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractMemoryHttpData;->isRenamed:Z

    .line 214
    if-eq v4, v2, :cond_1

    move v5, v6

    goto :goto_0
.end method

.method public setContent(Ljava/io/File;)V
    .locals 10
    .param p1, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 108
    if-nez p1, :cond_0

    .line 109
    new-instance v7, Ljava/lang/NullPointerException;

    const-string v8, "file"

    invoke-direct {v7, v8}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 111
    :cond_0
    invoke-virtual {p1}, Ljava/io/File;->length()J

    move-result-wide v4

    .line 112
    .local v4, "newsize":J
    const-wide/32 v8, 0x7fffffff

    cmp-long v7, v4, v8

    if-lez v7, :cond_1

    .line 113
    new-instance v7, Ljava/lang/IllegalArgumentException;

    const-string v8, "File too big to be loaded in memory"

    invoke-direct {v7, v8}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 116
    :cond_1
    invoke-virtual {p0, v4, v5}, Lorg/jboss/netty/handler/codec/http/multipart/AbstractMemoryHttpData;->checkSize(J)V

    .line 117
    new-instance v3, Ljava/io/FileInputStream;

    invoke-direct {v3, p1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 118
    .local v3, "inputStream":Ljava/io/FileInputStream;
    invoke-virtual {v3}, Ljava/io/FileInputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v2

    .line 119
    .local v2, "fileChannel":Ljava/nio/channels/FileChannel;
    long-to-int v7, v4

    new-array v0, v7, [B

    .line 120
    .local v0, "array":[B
    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v1

    .line 121
    .local v1, "byteBuffer":Ljava/nio/ByteBuffer;
    const/4 v6, 0x0

    .line 122
    .local v6, "read":I
    :goto_0
    int-to-long v8, v6

    cmp-long v7, v8, v4

    if-gez v7, :cond_2

    .line 123
    invoke-virtual {v2, v1}, Ljava/nio/channels/FileChannel;->read(Ljava/nio/ByteBuffer;)I

    move-result v7

    add-int/2addr v6, v7

    goto :goto_0

    .line 125
    :cond_2
    invoke-virtual {v2}, Ljava/nio/channels/FileChannel;->close()V

    .line 126
    invoke-virtual {v3}, Ljava/io/FileInputStream;->close()V

    .line 127
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 128
    invoke-static {v1}, Lorg/jboss/netty/buffer/ChannelBuffers;->wrappedBuffer(Ljava/nio/ByteBuffer;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v7

    iput-object v7, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractMemoryHttpData;->channelBuffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 129
    iput-wide v4, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractMemoryHttpData;->size:J

    .line 130
    const/4 v7, 0x1

    iput-boolean v7, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractMemoryHttpData;->completed:Z

    .line 131
    return-void
.end method

.method public setContent(Ljava/io/InputStream;)V
    .locals 8
    .param p1, "inputStream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 60
    if-nez p1, :cond_0

    .line 61
    new-instance v4, Ljava/lang/NullPointerException;

    const-string v5, "inputStream"

    invoke-direct {v4, v5}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 63
    :cond_0
    invoke-static {}, Lorg/jboss/netty/buffer/ChannelBuffers;->dynamicBuffer()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    .line 64
    .local v0, "buffer":Lorg/jboss/netty/buffer/ChannelBuffer;
    const/16 v4, 0x4000

    new-array v1, v4, [B

    .line 65
    .local v1, "bytes":[B
    invoke-virtual {p1, v1}, Ljava/io/InputStream;->read([B)I

    move-result v2

    .line 66
    .local v2, "read":I
    const/4 v3, 0x0

    .line 67
    .local v3, "written":I
    :goto_0
    if-lez v2, :cond_1

    .line 68
    const/4 v4, 0x0

    invoke-interface {v0, v1, v4, v2}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeBytes([BII)V

    .line 69
    add-int/2addr v3, v2

    .line 70
    int-to-long v4, v3

    invoke-virtual {p0, v4, v5}, Lorg/jboss/netty/handler/codec/http/multipart/AbstractMemoryHttpData;->checkSize(J)V

    .line 71
    invoke-virtual {p1, v1}, Ljava/io/InputStream;->read([B)I

    move-result v2

    goto :goto_0

    .line 73
    :cond_1
    int-to-long v4, v3

    iput-wide v4, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractMemoryHttpData;->size:J

    .line 74
    iget-wide v4, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractMemoryHttpData;->definedSize:J

    const-wide/16 v6, 0x0

    cmp-long v4, v4, v6

    if-lez v4, :cond_2

    iget-wide v4, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractMemoryHttpData;->definedSize:J

    iget-wide v6, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractMemoryHttpData;->size:J

    cmp-long v4, v4, v6

    if-gez v4, :cond_2

    .line 75
    new-instance v4, Ljava/io/IOException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Out of size: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-wide v6, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractMemoryHttpData;->size:J

    invoke-virtual {v5, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " > "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-wide v6, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractMemoryHttpData;->definedSize:J

    invoke-virtual {v5, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 77
    :cond_2
    iput-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractMemoryHttpData;->channelBuffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 78
    const/4 v4, 0x1

    iput-boolean v4, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractMemoryHttpData;->completed:Z

    .line 79
    return-void
.end method

.method public setContent(Lorg/jboss/netty/buffer/ChannelBuffer;)V
    .locals 6
    .param p1, "buffer"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 45
    if-nez p1, :cond_0

    .line 46
    new-instance v2, Ljava/lang/NullPointerException;

    const-string v3, "buffer"

    invoke-direct {v2, v3}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 48
    :cond_0
    invoke-interface {p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v2

    int-to-long v0, v2

    .line 49
    .local v0, "localsize":J
    invoke-virtual {p0, v0, v1}, Lorg/jboss/netty/handler/codec/http/multipart/AbstractMemoryHttpData;->checkSize(J)V

    .line 50
    iget-wide v2, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractMemoryHttpData;->definedSize:J

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-lez v2, :cond_1

    iget-wide v2, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractMemoryHttpData;->definedSize:J

    cmp-long v2, v2, v0

    if-gez v2, :cond_1

    .line 51
    new-instance v2, Ljava/io/IOException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Out of size: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " > "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-wide v4, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractMemoryHttpData;->definedSize:J

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 54
    :cond_1
    iput-object p1, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractMemoryHttpData;->channelBuffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 55
    iput-wide v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractMemoryHttpData;->size:J

    .line 56
    const/4 v2, 0x1

    iput-boolean v2, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractMemoryHttpData;->completed:Z

    .line 57
    return-void
.end method
