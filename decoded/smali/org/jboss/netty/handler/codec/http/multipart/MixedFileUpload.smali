.class public Lorg/jboss/netty/handler/codec/http/multipart/MixedFileUpload;
.super Ljava/lang/Object;
.source "MixedFileUpload.java"

# interfaces
.implements Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;


# instance fields
.field private final definedSize:J

.field private fileUpload:Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;

.field private final limitSize:J

.field protected maxSize:J


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/nio/charset/Charset;JJ)V
    .locals 10
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "filename"    # Ljava/lang/String;
    .param p3, "contentType"    # Ljava/lang/String;
    .param p4, "contentTransferEncoding"    # Ljava/lang/String;
    .param p5, "charset"    # Ljava/nio/charset/Charset;
    .param p6, "size"    # J
    .param p8, "limitSize"    # J

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    const-wide/16 v2, -0x1

    iput-wide v2, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedFileUpload;->maxSize:J

    .line 39
    move-wide/from16 v0, p8

    iput-wide v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedFileUpload;->limitSize:J

    .line 40
    iget-wide v2, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedFileUpload;->limitSize:J

    cmp-long v2, p6, v2

    if-lez v2, :cond_0

    .line 41
    new-instance v2, Lorg/jboss/netty/handler/codec/http/multipart/DiskFileUpload;

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    move-object v6, p4

    move-object v7, p5

    move-wide/from16 v8, p6

    invoke-direct/range {v2 .. v9}, Lorg/jboss/netty/handler/codec/http/multipart/DiskFileUpload;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/nio/charset/Charset;J)V

    iput-object v2, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedFileUpload;->fileUpload:Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;

    .line 47
    :goto_0
    move-wide/from16 v0, p6

    iput-wide v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedFileUpload;->definedSize:J

    .line 48
    return-void

    .line 44
    :cond_0
    new-instance v2, Lorg/jboss/netty/handler/codec/http/multipart/MemoryFileUpload;

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    move-object v6, p4

    move-object v7, p5

    move-wide/from16 v8, p6

    invoke-direct/range {v2 .. v9}, Lorg/jboss/netty/handler/codec/http/multipart/MemoryFileUpload;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/nio/charset/Charset;J)V

    iput-object v2, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedFileUpload;->fileUpload:Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;

    goto :goto_0
.end method


