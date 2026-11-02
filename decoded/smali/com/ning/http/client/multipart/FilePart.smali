.class public Lcom/ning/http/client/multipart/FilePart;
.super Lcom/ning/http/client/multipart/AbstractFilePart;
.source "FilePart.java"


# static fields
.field private static final LOGGER:Lorg/slf4j/Logger;


# instance fields
.field private final file:Ljava/io/File;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 30
    const-class v0, Lcom/ning/http/client/multipart/FilePart;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    sput-object v0, Lcom/ning/http/client/multipart/FilePart;->LOGGER:Lorg/slf4j/Logger;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/io/File;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "file"    # Ljava/io/File;

    .prologue
    .line 35
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/ning/http/client/multipart/FilePart;-><init>(Ljava/lang/String;Ljava/io/File;Ljava/lang/String;)V

    .line 36
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/io/File;Ljava/lang/String;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "file"    # Ljava/io/File;
    .param p3, "contentType"    # Ljava/lang/String;

    .prologue
    .line 39
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/ning/http/client/multipart/FilePart;-><init>(Ljava/lang/String;Ljava/io/File;Ljava/lang/String;Ljava/nio/charset/Charset;)V

    .line 40
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/io/File;Ljava/lang/String;Ljava/nio/charset/Charset;)V
    .locals 6
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "file"    # Ljava/io/File;
    .param p3, "contentType"    # Ljava/lang/String;
    .param p4, "charset"    # Ljava/nio/charset/Charset;

    .prologue
    .line 43
    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    invoke-direct/range {v0 .. v5}, Lcom/ning/http/client/multipart/FilePart;-><init>(Ljava/lang/String;Ljava/io/File;Ljava/lang/String;Ljava/nio/charset/Charset;Ljava/lang/String;)V

    .line 44
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/io/File;Ljava/lang/String;Ljava/nio/charset/Charset;Ljava/lang/String;)V
    .locals 7
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "file"    # Ljava/io/File;
    .param p3, "contentType"    # Ljava/lang/String;
    .param p4, "charset"    # Ljava/nio/charset/Charset;
    .param p5, "fileName"    # Ljava/lang/String;

    .prologue
    .line 47
    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-direct/range {v0 .. v6}, Lcom/ning/http/client/multipart/FilePart;-><init>(Ljava/lang/String;Ljava/io/File;Ljava/lang/String;Ljava/nio/charset/Charset;Ljava/lang/String;Ljava/lang/String;)V

    .line 48
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/io/File;Ljava/lang/String;Ljava/nio/charset/Charset;Ljava/lang/String;Ljava/lang/String;)V
    .locals 8
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "file"    # Ljava/io/File;
    .param p3, "contentType"    # Ljava/lang/String;
    .param p4, "charset"    # Ljava/nio/charset/Charset;
    .param p5, "fileName"    # Ljava/lang/String;
    .param p6, "contentId"    # Ljava/lang/String;

    .prologue
    .line 51
    const/4 v7, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    move-object v6, p6

    invoke-direct/range {v0 .. v7}, Lcom/ning/http/client/multipart/FilePart;-><init>(Ljava/lang/String;Ljava/io/File;Ljava/lang/String;Ljava/nio/charset/Charset;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 52
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/io/File;Ljava/lang/String;Ljava/nio/charset/Charset;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "file"    # Ljava/io/File;
    .param p3, "contentType"    # Ljava/lang/String;
    .param p4, "charset"    # Ljava/nio/charset/Charset;
    .param p5, "fileName"    # Ljava/lang/String;
    .param p6, "contentId"    # Ljava/lang/String;
    .param p7, "transferEncoding"    # Ljava/lang/String;

    .prologue
    .line 55
    move-object v0, p0

    move-object v1, p1

    move-object v2, p3

    move-object v3, p4

    move-object v4, p6

    move-object v5, p7

    invoke-direct/range {v0 .. v5}, Lcom/ning/http/client/multipart/AbstractFilePart;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/nio/charset/Charset;Ljava/lang/String;Ljava/lang/String;)V

    .line 56
    if-nez p2, :cond_0

    .line 57
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "file"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 58
    :cond_0
    invoke-virtual {p2}, Ljava/io/File;->isFile()Z

    move-result v0

    if-nez v0, :cond_1

    .line 59
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "File is not a normal file "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 60
    :cond_1
    invoke-virtual {p2}, Ljava/io/File;->canRead()Z

    move-result v0

    if-nez v0, :cond_2

    .line 61
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "File is not readable "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 62
    :cond_2
    iput-object p2, p0, Lcom/ning/http/client/multipart/FilePart;->file:Ljava/io/File;

    .line 63
    if-eqz p5, :cond_3

    .end local p5    # "fileName":Ljava/lang/String;
    :goto_0
    invoke-virtual {p0, p5}, Lcom/ning/http/client/multipart/FilePart;->setFileName(Ljava/lang/String;)V

    .line 64
    return-void

    .line 63
    .restart local p5    # "fileName":Ljava/lang/String;
    :cond_3
    invoke-virtual {p2}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object p5

    goto :goto_0
