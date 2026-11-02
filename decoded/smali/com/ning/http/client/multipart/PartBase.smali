.class public abstract Lcom/ning/http/client/multipart/PartBase;
.super Ljava/lang/Object;
.source "PartBase.java"

# interfaces
.implements Lcom/ning/http/client/multipart/Part;


# instance fields
.field private final charset:Ljava/nio/charset/Charset;

.field private final contentId:Ljava/lang/String;

.field private final contentType:Ljava/lang/String;

.field private dispositionType:Ljava/lang/String;

.field private final name:Ljava/lang/String;

.field private final transferEncoding:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/nio/charset/Charset;Ljava/lang/String;)V
    .locals 6
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "contentType"    # Ljava/lang/String;
    .param p3, "charset"    # Ljava/nio/charset/Charset;
    .param p4, "contentId"    # Ljava/lang/String;

    .prologue
    .line 54
    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    invoke-direct/range {v0 .. v5}, Lcom/ning/http/client/multipart/PartBase;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/nio/charset/Charset;Ljava/lang/String;Ljava/lang/String;)V

    .line 55
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/nio/charset/Charset;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "contentType"    # Ljava/lang/String;
    .param p3, "charset"    # Ljava/nio/charset/Charset;
    .param p4, "contentId"    # Ljava/lang/String;
    .param p5, "transferEncoding"    # Ljava/lang/String;

    .prologue
    .line 66
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 67
    iput-object p1, p0, Lcom/ning/http/client/multipart/PartBase;->name:Ljava/lang/String;

    .line 68
    iput-object p2, p0, Lcom/ning/http/client/multipart/PartBase;->contentType:Ljava/lang/String;

    .line 69
    iput-object p3, p0, Lcom/ning/http/client/multipart/PartBase;->charset:Ljava/nio/charset/Charset;

    .line 70
    iput-object p4, p0, Lcom/ning/http/client/multipart/PartBase;->contentId:Ljava/lang/String;

    .line 71
    iput-object p5, p0, Lcom/ning/http/client/multipart/PartBase;->transferEncoding:Ljava/lang/String;

    .line 72
    return-void
.end method


# virtual methods
.method public getCharset()Ljava/nio/charset/Charset;
    .locals 1

    .prologue
    .line 213
    iget-object v0, p0, Lcom/ning/http/client/multipart/PartBase;->charset:Ljava/nio/charset/Charset;

    return-object v0
.end method

.method public getContentId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 223
    iget-object v0, p0, Lcom/ning/http/client/multipart/PartBase;->contentId:Ljava/lang/String;

    return-object v0
.end method

.method public getContentType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 208
    iget-object v0, p0, Lcom/ning/http/client/multipart/PartBase;->contentType:Ljava/lang/String;

    return-object v0
.end method

.method protected abstract getDataLength()J
.end method

.method public getDispositionType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 228
    iget-object v0, p0, Lcom/ning/http/client/multipart/PartBase;->dispositionType:Ljava/lang/String;

    return-object v0
.end method

.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 203
    iget-object v0, p0, Lcom/ning/http/client/multipart/PartBase;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getTransferEncoding()Ljava/lang/String;
    .locals 1

    .prologue
    .line 218
    iget-object v0, p0, Lcom/ning/http/client/multipart/PartBase;->transferEncoding:Ljava/lang/String;

    return-object v0
.end method

