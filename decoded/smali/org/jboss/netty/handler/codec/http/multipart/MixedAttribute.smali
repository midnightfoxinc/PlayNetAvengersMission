.class public Lorg/jboss/netty/handler/codec/http/multipart/MixedAttribute;
.super Ljava/lang/Object;
.source "MixedAttribute.java"

# interfaces
.implements Lorg/jboss/netty/handler/codec/http/multipart/Attribute;


# instance fields
.field private attribute:Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

.field private final limitSize:J

.field protected maxSize:J


# direct methods
.method public constructor <init>(Ljava/lang/String;J)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "limitSize"    # J

    .prologue
    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedAttribute;->maxSize:J

    .line 35
    iput-wide p2, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedAttribute;->limitSize:J

    .line 36
    new-instance v0, Lorg/jboss/netty/handler/codec/http/multipart/MemoryAttribute;

    invoke-direct {v0, p1}, Lorg/jboss/netty/handler/codec/http/multipart/MemoryAttribute;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedAttribute;->attribute:Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    .line 37
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;J)V
    .locals 7
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .param p3, "limitSize"    # J

    .prologue
    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    const-wide/16 v2, -0x1

    iput-wide v2, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedAttribute;->maxSize:J

    .line 40
    iput-wide p3, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedAttribute;->limitSize:J

    .line 41
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v2

    int-to-long v2, v2

    iget-wide v4, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedAttribute;->limitSize:J

    cmp-long v2, v2, v4

    if-lez v2, :cond_0

    .line 43
    :try_start_0
    new-instance v2, Lorg/jboss/netty/handler/codec/http/multipart/DiskAttribute;

    invoke-direct {v2, p1, p2}, Lorg/jboss/netty/handler/codec/http/multipart/DiskAttribute;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iput-object v2, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedAttribute;->attribute:Lorg/jboss/netty/handler/codec/http/multipart/Attribute;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 59
    :goto_0
    return-void

    .line 44
    :catch_0
    move-exception v0

    .line 47
    .local v0, "e":Ljava/io/IOException;
    :try_start_1
    new-instance v2, Lorg/jboss/netty/handler/codec/http/multipart/MemoryAttribute;

    invoke-direct {v2, p1, p2}, Lorg/jboss/netty/handler/codec/http/multipart/MemoryAttribute;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iput-object v2, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedAttribute;->attribute:Lorg/jboss/netty/handler/codec/http/multipart/Attribute;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 48
    :catch_1
    move-exception v1

    .line 49
    .local v1, "e1":Ljava/io/IOException;
    new-instance v2, Ljava/lang/IllegalArgumentException;

    invoke-direct {v2, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/Throwable;)V

    throw v2

    .line 54
    .end local v0    # "e":Ljava/io/IOException;
    .end local v1    # "e1":Ljava/io/IOException;
    :cond_0
    :try_start_2
    new-instance v2, Lorg/jboss/netty/handler/codec/http/multipart/MemoryAttribute;

    invoke-direct {v2, p1, p2}, Lorg/jboss/netty/handler/codec/http/multipart/MemoryAttribute;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iput-object v2, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedAttribute;->attribute:Lorg/jboss/netty/handler/codec/http/multipart/Attribute;
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_0

    .line 55
    :catch_2
    move-exception v0

    .line 56
    .restart local v0    # "e":Ljava/io/IOException;
    new-instance v2, Ljava/lang/IllegalArgumentException;

    invoke-direct {v2, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method


# virtual methods
.method public addContent(Lorg/jboss/netty/buffer/ChannelBuffer;Z)V
    .locals 6
    .param p1, "buffer"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p2, "last"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 73
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedAttribute;->attribute:Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    instance-of v1, v1, Lorg/jboss/netty/handler/codec/http/multipart/MemoryAttribute;

    if-eqz v1, :cond_1

    .line 74
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedAttribute;->attribute:Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    invoke-interface {v1}, Lorg/jboss/netty/handler/codec/http/multipart/Attribute;->length()J

    move-result-wide v2

    invoke-interface {p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v1

    int-to-long v4, v1

    add-long/2addr v2, v4

    invoke-virtual {p0, v2, v3}, Lorg/jboss/netty/handler/codec/http/multipart/MixedAttribute;->checkSize(J)V

    .line 75
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedAttribute;->attribute:Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    invoke-interface {v1}, Lorg/jboss/netty/handler/codec/http/multipart/Attribute;->length()J

    move-result-wide v2

    invoke-interface {p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v1

    int-to-long v4, v1

    add-long/2addr v2, v4

    iget-wide v4, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedAttribute;->limitSize:J

    cmp-long v1, v2, v4

    if-lez v1, :cond_1

    .line 76
    new-instance v0, Lorg/jboss/netty/handler/codec/http/multipart/DiskAttribute;

    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedAttribute;->attribute:Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    invoke-interface {v1}, Lorg/jboss/netty/handler/codec/http/multipart/Attribute;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/jboss/netty/handler/codec/http/multipart/DiskAttribute;-><init>(Ljava/lang/String;)V

    .line 78
    .local v0, "diskAttribute":Lorg/jboss/netty/handler/codec/http/multipart/DiskAttribute;
    iget-wide v2, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedAttribute;->maxSize:J

    invoke-virtual {v0, v2, v3}, Lorg/jboss/netty/handler/codec/http/multipart/DiskAttribute;->setMaxSize(J)V

    .line 79
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedAttribute;->attribute:Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    check-cast v1, Lorg/jboss/netty/handler/codec/http/multipart/MemoryAttribute;

    invoke-virtual {v1}, Lorg/jboss/netty/handler/codec/http/multipart/MemoryAttribute;->getChannelBuffer()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 80
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedAttribute;->attribute:Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    check-cast v1, Lorg/jboss/netty/handler/codec/http/multipart/MemoryAttribute;

    invoke-virtual {v1}, Lorg/jboss/netty/handler/codec/http/multipart/MemoryAttribute;->getChannelBuffer()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lorg/jboss/netty/handler/codec/http/multipart/DiskAttribute;->addContent(Lorg/jboss/netty/buffer/ChannelBuffer;Z)V

    .line 83
    :cond_0
    iput-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedAttribute;->attribute:Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    .line 86
    .end local v0    # "diskAttribute":Lorg/jboss/netty/handler/codec/http/multipart/DiskAttribute;
    :cond_1
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedAttribute;->attribute:Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    invoke-interface {v1, p1, p2}, Lorg/jboss/netty/handler/codec/http/multipart/Attribute;->addContent(Lorg/jboss/netty/buffer/ChannelBuffer;Z)V

    .line 87
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
    .line 67
    iget-wide v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedAttribute;->maxSize:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-ltz v0, :cond_0

    iget-wide v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedAttribute;->maxSize:J

    cmp-long v0, p1, v0

    if-lez v0, :cond_0

    .line 68
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Size exceed allowed maximum capacity"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 70
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
    invoke-virtual {p0, p1}, Lorg/jboss/netty/handler/codec/http/multipart/MixedAttribute;->compareTo(Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;)I

    move-result v0

    return v0
.end method

.method public compareTo(Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;)I
    .locals 1
    .param p1, "o"    # Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;

    .prologue
    .line 175
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedAttribute;->attribute:Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    invoke-interface {v0, p1}, Lorg/jboss/netty/handler/codec/http/multipart/Attribute;->compareTo(Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public delete()V
    .locals 1

    .prologue
    .line 90
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedAttribute;->attribute:Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/multipart/Attribute;->delete()V

    .line 91
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
    .line 94
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedAttribute;->attribute:Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/multipart/Attribute;->get()[B

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
    .line 98
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedAttribute;->attribute:Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/multipart/Attribute;->getChannelBuffer()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    return-object v0
.end method

.method public getCharset()Ljava/nio/charset/Charset;
    .locals 1

    .prologue
    .line 102
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedAttribute;->attribute:Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/multipart/Attribute;->getCharset()Ljava/nio/charset/Charset;

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
    .line 195
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedAttribute;->attribute:Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    invoke-interface {v0, p1}, Lorg/jboss/netty/handler/codec/http/multipart/Attribute;->getChunk(I)Lorg/jboss/netty/buffer/ChannelBuffer;

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
    .line 199
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedAttribute;->attribute:Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/multipart/Attribute;->getFile()Ljava/io/File;

    move-result-object v0

    return-object v0
.end method

.method public getHttpDataType()Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData$HttpDataType;
    .locals 1

    .prologue
    .line 167
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedAttribute;->attribute:Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/multipart/Attribute;->getHttpDataType()Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData$HttpDataType;

    move-result-object v0

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 171
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedAttribute;->attribute:Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/multipart/Attribute;->getName()Ljava/lang/String;

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
    .line 106
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedAttribute;->attribute:Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/multipart/Attribute;->getString()Ljava/lang/String;

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
    .line 110
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedAttribute;->attribute:Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    invoke-interface {v0, p1}, Lorg/jboss/netty/handler/codec/http/multipart/Attribute;->getString(Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getValue()Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 184
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedAttribute;->attribute:Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/multipart/Attribute;->getValue()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public isCompleted()Z
    .locals 1

    .prologue
    .line 114
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedAttribute;->attribute:Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/multipart/Attribute;->isCompleted()Z

    move-result v0

    return v0
.end method

.method public isInMemory()Z
    .locals 1

    .prologue
    .line 118
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedAttribute;->attribute:Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/multipart/Attribute;->isInMemory()Z

    move-result v0

    return v0
.end method

.method public length()J
    .locals 2

    .prologue
    .line 122
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedAttribute;->attribute:Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/multipart/Attribute;->length()J

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
    .line 126
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedAttribute;->attribute:Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    invoke-interface {v0, p1}, Lorg/jboss/netty/handler/codec/http/multipart/Attribute;->renameTo(Ljava/io/File;)Z

    move-result v0

    return v0
.end method

.method public setCharset(Ljava/nio/charset/Charset;)V
    .locals 1
    .param p1, "charset"    # Ljava/nio/charset/Charset;

    .prologue
    .line 130
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedAttribute;->attribute:Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    invoke-interface {v0, p1}, Lorg/jboss/netty/handler/codec/http/multipart/Attribute;->setCharset(Ljava/nio/charset/Charset;)V

    .line 131
    return-void
.end method

.method public setContent(Ljava/io/File;)V
    .locals 4
    .param p1, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 146
    invoke-virtual {p1}, Ljava/io/File;->length()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lorg/jboss/netty/handler/codec/http/multipart/MixedAttribute;->checkSize(J)V

    .line 147
    invoke-virtual {p1}, Ljava/io/File;->length()J

    move-result-wide v0

    iget-wide v2, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedAttribute;->limitSize:J

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    .line 148
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedAttribute;->attribute:Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    instance-of v0, v0, Lorg/jboss/netty/handler/codec/http/multipart/MemoryAttribute;

    if-eqz v0, :cond_0

    .line 150
    new-instance v0, Lorg/jboss/netty/handler/codec/http/multipart/DiskAttribute;

    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedAttribute;->attribute:Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    invoke-interface {v1}, Lorg/jboss/netty/handler/codec/http/multipart/Attribute;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/jboss/netty/handler/codec/http/multipart/DiskAttribute;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedAttribute;->attribute:Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    .line 151
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedAttribute;->attribute:Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    iget-wide v2, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedAttribute;->maxSize:J

    invoke-interface {v0, v2, v3}, Lorg/jboss/netty/handler/codec/http/multipart/Attribute;->setMaxSize(J)V

    .line 154
    :cond_0
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedAttribute;->attribute:Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    invoke-interface {v0, p1}, Lorg/jboss/netty/handler/codec/http/multipart/Attribute;->setContent(Ljava/io/File;)V

    .line 155
    return-void
.end method

.method public setContent(Ljava/io/InputStream;)V
    .locals 4
    .param p1, "inputStream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 158
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedAttribute;->attribute:Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    instance-of v0, v0, Lorg/jboss/netty/handler/codec/http/multipart/MemoryAttribute;

    if-eqz v0, :cond_0

    .line 160
    new-instance v0, Lorg/jboss/netty/handler/codec/http/multipart/DiskAttribute;

    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedAttribute;->attribute:Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    invoke-interface {v1}, Lorg/jboss/netty/handler/codec/http/multipart/Attribute;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/jboss/netty/handler/codec/http/multipart/DiskAttribute;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedAttribute;->attribute:Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    .line 161
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedAttribute;->attribute:Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    iget-wide v2, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedAttribute;->maxSize:J

    invoke-interface {v0, v2, v3}, Lorg/jboss/netty/handler/codec/http/multipart/Attribute;->setMaxSize(J)V

    .line 163
    :cond_0
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedAttribute;->attribute:Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    invoke-interface {v0, p1}, Lorg/jboss/netty/handler/codec/http/multipart/Attribute;->setContent(Ljava/io/InputStream;)V

    .line 164
    return-void
.end method

.method public setContent(Lorg/jboss/netty/buffer/ChannelBuffer;)V
    .locals 4
    .param p1, "buffer"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 134
    invoke-interface {p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v0

    int-to-long v0, v0

    invoke-virtual {p0, v0, v1}, Lorg/jboss/netty/handler/codec/http/multipart/MixedAttribute;->checkSize(J)V

    .line 135
    invoke-interface {p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v0

    int-to-long v0, v0

    iget-wide v2, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedAttribute;->limitSize:J

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    .line 136
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedAttribute;->attribute:Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    instance-of v0, v0, Lorg/jboss/netty/handler/codec/http/multipart/MemoryAttribute;

    if-eqz v0, :cond_0

    .line 138
    new-instance v0, Lorg/jboss/netty/handler/codec/http/multipart/DiskAttribute;

    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedAttribute;->attribute:Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    invoke-interface {v1}, Lorg/jboss/netty/handler/codec/http/multipart/Attribute;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/jboss/netty/handler/codec/http/multipart/DiskAttribute;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedAttribute;->attribute:Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    .line 139
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedAttribute;->attribute:Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    iget-wide v2, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedAttribute;->maxSize:J

    invoke-interface {v0, v2, v3}, Lorg/jboss/netty/handler/codec/http/multipart/Attribute;->setMaxSize(J)V

    .line 142
    :cond_0
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedAttribute;->attribute:Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    invoke-interface {v0, p1}, Lorg/jboss/netty/handler/codec/http/multipart/Attribute;->setContent(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    .line 143
    return-void
.end method

.method public setMaxSize(J)V
    .locals 1
    .param p1, "maxSize"    # J

    .prologue
    .line 62
    iput-wide p1, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedAttribute;->maxSize:J

    .line 63
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedAttribute;->attribute:Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    invoke-interface {v0, p1, p2}, Lorg/jboss/netty/handler/codec/http/multipart/Attribute;->setMaxSize(J)V

    .line 64
    return-void
.end method

.method public setValue(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 188
    if-eqz p1, :cond_0

    .line 189
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    array-length v0, v0

    int-to-long v0, v0

    invoke-virtual {p0, v0, v1}, Lorg/jboss/netty/handler/codec/http/multipart/MixedAttribute;->checkSize(J)V

    .line 191
    :cond_0
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedAttribute;->attribute:Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    invoke-interface {v0, p1}, Lorg/jboss/netty/handler/codec/http/multipart/Attribute;->setValue(Ljava/lang/String;)V

    .line 192
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 180
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Mixed: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/multipart/MixedAttribute;->attribute:Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
