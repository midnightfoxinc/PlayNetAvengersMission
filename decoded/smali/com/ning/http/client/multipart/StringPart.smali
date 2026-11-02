.class public Lcom/ning/http/client/multipart/StringPart;
.super Lcom/ning/http/client/multipart/PartBase;
.source "StringPart.java"


# static fields
.field public static final DEFAULT_CHARSET:Ljava/nio/charset/Charset;

.field public static final DEFAULT_CONTENT_TYPE:Ljava/lang/String; = "text/plain"

.field public static final DEFAULT_TRANSFER_ENCODING:Ljava/lang/String; = "8bit"


# instance fields
.field private final content:[B

.field private final value:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 33
    sget-object v0, Ljava/nio/charset/StandardCharsets;->US_ASCII:Ljava/nio/charset/Charset;

    sput-object v0, Lcom/ning/http/client/multipart/StringPart;->DEFAULT_CHARSET:Ljava/nio/charset/Charset;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 59
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/ning/http/client/multipart/StringPart;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 60
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .param p3, "contentType"    # Ljava/lang/String;

    .prologue
    .line 63
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lcom/ning/http/client/multipart/StringPart;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/nio/charset/Charset;)V

    .line 64
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/nio/charset/Charset;)V
    .locals 6
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .param p3, "contentType"    # Ljava/lang/String;
    .param p4, "charset"    # Ljava/nio/charset/Charset;

    .prologue
    .line 67
    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    invoke-direct/range {v0 .. v5}, Lcom/ning/http/client/multipart/StringPart;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/nio/charset/Charset;Ljava/lang/String;)V

    .line 68
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/nio/charset/Charset;Ljava/lang/String;)V
    .locals 7
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .param p3, "contentType"    # Ljava/lang/String;
    .param p4, "charset"    # Ljava/nio/charset/Charset;
    .param p5, "contentId"    # Ljava/lang/String;

    .prologue
    .line 71
    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-direct/range {v0 .. v6}, Lcom/ning/http/client/multipart/StringPart;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/nio/charset/Charset;Ljava/lang/String;Ljava/lang/String;)V

    .line 72
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/nio/charset/Charset;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .param p3, "contentType"    # Ljava/lang/String;
    .param p4, "charset"    # Ljava/nio/charset/Charset;
    .param p5, "contentId"    # Ljava/lang/String;
    .param p6, "transferEncoding"    # Ljava/lang/String;

    .prologue
    .line 75
    invoke-static {p3}, Lcom/ning/http/client/multipart/StringPart;->contentTypeOrDefault(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {p4}, Lcom/ning/http/client/multipart/StringPart;->charsetOrDefault(Ljava/nio/charset/Charset;)Ljava/nio/charset/Charset;

    move-result-object v3

    invoke-static {p6}, Lcom/ning/http/client/multipart/StringPart;->transferEncodingOrDefault(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    move-object v0, p0

    move-object v1, p1

    move-object v4, p5

    invoke-direct/range {v0 .. v5}, Lcom/ning/http/client/multipart/PartBase;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/nio/charset/Charset;Ljava/lang/String;Ljava/lang/String;)V

    .line 76
    if-nez p2, :cond_0

    .line 77
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "value"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 79
    :cond_0
    const/4 v0, 0x0

    invoke-virtual {p2, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_1

    .line 81
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "NULs may not be present in string parts"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 83
    :cond_1
    invoke-virtual {p0}, Lcom/ning/http/client/multipart/StringPart;->getCharset()Ljava/nio/charset/Charset;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    iput-object v0, p0, Lcom/ning/http/client/multipart/StringPart;->content:[B

    .line 84
    iput-object p2, p0, Lcom/ning/http/client/multipart/StringPart;->value:Ljava/lang/String;

    .line 85
    return-void
.end method

.method private static charsetOrDefault(Ljava/nio/charset/Charset;)Ljava/nio/charset/Charset;
    .locals 0
    .param p0, "charset"    # Ljava/nio/charset/Charset;

    .prologue
    .line 47
    if-nez p0, :cond_0

    sget-object p0, Lcom/ning/http/client/multipart/StringPart;->DEFAULT_CHARSET:Ljava/nio/charset/Charset;

    .end local p0    # "charset":Ljava/nio/charset/Charset;
    :cond_0
    return-object p0
.end method

.method private static contentTypeOrDefault(Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "contentType"    # Ljava/lang/String;

    .prologue
    .line 51
    if-nez p0, :cond_0

    const-string p0, "text/plain"

    .end local p0    # "contentType":Ljava/lang/String;
    :cond_0
    return-object p0
.end method

.method private static transferEncodingOrDefault(Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "transferEncoding"    # Ljava/lang/String;

    .prologue
    .line 55
    if-nez p0, :cond_0

    const-string p0, "8bit"

    .end local p0    # "transferEncoding":Ljava/lang/String;
    :cond_0
    return-object p0
.end method


# virtual methods
.method public getBytes([B)[B
    .locals 2
    .param p1, "boundary"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 111
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 112
    .local v0, "outputStream":Ljava/io/ByteArrayOutputStream;
    invoke-virtual {p0, v0, p1}, Lcom/ning/http/client/multipart/StringPart;->write(Ljava/io/OutputStream;[B)V

    .line 113
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v1

    return-object v1
.end method

.method protected getDataLength()J
    .locals 2

    .prologue
    .line 107
    iget-object v0, p0, Lcom/ning/http/client/multipart/StringPart;->content:[B

    array-length v0, v0

    int-to-long v0, v0

    return-wide v0
.end method

.method public getValue()Ljava/lang/String;
    .locals 1

    .prologue
    .line 122
    iget-object v0, p0, Lcom/ning/http/client/multipart/StringPart;->value:Ljava/lang/String;

    return-object v0
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
    .line 97
    iget-object v0, p0, Lcom/ning/http/client/multipart/StringPart;->content:[B

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write([B)V

    .line 98
    return-void
.end method

.method public write(Ljava/nio/channels/WritableByteChannel;[B)J
    .locals 2
    .param p1, "target"    # Ljava/nio/channels/WritableByteChannel;
    .param p2, "boundary"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 118
    invoke-virtual {p0, p2}, Lcom/ning/http/client/multipart/StringPart;->getBytes([B)[B

    move-result-object v0

    invoke-static {p1, v0}, Lcom/ning/http/client/multipart/MultipartUtils;->writeBytesToChannel(Ljava/nio/channels/WritableByteChannel;[B)J

    move-result-wide v0

    return-wide v0
.end method