.method public length([B)J
    .locals 6
    .param p1, "boundary"    # [B

    .prologue
    .line 167
    invoke-virtual {p0}, Lcom/ning/http/client/multipart/PartBase;->getDataLength()J

    move-result-wide v0

    .line 170
    .local v0, "dataLength":J
    const-wide/16 v4, 0x0

    cmp-long v4, v0, v4

    if-gez v4, :cond_0

    .line 171
    const-wide/16 v4, -0x1

    .line 181
    :goto_0
    return-wide v4

    .line 173
    :cond_0
    :try_start_0
    new-instance v3, Lcom/ning/http/client/multipart/CounterPartVisitor;

    invoke-direct {v3}, Lcom/ning/http/client/multipart/CounterPartVisitor;-><init>()V

    .line 174
    .local v3, "visitor":Lcom/ning/http/client/multipart/CounterPartVisitor;
    invoke-virtual {p0, v3, p1}, Lcom/ning/http/client/multipart/PartBase;->visitStart(Lcom/ning/http/client/multipart/PartVisitor;[B)V

    .line 175
    invoke-virtual {p0, v3}, Lcom/ning/http/client/multipart/PartBase;->visitDispositionHeader(Lcom/ning/http/client/multipart/PartVisitor;)V

    .line 176
    invoke-virtual {p0, v3}, Lcom/ning/http/client/multipart/PartBase;->visitContentTypeHeader(Lcom/ning/http/client/multipart/PartVisitor;)V

    .line 177
    invoke-virtual {p0, v3}, Lcom/ning/http/client/multipart/PartBase;->visitTransferEncodingHeader(Lcom/ning/http/client/multipart/PartVisitor;)V

    .line 178
    invoke-virtual {p0, v3}, Lcom/ning/http/client/multipart/PartBase;->visitContentIdHeader(Lcom/ning/http/client/multipart/PartVisitor;)V

    .line 179
    invoke-virtual {p0, v3}, Lcom/ning/http/client/multipart/PartBase;->visitEndOfHeader(Lcom/ning/http/client/multipart/PartVisitor;)V

    .line 180
    invoke-virtual {p0, v3}, Lcom/ning/http/client/multipart/PartBase;->visitEnd(Lcom/ning/http/client/multipart/PartVisitor;)V

    .line 181
    invoke-virtual {v3}, Lcom/ning/http/client/multipart/CounterPartVisitor;->getCount()J
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-wide v4

    add-long/2addr v4, v0

    goto :goto_0

    .line 183
    .end local v3    # "visitor":Lcom/ning/http/client/multipart/CounterPartVisitor;
    :catch_0
    move-exception v2

    .line 185
    .local v2, "e":Ljava/io/IOException;
    new-instance v4, Ljava/lang/RuntimeException;

    const-string v5, "IOException while computing length, WTF"

    invoke-direct {v4, v5, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v4
.end method

.method protected abstract sendData(Ljava/io/OutputStream;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public setDispositionType(Ljava/lang/String;)V
    .locals 0
    .param p1, "dispositionType"    # Ljava/lang/String;

    .prologue
    .line 232
    iput-object p1, p0, Lcom/ning/http/client/multipart/PartBase;->dispositionType:Ljava/lang/String;

    .line 233
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 190
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " name="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/ning/http/client/multipart/PartBase;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " contentType="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/ning/http/client/multipart/PartBase;->getContentType()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " charset="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/ning/http/client/multipart/PartBase;->getCharset()Ljava/nio/charset/Charset;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " tranferEncoding="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/ning/http/client/multipart/PartBase;->getTransferEncoding()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " contentId="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/ning/http/client/multipart/PartBase;->getContentId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " dispositionType="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/ning/http/client/multipart/PartBase;->getDispositionType()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected visitContentIdHeader(Lcom/ning/http/client/multipart/PartVisitor;)V
    .locals 2
    .param p1, "visitor"    # Lcom/ning/http/client/multipart/PartVisitor;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 115
    invoke-virtual {p0}, Lcom/ning/http/client/multipart/PartBase;->getContentId()Ljava/lang/String;

    move-result-object v0

    .line 116
    .local v0, "contentId":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 117
    sget-object v1, Lcom/ning/http/client/multipart/PartBase;->CRLF_BYTES:[B

    invoke-interface {p1, v1}, Lcom/ning/http/client/multipart/PartVisitor;->withBytes([B)V

    .line 118
    sget-object v1, Lcom/ning/http/client/multipart/PartBase;->CONTENT_ID_BYTES:[B

    invoke-interface {p1, v1}, Lcom/ning/http/client/multipart/PartVisitor;->withBytes([B)V

    .line 119
    sget-object v1, Ljava/nio/charset/StandardCharsets;->US_ASCII:Ljava/nio/charset/Charset;

    invoke-virtual {v0, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v1

    invoke-interface {p1, v1}, Lcom/ning/http/client/multipart/PartVisitor;->withBytes([B)V

    .line 121
    :cond_0
    return-void
.end method

.method protected visitContentTypeHeader(Lcom/ning/http/client/multipart/PartVisitor;)V
    .locals 4
    .param p1, "visitor"    # Lcom/ning/http/client/multipart/PartVisitor;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 92
    invoke-virtual {p0}, Lcom/ning/http/client/multipart/PartBase;->getContentType()Ljava/lang/String;

    move-result-object v1

    .line 93
    .local v1, "contentType":Ljava/lang/String;
    if-eqz v1, :cond_0

    .line 94
    sget-object v2, Lcom/ning/http/client/multipart/PartBase;->CRLF_BYTES:[B

    invoke-interface {p1, v2}, Lcom/ning/http/client/multipart/PartVisitor;->withBytes([B)V

    .line 95
    sget-object v2, Lcom/ning/http/client/multipart/PartBase;->CONTENT_TYPE_BYTES:[B

    invoke-interface {p1, v2}, Lcom/ning/http/client/multipart/PartVisitor;->withBytes([B)V

    .line 96
    sget-object v2, Ljava/nio/charset/StandardCharsets;->US_ASCII:Ljava/nio/charset/Charset;

    invoke-virtual {v1, v2}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v2

    invoke-interface {p1, v2}, Lcom/ning/http/client/multipart/PartVisitor;->withBytes([B)V

    .line 97
    invoke-virtual {p0}, Lcom/ning/http/client/multipart/PartBase;->getCharset()Ljava/nio/charset/Charset;

    move-result-object v0

    .line 98
    .local v0, "charset":Ljava/nio/charset/Charset;
    if-eqz v0, :cond_0

    .line 99
    sget-object v2, Lcom/ning/http/client/multipart/PartBase;->CHARSET_BYTES:[B

    invoke-interface {p1, v2}, Lcom/ning/http/client/multipart/PartVisitor;->withBytes([B)V

    .line 100
    invoke-virtual {v0}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object v2

    sget-object v3, Ljava/nio/charset/StandardCharsets;->US_ASCII:Ljava/nio/charset/Charset;

    invoke-virtual {v2, v3}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v2

    invoke-interface {p1, v2}, Lcom/ning/http/client/multipart/PartVisitor;->withBytes([B)V

    .line 103
    .end local v0    # "charset":Ljava/nio/charset/Charset;
    :cond_0
    return-void
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

    .line 80
    sget-object v0, Lcom/ning/http/client/multipart/PartBase;->CRLF_BYTES:[B

    invoke-interface {p1, v0}, Lcom/ning/http/client/multipart/PartVisitor;->withBytes([B)V

    .line 81
    sget-object v0, Lcom/ning/http/client/multipart/PartBase;->CONTENT_DISPOSITION_BYTES:[B

    invoke-interface {p1, v0}, Lcom/ning/http/client/multipart/PartVisitor;->withBytes([B)V

    .line 82
    invoke-virtual {p0}, Lcom/ning/http/client/multipart/PartBase;->getDispositionType()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/ning/http/client/multipart/PartBase;->getDispositionType()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Ljava/nio/charset/StandardCharsets;->US_ASCII:Ljava/nio/charset/Charset;

    invoke-virtual {v0, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    :goto_0
    invoke-interface {p1, v0}, Lcom/ning/http/client/multipart/PartVisitor;->withBytes([B)V

    .line 83
    invoke-virtual {p0}, Lcom/ning/http/client/multipart/PartBase;->getName()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 84
    sget-object v0, Lcom/ning/http/client/multipart/PartBase;->NAME_BYTES:[B

    invoke-interface {p1, v0}, Lcom/ning/http/client/multipart/PartVisitor;->withBytes([B)V

    .line 85
    invoke-interface {p1, v2}, Lcom/ning/http/client/multipart/PartVisitor;->withByte(B)V

    .line 86
    invoke-virtual {p0}, Lcom/ning/http/client/multipart/PartBase;->getName()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Ljava/nio/charset/StandardCharsets;->US_ASCII:Ljava/nio/charset/Charset;

    invoke-virtual {v0, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    invoke-interface {p1, v0}, Lcom/ning/http/client/multipart/PartVisitor;->withBytes([B)V

    .line 87
    invoke-interface {p1, v2}, Lcom/ning/http/client/multipart/PartVisitor;->withByte(B)V

    .line 89
    :cond_0
    return-void

    .line 82
    :cond_1
    sget-object v0, Lcom/ning/http/client/multipart/PartBase;->FORM_DATA_DISPOSITION_TYPE_BYTES:[B

    goto :goto_0
.end method

.method protected visitEnd(Lcom/ning/http/client/multipart/PartVisitor;)V
    .locals 1
    .param p1, "visitor"    # Lcom/ning/http/client/multipart/PartVisitor;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 129
    sget-object v0, Lcom/ning/http/client/multipart/PartBase;->CRLF_BYTES:[B

    invoke-interface {p1, v0}, Lcom/ning/http/client/multipart/PartVisitor;->withBytes([B)V

    .line 130
    return-void
.end method

.method protected visitEndOfHeader(Lcom/ning/http/client/multipart/PartVisitor;)V
    .locals 1
    .param p1, "visitor"    # Lcom/ning/http/client/multipart/PartVisitor;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 124
    sget-object v0, Lcom/ning/http/client/multipart/PartBase;->CRLF_BYTES:[B

    invoke-interface {p1, v0}, Lcom/ning/http/client/multipart/PartVisitor;->withBytes([B)V

    .line 125
    sget-object v0, Lcom/ning/http/client/multipart/PartBase;->CRLF_BYTES:[B

    invoke-interface {p1, v0}, Lcom/ning/http/client/multipart/PartVisitor;->withBytes([B)V

    .line 126
    return-void
.end method

.method protected visitStart(Lcom/ning/http/client/multipart/PartVisitor;[B)V
    .locals 1
    .param p1, "visitor"    # Lcom/ning/http/client/multipart/PartVisitor;
    .param p2, "boundary"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 75
    sget-object v0, Lcom/ning/http/client/multipart/PartBase;->EXTRA_BYTES:[B

    invoke-interface {p1, v0}, Lcom/ning/http/client/multipart/PartVisitor;->withBytes([B)V

    .line 76
    invoke-interface {p1, p2}, Lcom/ning/http/client/multipart/PartVisitor;->withBytes([B)V

    .line 77
    return-void
.end method

.method protected visitTransferEncodingHeader(Lcom/ning/http/client/multipart/PartVisitor;)V
    .locals 2
    .param p1, "visitor"    # Lcom/ning/http/client/multipart/PartVisitor;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 106
    invoke-virtual {p0}, Lcom/ning/http/client/multipart/PartBase;->getTransferEncoding()Ljava/lang/String;

    move-result-object v0

    .line 107
    .local v0, "transferEncoding":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 108
    sget-object v1, Lcom/ning/http/client/multipart/PartBase;->CRLF_BYTES:[B

    invoke-interface {p1, v1}, Lcom/ning/http/client/multipart/PartVisitor;->withBytes([B)V

    .line 109
    sget-object v1, Lcom/ning/http/client/multipart/PartBase;->CONTENT_TRANSFER_ENCODING_BYTES:[B

    invoke-interface {p1, v1}, Lcom/ning/http/client/multipart/PartVisitor;->withBytes([B)V

    .line 110
    sget-object v1, Ljava/nio/charset/StandardCharsets;->US_ASCII:Ljava/nio/charset/Charset;

    invoke-virtual {v0, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v1

    invoke-interface {p1, v1}, Lcom/ning/http/client/multipart/PartVisitor;->withBytes([B)V

    .line 112
    :cond_0
    return-void
.end method

.method public write(Ljava/io/OutputStream;[B)V
    .locals 2
    .param p1, "out"    # Ljava/io/OutputStream;
    .param p2, "boundary"    # [B
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 148
    new-instance v0, Lcom/ning/http/client/multipart/OutputStreamPartVisitor;

    invoke-direct {v0, p1}, Lcom/ning/http/client/multipart/OutputStreamPartVisitor;-><init>(Ljava/io/OutputStream;)V

    .line 150
    .local v0, "visitor":Lcom/ning/http/client/multipart/OutputStreamPartVisitor;
    invoke-virtual {p0, v0, p2}, Lcom/ning/http/client/multipart/PartBase;->visitStart(Lcom/ning/http/client/multipart/PartVisitor;[B)V

    .line 151
    invoke-virtual {p0, v0}, Lcom/ning/http/client/multipart/PartBase;->visitDispositionHeader(Lcom/ning/http/client/multipart/PartVisitor;)V

    .line 152
    invoke-virtual {p0, v0}, Lcom/ning/http/client/multipart/PartBase;->visitContentTypeHeader(Lcom/ning/http/client/multipart/PartVisitor;)V

    .line 153
    invoke-virtual {p0, v0}, Lcom/ning/http/client/multipart/PartBase;->visitTransferEncodingHeader(Lcom/ning/http/client/multipart/PartVisitor;)V

    .line 154
    invoke-virtual {p0, v0}, Lcom/ning/http/client/multipart/PartBase;->visitContentIdHeader(Lcom/ning/http/client/multipart/PartVisitor;)V

    .line 155
    invoke-virtual {p0, v0}, Lcom/ning/http/client/multipart/PartBase;->visitEndOfHeader(Lcom/ning/http/client/multipart/PartVisitor;)V

    .line 156
    invoke-virtual {v0}, Lcom/ning/http/client/multipart/OutputStreamPartVisitor;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/ning/http/client/multipart/PartBase;->sendData(Ljava/io/OutputStream;)V

    .line 157
    invoke-virtual {p0, v0}, Lcom/ning/http/client/multipart/PartBase;->visitEnd(Lcom/ning/http/client/multipart/PartVisitor;)V

    .line 158
    return-void
.end method
