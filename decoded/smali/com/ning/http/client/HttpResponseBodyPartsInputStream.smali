.class public Lcom/ning/http/client/HttpResponseBodyPartsInputStream;
.super Ljava/io/InputStream;
.source "HttpResponseBodyPartsInputStream.java"


# instance fields
.field private active:[B

.field private available:I

.field private bytePos:I

.field private currentPos:I

.field private final parts:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/ning/http/client/HttpResponseBodyPart;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/ning/http/client/HttpResponseBodyPart;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "parts":Ljava/util/List;, "Ljava/util/List<Lcom/ning/http/client/HttpResponseBodyPart;>;"
    const/4 v1, 0x0

    .line 31
    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    .line 26
    iput v1, p0, Lcom/ning/http/client/HttpResponseBodyPartsInputStream;->currentPos:I

    .line 27
    const/4 v0, -0x1

    iput v0, p0, Lcom/ning/http/client/HttpResponseBodyPartsInputStream;->bytePos:I

    .line 29
    iput v1, p0, Lcom/ning/http/client/HttpResponseBodyPartsInputStream;->available:I

    .line 32
    iput-object p1, p0, Lcom/ning/http/client/HttpResponseBodyPartsInputStream;->parts:Ljava/util/List;

    .line 33
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/HttpResponseBodyPart;

    invoke-virtual {v0}, Lcom/ning/http/client/HttpResponseBodyPart;->getBodyPartBytes()[B

    move-result-object v0

    iput-object v0, p0, Lcom/ning/http/client/HttpResponseBodyPartsInputStream;->active:[B

    .line 34
    invoke-direct {p0, p1}, Lcom/ning/http/client/HttpResponseBodyPartsInputStream;->computeLength(Ljava/util/List;)V

    .line 35
    return-void
.end method

.method private computeLength(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/ning/http/client/HttpResponseBodyPart;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 38
    .local p1, "parts":Ljava/util/List;, "Ljava/util/List<Lcom/ning/http/client/HttpResponseBodyPart;>;"
    iget v2, p0, Lcom/ning/http/client/HttpResponseBodyPartsInputStream;->available:I

    if-nez v2, :cond_0

    .line 39
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/ning/http/client/HttpResponseBodyPart;

    .line 40
    .local v1, "p":Lcom/ning/http/client/HttpResponseBodyPart;
    iget v2, p0, Lcom/ning/http/client/HttpResponseBodyPartsInputStream;->available:I

    invoke-virtual {v1}, Lcom/ning/http/client/HttpResponseBodyPart;->getBodyPartBytes()[B

    move-result-object v3

    array-length v3, v3

    add-int/2addr v2, v3

    iput v2, p0, Lcom/ning/http/client/HttpResponseBodyPartsInputStream;->available:I

    goto :goto_0

    .line 43
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "p":Lcom/ning/http/client/HttpResponseBodyPart;
    :cond_0
    return-void
.end method


# virtual methods
.method public available()I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 47
    iget v0, p0, Lcom/ning/http/client/HttpResponseBodyPartsInputStream;->available:I

    return v0
.end method

.method public read()I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 52
    iget v0, p0, Lcom/ning/http/client/HttpResponseBodyPartsInputStream;->bytePos:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/ning/http/client/HttpResponseBodyPartsInputStream;->bytePos:I

    iget-object v1, p0, Lcom/ning/http/client/HttpResponseBodyPartsInputStream;->active:[B

    array-length v1, v1

    if-lt v0, v1, :cond_1

    .line 54
    iget v0, p0, Lcom/ning/http/client/HttpResponseBodyPartsInputStream;->currentPos:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/ning/http/client/HttpResponseBodyPartsInputStream;->currentPos:I

    iget-object v1, p0, Lcom/ning/http/client/HttpResponseBodyPartsInputStream;->parts:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-lt v0, v1, :cond_0

    .line 55
    const/4 v0, -0x1

    .line 62
    :goto_0
    return v0

    .line 58
    :cond_0
    const/4 v0, 0x0

    iput v0, p0, Lcom/ning/http/client/HttpResponseBodyPartsInputStream;->bytePos:I

    .line 59
    iget-object v0, p0, Lcom/ning/http/client/HttpResponseBodyPartsInputStream;->parts:Ljava/util/List;

    iget v1, p0, Lcom/ning/http/client/HttpResponseBodyPartsInputStream;->currentPos:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/HttpResponseBodyPart;

    invoke-virtual {v0}, Lcom/ning/http/client/HttpResponseBodyPart;->getBodyPartBytes()[B

    move-result-object v0

    iput-object v0, p0, Lcom/ning/http/client/HttpResponseBodyPartsInputStream;->active:[B

    .line 62
    :cond_1
    iget-object v0, p0, Lcom/ning/http/client/HttpResponseBodyPartsInputStream;->active:[B

    iget v1, p0, Lcom/ning/http/client/HttpResponseBodyPartsInputStream;->bytePos:I

    aget-byte v0, v0, v1

    and-int/lit16 v0, v0, 0xff

    goto :goto_0
.end method
