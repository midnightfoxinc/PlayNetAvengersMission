.class public Lcom/ning/http/client/providers/jdk/MultipartRequestEntity;
.super Ljava/lang/Object;
.source "MultipartRequestEntity.java"

# interfaces
.implements Lcom/ning/http/client/multipart/RequestEntity;


# static fields
.field private static MULTIPART_CHARS:[B = null

.field private static final MULTIPART_FORM_CONTENT_TYPE:Ljava/lang/String; = "multipart/form-data"


# instance fields
.field private final contentLength:J

.field private final contentType:Ljava/lang/String;

.field private final multipartBoundary:[B

.field protected final parts:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/ning/http/client/multipart/Part;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 46
    const-string v0, "-_1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

    sget-object v1, Ljava/nio/charset/StandardCharsets;->US_ASCII:Ljava/nio/charset/Charset;

    invoke-virtual {v0, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    sput-object v0, Lcom/ning/http/client/providers/jdk/MultipartRequestEntity;->MULTIPART_CHARS:[B

    return-void
.end method

.method public constructor <init>(Ljava/util/List;Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;)V
    .locals 4
    .param p2, "requestHeaders"    # Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/ning/http/client/multipart/Part;",
            ">;",
            "Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;",
            ")V"
        }
    .end annotation

    .prologue
    .line 77
    .local p1, "parts":Ljava/util/List;, "Ljava/util/List<Lcom/ning/http/client/multipart/Part;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 78
    if-nez p1, :cond_0

    .line 79
    new-instance v2, Ljava/lang/NullPointerException;

    const-string v3, "parts"

    invoke-direct {v2, v3}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 80
    :cond_0
    iput-object p1, p0, Lcom/ning/http/client/providers/jdk/MultipartRequestEntity;->parts:Ljava/util/List;

    .line 81
    const-string v2, "Content-Type"

    invoke-virtual {p2, v2}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->getFirstValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 82
    .local v1, "contentTypeHeader":Ljava/lang/String;
    invoke-static {v1}, Lcom/ning/http/util/MiscUtils;->isNonEmpty(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 83
    const-string v2, "boundary="

    invoke-virtual {v1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 84
    .local v0, "boundaryLocation":I
    const/4 v2, -0x1

    if-eq v0, v2, :cond_1

    .line 86
    iput-object v1, p0, Lcom/ning/http/client/providers/jdk/MultipartRequestEntity;->contentType:Ljava/lang/String;

    .line 87
    const-string v2, "boundary="

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    add-int/2addr v2, v0

    invoke-virtual {v1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    sget-object v3, Ljava/nio/charset/StandardCharsets;->US_ASCII:Ljava/nio/charset/Charset;

    invoke-virtual {v2, v3}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v2

    iput-object v2, p0, Lcom/ning/http/client/providers/jdk/MultipartRequestEntity;->multipartBoundary:[B

    .line 98
    .end local v0    # "boundaryLocation":I
    :goto_0
    iget-object v2, p0, Lcom/ning/http/client/providers/jdk/MultipartRequestEntity;->multipartBoundary:[B

    invoke-static {p1, v2}, Lcom/ning/http/client/multipart/MultipartUtils;->getLengthOfParts(Ljava/util/List;[B)J

    move-result-wide v2

    iput-wide v2, p0, Lcom/ning/http/client/providers/jdk/MultipartRequestEntity;->contentLength:J

    .line 99
    return-void

    .line 90
    .restart local v0    # "boundaryLocation":I
    :cond_1
    invoke-static {}, Lcom/ning/http/client/providers/jdk/MultipartRequestEntity;->generateMultipartBoundary()[B

    move-result-object v2

    iput-object v2, p0, Lcom/ning/http/client/providers/jdk/MultipartRequestEntity;->multipartBoundary:[B

    .line 91
    invoke-direct {p0, v1}, Lcom/ning/http/client/providers/jdk/MultipartRequestEntity;->computeContentType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/ning/http/client/providers/jdk/MultipartRequestEntity;->contentType:Ljava/lang/String;

    goto :goto_0

    .line 94
    .end local v0    # "boundaryLocation":I
    :cond_2
    invoke-static {}, Lcom/ning/http/client/providers/jdk/MultipartRequestEntity;->generateMultipartBoundary()[B

    move-result-object v2

    iput-object v2, p0, Lcom/ning/http/client/providers/jdk/MultipartRequestEntity;->multipartBoundary:[B

    .line 95
    const-string v2, "multipart/form-data"

    invoke-direct {p0, v2}, Lcom/ning/http/client/providers/jdk/MultipartRequestEntity;->computeContentType(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/ning/http/client/providers/jdk/MultipartRequestEntity;->contentType:Ljava/lang/String;

    goto :goto_0
.end method

.method private computeContentType(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p1, "base"    # Ljava/lang/String;

    .prologue
    .line 102
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 103
    .local v0, "buffer":Ljava/lang/StringBuilder;
    const-string v1, ";"

    invoke-virtual {p1, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 104
    const-string v1, ";"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 105
    :cond_0
    const-string v1, " boundary="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    new-instance v2, Ljava/lang/String;

    iget-object v3, p0, Lcom/ning/http/client/providers/jdk/MultipartRequestEntity;->multipartBoundary:[B

    sget-object v4, Ljava/nio/charset/StandardCharsets;->US_ASCII:Ljava/nio/charset/Charset;

    invoke-direct {v2, v3, v4}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static generateMultipartBoundary()[B
    .locals 5

    .prologue
    .line 54
    new-instance v2, Ljava/util/Random;

    invoke-direct {v2}, Ljava/util/Random;-><init>()V

    .line 55
    .local v2, "rand":Ljava/util/Random;
    const/16 v3, 0xb

    invoke-virtual {v2, v3}, Ljava/util/Random;->nextInt(I)I

    move-result v3

    add-int/lit8 v3, v3, 0x1e

    new-array v0, v3, [B

    .line 56
    .local v0, "bytes":[B
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    array-length v3, v0

    if-ge v1, v3, :cond_0

    .line 57
    sget-object v3, Lcom/ning/http/client/providers/jdk/MultipartRequestEntity;->MULTIPART_CHARS:[B

    sget-object v4, Lcom/ning/http/client/providers/jdk/MultipartRequestEntity;->MULTIPART_CHARS:[B

    array-length v4, v4

    invoke-virtual {v2, v4}, Ljava/util/Random;->nextInt(I)I

    move-result v4

    aget-byte v3, v3, v4

    aput-byte v3, v0, v1

    .line 56
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 59
    :cond_0
    return-object v0
.end method


# virtual methods
.method public getContentLength()J
    .locals 2

    .prologue
    .line 124
    iget-wide v0, p0, Lcom/ning/http/client/providers/jdk/MultipartRequestEntity;->contentLength:J

    return-wide v0
.end method

.method public getContentType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 128
    iget-object v0, p0, Lcom/ning/http/client/providers/jdk/MultipartRequestEntity;->contentType:Ljava/lang/String;

    return-object v0
.end method

.method public getMultipartBoundary()[B
    .locals 1

    .prologue
    .line 114
    iget-object v0, p0, Lcom/ning/http/client/providers/jdk/MultipartRequestEntity;->multipartBoundary:[B

    return-object v0
.end method

.method public writeRequest(Ljava/io/OutputStream;)V
    .locals 3
    .param p1, "out"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 118
    iget-object v2, p0, Lcom/ning/http/client/providers/jdk/MultipartRequestEntity;->parts:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/ning/http/client/multipart/Part;

    .line 119
    .local v1, "part":Lcom/ning/http/client/multipart/Part;
    iget-object v2, p0, Lcom/ning/http/client/providers/jdk/MultipartRequestEntity;->multipartBoundary:[B

    invoke-interface {v1, p1, v2}, Lcom/ning/http/client/multipart/Part;->write(Ljava/io/OutputStream;[B)V

    goto :goto_0

    .line 121
    .end local v1    # "part":Lcom/ning/http/client/multipart/Part;
    :cond_0
    return-void
.end method
