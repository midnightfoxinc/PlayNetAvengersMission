.class public abstract Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;
.super Lorg/jboss/netty/handler/codec/http/multipart/AbstractHttpData;
.source "AbstractDiskHttpData.java"


# static fields
.field private static final logger:Lorg/jboss/netty/logging/InternalLogger;


# instance fields
.field protected file:Ljava/io/File;

.field private fileChannel:Ljava/nio/channels/FileChannel;

.field private isRenamed:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 38
    const-class v0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;

    invoke-static {v0}, Lorg/jboss/netty/logging/InternalLoggerFactory;->getInstance(Ljava/lang/Class;)Lorg/jboss/netty/logging/InternalLogger;

    move-result-object v0

    sput-object v0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->logger:Lorg/jboss/netty/logging/InternalLogger;

    return-void
.end method

.method protected constructor <init>(Ljava/lang/String;Ljava/nio/charset/Charset;J)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "charset"    # Ljava/nio/charset/Charset;
    .param p3, "size"    # J

    .prologue
    .line 45
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/jboss/netty/handler/codec/http/multipart/AbstractHttpData;-><init>(Ljava/lang/String;Ljava/nio/charset/Charset;J)V

    .line 46
    return-void
.end method

.method private static readFrom(Ljava/io/File;)[B
    .locals 10
    .param p0, "src"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 342
    invoke-virtual {p0}, Ljava/io/File;->length()J

    move-result-wide v6

    .line 343
    .local v6, "srcsize":J
    const-wide/32 v8, 0x7fffffff

    cmp-long v5, v6, v8

    if-lez v5, :cond_0

    .line 344
    new-instance v5, Ljava/lang/IllegalArgumentException;

    const-string v8, "File too big to be loaded in memory"

    invoke-direct {v5, v8}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 347
    :cond_0
    new-instance v3, Ljava/io/FileInputStream;

    invoke-direct {v3, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 348
    .local v3, "inputStream":Ljava/io/FileInputStream;
    invoke-virtual {v3}, Ljava/io/FileInputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v2

    .line 349
    .local v2, "fileChannel":Ljava/nio/channels/FileChannel;
    long-to-int v5, v6

    new-array v0, v5, [B

    .line 350
    .local v0, "array":[B
    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v1

    .line 351
    .local v1, "byteBuffer":Ljava/nio/ByteBuffer;
    const/4 v4, 0x0

    .line 352
    .local v4, "read":I
    :goto_0
    int-to-long v8, v4

    cmp-long v5, v8, v6

    if-gez v5, :cond_1

    .line 353
    invoke-virtual {v2, v1}, Ljava/nio/channels/FileChannel;->read(Ljava/nio/ByteBuffer;)I

    move-result v5

    add-int/2addr v4, v5

    goto :goto_0

    .line 355
    :cond_1
    invoke-virtual {v2}, Ljava/nio/channels/FileChannel;->close()V

    .line 356
    return-object v0
.end method

.method private tempFile()Ljava/io/File;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 79
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->getDiskFilename()Ljava/lang/String;

    move-result-object v0

    .line 80
    .local v0, "diskFilename":Ljava/lang/String;
    if-eqz v0, :cond_1

    .line 81
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v4, 0x5f

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 86
    .local v1, "newpostfix":Ljava/lang/String;
    :goto_0
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->getBaseDirectory()Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_2

    .line 88
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->getPrefix()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, v1}, Ljava/io/File;->createTempFile(Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    move-result-object v2

    .line 93
    .local v2, "tmpFile":Ljava/io/File;
    :goto_1
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->deleteOnExit()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 94
    invoke-virtual {v2}, Ljava/io/File;->deleteOnExit()V

    .line 96
    :cond_0
    return-object v2

    .line 83
    .end local v1    # "newpostfix":Ljava/lang/String;
    .end local v2    # "tmpFile":Ljava/io/File;
    :cond_1
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->getPostfix()Ljava/lang/String;

    move-result-object v1

    .restart local v1    # "newpostfix":Ljava/lang/String;
    goto :goto_0

    .line 90
    :cond_2
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->getPrefix()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/io/File;

    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->getBaseDirectory()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v3, v1, v4}, Ljava/io/File;->createTempFile(Ljava/lang/String;Ljava/lang/String;Ljava/io/File;)Ljava/io/File;

    move-result-object v2

    .restart local v2    # "tmpFile":Ljava/io/File;
    goto :goto_1
.end method


# virtual methods
.method public addContent(Lorg/jboss/netty/buffer/ChannelBuffer;Z)V
    .locals 10
    .param p1, "buffer"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p2, "last"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 132
    if-eqz p1, :cond_4

    .line 133
    invoke-interface {p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v1

    .line 134
    .local v1, "localsize":I
    iget-wide v4, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->size:J

    int-to-long v6, v1

    add-long/2addr v4, v6

    invoke-virtual {p0, v4, v5}, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->checkSize(J)V

    .line 135
    iget-wide v4, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->definedSize:J

    const-wide/16 v6, 0x0

    cmp-long v4, v4, v6

    if-lez v4, :cond_0

    iget-wide v4, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->definedSize:J

    iget-wide v6, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->size:J

    int-to-long v8, v1

    add-long/2addr v6, v8

    cmp-long v4, v4, v6

    if-gez v4, :cond_0

    .line 136
    new-instance v4, Ljava/io/IOException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Out of size: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-wide v6, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->size:J

    int-to-long v8, v1

    add-long/2addr v6, v8

    invoke-virtual {v5, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " > "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-wide v6, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->definedSize:J

    invoke-virtual {v5, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 139
    :cond_0
    invoke-interface {p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->toByteBuffer()Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 140
    .local v0, "byteBuffer":Ljava/nio/ByteBuffer;
    const/4 v3, 0x0

    .line 141
    .local v3, "written":I
    iget-object v4, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->file:Ljava/io/File;

    if-nez v4, :cond_1

    .line 142
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->tempFile()Ljava/io/File;

    move-result-object v4

    iput-object v4, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->file:Ljava/io/File;

    .line 144
    :cond_1
    iget-object v4, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->fileChannel:Ljava/nio/channels/FileChannel;

    if-nez v4, :cond_2

    .line 145
    new-instance v2, Ljava/io/FileOutputStream;

    iget-object v4, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->file:Ljava/io/File;

    invoke-direct {v2, v4}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 146
    .local v2, "outputStream":Ljava/io/FileOutputStream;
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v4

    iput-object v4, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->fileChannel:Ljava/nio/channels/FileChannel;

    .line 148
    .end local v2    # "outputStream":Ljava/io/FileOutputStream;
    :cond_2
    :goto_0
    if-ge v3, v1, :cond_3

    .line 149
    iget-object v4, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->fileChannel:Ljava/nio/channels/FileChannel;

    invoke-virtual {v4, v0}, Ljava/nio/channels/FileChannel;->write(Ljava/nio/ByteBuffer;)I

    move-result v4

    add-int/2addr v3, v4

    goto :goto_0

    .line 151
    :cond_3
    iget-wide v4, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->size:J

    int-to-long v6, v1

    add-long/2addr v4, v6

    iput-wide v4, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->size:J

    .line 152
    invoke-interface {p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v4

    add-int/2addr v4, v3

    invoke-interface {p1, v4}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex(I)V

    .line 154
    .end local v0    # "byteBuffer":Ljava/nio/ByteBuffer;
    .end local v1    # "localsize":I
    .end local v3    # "written":I
    :cond_4
    if-eqz p2, :cond_8

    .line 155
    iget-object v4, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->file:Ljava/io/File;

    if-nez v4, :cond_5

    .line 156
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->tempFile()Ljava/io/File;

    move-result-object v4

    iput-object v4, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->file:Ljava/io/File;

    .line 158
    :cond_5
    iget-object v4, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->fileChannel:Ljava/nio/channels/FileChannel;

    if-nez v4, :cond_6

    .line 159
    new-instance v2, Ljava/io/FileOutputStream;

    iget-object v4, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->file:Ljava/io/File;

    invoke-direct {v2, v4}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 160
    .restart local v2    # "outputStream":Ljava/io/FileOutputStream;
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v4

    iput-object v4, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->fileChannel:Ljava/nio/channels/FileChannel;

    .line 162
    .end local v2    # "outputStream":Ljava/io/FileOutputStream;
    :cond_6
    iget-object v4, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->fileChannel:Ljava/nio/channels/FileChannel;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Ljava/nio/channels/FileChannel;->force(Z)V

    .line 163
    iget-object v4, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->fileChannel:Ljava/nio/channels/FileChannel;

    invoke-virtual {v4}, Ljava/nio/channels/FileChannel;->close()V

    .line 164
    const/4 v4, 0x0

    iput-object v4, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->fileChannel:Ljava/nio/channels/FileChannel;

    .line 165
    const/4 v4, 0x1

    iput-boolean v4, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->completed:Z

    .line 171
    :cond_7
    return-void

    .line 167
    :cond_8
    if-nez p1, :cond_7

    .line 168
    new-instance v4, Ljava/lang/NullPointerException;

    const-string v5, "buffer"

    invoke-direct {v4, v5}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v4
.end method

.method public delete()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 217
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->fileChannel:Ljava/nio/channels/FileChannel;

    if-eqz v1, :cond_0

    .line 219
    :try_start_0
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->fileChannel:Ljava/nio/channels/FileChannel;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/nio/channels/FileChannel;->force(Z)V

    .line 220
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->fileChannel:Ljava/nio/channels/FileChannel;

    invoke-virtual {v1}, Ljava/nio/channels/FileChannel;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 224
    :goto_0
    iput-object v3, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->fileChannel:Ljava/nio/channels/FileChannel;

    .line 226
    :cond_0
    iget-boolean v1, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->isRenamed:Z

    if-nez v1, :cond_2

    .line 227
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->file:Ljava/io/File;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->file:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 228
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->file:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    .line 230
    :cond_1
    iput-object v3, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->file:Ljava/io/File;

    .line 232
    :cond_2
    return-void

    .line 221
    :catch_0
    move-exception v0

    .line 222
    .local v0, "e":Ljava/io/IOException;
    sget-object v1, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->logger:Lorg/jboss/netty/logging/InternalLogger;

    const-string v2, "Failed to close a file."

    invoke-interface {v1, v2, v0}, Lorg/jboss/netty/logging/InternalLogger;->warn(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method protected abstract deleteOnExit()Z
.end method

.method public get()[B
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 235
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->file:Ljava/io/File;

    if-nez v0, :cond_0

    .line 236
    const/4 v0, 0x0

    new-array v0, v0, [B

    .line 238
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->file:Ljava/io/File;

    invoke-static {v0}, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->readFrom(Ljava/io/File;)[B

    move-result-object v0

    goto :goto_0
.end method

.method protected abstract getBaseDirectory()Ljava/lang/String;
.end method

.method public getChannelBuffer()Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 242
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->file:Ljava/io/File;

    if-nez v1, :cond_0

    .line 243
    sget-object v1, Lorg/jboss/netty/buffer/ChannelBuffers;->EMPTY_BUFFER:Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 246
    :goto_0
    return-object v1

    .line 245
    :cond_0
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->file:Ljava/io/File;

    invoke-static {v1}, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->readFrom(Ljava/io/File;)[B

    move-result-object v0

    .line 246
    .local v0, "array":[B
    invoke-static {v0}, Lorg/jboss/netty/buffer/ChannelBuffers;->wrappedBuffer([B)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v1

    goto :goto_0
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
    .line 250
    iget-object v5, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->file:Ljava/io/File;

    if-eqz v5, :cond_0

    if-nez p1, :cond_1

    .line 251
    :cond_0
    sget-object v0, Lorg/jboss/netty/buffer/ChannelBuffers;->EMPTY_BUFFER:Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 276
    :goto_0
    return-object v0

    .line 253
    :cond_1
    iget-object v5, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->fileChannel:Ljava/nio/channels/FileChannel;

    if-nez v5, :cond_2

    .line 254
    new-instance v2, Ljava/io/FileInputStream;

    iget-object v5, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->file:Ljava/io/File;

    invoke-direct {v2, v5}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 255
    .local v2, "inputStream":Ljava/io/FileInputStream;
    invoke-virtual {v2}, Ljava/io/FileInputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v5

    iput-object v5, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->fileChannel:Ljava/nio/channels/FileChannel;

    .line 257
    .end local v2    # "inputStream":Ljava/io/FileInputStream;
    :cond_2
    const/4 v3, 0x0

    .line 258
    .local v3, "read":I
    invoke-static {p1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v1

    .line 259
    .local v1, "byteBuffer":Ljava/nio/ByteBuffer;
    :goto_1
    if-ge v3, p1, :cond_3

    .line 260
    iget-object v5, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->fileChannel:Ljava/nio/channels/FileChannel;

    invoke-virtual {v5, v1}, Ljava/nio/channels/FileChannel;->read(Ljava/nio/ByteBuffer;)I

    move-result v4

    .line 261
    .local v4, "readnow":I
    const/4 v5, -0x1

    if-ne v4, v5, :cond_4

    .line 262
    iget-object v5, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->fileChannel:Ljava/nio/channels/FileChannel;

    invoke-virtual {v5}, Ljava/nio/channels/FileChannel;->close()V

    .line 263
    const/4 v5, 0x0

    iput-object v5, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->fileChannel:Ljava/nio/channels/FileChannel;

    .line 269
    .end local v4    # "readnow":I
    :cond_3
    if-nez v3, :cond_5

    .line 270
    sget-object v0, Lorg/jboss/netty/buffer/ChannelBuffers;->EMPTY_BUFFER:Lorg/jboss/netty/buffer/ChannelBuffer;

    goto :goto_0

    .line 266
    .restart local v4    # "readnow":I
    :cond_4
    add-int/2addr v3, v4

    .line 268
    goto :goto_1

    .line 272
    .end local v4    # "readnow":I
    :cond_5
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 273
    invoke-static {v1}, Lorg/jboss/netty/buffer/ChannelBuffers;->wrappedBuffer(Ljava/nio/ByteBuffer;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    .line 274
    .local v0, "buffer":Lorg/jboss/netty/buffer/ChannelBuffer;
    const/4 v5, 0x0

    invoke-interface {v0, v5}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex(I)V

    .line 275
    invoke-interface {v0, v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->writerIndex(I)V

    goto :goto_0
.end method

.method protected abstract getDiskFilename()Ljava/lang/String;
.end method

.method public getFile()Ljava/io/File;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 360
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->file:Ljava/io/File;

    return-object v0
.end method

.method protected abstract getPostfix()Ljava/lang/String;
.end method

.method protected abstract getPrefix()Ljava/lang/String;
.end method

.method public getString()Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 280
    sget-object v0, Lorg/jboss/netty/handler/codec/http/HttpConstants;->DEFAULT_CHARSET:Ljava/nio/charset/Charset;

    invoke-virtual {p0, v0}, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->getString(Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getString(Ljava/nio/charset/Charset;)Ljava/lang/String;
    .locals 3
    .param p1, "encoding"    # Ljava/nio/charset/Charset;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 284
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->file:Ljava/io/File;

    if-nez v1, :cond_0

    .line 285
    const-string v1, ""

    .line 292
    :goto_0
    return-object v1

    .line 287
    :cond_0
    if-nez p1, :cond_1

    .line 288
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->file:Ljava/io/File;

    invoke-static {v1}, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->readFrom(Ljava/io/File;)[B

    move-result-object v0

    .line 289
    .local v0, "array":[B
    new-instance v1, Ljava/lang/String;

    sget-object v2, Lorg/jboss/netty/handler/codec/http/HttpConstants;->DEFAULT_CHARSET:Ljava/nio/charset/Charset;

    invoke-virtual {v2}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v0, v2}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    goto :goto_0

    .line 291
    .end local v0    # "array":[B
    :cond_1
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->file:Ljava/io/File;

    invoke-static {v1}, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->readFrom(Ljava/io/File;)[B

    move-result-object v0

    .line 292
    .restart local v0    # "array":[B
    new-instance v1, Ljava/lang/String;

    invoke-virtual {p1}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v0, v2}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    goto :goto_0
.end method

.method public isInMemory()Z
    .locals 1

    .prologue
    .line 296
    const/4 v0, 0x0

    return v0
.end method

.method public renameTo(Ljava/io/File;)Z
    .locals 12
    .param p1, "dest"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v8, 0x1

    .line 300
    if-nez p1, :cond_0

    .line 301
    new-instance v8, Ljava/lang/NullPointerException;

    const-string v9, "dest"

    invoke-direct {v8, v9}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 303
    :cond_0
    iget-object v9, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->file:Ljava/io/File;

    if-nez v9, :cond_1

    .line 304
    new-instance v8, Ljava/io/IOException;

    const-string v9, "No file defined so cannot be renamed"

    invoke-direct {v8, v9}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v8

    .line 306
    :cond_1
    iget-object v9, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->file:Ljava/io/File;

    invoke-virtual {v9, p1}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v9

    if-nez v9, :cond_5

    .line 308
    new-instance v0, Ljava/io/FileInputStream;

    iget-object v9, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->file:Ljava/io/File;

    invoke-direct {v0, v9}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 309
    .local v0, "inputStream":Ljava/io/FileInputStream;
    new-instance v7, Ljava/io/FileOutputStream;

    invoke-direct {v7, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 310
    .local v7, "outputStream":Ljava/io/FileOutputStream;
    invoke-virtual {v0}, Ljava/io/FileInputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v1

    .line 311
    .local v1, "in":Ljava/nio/channels/FileChannel;
    invoke-virtual {v7}, Ljava/io/FileOutputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v6

    .line 312
    .local v6, "out":Ljava/nio/channels/FileChannel;
    const-wide/16 v4, 0x2004

    .line 313
    .local v4, "chunkSize":J
    const-wide/16 v2, 0x0

    .line 314
    .local v2, "position":J
    :goto_0
    iget-wide v10, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->size:J

    cmp-long v9, v2, v10

    if-gez v9, :cond_3

    .line 315
    iget-wide v10, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->size:J

    sub-long/2addr v10, v2

    cmp-long v9, v4, v10

    if-gez v9, :cond_2

    .line 316
    iget-wide v10, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->size:J

    sub-long v4, v10, v2

    .line 318
    :cond_2
    invoke-virtual/range {v1 .. v6}, Ljava/nio/channels/FileChannel;->transferTo(JJLjava/nio/channels/WritableByteChannel;)J

    move-result-wide v10

    add-long/2addr v2, v10

    goto :goto_0

    .line 320
    :cond_3
    invoke-virtual {v1}, Ljava/nio/channels/FileChannel;->close()V

    .line 321
    invoke-virtual {v6}, Ljava/nio/channels/FileChannel;->close()V

    .line 322
    iget-wide v10, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->size:J

    cmp-long v9, v2, v10

    if-nez v9, :cond_4

    .line 323
    iget-object v9, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->file:Ljava/io/File;

    invoke-virtual {v9}, Ljava/io/File;->delete()Z

    .line 324
    iput-object p1, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->file:Ljava/io/File;

    .line 325
    iput-boolean v8, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->isRenamed:Z

    .line 334
    .end local v0    # "inputStream":Ljava/io/FileInputStream;
    .end local v1    # "in":Ljava/nio/channels/FileChannel;
    .end local v2    # "position":J
    .end local v4    # "chunkSize":J
    .end local v6    # "out":Ljava/nio/channels/FileChannel;
    .end local v7    # "outputStream":Ljava/io/FileOutputStream;
    :goto_1
    return v8

    .line 328
    .restart local v0    # "inputStream":Ljava/io/FileInputStream;
    .restart local v1    # "in":Ljava/nio/channels/FileChannel;
    .restart local v2    # "position":J
    .restart local v4    # "chunkSize":J
    .restart local v6    # "out":Ljava/nio/channels/FileChannel;
    .restart local v7    # "outputStream":Ljava/io/FileOutputStream;
    :cond_4
    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    .line 329
    const/4 v8, 0x0

    goto :goto_1

    .line 332
    .end local v0    # "inputStream":Ljava/io/FileInputStream;
    .end local v1    # "in":Ljava/nio/channels/FileChannel;
    .end local v2    # "position":J
    .end local v4    # "chunkSize":J
    .end local v6    # "out":Ljava/nio/channels/FileChannel;
    .end local v7    # "outputStream":Ljava/io/FileOutputStream;
    :cond_5
    iput-object p1, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->file:Ljava/io/File;

    .line 333
    iput-boolean v8, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->isRenamed:Z

    goto :goto_1
.end method

.method public setContent(Ljava/io/File;)V
    .locals 3
    .param p1, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x1

    .line 174
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->file:Ljava/io/File;

    if-eqz v0, :cond_0

    .line 175
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->delete()V

    .line 177
    :cond_0
    iput-object p1, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->file:Ljava/io/File;

    .line 178
    invoke-virtual {p1}, Ljava/io/File;->length()J

    move-result-wide v0

    iput-wide v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->size:J

    .line 179
    iget-wide v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->size:J

    invoke-virtual {p0, v0, v1}, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->checkSize(J)V

    .line 180
    iput-boolean v2, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->isRenamed:Z

    .line 181
    iput-boolean v2, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->completed:Z

    .line 182
    return-void
.end method

.method public setContent(Ljava/io/InputStream;)V
    .locals 11
    .param p1, "inputStream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v10, 0x1

    .line 185
    if-nez p1, :cond_0

    .line 186
    new-instance v6, Ljava/lang/NullPointerException;

    const-string v7, "inputStream"

    invoke-direct {v6, v7}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 188
    :cond_0
    iget-object v6, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->file:Ljava/io/File;

    if-eqz v6, :cond_1

    .line 189
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->delete()V

    .line 191
    :cond_1
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->tempFile()Ljava/io/File;

    move-result-object v6

    iput-object v6, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->file:Ljava/io/File;

    .line 192
    new-instance v3, Ljava/io/FileOutputStream;

    iget-object v6, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->file:Ljava/io/File;

    invoke-direct {v3, v6}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 193
    .local v3, "outputStream":Ljava/io/FileOutputStream;
    invoke-virtual {v3}, Ljava/io/FileOutputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v2

    .line 194
    .local v2, "localfileChannel":Ljava/nio/channels/FileChannel;
    const/16 v6, 0x4000

    new-array v1, v6, [B

    .line 195
    .local v1, "bytes":[B
    invoke-static {v1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 196
    .local v0, "byteBuffer":Ljava/nio/ByteBuffer;
    invoke-virtual {p1, v1}, Ljava/io/InputStream;->read([B)I

    move-result v4

    .line 197
    .local v4, "read":I
    const/4 v5, 0x0

    .line 198
    .local v5, "written":I
    :goto_0
    if-lez v4, :cond_2

    .line 199
    invoke-virtual {v0, v4}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    move-result-object v6

    invoke-virtual {v6}, Ljava/nio/Buffer;->flip()Ljava/nio/Buffer;

    .line 200
    invoke-virtual {v2, v0}, Ljava/nio/channels/FileChannel;->write(Ljava/nio/ByteBuffer;)I

    move-result v6

    add-int/2addr v5, v6

    .line 201
    int-to-long v6, v5

    invoke-virtual {p0, v6, v7}, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->checkSize(J)V

    .line 202
    invoke-virtual {p1, v1}, Ljava/io/InputStream;->read([B)I

    move-result v4

    goto :goto_0

    .line 204
    :cond_2
    const/4 v6, 0x0

    invoke-virtual {v2, v6}, Ljava/nio/channels/FileChannel;->force(Z)V

    .line 205
    invoke-virtual {v2}, Ljava/nio/channels/FileChannel;->close()V

    .line 206
    int-to-long v6, v5

    iput-wide v6, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->size:J

    .line 207
    iget-wide v6, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->definedSize:J

    const-wide/16 v8, 0x0

    cmp-long v6, v6, v8

    if-lez v6, :cond_3

    iget-wide v6, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->definedSize:J

    iget-wide v8, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->size:J

    cmp-long v6, v6, v8

    if-gez v6, :cond_3

    .line 208
    iget-object v6, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->file:Ljava/io/File;

    invoke-virtual {v6}, Ljava/io/File;->delete()Z

    .line 209
    const/4 v6, 0x0

    iput-object v6, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->file:Ljava/io/File;

    .line 210
    new-instance v6, Ljava/io/IOException;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Out of size: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-wide v8, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->size:J

    invoke-virtual {v7, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " > "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-wide v8, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->definedSize:J

    invoke-virtual {v7, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v6

    .line 212
    :cond_3
    iput-boolean v10, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->isRenamed:Z

    .line 213
    iput-boolean v10, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->completed:Z

    .line 214
    return-void
.end method

.method public setContent(Lorg/jboss/netty/buffer/ChannelBuffer;)V
    .locals 8
    .param p1, "buffer"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 100
    if-nez p1, :cond_0

    .line 101
    new-instance v4, Ljava/lang/NullPointerException;

    const-string v5, "buffer"

    invoke-direct {v4, v5}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 103
    :cond_0
    invoke-interface {p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v4

    int-to-long v4, v4

    iput-wide v4, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->size:J

    .line 104
    iget-wide v4, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->size:J

    invoke-virtual {p0, v4, v5}, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->checkSize(J)V

    .line 105
    iget-wide v4, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->definedSize:J

    const-wide/16 v6, 0x0

    cmp-long v4, v4, v6

    if-lez v4, :cond_1

    iget-wide v4, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->definedSize:J

    iget-wide v6, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->size:J

    cmp-long v4, v4, v6

    if-gez v4, :cond_1

    .line 106
    new-instance v4, Ljava/io/IOException;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Out of size: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-wide v6, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->size:J

    invoke-virtual {v5, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " > "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-wide v6, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->definedSize:J

    invoke-virtual {v5, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 108
    :cond_1
    iget-object v4, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->file:Ljava/io/File;

    if-nez v4, :cond_2

    .line 109
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->tempFile()Ljava/io/File;

    move-result-object v4

    iput-object v4, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->file:Ljava/io/File;

    .line 111
    :cond_2
    invoke-interface {p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v4

    if-nez v4, :cond_3

    .line 113
    iget-object v4, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->file:Ljava/io/File;

    invoke-virtual {v4}, Ljava/io/File;->createNewFile()Z

    .line 128
    :goto_0
    return-void

    .line 116
    :cond_3
    new-instance v2, Ljava/io/FileOutputStream;

    iget-object v4, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->file:Ljava/io/File;

    invoke-direct {v2, v4}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 117
    .local v2, "outputStream":Ljava/io/FileOutputStream;
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v1

    .line 118
    .local v1, "localfileChannel":Ljava/nio/channels/FileChannel;
    invoke-interface {p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->toByteBuffer()Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 119
    .local v0, "byteBuffer":Ljava/nio/ByteBuffer;
    const/4 v3, 0x0

    .line 120
    .local v3, "written":I
    :goto_1
    int-to-long v4, v3

    iget-wide v6, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->size:J

    cmp-long v4, v4, v6

    if-gez v4, :cond_4

    .line 121
    invoke-virtual {v1, v0}, Ljava/nio/channels/FileChannel;->write(Ljava/nio/ByteBuffer;)I

    move-result v4

    add-int/2addr v3, v4

    goto :goto_1

    .line 123
    :cond_4
    invoke-interface {p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v4

    add-int/2addr v4, v3

    invoke-interface {p1, v4}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex(I)V

    .line 124
    const/4 v4, 0x0

    invoke-virtual {v1, v4}, Ljava/nio/channels/FileChannel;->force(Z)V

    .line 125
    invoke-virtual {v1}, Ljava/nio/channels/FileChannel;->close()V

    .line 126
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V

    .line 127
    const/4 v4, 0x1

    iput-boolean v4, p0, Lorg/jboss/netty/handler/codec/http/multipart/AbstractDiskHttpData;->completed:Z

    goto :goto_0
.end method
