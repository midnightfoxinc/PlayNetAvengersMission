.class public Lcom/ning/http/client/providers/jdk/ResponseBodyPart;
.super Lcom/ning/http/client/HttpResponseBodyPart;
.source "ResponseBodyPart.java"


# instance fields
.field private final chunk:[B


# direct methods
.method public constructor <init>([BZ)V
    .locals 0
    .param p1, "chunk"    # [B
    .param p2, "last"    # Z

    .prologue
    .line 29
    invoke-direct {p0, p2}, Lcom/ning/http/client/HttpResponseBodyPart;-><init>(Z)V

    .line 30
    iput-object p1, p0, Lcom/ning/http/client/providers/jdk/ResponseBodyPart;->chunk:[B

    .line 31
    return-void
.end method


# virtual methods
.method public getBodyByteBuffer()Ljava/nio/ByteBuffer;
    .locals 1

    .prologue
    .line 50
    iget-object v0, p0, Lcom/ning/http/client/providers/jdk/ResponseBodyPart;->chunk:[B

    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    return-object v0
.end method

.method public getBodyPartBytes()[B
    .locals 1

    .prologue
    .line 39
    iget-object v0, p0, Lcom/ning/http/client/providers/jdk/ResponseBodyPart;->chunk:[B

    return-object v0
.end method

.method public length()I
    .locals 1

    .prologue
    .line 55
    iget-object v0, p0, Lcom/ning/http/client/providers/jdk/ResponseBodyPart;->chunk:[B

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/ning/http/client/providers/jdk/ResponseBodyPart;->chunk:[B

    array-length v0, v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public writeTo(Ljava/io/OutputStream;)I
    .locals 1
    .param p1, "outputStream"    # Ljava/io/OutputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 44
    iget-object v0, p0, Lcom/ning/http/client/providers/jdk/ResponseBodyPart;->chunk:[B

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write([B)V

    .line 45
    iget-object v0, p0, Lcom/ning/http/client/providers/jdk/ResponseBodyPart;->chunk:[B

    array-length v0, v0

    return v0
.end method
