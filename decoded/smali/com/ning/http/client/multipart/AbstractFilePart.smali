.class public abstract Lcom/ning/http/client/multipart/AbstractFilePart;
.super Lcom/ning/http/client/multipart/PartBase;
.source "AbstractFilePart.java"


# static fields
.field public static final DEFAULT_CONTENT_TYPE:Ljava/lang/String; = "application/octet-stream"

.field public static final DEFAULT_TRANSFER_ENCODING:Ljava/lang/String; = "binary"

.field private static final FILE_NAME_BYTES:[B


# instance fields
.field private fileName:Ljava/lang/String;

.field private stalledTime:J


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 41
    const-string v0, "; filename="

    sget-object v1, Ljava/nio/charset/StandardCharsets;->US_ASCII:Ljava/nio/charset/Charset;

    invoke-virtual {v0, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    sput-object v0, Lcom/ning/http/client/multipart/AbstractFilePart;->FILE_NAME_BYTES:[B

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/nio/charset/Charset;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "contentType"    # Ljava/lang/String;
    .param p3, "charset"    # Ljava/nio/charset/Charset;
    .param p4, "contentId"    # Ljava/lang/String;
    .param p5, "transferEncoding"    # Ljava/lang/String;

    .prologue
    .line 60
    if-nez p2, :cond_0

    const-string v2, "application/octet-stream"

    :goto_0
    if-nez p5, :cond_1

    const-string v5, "binary"

    :goto_1
    move-object v0, p0

    move-object v1, p1

    move-object v3, p3

    move-object v4, p4

    invoke-direct/range {v0 .. v5}, Lcom/ning/http/client/multipart/PartBase;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/nio/charset/Charset;Ljava/lang/String;Ljava/lang/String;)V

    .line 43
    const-wide/16 v0, -0x1

    iput-wide v0, p0, Lcom/ning/http/client/multipart/AbstractFilePart;->stalledTime:J

    .line 65
    return-void

    :cond_0
    move-object v2, p2

    .line 60
    goto :goto_0

    :cond_1
    move-object v5, p5

    goto :goto_1
.end method


# virtual methods
.method protected generateFileEnd()[B
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 91
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 92
    .local v0, "out":Ljava/io/ByteArrayOutputStream;
    new-instance v1, Lcom/ning/http/client/multipart/OutputStreamPartVisitor;

    invoke-direct {v1, v0}, Lcom/ning/http/client/multipart/OutputStreamPartVisitor;-><init>(Ljava/io/OutputStream;)V

    .line 93
    .local v1, "visitor":Lcom/ning/http/client/multipart/OutputStreamPartVisitor;
    invoke-virtual {p0, v1}, Lcom/ning/http/client/multipart/AbstractFilePart;->visitEnd(Lcom/ning/http/client/multipart/PartVisitor;)V

    .line 94
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v2

    return-object v2
.end method

.method protected generateFileStart([B)[B
    .locals 3
    .param p1, "boundary"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 78
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 79
    .local v0, "out":Ljava/io/ByteArrayOutputStream;
    new-instance v1, Lcom/ning/http/client/multipart/OutputStreamPartVisitor;

    invoke-direct {v1, v0}, Lcom/ning/http/client/multipart/OutputStreamPartVisitor;-><init>(Ljava/io/OutputStream;)V

    .line 80
    .local v1, "visitor":Lcom/ning/http/client/multipart/OutputStreamPartVisitor;
    invoke-virtual {p0, v1, p1}, Lcom/ning/http/client/multipart/AbstractFilePart;->visitStart(Lcom/ning/http/client/multipart/PartVisitor;[B)V

    .line 81
    invoke-virtual {p0, v1}, Lcom/ning/http/client/multipart/AbstractFilePart;->visitDispositionHeader(Lcom/ning/http/client/multipart/PartVisitor;)V

    .line 82
    invoke-virtual {p0, v1}, Lcom/ning/http/client/multipart/AbstractFilePart;->visitContentTypeHeader(Lcom/ning/http/client/multipart/PartVisitor;)V

    .line 83
    invoke-virtual {p0, v1}, Lcom/ning/http/client/multipart/AbstractFilePart;->visitTransferEncodingHeader(Lcom/ning/http/client/multipart/PartVisitor;)V

    .line 84
    invoke-virtual {p0, v1}, Lcom/ning/http/client/multipart/AbstractFilePart;->visitContentIdHeader(Lcom/ning/http/client/multipart/PartVisitor;)V

    .line 85
    invoke-virtual {p0, v1}, Lcom/ning/http/client/multipart/AbstractFilePart;->visitEndOfHeader(Lcom/ning/http/client/multipart/PartVisitor;)V

    .line 87
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v2

    return-object v2
.end method

.method public getFileName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 110
    iget-object v0, p0, Lcom/ning/http/client/multipart/AbstractFilePart;->fileName:Ljava/lang/String;

    return-object v0
.end method

.method public getStalledTime()J
    .locals 2

    .prologue
    .line 102
    iget-wide v0, p0, Lcom/ning/http/client/multipart/AbstractFilePart;->stalledTime:J

    return-wide v0
.end method

.method public setFileName(Ljava/lang/String;)V
    .locals 0
    .param p1, "fileName"    # Ljava/lang/String;

    .prologue
    .line 106
    iput-object p1, p0, Lcom/ning/http/client/multipart/AbstractFilePart;->fileName:Ljava/lang/String;

    .line 107
    return-void
.end method

.method public setStalledTime(J)V
    .locals 1
    .param p1, "ms"    # J

    .prologue
    .line 98
    iput-wide p1, p0, Lcom/ning/http/client/multipart/AbstractFilePart;->stalledTime:J

    .line 99
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 115
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-super {p0}, Lcom/ning/http/client/multipart/PartBase;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " filename="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/ning/http/client/multipart/AbstractFilePart;->fileName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected visitDispositionHeader(Lcom/ning/http/client/multipart/PartVisitor;)V
    .locals 3
    .param p1, "visitor"    # Lcom/ning/http/client/multipart/PartVisitor;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/16 v2, 0x22

    .line 68
    invoke-super {p0, p1}, Lcom/ning/http/client/multipart/PartBase;->visitDispositionHeader(Lcom/ning/http/client/multipart/PartVisitor;)V

    .line 69
    iget-object v0, p0, Lcom/ning/http/client/multipart/AbstractFilePart;->fileName:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 70
    sget-object v0, Lcom/ning/http/client/multipart/AbstractFilePart;->FILE_NAME_BYTES:[B

    invoke-interface {p1, v0}, Lcom/ning/http/client/multipart/PartVisitor;->withBytes([B)V

    .line 71
    invoke-interface {p1, v2}, Lcom/ning/http/client/multipart/PartVisitor;->withByte(B)V

    .line 72
    iget-object v1, p0, Lcom/ning/http/client/multipart/AbstractFilePart;->fileName:Ljava/lang/String;

    invoke-virtual {p0}, Lcom/ning/http/client/multipart/AbstractFilePart;->getCharset()Ljava/nio/charset/Charset;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/ning/http/client/multipart/AbstractFilePart;->getCharset()Ljava/nio/charset/Charset;

    move-result-object v0

    :goto_0
    invoke-virtual {v1, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    invoke-interface {p1, v0}, Lcom/ning/http/client/multipart/PartVisitor;->withBytes([B)V

    .line 73
    invoke-interface {p1, v2}, Lcom/ning/http/client/multipart/PartVisitor;->withByte(B)V

    .line 75
    :cond_0
    return-void

    .line 72
    :cond_1
    sget-object v0, Ljava/nio/charset/StandardCharsets;->US_ASCII:Ljava/nio/charset/Charset;

    goto :goto_0
.end method