.end method


# virtual methods
.method protected getDataLength()J
    .locals 2

    .prologue
    .line 91
    iget-object v0, p0, Lcom/ning/http/client/multipart/FilePart;->file:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v0

    return-wide v0
.end method

.method public getFile()Ljava/io/File;
    .locals 1

    .prologue
    .line 95
    iget-object v0, p0, Lcom/ning/http/client/multipart/FilePart;->file:Ljava/io/File;

    return-object v0
.end method

.method protected sendData(Ljava/io/OutputStream;)V
    .locals 8
    .param p1, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 68
    invoke-virtual {p0}, Lcom/ning/http/client/multipart/FilePart;->getDataLength()J

    move-result-wide v4

    const-wide/16 v6, 0x0

    cmp-long v3, v4, v6

    if-nez v3, :cond_0

    .line 87
    :goto_0
    return-void

    .line 76
    :cond_0
    const/16 v3, 0x1000

    new-array v2, v3, [B

    .line 77
    .local v2, "tmp":[B
    new-instance v0, Ljava/io/FileInputStream;

    iget-object v3, p0, Lcom/ning/http/client/multipart/FilePart;->file:Ljava/io/File;

    invoke-direct {v0, v3}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 80
    .local v0, "instream":Ljava/io/InputStream;
    :goto_1
    :try_start_0
    invoke-virtual {v0, v2}, Ljava/io/InputStream;->read([B)I

    move-result v1

    .local v1, "len":I
    if-ltz v1, :cond_1

    .line 81
    const/4 v3, 0x0

    invoke-virtual {p1, v2, v3, v1}, Ljava/io/OutputStream;->write([BII)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    .line 85
    .end local v1    # "len":I
    :catchall_0
    move-exception v3

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    throw v3

    .restart local v1    # "len":I
    :cond_1
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    goto :goto_0
.end method

.method public write(Ljava/nio/channels/WritableByteChannel;[B)J
    .locals 20
    .param p1, "target"    # Ljava/nio/channels/WritableByteChannel;
    .param p2, "boundary"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 100
    new-instance v11, Lcom/ning/http/client/multipart/FilePartStallHandler;

    invoke-virtual/range {p0 .. p0}, Lcom/ning/http/client/multipart/FilePart;->getStalledTime()J

    move-result-wide v4

    move-object/from16 v0, p0

    invoke-direct {v11, v4, v5, v0}, Lcom/ning/http/client/multipart/FilePartStallHandler;-><init>(JLcom/ning/http/client/multipart/AbstractFilePart;)V

    .line 102
    .local v11, "handler":Lcom/ning/http/client/multipart/FilePartStallHandler;
    invoke-virtual {v11}, Lcom/ning/http/client/multipart/FilePartStallHandler;->start()V

    .line 104
    const/4 v12, 0x0

    .line 106
    .local v12, "length":I
    int-to-long v4, v12

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lcom/ning/http/client/multipart/FilePart;->generateFileStart([B)[B

    move-result-object v8

    move-object/from16 v0, p1

    invoke-static {v0, v8}, Lcom/ning/http/client/multipart/MultipartUtils;->writeBytesToChannel(Ljava/nio/channels/WritableByteChannel;[B)J

    move-result-wide v18

    add-long v4, v4, v18

    long-to-int v12, v4

    .line 108
    new-instance v16, Ljava/io/RandomAccessFile;

    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/ning/http/client/multipart/FilePart;->file:Ljava/io/File;

    const-string v5, "r"

    move-object/from16 v0, v16

    invoke-direct {v0, v4, v5}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 109
    .local v16, "raf":Ljava/io/RandomAccessFile;
    invoke-virtual/range {v16 .. v16}, Ljava/io/RandomAccessFile;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v3

    .line 111
    .local v3, "fc":Ljava/nio/channels/FileChannel;
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/ning/http/client/multipart/FilePart;->file:Ljava/io/File;

    invoke-virtual {v4}, Ljava/io/File;->length()J

    move-result-wide v6

    .line 112
    .local v6, "l":J
    const/4 v10, 0x0

    .line 113
    .local v10, "fileLength":I
    const-wide/16 v14, 0x0

    .line 116
    .local v14, "nWrite":J
    :try_start_0
    monitor-enter v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 117
    :goto_0
    int-to-long v4, v10

    cmp-long v4, v4, v6

    if-eqz v4, :cond_3

    .line 118
    :try_start_1
    invoke-virtual {v11}, Lcom/ning/http/client/multipart/FilePartStallHandler;->isFailed()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 119
    sget-object v4, Lcom/ning/http/client/multipart/FilePart;->LOGGER:Lorg/slf4j/Logger;

    const-string v5, "Stalled error"

    invoke-interface {v4, v5}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;)V

    .line 120
    new-instance v4, Lcom/ning/http/client/multipart/FileUploadStalledException;

    invoke-direct {v4}, Lcom/ning/http/client/multipart/FileUploadStalledException;-><init>()V

    throw v4

    .line 153
    :catchall_0
    move-exception v4

    monitor-exit v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw v4
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 155
    :catchall_1
    move-exception v4

    invoke-virtual {v11}, Lcom/ning/http/client/multipart/FilePartStallHandler;->completed()V

    .line 156
    invoke-virtual/range {v16 .. v16}, Ljava/io/RandomAccessFile;->close()V

    throw v4

    .line 123
    :cond_0
    int-to-long v4, v10

    move-object/from16 v8, p1

    :try_start_3
    invoke-virtual/range {v3 .. v8}, Ljava/nio/channels/FileChannel;->transferTo(JJLjava/nio/channels/WritableByteChannel;)J

    move-result-wide v14

    .line 125
    const-wide/16 v4, 0x0

    cmp-long v4, v14, v4

    if-nez v4, :cond_1

    .line 126
    sget-object v4, Lcom/ning/http/client/multipart/FilePart;->LOGGER:Lorg/slf4j/Logger;

    const-string v5, "Waiting for writing..."

    invoke-interface {v4, v5}, Lorg/slf4j/Logger;->info(Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 128
    const-wide/16 v4, 0x32

    :try_start_4
    invoke-virtual {v3, v4, v5}, Ljava/lang/Object;->wait(J)V
    :try_end_4
    .catch Ljava/lang/InterruptedException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 151
    :goto_1
    int-to-long v4, v10

    add-long/2addr v4, v14

    long-to-int v10, v4

    goto :goto_0

    .line 129
    :catch_0
    move-exception v2

    .line 130
    .local v2, "e":Ljava/lang/InterruptedException;
    :try_start_5
    sget-object v4, Lcom/ning/http/client/multipart/FilePart;->LOGGER:Lorg/slf4j/Logger;

    invoke-virtual {v2}, Ljava/lang/InterruptedException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5, v2}, Lorg/slf4j/Logger;->trace(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_1
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto :goto_1

    .line 135
    .end local v2    # "e":Ljava/lang/InterruptedException;
    :catch_1
    move-exception v9

    .line 136
    .local v9, "ex":Ljava/io/IOException;
    :try_start_6
    invoke-virtual {v9}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v13

    .line 139
    .local v13, "message":Ljava/lang/String;
    if-eqz v13, :cond_2

    const-string v4, "Resource temporarily unavailable"

    invoke-virtual {v13, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    move-result v4

    if-eqz v4, :cond_2

    .line 141
    const-wide/16 v4, 0x3e8

    :try_start_7
    invoke-virtual {v3, v4, v5}, Ljava/lang/Object;->wait(J)V
    :try_end_7
    .catch Ljava/lang/InterruptedException; {:try_start_7 .. :try_end_7} :catch_2
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 145
    :goto_2
    :try_start_8
    sget-object v4, Lcom/ning/http/client/multipart/FilePart;->LOGGER:Lorg/slf4j/Logger;

    const-string v5, "Experiencing NIO issue http://bugs.sun.com/view_bug.do?bug_id=5103988. Retrying"

    invoke-interface {v4, v5}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    goto :goto_0

    .line 133
    .end local v9    # "ex":Ljava/io/IOException;
    .end local v13    # "message":Ljava/lang/String;
    :cond_1
    :try_start_9
    invoke-virtual {v11}, Lcom/ning/http/client/multipart/FilePartStallHandler;->writeHappened()V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_1
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    goto :goto_1

    .line 142
    .restart local v9    # "ex":Ljava/io/IOException;
    .restart local v13    # "message":Ljava/lang/String;
    :catch_2
    move-exception v2

    .line 143
    .restart local v2    # "e":Ljava/lang/InterruptedException;
    :try_start_a
    sget-object v4, Lcom/ning/http/client/multipart/FilePart;->LOGGER:Lorg/slf4j/Logger;

    invoke-virtual {v2}, Ljava/lang/InterruptedException;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5, v2}, Lorg/slf4j/Logger;->trace(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_2

    .line 148
    .end local v2    # "e":Ljava/lang/InterruptedException;
    :cond_2
    throw v9

    .line 153
    .end local v9    # "ex":Ljava/io/IOException;
    .end local v13    # "message":Ljava/lang/String;
    :cond_3
    monitor-exit v3
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    .line 155
    invoke-virtual {v11}, Lcom/ning/http/client/multipart/FilePartStallHandler;->completed()V

    .line 156
    invoke-virtual/range {v16 .. v16}, Ljava/io/RandomAccessFile;->close()V

    .line 159
    int-to-long v4, v12

    invoke-virtual/range {p0 .. p0}, Lcom/ning/http/client/multipart/FilePart;->generateFileEnd()[B

    move-result-object v8

    move-object/from16 v0, p1

    invoke-static {v0, v8}, Lcom/ning/http/client/multipart/MultipartUtils;->writeBytesToChannel(Ljava/nio/channels/WritableByteChannel;[B)J

    move-result-wide v18

    add-long v4, v4, v18

    long-to-int v12, v4

    .line 161
    int-to-long v4, v12

    return-wide v4
.end method
