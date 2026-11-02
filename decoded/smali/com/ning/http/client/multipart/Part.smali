.class public interface abstract Lcom/ning/http/client/multipart/Part;
.super Ljava/lang/Object;
.source "Part.java"


# static fields
.field public static final CHARSET_BYTES:[B

.field public static final CONTENT_DISPOSITION_BYTES:[B

.field public static final CONTENT_ID_BYTES:[B

.field public static final CONTENT_TRANSFER_ENCODING_BYTES:[B

.field public static final CONTENT_TYPE_BYTES:[B

.field public static final CRLF_BYTES:[B

.field public static final EXTRA_BYTES:[B

.field public static final FORM_DATA_DISPOSITION_TYPE_BYTES:[B

.field public static final NAME_BYTES:[B

.field public static final QUOTE_BYTE:B = 0x22t


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 27
    const-string v0, "\r\n"

    sget-object v1, Ljava/nio/charset/StandardCharsets;->US_ASCII:Ljava/nio/charset/Charset;

    invoke-virtual {v0, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    sput-object v0, Lcom/ning/http/client/multipart/Part;->CRLF_BYTES:[B

    .line 37
    const-string v0, "--"

    sget-object v1, Ljava/nio/charset/StandardCharsets;->US_ASCII:Ljava/nio/charset/Charset;

    invoke-virtual {v0, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    sput-object v0, Lcom/ning/http/client/multipart/Part;->EXTRA_BYTES:[B

    .line 42
    const-string v0, "Content-Disposition: "

    sget-object v1, Ljava/nio/charset/StandardCharsets;->US_ASCII:Ljava/nio/charset/Charset;

    invoke-virtual {v0, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    sput-object v0, Lcom/ning/http/client/multipart/Part;->CONTENT_DISPOSITION_BYTES:[B

    .line 47
    const-string v0, "form-data"

    sget-object v1, Ljava/nio/charset/StandardCharsets;->US_ASCII:Ljava/nio/charset/Charset;

    invoke-virtual {v0, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    sput-object v0, Lcom/ning/http/client/multipart/Part;->FORM_DATA_DISPOSITION_TYPE_BYTES:[B

    .line 52
    const-string v0, "; name="

    sget-object v1, Ljava/nio/charset/StandardCharsets;->US_ASCII:Ljava/nio/charset/Charset;

    invoke-virtual {v0, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    sput-object v0, Lcom/ning/http/client/multipart/Part;->NAME_BYTES:[B

    .line 57
    const-string v0, "Content-Type: "

    sget-object v1, Ljava/nio/charset/StandardCharsets;->US_ASCII:Ljava/nio/charset/Charset;

    invoke-virtual {v0, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    sput-object v0, Lcom/ning/http/client/multipart/Part;->CONTENT_TYPE_BYTES:[B

    .line 62
    const-string v0, "; charset="

    sget-object v1, Ljava/nio/charset/StandardCharsets;->US_ASCII:Ljava/nio/charset/Charset;

    invoke-virtual {v0, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    sput-object v0, Lcom/ning/http/client/multipart/Part;->CHARSET_BYTES:[B

    .line 67
    const-string v0, "Content-Transfer-Encoding: "

    sget-object v1, Ljava/nio/charset/StandardCharsets;->US_ASCII:Ljava/nio/charset/Charset;

    invoke-virtual {v0, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    sput-object v0, Lcom/ning/http/client/multipart/Part;->CONTENT_TRANSFER_ENCODING_BYTES:[B

    .line 72
    const-string v0, "Content-ID: "

    sget-object v1, Ljava/nio/charset/StandardCharsets;->US_ASCII:Ljava/nio/charset/Charset;

    invoke-virtual {v0, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    sput-object v0, Lcom/ning/http/client/multipart/Part;->CONTENT_ID_BYTES:[B

    return-void
.end method


# virtual methods
.method public abstract getCharset()Ljava/nio/charset/Charset;
.end method

.method public abstract getContentId()Ljava/lang/String;
.end method

.method public abstract getContentType()Ljava/lang/String;
.end method

.method public abstract getDispositionType()Ljava/lang/String;
.end method

.method public abstract getName()Ljava/lang/String;
.end method

.method public abstract getTransferEncoding()Ljava/lang/String;
.end method

.method public abstract length([B)J
.end method

.method public abstract write(Ljava/nio/channels/WritableByteChannel;[B)J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract write(Ljava/io/OutputStream;[B)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method