# virtual methods
.method public addContent(Lorg/jboss/netty/buffer/ChannelBuffer;Z)V
    .locals 8
    .param p1, "buffer"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p2, "last"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 63
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedFileUpload;->fileUpload:Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;

    instance-of v1, v1, Lorg/jboss/netty/handler/codec/http/multipart/MemoryFileUpload;

    if-eqz v1, :cond_1

    .line 64
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedFileUpload;->fileUpload:Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;

    invoke-interface {v1}, Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;->length()J

    move-result-wide v2

    invoke-interface {p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v1

    int-to-long v4, v1

    add-long/2addr v2, v4

    invoke-virtual {p0, v2, v3}, Lorg/jboss/netty/handler/codec/http/multipart/MixedFileUpload;->checkSize(J)V

    .line 65
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedFileUpload;->fileUpload:Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;

    invoke-interface {v1}, Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;->length()J

    move-result-wide v2

    invoke-interface {p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v1

    int-to-long v4, v1

    add-long/2addr v2, v4

    iget-wide v4, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedFileUpload;->limitSize:J

    cmp-long v1, v2, v4

    if-lez v1, :cond_1

    .line 66
    new-instance v0, Lorg/jboss/netty/handler/codec/http/multipart/DiskFileUpload;

    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedFileUpload;->fileUpload:Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;

    invoke-interface {v1}, Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;->getName()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedFileUpload;->fileUpload:Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;

    invoke-interface {v2}, Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;->getFilename()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedFileUpload;->fileUpload:Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;

    invoke-interface {v3}, Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;->getContentType()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedFileUpload;->fileUpload:Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;

    invoke-interface {v4}, Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;->getContentTransferEncoding()Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedFileUpload;->fileUpload:Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;

    invoke-interface {v5}, Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;->getCharset()Ljava/nio/charset/Charset;

    move-result-object v5

    iget-wide v6, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedFileUpload;->definedSize:J

    invoke-direct/range {v0 .. v7}, Lorg/jboss/netty/handler/codec/http/multipart/DiskFileUpload;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/nio/charset/Charset;J)V

    .line 71
    .local v0, "diskFileUpload":Lorg/jboss/netty/handler/codec/http/multipart/DiskFileUpload;
    iget-wide v2, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedFileUpload;->maxSize:J

    invoke-virtual {v0, v2, v3}, Lorg/jboss/netty/handler/codec/http/multipart/DiskFileUpload;->setMaxSize(J)V

    .line 72
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedFileUpload;->fileUpload:Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;

    check-cast v1, Lorg/jboss/netty/handler/codec/http/multipart/MemoryFileUpload;

    invoke-virtual {v1}, Lorg/jboss/netty/handler/codec/http/multipart/MemoryFileUpload;->getChannelBuffer()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 73
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedFileUpload;->fileUpload:Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;

    check-cast v1, Lorg/jboss/netty/handler/codec/http/multipart/MemoryFileUpload;

    invoke-virtual {v1}, Lorg/jboss/netty/handler/codec/http/multipart/MemoryFileUpload;->getChannelBuffer()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lorg/jboss/netty/handler/codec/http/multipart/DiskFileUpload;->addContent(Lorg/jboss/netty/buffer/ChannelBuffer;Z)V

    .line 76
    :cond_0
    iput-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedFileUpload;->fileUpload:Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;

    .line 79
    .end local v0    # "diskFileUpload":Lorg/jboss/netty/handler/codec/http/multipart/DiskFileUpload;
    :cond_1
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedFileUpload;->fileUpload:Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;

    invoke-interface {v1, p1, p2}, Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;->addContent(Lorg/jboss/netty/buffer/ChannelBuffer;Z)V

    .line 80
    return-void
.end method

.method public checkSize(J)V
    .locals 5
    .param p1, "newSize"    # J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 56
    iget-wide v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedFileUpload;->maxSize:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-ltz v0, :cond_0

    iget-wide v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedFileUpload;->maxSize:J

    cmp-long v0, p1, v0

    if-lez v0, :cond_0

    .line 57
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Size exceed allowed maximum capacity"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 59
    :cond_0
    return-void
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 28
    check-cast p1, Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lorg/jboss/netty/handler/codec/http/multipart/MixedFileUpload;->compareTo(Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;)I

    move-result v0

    return v0
.end method

.method public compareTo(Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;)I
    .locals 1
    .param p1, "o"    # Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;

    .prologue
    .line 204
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedFileUpload;->fileUpload:Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;

    invoke-interface {v0, p1}, Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;->compareTo(Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public delete()V
    .locals 1

    .prologue
    .line 83
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedFileUpload;->fileUpload:Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;

    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;->delete()V

    .line 84
    return-void
.end method

.method public get()[B
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 87
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedFileUpload;->fileUpload:Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;

    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;->get()[B

    move-result-object v0

    return-object v0
.end method

.method public getChannelBuffer()Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 91
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedFileUpload;->fileUpload:Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;

    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;->getChannelBuffer()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    return-object v0
.end method

.method public getCharset()Ljava/nio/charset/Charset;
    .locals 1

    .prologue
    .line 95
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedFileUpload;->fileUpload:Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;

    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;->getCharset()Ljava/nio/charset/Charset;

    move-result-object v0

    return-object v0
.end method

.method public getChunk(I)Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 1
    .param p1, "length"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 213
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedFileUpload;->fileUpload:Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;

    invoke-interface {v0, p1}, Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;->getChunk(I)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    return-object v0
.end method

.method public getContentTransferEncoding()Ljava/lang/String;
    .locals 1

    .prologue
    .line 103
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedFileUpload;->fileUpload:Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;

    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;->getContentTransferEncoding()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getContentType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 99
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedFileUpload;->fileUpload:Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;

    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;->getContentType()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getFile()Ljava/io/File;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 217
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedFileUpload;->fileUpload:Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;

    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;->getFile()Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method public getFilename()Ljava/lang/String;
    .locals 1

    .prologue
    .line 107
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedFileUpload;->fileUpload:Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;

    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;->getFilename()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getHttpDataType()Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData$HttpDataType;
    .locals 1

    .prologue
    .line 196
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedFileUpload;->fileUpload:Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;

    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;->getHttpDataType()Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData$HttpDataType;

    move-result-object v0

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 200
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedFileUpload;->fileUpload:Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;

    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;->getName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getString()Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 111
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedFileUpload;->fileUpload:Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;

    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;->getString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getString(Ljava/nio/charset/Charset;)Ljava/lang/String;
    .locals 1
    .param p1, "encoding"    # Ljava/nio/charset/Charset;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 115
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedFileUpload;->fileUpload:Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;

    invoke-interface {v0, p1}, Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;->getString(Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public isCompleted()Z
    .locals 1

    .prologue
    .line 119
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedFileUpload;->fileUpload:Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;

    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;->isCompleted()Z

    move-result v0

    return v0
.end method

.method public isInMemory()Z
    .locals 1

    .prologue
    .line 123
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedFileUpload;->fileUpload:Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;

    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;->isInMemory()Z

    move-result v0

    return v0
.end method

.method public length()J
    .locals 2

    .prologue
    .line 127
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedFileUpload;->fileUpload:Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;

    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;->length()J

    move-result-wide v0

    return-wide v0
.end method

.method public renameTo(Ljava/io/File;)Z
    .locals 1
    .param p1, "dest"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 131
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedFileUpload;->fileUpload:Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;

    invoke-interface {v0, p1}, Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;->renameTo(Ljava/io/File;)Z

    move-result v0

    return v0
.end method

.method public setCharset(Ljava/nio/charset/Charset;)V
    .locals 1
    .param p1, "charset"    # Ljava/nio/charset/Charset;

    .prologue
    .line 135
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedFileUpload;->fileUpload:Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;

    invoke-interface {v0, p1}, Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;->setCharset(Ljava/nio/charset/Charset;)V

    .line 136
    return-void
.end method

.method public setContent(Ljava/io/File;)V
    .locals 8
    .param p1, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 155
    invoke-virtual {p1}, Ljava/io/File;->length()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lorg/jboss/netty/handler/codec/http/multipart/MixedFileUpload;->checkSize(J)V

    .line 156
    invoke-virtual {p1}, Ljava/io/File;->length()J

    move-result-wide v0

    iget-wide v2, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedFileUpload;->limitSize:J

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    .line 157
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedFileUpload;->fileUpload:Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;

    instance-of v0, v0, Lorg/jboss/netty/handler/codec/http/multipart/MemoryFileUpload;

    if-eqz v0, :cond_0

    .line 159
    new-instance v0, Lorg/jboss/netty/handler/codec/http/multipart/DiskFileUpload;

    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedFileUpload;->fileUpload:Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;

    invoke-interface {v1}, Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;->getName()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedFileUpload;->fileUpload:Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;

    invoke-interface {v2}, Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;->getFilename()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedFileUpload;->fileUpload:Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;

    invoke-interface {v3}, Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;->getContentType()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedFileUpload;->fileUpload:Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;

    invoke-interface {v4}, Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;->getContentTransferEncoding()Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedFileUpload;->fileUpload:Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;

    invoke-interface {v5}, Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;->getCharset()Ljava/nio/charset/Charset;

    move-result-object v5

    iget-wide v6, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedFileUpload;->definedSize:J

    invoke-direct/range {v0 .. v7}, Lorg/jboss/netty/handler/codec/http/multipart/DiskFileUpload;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/nio/charset/Charset;J)V

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedFileUpload;->fileUpload:Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;

    .line 164
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedFileUpload;->fileUpload:Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;

    iget-wide v2, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedFileUpload;->maxSize:J

    invoke-interface {v0, v2, v3}, Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;->setMaxSize(J)V

    .line 167
    :cond_0
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedFileUpload;->fileUpload:Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;

    invoke-interface {v0, p1}, Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;->setContent(Ljava/io/File;)V

    .line 168
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
    .line 171
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedFileUpload;->fileUpload:Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;

    instance-of v0, v0, Lorg/jboss/netty/handler/codec/http/multipart/MemoryFileUpload;

    if-eqz v0, :cond_0

    .line 173
    new-instance v0, Lorg/jboss/netty/handler/codec/http/multipart/DiskFileUpload;

    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedFileUpload;->fileUpload:Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;

    invoke-interface {v1}, Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;->getName()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedFileUpload;->fileUpload:Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;

    invoke-interface {v2}, Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;->getFilename()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedFileUpload;->fileUpload:Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;

    invoke-interface {v3}, Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;->getContentType()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedFileUpload;->fileUpload:Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;

    invoke-interface {v4}, Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;->getContentTransferEncoding()Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedFileUpload;->fileUpload:Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;

    invoke-interface {v5}, Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;->getCharset()Ljava/nio/charset/Charset;

    move-result-object v5

    iget-wide v6, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedFileUpload;->definedSize:J

    invoke-direct/range {v0 .. v7}, Lorg/jboss/netty/handler/codec/http/multipart/DiskFileUpload;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/nio/charset/Charset;J)V

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedFileUpload;->fileUpload:Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;

    .line 178
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedFileUpload;->fileUpload:Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;

    iget-wide v2, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedFileUpload;->maxSize:J

    invoke-interface {v0, v2, v3}, Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;->setMaxSize(J)V

    .line 180
    :cond_0
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedFileUpload;->fileUpload:Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;

    invoke-interface {v0, p1}, Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;->setContent(Ljava/io/InputStream;)V

    .line 181
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
    .line 139
    invoke-interface {p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v0

    int-to-long v0, v0

    invoke-virtual {p0, v0, v1}, Lorg/jboss/netty/handler/codec/http/multipart/MixedFileUpload;->checkSize(J)V

    .line 140
    invoke-interface {p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v0

    int-to-long v0, v0

    iget-wide v2, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedFileUpload;->limitSize:J

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    .line 141
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedFileUpload;->fileUpload:Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;

    instance-of v0, v0, Lorg/jboss/netty/handler/codec/http/multipart/MemoryFileUpload;

    if-eqz v0, :cond_0

    .line 143
    new-instance v0, Lorg/jboss/netty/handler/codec/http/multipart/DiskFileUpload;

    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedFileUpload;->fileUpload:Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;

    invoke-interface {v1}, Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;->getName()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedFileUpload;->fileUpload:Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;

    invoke-interface {v2}, Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;->getFilename()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedFileUpload;->fileUpload:Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;

    invoke-interface {v3}, Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;->getContentType()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedFileUpload;->fileUpload:Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;

    invoke-interface {v4}, Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;->getContentTransferEncoding()Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedFileUpload;->fileUpload:Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;

    invoke-interface {v5}, Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;->getCharset()Ljava/nio/charset/Charset;

    move-result-object v5

    iget-wide v6, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedFileUpload;->definedSize:J

    invoke-direct/range {v0 .. v7}, Lorg/jboss/netty/handler/codec/http/multipart/DiskFileUpload;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/nio/charset/Charset;J)V

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedFileUpload;->fileUpload:Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;

    .line 148
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedFileUpload;->fileUpload:Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;

    iget-wide v2, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedFileUpload;->maxSize:J

    invoke-interface {v0, v2, v3}, Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;->setMaxSize(J)V

    .line 151
    :cond_0
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedFileUpload;->fileUpload:Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;

    invoke-interface {v0, p1}, Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;->setContent(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    .line 152
    return-void
.end method

.method public setContentTransferEncoding(Ljava/lang/String;)V
    .locals 1
    .param p1, "contentTransferEncoding"    # Ljava/lang/String;

    .prologue
    .line 188
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedFileUpload;->fileUpload:Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;

    invoke-interface {v0, p1}, Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;->setContentTransferEncoding(Ljava/lang/String;)V

    .line 189
    return-void
.end method

.method public setContentType(Ljava/lang/String;)V
    .locals 1
    .param p1, "contentType"    # Ljava/lang/String;

    .prologue
    .line 184
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedFileUpload;->fileUpload:Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;

    invoke-interface {v0, p1}, Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;->setContentType(Ljava/lang/String;)V

    .line 185
    return-void
.end method

.method public setFilename(Ljava/lang/String;)V
    .locals 1
    .param p1, "filename"    # Ljava/lang/String;

    .prologue
    .line 192
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedFileUpload;->fileUpload:Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;

    invoke-interface {v0, p1}, Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;->setFilename(Ljava/lang/String;)V

    .line 193
    return-void
.end method

.method public setMaxSize(J)V
    .locals 1
    .param p1, "maxSize"    # J

    .prologue
    .line 51
    iput-wide p1, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedFileUpload;->maxSize:J

    .line 52
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedFileUpload;->fileUpload:Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;

    invoke-interface {v0, p1, p2}, Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;->setMaxSize(J)V

    .line 53
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 209
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Mixed: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedFileUpload;->fileUpload:Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
