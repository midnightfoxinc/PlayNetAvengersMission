.class public Lcom/ning/http/client/multipart/ByteArrayPart;
.super Lcom/ning/http/client/multipart/AbstractFilePart;
.source "ByteArrayPart.java"


# instance fields
.field private final bytes:[B


# direct methods
.method public constructor <init>(Ljava/lang/String;[B)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "bytes"    # [B

    .prologue
    .line 25
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/ning/http/client/multipart/ByteArrayPart;-><init>(Ljava/lang/String;[BLjava/lang/String;)V

    .line 26
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;[BLjava/lang/String;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "bytes"    # [B
    .param p3, "contentType"    # Ljava/lang/String;

    .prologue
    .line 29
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/ning/http/client/multipart/ByteArrayPart;-><init>(Ljava/lang/String;[BLjava/lang/String;Ljava/nio/charset/Charset;)V

    .line 30
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;[BLjava/lang/String;Ljava/nio/charset/Charset;)V
    .locals 6
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "bytes"    # [B
    .param p3, "contentType"    # Ljava/lang/String;
    .param p4, "charset"    # Ljava/nio/charset/Charset;

    .prologue
    .line 33
    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    invoke-direct/range {v0 .. v5}, Lcom/ning/http/client/multipart/ByteArrayPart;-><init>(Ljava/lang/String;[BLjava/lang/String;Ljava/nio/charset/Charset;Ljava/lang/String;)V

    .line 34
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;[BLjava/lang/String;Ljava/nio/charset/Charset;Ljava/lang/String;)V
    .locals 7
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "bytes"    # [B
    .param p3, "contentType"    # Ljava/lang/String;
    .param p4, "charset"    # Ljava/nio/charset/Charset;
    .param p5, "fileName"    # Ljava/lang/String;

    .prologue
    .line 37
    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-direct/range {v0 .. v6}, Lcom/ning/http/client/multipart/ByteArrayPart;-><init>(Ljava/lang/String;[BLjava/lang/String;Ljava/nio/charset/Charset;Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;[BLjava/lang/String;Ljava/nio/charset/Charset;Ljava/lang/String;Ljava/lang/String;)V
    .locals 8
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "bytes"    # [B
    .param p3, "contentType"    # Ljava/lang/String;
    .param p4, "charset"    # Ljava/nio/charset/Charset;
    .param p5, "fileName"    # Ljava/lang/String;
    .param p6, "contentId"    # Ljava/lang/String;

    .prologue
    .line 41
    const/4 v7, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    move-object v6, p6

    invoke-direct/range {v0 .. v7}, Lcom/ning/http/client/multipart/ByteArrayPart;-><init>(Ljava/lang/String;[BLjava/lang/String;Ljava/nio/charset/Charset;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;[BLjava/lang/String;Ljava/nio/charset/Charset;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "bytes"    # [B
    .param p3, "contentType"    # Ljava/lang/String;
    .param p4, "charset"    # Ljava/nio/charset/Charset;
    .param p5, "fileName"    # Ljava/lang/String;
    .param p6, "contentId"    # Ljava/lang/String;
    .param p7, "transferEncoding"    # Ljava/lang/String;

    .prologue
    .line 45
    move-object v0, p0

    move-object v1, p1

    move-object v2, p3

    move-object v3, p4

    move-object v4, p6

    move-object v5, p7

    invoke-direct/range {v0 .. v5}, Lcom/ning/http/client/multipart/AbstractFilePart;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/nio/charset/Charset;Ljava/lang/String;Ljava/lang/String;)V

    .line 46
    if-nez p2, :cond_0

    .line 47
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "bytes"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 48
    :cond_0
    iput-object p2, p0, Lcom/ning/http/client/multipart/ByteArrayPart;->bytes:[B

    .line 49
    invoke-virtual {p0, p5}, Lcom/ning/http/client/multipart/ByteArrayPart;->setFileName(Ljava/lang/String;)V

    .line 50
    return-void
.end method


# virtual methods
.method public getBytes()[B
    .locals 1

    .prologue
    .line 63
    iget-object v0, p0, Lcom/ning/http/client/multipart/ByteArrayPart;->bytes:[B

    return-object v0
.end method

.method protected getDataLength()J
    .locals 2

    .prologue
    .line 59
    iget-object v0, p0, Lcom/ning/http/client/multipart/ByteArrayPart;->bytes:[B

    array-length v0, v0

    int-to-long v0, v0

    return-wide v0
.end method

.method protected sendData(Ljava/io/OutputStream;)V
    .locals 1
    .param p1, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 54
    iget-object v0, p0, Lcom/ning/http/client/multipart/ByteArrayPart;->bytes:[B

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write([B)V

    .line 55
    return-void
.end method

.method public write(Ljava/nio/channels/WritableByteChannel;[B)J
    .locals 6
    .param p1, "target"    # Ljava/nio/channels/WritableByteChannel;
    .param p2, "boundary"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 68
    new-instance v0, Lcom/ning/http/client/multipart/FilePartStallHandler;

    invoke-virtual {p0}, Lcom/ning/http/client/multipart/ByteArrayPart;->getStalledTime()J

    move-result-wide v4

    invoke-direct {v0, v4, v5, p0}, Lcom/ning/http/client/multipart/FilePartStallHandler;-><init>(JLcom/ning/http/client/multipart/AbstractFilePart;)V

    .line 71
    .local v0, "handler":Lcom/ning/http/client/multipart/FilePartStallHandler;
    :try_start_0
    invoke-virtual {v0}, Lcom/ning/http/client/multipart/FilePartStallHandler;->start()V

    .line 73
    invoke-virtual {p0, p2}, Lcom/ning/http/client/multipart/ByteArrayPart;->generateFileStart([B)[B

    move-result-object v1

    invoke-static {p1, v1}, Lcom/ning/http/client/multipart/MultipartUtils;->writeBytesToChannel(Ljava/nio/channels/WritableByteChannel;[B)J

    move-result-wide v2

    .line 74
    .local v2, "length":J
    iget-object v1, p0, Lcom/ning/http/client/multipart/ByteArrayPart;->bytes:[B

    invoke-static {p1, v1}, Lcom/ning/http/client/multipart/MultipartUtils;->writeBytesToChannel(Ljava/nio/channels/WritableByteChannel;[B)J

    move-result-wide v4

    add-long/2addr v2, v4

    .line 75
    invoke-virtual {p0}, Lcom/ning/http/client/multipart/ByteArrayPart;->generateFileEnd()[B

    move-result-object v1

    invoke-static {p1, v1}, Lcom/ning/http/client/multipart/MultipartUtils;->writeBytesToChannel(Ljava/nio/channels/WritableByteChannel;[B)J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-wide v4

    add-long/2addr v2, v4

    .line 79
    invoke-virtual {v0}, Lcom/ning/http/client/multipart/FilePartStallHandler;->completed()V

    return-wide v2

    .end local v2    # "length":J
    :catchall_0
    move-exception v1

    invoke-virtual {v0}, Lcom/ning/http/client/multipart/FilePartStallHandler;->completed()V

    throw v1
.end method
