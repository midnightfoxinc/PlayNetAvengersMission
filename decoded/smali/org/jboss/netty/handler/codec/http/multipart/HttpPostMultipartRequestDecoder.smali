.class public Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;
.super Ljava/lang/Object;
.source "HttpPostMultipartRequestDecoder.java"

# interfaces
.implements Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpPostRequestDecoder;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder$1;
    }
.end annotation


# instance fields
.field private final bodyListHttpData:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;",
            ">;"
        }
    .end annotation
.end field

.field private bodyListHttpDataRank:I

.field private final bodyMapHttpData:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;",
            ">;>;"
        }
    .end annotation
.end field

.field private charset:Ljava/nio/charset/Charset;

.field private currentAttribute:Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

.field private currentFieldAttributes:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/jboss/netty/handler/codec/http/multipart/Attribute;",
            ">;"
        }
    .end annotation
.end field

.field private currentFileUpload:Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;

.field private currentStatus:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

.field private final factory:Lorg/jboss/netty/handler/codec/http/multipart/HttpDataFactory;

.field private isLastChunk:Z

.field private multipartDataBoundary:Ljava/lang/String;

.field private multipartMixedBoundary:Ljava/lang/String;

.field private final request:Lorg/jboss/netty/handler/codec/http/HttpRequest;

.field private undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;


# direct methods
.method public constructor <init>(Lorg/jboss/netty/handler/codec/http/HttpRequest;)V
    .locals 4
    .param p1, "request"    # Lorg/jboss/netty/handler/codec/http/HttpRequest;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;
        }
    .end annotation

    .prologue
    .line 124
    new-instance v0, Lorg/jboss/netty/handler/codec/http/multipart/DefaultHttpDataFactory;

    const-wide/16 v2, 0x4000

    invoke-direct {v0, v2, v3}, Lorg/jboss/netty/handler/codec/http/multipart/DefaultHttpDataFactory;-><init>(J)V

    sget-object v1, Lorg/jboss/netty/handler/codec/http/HttpConstants;->DEFAULT_CHARSET:Ljava/nio/charset/Charset;

    invoke-direct {p0, v0, p1, v1}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;-><init>(Lorg/jboss/netty/handler/codec/http/multipart/HttpDataFactory;Lorg/jboss/netty/handler/codec/http/HttpRequest;Ljava/nio/charset/Charset;)V

    .line 126
    return-void
.end method

.method public constructor <init>(Lorg/jboss/netty/handler/codec/http/multipart/HttpDataFactory;Lorg/jboss/netty/handler/codec/http/HttpRequest;)V
    .locals 1
    .param p1, "factory"    # Lorg/jboss/netty/handler/codec/http/multipart/HttpDataFactory;
    .param p2, "request"    # Lorg/jboss/netty/handler/codec/http/HttpRequest;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;
        }
    .end annotation

    .prologue
    .line 137
    sget-object v0, Lorg/jboss/netty/handler/codec/http/HttpConstants;->DEFAULT_CHARSET:Ljava/nio/charset/Charset;

    invoke-direct {p0, p1, p2, v0}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;-><init>(Lorg/jboss/netty/handler/codec/http/multipart/HttpDataFactory;Lorg/jboss/netty/handler/codec/http/HttpRequest;Ljava/nio/charset/Charset;)V

    .line 138
    return-void
.end method

.method public constructor <init>(Lorg/jboss/netty/handler/codec/http/multipart/HttpDataFactory;Lorg/jboss/netty/handler/codec/http/HttpRequest;Ljava/nio/charset/Charset;)V
    .locals 2
    .param p1, "factory"    # Lorg/jboss/netty/handler/codec/http/multipart/HttpDataFactory;
    .param p2, "request"    # Lorg/jboss/netty/handler/codec/http/HttpRequest;
    .param p3, "charset"    # Ljava/nio/charset/Charset;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;
        }
    .end annotation

    .prologue
    .line 149
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 68
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->bodyListHttpData:Ljava/util/List;

    .line 73
    new-instance v0, Ljava/util/TreeMap;

    sget-object v1, Lorg/jboss/netty/util/internal/CaseIgnoringComparator;->INSTANCE:Lorg/jboss/netty/util/internal/CaseIgnoringComparator;

    invoke-direct {v0, v1}, Ljava/util/TreeMap;-><init>(Ljava/util/Comparator;)V

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->bodyMapHttpData:Ljava/util/Map;

    .line 100
    sget-object v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;->NOTSTARTED:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->currentStatus:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    .line 150
    if-nez p1, :cond_0

    .line 151
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "factory"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 153
    :cond_0
    if-nez p2, :cond_1

    .line 154
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "request"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 156
    :cond_1
    if-nez p3, :cond_2

    .line 157
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "charset"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 159
    :cond_2
    iput-object p2, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->request:Lorg/jboss/netty/handler/codec/http/HttpRequest;

    .line 160
    iput-object p3, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->charset:Ljava/nio/charset/Charset;

    .line 161
    iput-object p1, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->factory:Lorg/jboss/netty/handler/codec/http/multipart/HttpDataFactory;

    .line 163
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->request:Lorg/jboss/netty/handler/codec/http/HttpRequest;

    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/HttpRequest;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v0

    const-string v1, "Content-Type"

    invoke-virtual {v0, v1}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->setMultipart(Ljava/lang/String;)V

    .line 164
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->request:Lorg/jboss/netty/handler/codec/http/HttpRequest;

    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/HttpRequest;->isChunked()Z

    move-result v0

    if-nez v0, :cond_3

    .line 165
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->request:Lorg/jboss/netty/handler/codec/http/HttpRequest;

    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/HttpRequest;->getContent()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 166
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->isLastChunk:Z

    .line 167
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->parseBody()V

    .line 169
    :cond_3
    return-void
.end method

.method private addHttpData(Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;)V
    .locals 3
    .param p1, "data"    # Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;

    .prologue
    .line 272
    if-nez p1, :cond_0

    .line 282
    :goto_0
    return-void

    .line 275
    :cond_0
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->bodyMapHttpData:Ljava/util/Map;

    invoke-interface {p1}, Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 276
    .local v0, "datas":Ljava/util/List;, "Ljava/util/List<Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;>;"
    if-nez v0, :cond_1

    .line 277
    new-instance v0, Ljava/util/ArrayList;

    .end local v0    # "datas":Ljava/util/List;, "Ljava/util/List<Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;>;"
    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 278
    .restart local v0    # "datas":Ljava/util/List;, "Ljava/util/List<Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;>;"
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->bodyMapHttpData:Ljava/util/Map;

    invoke-interface {p1}, Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 280
    :cond_1
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 281
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->bodyListHttpData:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method private cleanMixedAttributes()V
    .locals 2

    .prologue
    .line 792
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->currentFieldAttributes:Ljava/util/Map;

    const-string v1, "charset"

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 793
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->currentFieldAttributes:Ljava/util/Map;

    const-string v1, "Content-Length"

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 794
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->currentFieldAttributes:Ljava/util/Map;

    const-string v1, "Content-Transfer-Encoding"

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 795
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->currentFieldAttributes:Ljava/util/Map;

    const-string v1, "Content-Type"

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 796
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->currentFieldAttributes:Ljava/util/Map;

    const-string v1, "filename"

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 797
    return-void
.end method

.method private static cleanString(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p0, "field"    # Ljava/lang/String;

    .prologue
    const/16 v4, 0x20

    .line 1531
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 1532
    .local v2, "sb":Ljava/lang/StringBuilder;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v0, v3, :cond_6

    .line 1533
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 1534
    .local v1, "nextChar":C
    const/16 v3, 0x3a

    if-ne v1, v3, :cond_1

    .line 1535
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 1532
    :cond_0
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1536
    :cond_1
    const/16 v3, 0x2c

    if-ne v1, v3, :cond_2

    .line 1537
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 1538
    :cond_2
    const/16 v3, 0x3d

    if-ne v1, v3, :cond_3

    .line 1539
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 1540
    :cond_3
    const/16 v3, 0x3b

    if-ne v1, v3, :cond_4

    .line 1541
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 1542
    :cond_4
    const/16 v3, 0x9

    if-ne v1, v3, :cond_5

    .line 1543
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 1544
    :cond_5
    const/16 v3, 0x22

    if-eq v1, v3, :cond_0

    .line 1547
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 1550
    .end local v1    # "nextChar":C
    :cond_6
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method private decodeMultipart(Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;)Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;
    .locals 9
    .param p1, "state"    # Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    .line 322
    sget-object v6, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder$1;->$SwitchMap$org$jboss$netty$handler$codec$http$multipart$HttpPostRequestDecoder$MultiPartStatus:[I

    invoke-virtual {p1}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;->ordinal()I

    move-result v7

    aget v6, v6, v7

    packed-switch v6, :pswitch_data_0

    .line 412
    new-instance v5, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;

    const-string v6, "Shouldn\'t reach here."

    invoke-direct {v5, v6}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 324
    :pswitch_0
    new-instance v5, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;

    const-string v6, "Should not be called with the current status"

    invoke-direct {v5, v6}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 328
    :pswitch_1
    new-instance v5, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;

    const-string v6, "Should not be called with the current status"

    invoke-direct {v5, v6}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;-><init>(Ljava/lang/String;)V

    throw v5

    .line 332
    :pswitch_2
    iget-object v5, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->multipartDataBoundary:Ljava/lang/String;

    sget-object v6, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;->DISPOSITION:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    sget-object v7, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;->PREEPILOGUE:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    invoke-direct {p0, v5, v6, v7}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->findMultipartDelimiter(Ljava/lang/String;Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;)Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;

    move-result-object v2

    .line 410
    :goto_0
    return-object v2

    .line 345
    :pswitch_3
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->findMultipartDisposition()Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;

    move-result-object v2

    goto :goto_0

    .line 349
    :pswitch_4
    const/4 v3, 0x0

    .line 350
    .local v3, "localCharset":Ljava/nio/charset/Charset;
    iget-object v6, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->currentFieldAttributes:Ljava/util/Map;

    const-string v7, "charset"

    invoke-interface {v6, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    .line 352
    .local v0, "charsetAttribute":Lorg/jboss/netty/handler/codec/http/multipart/Attribute;
    if-eqz v0, :cond_0

    .line 354
    :try_start_0
    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/multipart/Attribute;->getValue()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 359
    :cond_0
    iget-object v6, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->currentFieldAttributes:Ljava/util/Map;

    const-string v7, "name"

    invoke-interface {v6, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    .line 361
    .local v4, "nameAttribute":Lorg/jboss/netty/handler/codec/http/multipart/Attribute;
    iget-object v6, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->currentAttribute:Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    if-nez v6, :cond_1

    .line 363
    :try_start_1
    iget-object v6, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->factory:Lorg/jboss/netty/handler/codec/http/multipart/HttpDataFactory;

    iget-object v7, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->request:Lorg/jboss/netty/handler/codec/http/HttpRequest;

    invoke-interface {v4}, Lorg/jboss/netty/handler/codec/http/multipart/Attribute;->getValue()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->cleanString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-interface {v6, v7, v8}, Lorg/jboss/netty/handler/codec/http/multipart/HttpDataFactory;->createAttribute(Lorg/jboss/netty/handler/codec/http/HttpRequest;Ljava/lang/String;)Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    move-result-object v6

    iput-object v6, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->currentAttribute:Lorg/jboss/netty/handler/codec/http/multipart/Attribute;
    :try_end_1
    .catch Ljava/lang/NullPointerException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_3

    .line 372
    if-eqz v3, :cond_1

    .line 373
    iget-object v6, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->currentAttribute:Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    invoke-interface {v6, v3}, Lorg/jboss/netty/handler/codec/http/multipart/Attribute;->setCharset(Ljava/nio/charset/Charset;)V

    .line 378
    :cond_1
    :try_start_2
    iget-object v6, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->multipartDataBoundary:Ljava/lang/String;

    invoke-direct {p0, v6}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->loadFieldMultipart(Ljava/lang/String;)V
    :try_end_2
    .catch Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$NotEnoughDataDecoderException; {:try_start_2 .. :try_end_2} :catch_4

    .line 382
    iget-object v2, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->currentAttribute:Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    .line 383
    .local v2, "finalAttribute":Lorg/jboss/netty/handler/codec/http/multipart/Attribute;
    iput-object v5, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->currentAttribute:Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    .line 384
    iput-object v5, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->currentFieldAttributes:Ljava/util/Map;

    .line 386
    sget-object v5, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;->HEADERDELIMITER:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    iput-object v5, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->currentStatus:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    goto :goto_0

    .line 355
    .end local v2    # "finalAttribute":Lorg/jboss/netty/handler/codec/http/multipart/Attribute;
    .end local v4    # "nameAttribute":Lorg/jboss/netty/handler/codec/http/multipart/Attribute;
    :catch_0
    move-exception v1

    .line 356
    .local v1, "e":Ljava/io/IOException;
    new-instance v5, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;

    invoke-direct {v5, v1}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;-><init>(Ljava/lang/Throwable;)V

    throw v5

    .line 365
    .end local v1    # "e":Ljava/io/IOException;
    .restart local v4    # "nameAttribute":Lorg/jboss/netty/handler/codec/http/multipart/Attribute;
    :catch_1
    move-exception v1

    .line 366
    .local v1, "e":Ljava/lang/NullPointerException;
    new-instance v5, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;

    invoke-direct {v5, v1}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;-><init>(Ljava/lang/Throwable;)V

    throw v5

    .line 367
    .end local v1    # "e":Ljava/lang/NullPointerException;
    :catch_2
    move-exception v1

    .line 368
    .local v1, "e":Ljava/lang/IllegalArgumentException;
    new-instance v5, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;

    invoke-direct {v5, v1}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;-><init>(Ljava/lang/Throwable;)V

    throw v5

    .line 369
    .end local v1    # "e":Ljava/lang/IllegalArgumentException;
    :catch_3
    move-exception v1

    .line 370
    .local v1, "e":Ljava/io/IOException;
    new-instance v5, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;

    invoke-direct {v5, v1}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;-><init>(Ljava/lang/Throwable;)V

    throw v5

    .line 379
    .end local v1    # "e":Ljava/io/IOException;
    :catch_4
    move-exception v1

    .local v1, "e":Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$NotEnoughDataDecoderException;
    move-object v2, v5

    .line 380
    goto :goto_0

    .line 391
    .end local v0    # "charsetAttribute":Lorg/jboss/netty/handler/codec/http/multipart/Attribute;
    .end local v1    # "e":Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$NotEnoughDataDecoderException;
    .end local v3    # "localCharset":Ljava/nio/charset/Charset;
    .end local v4    # "nameAttribute":Lorg/jboss/netty/handler/codec/http/multipart/Attribute;
    :pswitch_5
    iget-object v5, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->multipartDataBoundary:Ljava/lang/String;

    invoke-direct {p0, v5}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->getFileUpload(Ljava/lang/String;)Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;

    move-result-object v2

    goto :goto_0

    .line 396
    :pswitch_6
    iget-object v5, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->multipartMixedBoundary:Ljava/lang/String;

    sget-object v6, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;->MIXEDDISPOSITION:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    sget-object v7, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;->HEADERDELIMITER:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    invoke-direct {p0, v5, v6, v7}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->findMultipartDelimiter(Ljava/lang/String;Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;)Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;

    move-result-object v2

    goto/16 :goto_0

    .line 401
    :pswitch_7
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->findMultipartDisposition()Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;

    move-result-object v2

    goto/16 :goto_0

    .line 405
    :pswitch_8
    iget-object v5, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->multipartMixedBoundary:Ljava/lang/String;

    invoke-direct {p0, v5}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->getFileUpload(Ljava/lang/String;)Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;

    move-result-object v2

    goto/16 :goto_0

    :pswitch_9
    move-object v2, v5

    .line 408
    goto/16 :goto_0

    :pswitch_a
    move-object v2, v5

    .line 410
    goto/16 :goto_0

    .line 322
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_9
        :pswitch_a
    .end packed-switch
.end method

.method private findMultipartDelimiter(Ljava/lang/String;Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;)Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;
    .locals 7
    .param p1, "delimiter"    # Ljava/lang/String;
    .param p2, "dispositionStatus"    # Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;
    .param p3, "closeDelimiterStatus"    # Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 465
    iget-object v5, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v5}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v3

    .line 467
    .local v3, "readerIndex":I
    :try_start_0
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->skipControlCharacters()V
    :try_end_0
    .catch Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$NotEnoughDataDecoderException; {:try_start_0 .. :try_end_0} :catch_0

    .line 472
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->skipOneLine()Z

    .line 475
    :try_start_1
    invoke-direct {p0, p1}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->readDelimiter(Ljava/lang/String;)Ljava/lang/String;
    :try_end_1
    .catch Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$NotEnoughDataDecoderException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v2

    .line 480
    .local v2, "newline":Ljava/lang/String;
    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 481
    iput-object p2, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->currentStatus:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    .line 482
    invoke-direct {p0, p2}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->decodeMultipart(Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;)Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;

    move-result-object v4

    .line 493
    .end local v2    # "newline":Ljava/lang/String;
    :cond_0
    :goto_0
    return-object v4

    .line 468
    :catch_0
    move-exception v1

    .line 469
    .local v1, "e1":Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$NotEnoughDataDecoderException;
    iget-object v5, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v5, v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex(I)V

    goto :goto_0

    .line 476
    .end local v1    # "e1":Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$NotEnoughDataDecoderException;
    :catch_1
    move-exception v0

    .line 477
    .local v0, "e":Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$NotEnoughDataDecoderException;
    iget-object v5, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v5, v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex(I)V

    goto :goto_0

    .line 484
    .end local v0    # "e":Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$NotEnoughDataDecoderException;
    .restart local v2    # "newline":Ljava/lang/String;
    :cond_1
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "--"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 486
    iput-object p3, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->currentStatus:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    .line 487
    iget-object v5, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->currentStatus:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    sget-object v6, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;->HEADERDELIMITER:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    if-ne v5, v6, :cond_0

    .line 490
    iput-object v4, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->currentFieldAttributes:Ljava/util/Map;

    .line 491
    sget-object v4, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;->HEADERDELIMITER:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    invoke-direct {p0, v4}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->decodeMultipart(Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;)Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;

    move-result-object v4

    goto :goto_0

    .line 495
    :cond_2
    iget-object v4, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v4, v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex(I)V

    .line 496
    new-instance v4, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;

    const-string v5, "No Multipart delimiter found"

    invoke-direct {v4, v5}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;-><init>(Ljava/lang/String;)V

    throw v4
.end method

.method private findMultipartDisposition()Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;
    .locals 15
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;
        }
    .end annotation

    .prologue
    .line 506
    iget-object v11, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v11}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v8

    .line 507
    .local v8, "readerIndex":I
    iget-object v11, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->currentStatus:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    sget-object v12, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;->DISPOSITION:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    if-ne v11, v12, :cond_0

    .line 508
    new-instance v11, Ljava/util/TreeMap;

    sget-object v12, Lorg/jboss/netty/util/internal/CaseIgnoringComparator;->INSTANCE:Lorg/jboss/netty/util/internal/CaseIgnoringComparator;

    invoke-direct {v11, v12}, Ljava/util/TreeMap;-><init>(Ljava/util/Comparator;)V

    iput-object v11, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->currentFieldAttributes:Ljava/util/Map;

    .line 512
    :cond_0
    :goto_0
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->skipOneLine()Z

    move-result v11

    if-nez v11, :cond_c

    .line 515
    :try_start_0
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->skipControlCharacters()V

    .line 516
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->readLine()Ljava/lang/String;
    :try_end_0
    .catch Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$NotEnoughDataDecoderException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v7

    .line 521
    .local v7, "newline":Ljava/lang/String;
    invoke-static {v7}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->splitMultipartHeader(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 522
    .local v2, "contents":[Ljava/lang/String;
    const/4 v11, 0x0

    aget-object v11, v2, v11

    const-string v12, "Content-Disposition"

    invoke-virtual {v11, v12}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_5

    .line 524
    iget-object v11, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->currentStatus:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    sget-object v12, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;->DISPOSITION:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    if-ne v11, v12, :cond_1

    .line 525
    const/4 v11, 0x1

    aget-object v11, v2, v11

    const-string v12, "form-data"

    invoke-virtual {v11, v12}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    .line 533
    .local v1, "checkSecondArg":Z
    :goto_1
    if-eqz v1, :cond_0

    .line 535
    const/4 v5, 0x2

    .local v5, "i":I
    :goto_2
    array-length v11, v2

    if-ge v5, v11, :cond_0

    .line 536
    aget-object v11, v2, v5

    const/16 v12, 0x3d

    const/4 v13, 0x2

    invoke-static {v11, v12, v13}, Lorg/jboss/netty/util/internal/StringUtil;->split(Ljava/lang/String;CI)[Ljava/lang/String;

    move-result-object v10

    .line 539
    .local v10, "values":[Ljava/lang/String;
    const/4 v11, 0x0

    :try_start_1
    aget-object v11, v10, v11

    invoke-static {v11}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->cleanString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 540
    .local v6, "name":Ljava/lang/String;
    const/4 v11, 0x1

    aget-object v9, v10, v11

    .line 543
    .local v9, "value":Ljava/lang/String;
    const-string v11, "filename"

    invoke-virtual {v11, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_4

    .line 545
    const/4 v11, 0x1

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v12

    add-int/lit8 v12, v12, -0x1

    invoke-virtual {v9, v11, v12}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v9

    .line 550
    :goto_3
    iget-object v11, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->factory:Lorg/jboss/netty/handler/codec/http/multipart/HttpDataFactory;

    iget-object v12, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->request:Lorg/jboss/netty/handler/codec/http/HttpRequest;

    invoke-interface {v11, v12, v6, v9}, Lorg/jboss/netty/handler/codec/http/multipart/HttpDataFactory;->createAttribute(Lorg/jboss/netty/handler/codec/http/HttpRequest;Ljava/lang/String;Ljava/lang/String;)Lorg/jboss/netty/handler/codec/http/multipart/Attribute;
    :try_end_1
    .catch Ljava/lang/NullPointerException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_2

    move-result-object v0

    .line 556
    .local v0, "attribute":Lorg/jboss/netty/handler/codec/http/multipart/Attribute;
    iget-object v11, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->currentFieldAttributes:Ljava/util/Map;

    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/multipart/Attribute;->getName()Ljava/lang/String;

    move-result-object v12

    invoke-interface {v11, v12, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 535
    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    .line 517
    .end local v0    # "attribute":Lorg/jboss/netty/handler/codec/http/multipart/Attribute;
    .end local v1    # "checkSecondArg":Z
    .end local v2    # "contents":[Ljava/lang/String;
    .end local v5    # "i":I
    .end local v6    # "name":Ljava/lang/String;
    .end local v7    # "newline":Ljava/lang/String;
    .end local v9    # "value":Ljava/lang/String;
    .end local v10    # "values":[Ljava/lang/String;
    :catch_0
    move-exception v3

    .line 518
    .local v3, "e":Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$NotEnoughDataDecoderException;
    iget-object v11, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v11, v8}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex(I)V

    .line 519
    const/4 v11, 0x0

    .line 657
    .end local v3    # "e":Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$NotEnoughDataDecoderException;
    :goto_4
    return-object v11

    .line 528
    .restart local v2    # "contents":[Ljava/lang/String;
    .restart local v7    # "newline":Ljava/lang/String;
    :cond_1
    const/4 v11, 0x1

    aget-object v11, v2, v11

    const-string v12, "attachment"

    invoke-virtual {v11, v12}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v11

    if-nez v11, :cond_2

    const/4 v11, 0x1

    aget-object v11, v2, v11

    const-string v12, "file"

    invoke-virtual {v11, v12}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_3

    :cond_2
    const/4 v1, 0x1

    .restart local v1    # "checkSecondArg":Z
    :goto_5
    goto :goto_1

    .end local v1    # "checkSecondArg":Z
    :cond_3
    const/4 v1, 0x0

    goto :goto_5

    .line 548
    .restart local v1    # "checkSecondArg":Z
    .restart local v5    # "i":I
    .restart local v6    # "name":Ljava/lang/String;
    .restart local v9    # "value":Ljava/lang/String;
    .restart local v10    # "values":[Ljava/lang/String;
    :cond_4
    :try_start_2
    invoke-static {v9}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->cleanString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_2
    .catch Ljava/lang/NullPointerException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_2 .. :try_end_2} :catch_2

    move-result-object v9

    goto :goto_3

    .line 551
    .end local v6    # "name":Ljava/lang/String;
    .end local v9    # "value":Ljava/lang/String;
    :catch_1
    move-exception v3

    .line 552
    .local v3, "e":Ljava/lang/NullPointerException;
    new-instance v11, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;

    invoke-direct {v11, v3}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;-><init>(Ljava/lang/Throwable;)V

    throw v11

    .line 553
    .end local v3    # "e":Ljava/lang/NullPointerException;
    :catch_2
    move-exception v3

    .line 554
    .local v3, "e":Ljava/lang/IllegalArgumentException;
    new-instance v11, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;

    invoke-direct {v11, v3}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;-><init>(Ljava/lang/Throwable;)V

    throw v11

    .line 560
    .end local v1    # "checkSecondArg":Z
    .end local v3    # "e":Ljava/lang/IllegalArgumentException;
    .end local v5    # "i":I
    .end local v10    # "values":[Ljava/lang/String;
    :cond_5
    const/4 v11, 0x0

    aget-object v11, v2, v11

    const-string v12, "Content-Transfer-Encoding"

    invoke-virtual {v11, v12}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_6

    .line 564
    :try_start_3
    iget-object v11, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->factory:Lorg/jboss/netty/handler/codec/http/multipart/HttpDataFactory;

    iget-object v12, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->request:Lorg/jboss/netty/handler/codec/http/HttpRequest;

    const-string v13, "Content-Transfer-Encoding"

    const/4 v14, 0x1

    aget-object v14, v2, v14

    invoke-static {v14}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->cleanString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-interface {v11, v12, v13, v14}, Lorg/jboss/netty/handler/codec/http/multipart/HttpDataFactory;->createAttribute(Lorg/jboss/netty/handler/codec/http/HttpRequest;Ljava/lang/String;Ljava/lang/String;)Lorg/jboss/netty/handler/codec/http/multipart/Attribute;
    :try_end_3
    .catch Ljava/lang/NullPointerException; {:try_start_3 .. :try_end_3} :catch_3
    .catch Ljava/lang/IllegalArgumentException; {:try_start_3 .. :try_end_3} :catch_4

    move-result-object v0

    .line 572
    .restart local v0    # "attribute":Lorg/jboss/netty/handler/codec/http/multipart/Attribute;
    iget-object v11, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->currentFieldAttributes:Ljava/util/Map;

    const-string v12, "Content-Transfer-Encoding"

    invoke-interface {v11, v12, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_0

    .line 567
    .end local v0    # "attribute":Lorg/jboss/netty/handler/codec/http/multipart/Attribute;
    :catch_3
    move-exception v3

    .line 568
    .local v3, "e":Ljava/lang/NullPointerException;
    new-instance v11, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;

    invoke-direct {v11, v3}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;-><init>(Ljava/lang/Throwable;)V

    throw v11

    .line 569
    .end local v3    # "e":Ljava/lang/NullPointerException;
    :catch_4
    move-exception v3

    .line 570
    .local v3, "e":Ljava/lang/IllegalArgumentException;
    new-instance v11, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;

    invoke-direct {v11, v3}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;-><init>(Ljava/lang/Throwable;)V

    throw v11

    .line 574
    .end local v3    # "e":Ljava/lang/IllegalArgumentException;
    :cond_6
    const/4 v11, 0x0

    aget-object v11, v2, v11

    const-string v12, "Content-Length"

    invoke-virtual {v11, v12}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_7

    .line 578
    :try_start_4
    iget-object v11, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->factory:Lorg/jboss/netty/handler/codec/http/multipart/HttpDataFactory;

    iget-object v12, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->request:Lorg/jboss/netty/handler/codec/http/HttpRequest;

    const-string v13, "Content-Length"

    const/4 v14, 0x1

    aget-object v14, v2, v14

    invoke-static {v14}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->cleanString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-interface {v11, v12, v13, v14}, Lorg/jboss/netty/handler/codec/http/multipart/HttpDataFactory;->createAttribute(Lorg/jboss/netty/handler/codec/http/HttpRequest;Ljava/lang/String;Ljava/lang/String;)Lorg/jboss/netty/handler/codec/http/multipart/Attribute;
    :try_end_4
    .catch Ljava/lang/NullPointerException; {:try_start_4 .. :try_end_4} :catch_5
    .catch Ljava/lang/IllegalArgumentException; {:try_start_4 .. :try_end_4} :catch_6

    move-result-object v0

    .line 586
    .restart local v0    # "attribute":Lorg/jboss/netty/handler/codec/http/multipart/Attribute;
    iget-object v11, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->currentFieldAttributes:Ljava/util/Map;

    const-string v12, "Content-Length"

    invoke-interface {v11, v12, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_0

    .line 581
    .end local v0    # "attribute":Lorg/jboss/netty/handler/codec/http/multipart/Attribute;
    :catch_5
    move-exception v3

    .line 582
    .local v3, "e":Ljava/lang/NullPointerException;
    new-instance v11, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;

    invoke-direct {v11, v3}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;-><init>(Ljava/lang/Throwable;)V

    throw v11

    .line 583
    .end local v3    # "e":Ljava/lang/NullPointerException;
    :catch_6
    move-exception v3

    .line 584
    .local v3, "e":Ljava/lang/IllegalArgumentException;
    new-instance v11, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;

    invoke-direct {v11, v3}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;-><init>(Ljava/lang/Throwable;)V

    throw v11

    .line 588
    .end local v3    # "e":Ljava/lang/IllegalArgumentException;
    :cond_7
    const/4 v11, 0x0

    aget-object v11, v2, v11

    const-string v12, "Content-Type"

    invoke-virtual {v11, v12}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_b

    .line 590
    const/4 v11, 0x1

    aget-object v11, v2, v11

    const-string v12, "multipart/mixed"

    invoke-virtual {v11, v12}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_9

    .line 591
    iget-object v11, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->currentStatus:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    sget-object v12, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;->DISPOSITION:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    if-ne v11, v12, :cond_8

    .line 592
    const/4 v11, 0x2

    aget-object v11, v2, v11

    const/16 v12, 0x3d

    invoke-static {v11, v12}, Lorg/jboss/netty/util/internal/StringUtil;->substringAfter(Ljava/lang/String;C)Ljava/lang/String;

    move-result-object v10

    .line 593
    .local v10, "values":Ljava/lang/String;
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "--"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    iput-object v11, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->multipartMixedBoundary:Ljava/lang/String;

    .line 594
    sget-object v11, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;->MIXEDDELIMITER:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    iput-object v11, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->currentStatus:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    .line 595
    sget-object v11, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;->MIXEDDELIMITER:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    invoke-direct {p0, v11}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->decodeMultipart(Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;)Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;

    move-result-object v11

    goto/16 :goto_4

    .line 597
    .end local v10    # "values":Ljava/lang/String;
    :cond_8
    new-instance v11, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;

    const-string v12, "Mixed Multipart found in a previous Mixed Multipart"

    invoke-direct {v11, v12}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 601
    :cond_9
    const/4 v5, 0x1

    .restart local v5    # "i":I
    :goto_6
    array-length v11, v2

    if-ge v5, v11, :cond_0

    .line 602
    aget-object v11, v2, v5

    invoke-virtual {v11}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v11

    const-string v12, "charset"

    invoke-virtual {v11, v12}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_a

    .line 604
    aget-object v11, v2, v5

    const/16 v12, 0x3d

    invoke-static {v11, v12}, Lorg/jboss/netty/util/internal/StringUtil;->substringAfter(Ljava/lang/String;C)Ljava/lang/String;

    move-result-object v10

    .line 607
    .restart local v10    # "values":Ljava/lang/String;
    :try_start_5
    iget-object v11, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->factory:Lorg/jboss/netty/handler/codec/http/multipart/HttpDataFactory;

    iget-object v12, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->request:Lorg/jboss/netty/handler/codec/http/HttpRequest;

    const-string v13, "charset"

    invoke-static {v10}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->cleanString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-interface {v11, v12, v13, v14}, Lorg/jboss/netty/handler/codec/http/multipart/HttpDataFactory;->createAttribute(Lorg/jboss/netty/handler/codec/http/HttpRequest;Ljava/lang/String;Ljava/lang/String;)Lorg/jboss/netty/handler/codec/http/multipart/Attribute;
    :try_end_5
    .catch Ljava/lang/NullPointerException; {:try_start_5 .. :try_end_5} :catch_7
    .catch Ljava/lang/IllegalArgumentException; {:try_start_5 .. :try_end_5} :catch_8

    move-result-object v0

    .line 615
    .restart local v0    # "attribute":Lorg/jboss/netty/handler/codec/http/multipart/Attribute;
    iget-object v11, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->currentFieldAttributes:Ljava/util/Map;

    const-string v12, "charset"

    invoke-interface {v11, v12, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 601
    .end local v10    # "values":Ljava/lang/String;
    :goto_7
    add-int/lit8 v5, v5, 0x1

    goto :goto_6

    .line 610
    .end local v0    # "attribute":Lorg/jboss/netty/handler/codec/http/multipart/Attribute;
    .restart local v10    # "values":Ljava/lang/String;
    :catch_7
    move-exception v3

    .line 611
    .local v3, "e":Ljava/lang/NullPointerException;
    new-instance v11, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;

    invoke-direct {v11, v3}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;-><init>(Ljava/lang/Throwable;)V

    throw v11

    .line 612
    .end local v3    # "e":Ljava/lang/NullPointerException;
    :catch_8
    move-exception v3

    .line 613
    .local v3, "e":Ljava/lang/IllegalArgumentException;
    new-instance v11, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;

    invoke-direct {v11, v3}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;-><init>(Ljava/lang/Throwable;)V

    throw v11

    .line 620
    .end local v3    # "e":Ljava/lang/IllegalArgumentException;
    .end local v10    # "values":Ljava/lang/String;
    :cond_a
    :try_start_6
    iget-object v11, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->factory:Lorg/jboss/netty/handler/codec/http/multipart/HttpDataFactory;

    iget-object v12, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->request:Lorg/jboss/netty/handler/codec/http/HttpRequest;

    const/4 v13, 0x0

    aget-object v13, v2, v13

    invoke-static {v13}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->cleanString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    aget-object v14, v2, v5

    invoke-interface {v11, v12, v13, v14}, Lorg/jboss/netty/handler/codec/http/multipart/HttpDataFactory;->createAttribute(Lorg/jboss/netty/handler/codec/http/HttpRequest;Ljava/lang/String;Ljava/lang/String;)Lorg/jboss/netty/handler/codec/http/multipart/Attribute;
    :try_end_6
    .catch Ljava/lang/NullPointerException; {:try_start_6 .. :try_end_6} :catch_9
    .catch Ljava/lang/IllegalArgumentException; {:try_start_6 .. :try_end_6} :catch_a

    move-result-object v0

    .line 627
    .restart local v0    # "attribute":Lorg/jboss/netty/handler/codec/http/multipart/Attribute;
    iget-object v11, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->currentFieldAttributes:Ljava/util/Map;

    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/multipart/Attribute;->getName()Ljava/lang/String;

    move-result-object v12

    invoke-interface {v11, v12, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_7

    .line 622
    .end local v0    # "attribute":Lorg/jboss/netty/handler/codec/http/multipart/Attribute;
    :catch_9
    move-exception v3

    .line 623
    .local v3, "e":Ljava/lang/NullPointerException;
    new-instance v11, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;

    invoke-direct {v11, v3}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;-><init>(Ljava/lang/Throwable;)V

    throw v11

    .line 624
    .end local v3    # "e":Ljava/lang/NullPointerException;
    :catch_a
    move-exception v3

    .line 625
    .local v3, "e":Ljava/lang/IllegalArgumentException;
    new-instance v11, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;

    invoke-direct {v11, v3}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;-><init>(Ljava/lang/Throwable;)V

    throw v11

    .line 633
    .end local v3    # "e":Ljava/lang/IllegalArgumentException;
    .end local v5    # "i":I
    :cond_b
    new-instance v11, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Unknown Params: "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v11, v12}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;-><init>(Ljava/lang/String;)V

    throw v11

    .line 638
    .end local v2    # "contents":[Ljava/lang/String;
    .end local v7    # "newline":Ljava/lang/String;
    :cond_c
    iget-object v11, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->currentFieldAttributes:Ljava/util/Map;

    const-string v12, "filename"

    invoke-interface {v11, v12}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    .line 640
    .local v4, "filenameAttribute":Lorg/jboss/netty/handler/codec/http/multipart/Attribute;
    iget-object v11, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->currentStatus:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    sget-object v12, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;->DISPOSITION:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    if-ne v11, v12, :cond_e

    .line 641
    if-eqz v4, :cond_d

    .line 643
    sget-object v11, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;->FILEUPLOAD:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    iput-object v11, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->currentStatus:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    .line 645
    sget-object v11, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;->FILEUPLOAD:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    invoke-direct {p0, v11}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->decodeMultipart(Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;)Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;

    move-result-object v11

    goto/16 :goto_4

    .line 648
    :cond_d
    sget-object v11, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;->FIELD:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    iput-object v11, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->currentStatus:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    .line 650
    sget-object v11, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;->FIELD:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    invoke-direct {p0, v11}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->decodeMultipart(Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;)Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;

    move-result-object v11

    goto/16 :goto_4

    .line 653
    :cond_e
    if-eqz v4, :cond_f

    .line 655
    sget-object v11, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;->MIXEDFILEUPLOAD:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    iput-object v11, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->currentStatus:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    .line 657
    sget-object v11, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;->MIXEDFILEUPLOAD:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    invoke-direct {p0, v11}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->decodeMultipart(Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;)Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;

    move-result-object v11

    goto/16 :goto_4

    .line 660
    :cond_f
    new-instance v11, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;

    const-string v12, "Filename not found"

    invoke-direct {v11, v12}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;-><init>(Ljava/lang/String;)V

    throw v11
.end method

.method private getFileUpload(Ljava/lang/String;)Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;
    .locals 21
    .param p1, "delimiter"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;
        }
    .end annotation

    .prologue
    .line 675
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->currentFieldAttributes:Ljava/util/Map;

    const-string v4, "Content-Transfer-Encoding"

    invoke-interface {v3, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    .line 677
    .local v15, "encoding":Lorg/jboss/netty/handler/codec/http/multipart/Attribute;
    move-object/from16 v0, p0

    iget-object v9, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->charset:Ljava/nio/charset/Charset;

    .line 679
    .local v9, "localCharset":Ljava/nio/charset/Charset;
    sget-object v19, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$TransferEncodingMechanism;->BIT7:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$TransferEncodingMechanism;

    .line 680
    .local v19, "mechanism":Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$TransferEncodingMechanism;
    if-eqz v15, :cond_0

    .line 683
    :try_start_0
    invoke-interface {v15}, Lorg/jboss/netty/handler/codec/http/multipart/Attribute;->getValue()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v12

    .line 687
    .local v12, "code":Ljava/lang/String;
    sget-object v3, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$TransferEncodingMechanism;->BIT7:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$TransferEncodingMechanism;

    invoke-virtual {v3}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$TransferEncodingMechanism;->value()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v12, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 688
    sget-object v9, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil;->US_ASCII:Ljava/nio/charset/Charset;

    .line 701
    .end local v12    # "code":Ljava/lang/String;
    :cond_0
    :goto_0
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->currentFieldAttributes:Ljava/util/Map;

    const-string v4, "charset"

    invoke-interface {v3, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    .line 703
    .local v2, "charsetAttribute":Lorg/jboss/netty/handler/codec/http/multipart/Attribute;
    if-eqz v2, :cond_1

    .line 705
    :try_start_1
    invoke-interface {v2}, Lorg/jboss/netty/handler/codec/http/multipart/Attribute;->getValue()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v9

    .line 710
    :cond_1
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->currentFileUpload:Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;

    if-nez v3, :cond_3

    .line 711
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->currentFieldAttributes:Ljava/util/Map;

    const-string v4, "filename"

    invoke-interface {v3, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    .line 713
    .local v17, "filenameAttribute":Lorg/jboss/netty/handler/codec/http/multipart/Attribute;
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->currentFieldAttributes:Ljava/util/Map;

    const-string v4, "name"

    invoke-interface {v3, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    .line 715
    .local v20, "nameAttribute":Lorg/jboss/netty/handler/codec/http/multipart/Attribute;
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->currentFieldAttributes:Ljava/util/Map;

    const-string v4, "Content-Type"

    invoke-interface {v3, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    .line 717
    .local v13, "contentTypeAttribute":Lorg/jboss/netty/handler/codec/http/multipart/Attribute;
    if-nez v13, :cond_2

    .line 719
    new-instance v13, Lorg/jboss/netty/handler/codec/http/multipart/MemoryAttribute;

    .end local v13    # "contentTypeAttribute":Lorg/jboss/netty/handler/codec/http/multipart/Attribute;
    const-string v3, "Content-Type"

    invoke-direct {v13, v3}, Lorg/jboss/netty/handler/codec/http/multipart/MemoryAttribute;-><init>(Ljava/lang/String;)V

    .line 721
    .restart local v13    # "contentTypeAttribute":Lorg/jboss/netty/handler/codec/http/multipart/Attribute;
    :try_start_2
    const-string v3, "application/octet-stream"

    invoke-interface {v13, v3}, Lorg/jboss/netty/handler/codec/http/multipart/Attribute;->setValue(Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2

    .line 727
    :cond_2
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->currentFieldAttributes:Ljava/util/Map;

    const-string v4, "Content-Length"

    invoke-interface {v3, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    .line 731
    .local v18, "lengthAttribute":Lorg/jboss/netty/handler/codec/http/multipart/Attribute;
    if-eqz v18, :cond_7

    :try_start_3
    invoke-interface/range {v18 .. v18}, Lorg/jboss/netty/handler/codec/http/multipart/Attribute;->getValue()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_3
    .catch Ljava/lang/NumberFormatException; {:try_start_3 .. :try_end_3} :catch_4

    move-result-wide v10

    .line 739
    .local v10, "size":J
    :goto_1
    :try_start_4
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->factory:Lorg/jboss/netty/handler/codec/http/multipart/HttpDataFactory;

    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->request:Lorg/jboss/netty/handler/codec/http/HttpRequest;

    invoke-interface/range {v20 .. v20}, Lorg/jboss/netty/handler/codec/http/multipart/Attribute;->getValue()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->cleanString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-interface/range {v17 .. v17}, Lorg/jboss/netty/handler/codec/http/multipart/Attribute;->getValue()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->cleanString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v13}, Lorg/jboss/netty/handler/codec/http/multipart/Attribute;->getValue()Ljava/lang/String;

    move-result-object v7

    invoke-virtual/range {v19 .. v19}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$TransferEncodingMechanism;->value()Ljava/lang/String;

    move-result-object v8

    invoke-interface/range {v3 .. v11}, Lorg/jboss/netty/handler/codec/http/multipart/HttpDataFactory;->createFileUpload(Lorg/jboss/netty/handler/codec/http/HttpRequest;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/nio/charset/Charset;J)Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;

    move-result-object v3

    move-object/from16 v0, p0

    iput-object v3, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->currentFileUpload:Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;
    :try_end_4
    .catch Ljava/lang/NullPointerException; {:try_start_4 .. :try_end_4} :catch_5
    .catch Ljava/lang/IllegalArgumentException; {:try_start_4 .. :try_end_4} :catch_6
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_7

    .line 754
    .end local v10    # "size":J
    .end local v13    # "contentTypeAttribute":Lorg/jboss/netty/handler/codec/http/multipart/Attribute;
    .end local v17    # "filenameAttribute":Lorg/jboss/netty/handler/codec/http/multipart/Attribute;
    .end local v18    # "lengthAttribute":Lorg/jboss/netty/handler/codec/http/multipart/Attribute;
    .end local v20    # "nameAttribute":Lorg/jboss/netty/handler/codec/http/multipart/Attribute;
    :cond_3
    :try_start_5
    invoke-direct/range {p0 .. p1}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->readFileUploadByteMultipart(Ljava/lang/String;)V
    :try_end_5
    .catch Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$NotEnoughDataDecoderException; {:try_start_5 .. :try_end_5} :catch_8

    .line 761
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->currentFileUpload:Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;

    invoke-interface {v3}, Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;->isCompleted()Z

    move-result v3

    if-eqz v3, :cond_9

    .line 763
    move-object/from16 v0, p0

    iget-object v3, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->currentStatus:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    sget-object v4, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;->FILEUPLOAD:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    if-ne v3, v4, :cond_8

    .line 764
    sget-object v3, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;->HEADERDELIMITER:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    move-object/from16 v0, p0

    iput-object v3, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->currentStatus:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    .line 765
    const/4 v3, 0x0

    move-object/from16 v0, p0

    iput-object v3, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->currentFieldAttributes:Ljava/util/Map;

    .line 770
    :goto_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->currentFileUpload:Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;

    move-object/from16 v16, v0

    .line 771
    .local v16, "fileUpload":Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;
    const/4 v3, 0x0

    move-object/from16 v0, p0

    iput-object v3, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->currentFileUpload:Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;

    .line 777
    .end local v16    # "fileUpload":Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;
    :goto_3
    return-object v16

    .line 684
    .end local v2    # "charsetAttribute":Lorg/jboss/netty/handler/codec/http/multipart/Attribute;
    :catch_0
    move-exception v14

    .line 685
    .local v14, "e":Ljava/io/IOException;
    new-instance v3, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;

    invoke-direct {v3, v14}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;-><init>(Ljava/lang/Throwable;)V

    throw v3

    .line 689
    .end local v14    # "e":Ljava/io/IOException;
    .restart local v12    # "code":Ljava/lang/String;
    :cond_4
    sget-object v3, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$TransferEncodingMechanism;->BIT8:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$TransferEncodingMechanism;

    invoke-virtual {v3}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$TransferEncodingMechanism;->value()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v12, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 690
    sget-object v9, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil;->ISO_8859_1:Ljava/nio/charset/Charset;

    .line 691
    sget-object v19, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$TransferEncodingMechanism;->BIT8:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$TransferEncodingMechanism;

    goto/16 :goto_0

    .line 692
    :cond_5
    sget-object v3, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$TransferEncodingMechanism;->BINARY:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$TransferEncodingMechanism;

    invoke-virtual {v3}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$TransferEncodingMechanism;->value()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v12, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 695
    sget-object v19, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$TransferEncodingMechanism;->BINARY:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$TransferEncodingMechanism;

    goto/16 :goto_0

    .line 697
    :cond_6
    new-instance v3, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "TransferEncoding Unknown: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 706
    .end local v12    # "code":Ljava/lang/String;
    .restart local v2    # "charsetAttribute":Lorg/jboss/netty/handler/codec/http/multipart/Attribute;
    :catch_1
    move-exception v14

    .line 707
    .restart local v14    # "e":Ljava/io/IOException;
    new-instance v3, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;

    invoke-direct {v3, v14}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;-><init>(Ljava/lang/Throwable;)V

    throw v3

    .line 722
    .end local v14    # "e":Ljava/io/IOException;
    .restart local v13    # "contentTypeAttribute":Lorg/jboss/netty/handler/codec/http/multipart/Attribute;
    .restart local v17    # "filenameAttribute":Lorg/jboss/netty/handler/codec/http/multipart/Attribute;
    .restart local v20    # "nameAttribute":Lorg/jboss/netty/handler/codec/http/multipart/Attribute;
    :catch_2
    move-exception v14

    .line 723
    .restart local v14    # "e":Ljava/io/IOException;
    new-instance v3, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;

    const-string v4, "Content-Type is absent but required, and cannot be reverted to default"

    invoke-direct {v3, v4}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 731
    .end local v14    # "e":Ljava/io/IOException;
    .restart local v18    # "lengthAttribute":Lorg/jboss/netty/handler/codec/http/multipart/Attribute;
    :cond_7
    const-wide/16 v10, 0x0

    goto/16 :goto_1

    .line 733
    :catch_3
    move-exception v14

    .line 734
    .restart local v14    # "e":Ljava/io/IOException;
    new-instance v3, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;

    invoke-direct {v3, v14}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;-><init>(Ljava/lang/Throwable;)V

    throw v3

    .line 735
    .end local v14    # "e":Ljava/io/IOException;
    :catch_4
    move-exception v14

    .line 736
    .local v14, "e":Ljava/lang/NumberFormatException;
    const-wide/16 v10, 0x0

    .restart local v10    # "size":J
    goto/16 :goto_1

    .line 744
    .end local v14    # "e":Ljava/lang/NumberFormatException;
    :catch_5
    move-exception v14

    .line 745
    .local v14, "e":Ljava/lang/NullPointerException;
    new-instance v3, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;

    invoke-direct {v3, v14}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;-><init>(Ljava/lang/Throwable;)V

    throw v3

    .line 746
    .end local v14    # "e":Ljava/lang/NullPointerException;
    :catch_6
    move-exception v14

    .line 747
    .local v14, "e":Ljava/lang/IllegalArgumentException;
    new-instance v3, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;

    invoke-direct {v3, v14}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;-><init>(Ljava/lang/Throwable;)V

    throw v3

    .line 748
    .end local v14    # "e":Ljava/lang/IllegalArgumentException;
    :catch_7
    move-exception v14

    .line 749
    .local v14, "e":Ljava/io/IOException;
    new-instance v3, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;

    invoke-direct {v3, v14}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;-><init>(Ljava/lang/Throwable;)V

    throw v3

    .line 755
    .end local v10    # "size":J
    .end local v13    # "contentTypeAttribute":Lorg/jboss/netty/handler/codec/http/multipart/Attribute;
    .end local v14    # "e":Ljava/io/IOException;
    .end local v17    # "filenameAttribute":Lorg/jboss/netty/handler/codec/http/multipart/Attribute;
    .end local v18    # "lengthAttribute":Lorg/jboss/netty/handler/codec/http/multipart/Attribute;
    .end local v20    # "nameAttribute":Lorg/jboss/netty/handler/codec/http/multipart/Attribute;
    :catch_8
    move-exception v14

    .line 759
    .local v14, "e":Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$NotEnoughDataDecoderException;
    const/16 v16, 0x0

    goto :goto_3

    .line 767
    .end local v14    # "e":Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$NotEnoughDataDecoderException;
    :cond_8
    sget-object v3, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;->MIXEDDELIMITER:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    move-object/from16 v0, p0

    iput-object v3, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->currentStatus:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    .line 768
    invoke-direct/range {p0 .. p0}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->cleanMixedAttributes()V

    goto/16 :goto_2

    .line 777
    :cond_9
    const/16 v16, 0x0

    goto/16 :goto_3
.end method

.method private loadFieldMultipart(Ljava/lang/String;)V
    .locals 13
    .param p1, "delimiter"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$NotEnoughDataDecoderException;,
            Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;
        }
    .end annotation

    .prologue
    .line 1424
    :try_start_0
    new-instance v9, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;

    iget-object v10, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-direct {v9, v10}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;-><init>(Lorg/jboss/netty/buffer/ChannelBuffer;)V
    :try_end_0
    .catch Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadNoBackArrayException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1429
    .local v9, "sao":Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;
    iget-object v10, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v10}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v8

    .line 1432
    .local v8, "readerIndex":I
    const/4 v6, 0x1

    .line 1433
    .local v6, "newLine":Z
    const/4 v3, 0x0

    .line 1435
    .local v3, "index":I
    :try_start_1
    iget v5, v9, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->pos:I

    .line 1436
    .local v5, "lastrealpos":I
    const/4 v2, 0x0

    .line 1438
    .local v2, "found":Z
    :cond_0
    :goto_0
    iget v10, v9, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->pos:I

    iget v11, v9, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->limit:I

    if-ge v10, v11, :cond_1

    .line 1439
    iget-object v10, v9, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->bytes:[B

    iget v11, v9, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->pos:I

    add-int/lit8 v12, v11, 0x1

    iput v12, v9, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->pos:I

    aget-byte v7, v10, v11

    .line 1440
    .local v7, "nextByte":B
    if-eqz v6, :cond_6

    .line 1442
    invoke-virtual {p1, v3}, Ljava/lang/String;->codePointAt(I)I

    move-result v10

    if-ne v7, v10, :cond_2

    .line 1443
    add-int/lit8 v3, v3, 0x1

    .line 1444
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v10

    if-ne v10, v3, :cond_0

    .line 1445
    const/4 v2, 0x1

    .line 1498
    .end local v7    # "nextByte":B
    :cond_1
    invoke-virtual {v9, v5}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->getReadPosition(I)I
    :try_end_1
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_1 .. :try_end_1} :catch_2

    move-result v4

    .line 1499
    .local v4, "lastPosition":I
    if-eqz v2, :cond_a

    .line 1504
    :try_start_2
    iget-object v10, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->currentAttribute:Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    iget-object v11, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    sub-int v12, v4, v8

    invoke-interface {v11, v8, v12}, Lorg/jboss/netty/buffer/ChannelBuffer;->slice(II)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v11

    const/4 v12, 0x1

    invoke-interface {v10, v11, v12}, Lorg/jboss/netty/handler/codec/http/multipart/Attribute;->addContent(Lorg/jboss/netty/buffer/ChannelBuffer;Z)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_2 .. :try_end_2} :catch_2

    .line 1509
    :try_start_3
    iget-object v10, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v10, v4}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex(I)V
    :try_end_3
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_3 .. :try_end_3} :catch_2

    .line 1524
    .end local v2    # "found":Z
    .end local v3    # "index":I
    .end local v4    # "lastPosition":I
    .end local v5    # "lastrealpos":I
    .end local v6    # "newLine":Z
    .end local v8    # "readerIndex":I
    .end local v9    # "sao":Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;
    :goto_1
    return-void

    .line 1425
    :catch_0
    move-exception v1

    .line 1426
    .local v1, "e1":Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadNoBackArrayException;
    invoke-direct {p0, p1}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->loadFieldMultipartStandard(Ljava/lang/String;)V

    goto :goto_1

    .line 1450
    .end local v1    # "e1":Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadNoBackArrayException;
    .restart local v2    # "found":Z
    .restart local v3    # "index":I
    .restart local v5    # "lastrealpos":I
    .restart local v6    # "newLine":Z
    .restart local v7    # "nextByte":B
    .restart local v8    # "readerIndex":I
    .restart local v9    # "sao":Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;
    :cond_2
    const/4 v6, 0x0

    .line 1451
    const/4 v3, 0x0

    .line 1453
    const/16 v10, 0xd

    if-ne v7, v10, :cond_4

    .line 1454
    :try_start_4
    iget v10, v9, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->pos:I

    iget v11, v9, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->limit:I

    if-ge v10, v11, :cond_0

    .line 1455
    iget-object v10, v9, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->bytes:[B

    iget v11, v9, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->pos:I

    add-int/lit8 v12, v11, 0x1

    iput v12, v9, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->pos:I

    aget-byte v7, v10, v11

    .line 1456
    const/16 v10, 0xa

    if-ne v7, v10, :cond_3

    .line 1457
    const/4 v6, 0x1

    .line 1458
    const/4 v3, 0x0

    .line 1459
    iget v10, v9, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->pos:I

    add-int/lit8 v5, v10, -0x2

    goto :goto_0

    .line 1462
    :cond_3
    iget v10, v9, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->pos:I

    add-int/lit8 v10, v10, -0x1

    iput v10, v9, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->pos:I

    .line 1463
    iget v5, v9, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->pos:I

    goto :goto_0

    .line 1466
    :cond_4
    const/16 v10, 0xa

    if-ne v7, v10, :cond_5

    .line 1467
    const/4 v6, 0x1

    .line 1468
    const/4 v3, 0x0

    .line 1469
    iget v10, v9, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->pos:I

    add-int/lit8 v5, v10, -0x1

    goto :goto_0

    .line 1471
    :cond_5
    iget v5, v9, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->pos:I

    goto :goto_0

    .line 1476
    :cond_6
    const/16 v10, 0xd

    if-ne v7, v10, :cond_8

    .line 1477
    iget v10, v9, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->pos:I

    iget v11, v9, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->limit:I

    if-ge v10, v11, :cond_0

    .line 1478
    iget-object v10, v9, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->bytes:[B

    iget v11, v9, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->pos:I

    add-int/lit8 v12, v11, 0x1

    iput v12, v9, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->pos:I

    aget-byte v7, v10, v11

    .line 1479
    const/16 v10, 0xa

    if-ne v7, v10, :cond_7

    .line 1480
    const/4 v6, 0x1

    .line 1481
    const/4 v3, 0x0

    .line 1482
    iget v10, v9, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->pos:I

    add-int/lit8 v5, v10, -0x2

    goto/16 :goto_0

    .line 1485
    :cond_7
    iget v10, v9, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->pos:I

    add-int/lit8 v10, v10, -0x1

    iput v10, v9, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->pos:I

    .line 1486
    iget v5, v9, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->pos:I

    goto/16 :goto_0

    .line 1489
    :cond_8
    const/16 v10, 0xa

    if-ne v7, v10, :cond_9

    .line 1490
    const/4 v6, 0x1

    .line 1491
    const/4 v3, 0x0

    .line 1492
    iget v10, v9, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->pos:I

    add-int/lit8 v5, v10, -0x1

    goto/16 :goto_0

    .line 1494
    :cond_9
    iget v5, v9, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->pos:I

    goto/16 :goto_0

    .line 1506
    .end local v7    # "nextByte":B
    .restart local v4    # "lastPosition":I
    :catch_1
    move-exception v0

    .line 1507
    .local v0, "e":Ljava/io/IOException;
    new-instance v10, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;

    invoke-direct {v10, v0}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;-><init>(Ljava/lang/Throwable;)V

    throw v10
    :try_end_4
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_4 .. :try_end_4} :catch_2

    .line 1520
    .end local v0    # "e":Ljava/io/IOException;
    .end local v2    # "found":Z
    .end local v4    # "lastPosition":I
    .end local v5    # "lastrealpos":I
    :catch_2
    move-exception v0

    .line 1521
    .local v0, "e":Ljava/lang/IndexOutOfBoundsException;
    iget-object v10, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v10, v8}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex(I)V

    .line 1522
    new-instance v10, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$NotEnoughDataDecoderException;

    invoke-direct {v10, v0}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$NotEnoughDataDecoderException;-><init>(Ljava/lang/Throwable;)V

    throw v10

    .line 1512
    .end local v0    # "e":Ljava/lang/IndexOutOfBoundsException;
    .restart local v2    # "found":Z
    .restart local v4    # "lastPosition":I
    .restart local v5    # "lastrealpos":I
    :cond_a
    :try_start_5
    iget-object v10, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->currentAttribute:Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    iget-object v11, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    sub-int v12, v4, v8

    invoke-interface {v11, v8, v12}, Lorg/jboss/netty/buffer/ChannelBuffer;->slice(II)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v11

    const/4 v12, 0x0

    invoke-interface {v10, v11, v12}, Lorg/jboss/netty/handler/codec/http/multipart/Attribute;->addContent(Lorg/jboss/netty/buffer/ChannelBuffer;Z)V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_3
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_5 .. :try_end_5} :catch_2

    .line 1517
    :try_start_6
    iget-object v10, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v10, v4}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex(I)V

    .line 1518
    new-instance v10, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$NotEnoughDataDecoderException;

    invoke-direct {v10}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$NotEnoughDataDecoderException;-><init>()V

    throw v10

    .line 1514
    :catch_3
    move-exception v0

    .line 1515
    .local v0, "e":Ljava/io/IOException;
    new-instance v10, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;

    invoke-direct {v10, v0}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;-><init>(Ljava/lang/Throwable;)V

    throw v10
    :try_end_6
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_6 .. :try_end_6} :catch_2
.end method

.method private loadFieldMultipartStandard(Ljava/lang/String;)V
    .locals 10
    .param p1, "delimiter"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$NotEnoughDataDecoderException;,
            Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;
        }
    .end annotation

    .prologue
    const/16 v9, 0xd

    const/16 v8, 0xa

    .line 1315
    iget-object v7, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v7}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v6

    .line 1318
    .local v6, "readerIndex":I
    const/4 v4, 0x1

    .line 1319
    .local v4, "newLine":Z
    const/4 v2, 0x0

    .line 1320
    .local v2, "index":I
    :try_start_0
    iget-object v7, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v7}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v3

    .line 1321
    .local v3, "lastPosition":I
    const/4 v1, 0x0

    .line 1322
    .local v1, "found":Z
    :cond_0
    :goto_0
    iget-object v7, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v7}, Lorg/jboss/netty/buffer/ChannelBuffer;->readable()Z

    move-result v7

    if-eqz v7, :cond_1

    .line 1323
    iget-object v7, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v7}, Lorg/jboss/netty/buffer/ChannelBuffer;->readByte()B

    move-result v5

    .line 1324
    .local v5, "nextByte":B
    if-eqz v4, :cond_7

    .line 1326
    invoke-virtual {p1, v2}, Ljava/lang/String;->codePointAt(I)I

    move-result v7

    if-ne v5, v7, :cond_2

    .line 1327
    add-int/lit8 v2, v2, 0x1

    .line 1328
    invoke-virtual {p1}, Ljava/lang/String;->length()I
    :try_end_0
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v7

    if-ne v7, v2, :cond_0

    .line 1329
    const/4 v1, 0x1

    .line 1386
    .end local v5    # "nextByte":B
    :cond_1
    if-eqz v1, :cond_c

    .line 1391
    :try_start_1
    iget-object v7, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->currentAttribute:Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    iget-object v8, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    sub-int v9, v3, v6

    invoke-interface {v8, v6, v9}, Lorg/jboss/netty/buffer/ChannelBuffer;->slice(II)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v8

    const/4 v9, 0x1

    invoke-interface {v7, v8, v9}, Lorg/jboss/netty/handler/codec/http/multipart/Attribute;->addContent(Lorg/jboss/netty/buffer/ChannelBuffer;Z)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_1 .. :try_end_1} :catch_0

    .line 1397
    :try_start_2
    iget-object v7, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v7, v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex(I)V

    .line 1413
    return-void

    .line 1334
    .restart local v5    # "nextByte":B
    :cond_2
    const/4 v4, 0x0

    .line 1335
    const/4 v2, 0x0

    .line 1337
    if-ne v5, v9, :cond_5

    .line 1338
    iget-object v7, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v7}, Lorg/jboss/netty/buffer/ChannelBuffer;->readable()Z

    move-result v7

    if-eqz v7, :cond_4

    .line 1339
    iget-object v7, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v7}, Lorg/jboss/netty/buffer/ChannelBuffer;->readByte()B

    move-result v5

    .line 1340
    if-ne v5, v8, :cond_3

    .line 1341
    const/4 v4, 0x1

    .line 1342
    const/4 v2, 0x0

    .line 1343
    iget-object v7, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v7}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v7

    add-int/lit8 v3, v7, -0x2

    goto :goto_0

    .line 1346
    :cond_3
    iget-object v7, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v7}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v7

    add-int/lit8 v3, v7, -0x1

    .line 1347
    iget-object v7, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v7, v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex(I)V
    :try_end_2
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_0

    .line 1409
    .end local v1    # "found":Z
    .end local v3    # "lastPosition":I
    .end local v5    # "nextByte":B
    :catch_0
    move-exception v0

    .line 1410
    .local v0, "e":Ljava/lang/IndexOutOfBoundsException;
    iget-object v7, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v7, v6}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex(I)V

    .line 1411
    new-instance v7, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$NotEnoughDataDecoderException;

    invoke-direct {v7, v0}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$NotEnoughDataDecoderException;-><init>(Ljava/lang/Throwable;)V

    throw v7

    .line 1350
    .end local v0    # "e":Ljava/lang/IndexOutOfBoundsException;
    .restart local v1    # "found":Z
    .restart local v3    # "lastPosition":I
    .restart local v5    # "nextByte":B
    :cond_4
    :try_start_3
    iget-object v7, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v7}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v7

    add-int/lit8 v3, v7, -0x1

    goto :goto_0

    .line 1352
    :cond_5
    if-ne v5, v8, :cond_6

    .line 1353
    const/4 v4, 0x1

    .line 1354
    const/4 v2, 0x0

    .line 1355
    iget-object v7, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v7}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v7

    add-int/lit8 v3, v7, -0x1

    goto/16 :goto_0

    .line 1357
    :cond_6
    iget-object v7, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v7}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v3

    goto/16 :goto_0

    .line 1362
    :cond_7
    if-ne v5, v9, :cond_a

    .line 1363
    iget-object v7, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v7}, Lorg/jboss/netty/buffer/ChannelBuffer;->readable()Z

    move-result v7

    if-eqz v7, :cond_9

    .line 1364
    iget-object v7, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v7}, Lorg/jboss/netty/buffer/ChannelBuffer;->readByte()B

    move-result v5

    .line 1365
    if-ne v5, v8, :cond_8

    .line 1366
    const/4 v4, 0x1

    .line 1367
    const/4 v2, 0x0

    .line 1368
    iget-object v7, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v7}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v7

    add-int/lit8 v3, v7, -0x2

    goto/16 :goto_0

    .line 1371
    :cond_8
    iget-object v7, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v7}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v7

    add-int/lit8 v3, v7, -0x1

    .line 1372
    iget-object v7, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v7, v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex(I)V

    goto/16 :goto_0

    .line 1375
    :cond_9
    iget-object v7, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v7}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v7

    add-int/lit8 v3, v7, -0x1

    goto/16 :goto_0

    .line 1377
    :cond_a
    if-ne v5, v8, :cond_b

    .line 1378
    const/4 v4, 0x1

    .line 1379
    const/4 v2, 0x0

    .line 1380
    iget-object v7, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v7}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v7

    add-int/lit8 v3, v7, -0x1

    goto/16 :goto_0

    .line 1382
    :cond_b
    iget-object v7, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v7}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v3

    goto/16 :goto_0

    .line 1394
    .end local v5    # "nextByte":B
    :catch_1
    move-exception v0

    .line 1395
    .local v0, "e":Ljava/io/IOException;
    new-instance v7, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;

    invoke-direct {v7, v0}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;-><init>(Ljava/lang/Throwable;)V

    throw v7
    :try_end_3
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_3 .. :try_end_3} :catch_0

    .line 1400
    .end local v0    # "e":Ljava/io/IOException;
    :cond_c
    :try_start_4
    iget-object v7, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->currentAttribute:Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    iget-object v8, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    sub-int v9, v3, v6

    invoke-interface {v8, v6, v9}, Lorg/jboss/netty/buffer/ChannelBuffer;->slice(II)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v8

    const/4 v9, 0x0

    invoke-interface {v7, v8, v9}, Lorg/jboss/netty/handler/codec/http/multipart/Attribute;->addContent(Lorg/jboss/netty/buffer/ChannelBuffer;Z)V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_4 .. :try_end_4} :catch_0

    .line 1406
    :try_start_5
    iget-object v7, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v7, v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex(I)V

    .line 1407
    new-instance v7, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$NotEnoughDataDecoderException;

    invoke-direct {v7}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$NotEnoughDataDecoderException;-><init>()V

    throw v7

    .line 1403
    :catch_2
    move-exception v0

    .line 1404
    .restart local v0    # "e":Ljava/io/IOException;
    new-instance v7, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;

    invoke-direct {v7, v0}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;-><init>(Ljava/lang/Throwable;)V

    throw v7
    :try_end_5
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_5 .. :try_end_5} :catch_0
.end method

.method private parseBody()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;
        }
    .end annotation

    .prologue
    .line 258
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->currentStatus:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    sget-object v1, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;->PREEPILOGUE:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->currentStatus:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    sget-object v1, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;->EPILOGUE:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    if-ne v0, v1, :cond_2

    .line 260
    :cond_0
    iget-boolean v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->isLastChunk:Z

    if-eqz v0, :cond_1

    .line 261
    sget-object v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;->EPILOGUE:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->currentStatus:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    .line 266
    :cond_1
    :goto_0
    return-void

    .line 265
    :cond_2
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->parseBodyMultipart()V

    goto :goto_0
.end method

.method private parseBodyMultipart()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;
        }
    .end annotation

    .prologue
    .line 290
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v1

    if-nez v1, :cond_1

    .line 303
    :cond_0
    return-void

    .line 294
    :cond_1
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->currentStatus:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    invoke-direct {p0, v1}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->decodeMultipart(Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;)Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;

    move-result-object v0

    .line 295
    .local v0, "data":Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;
    :goto_0
    if-eqz v0, :cond_0

    .line 296
    invoke-direct {p0, v0}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->addHttpData(Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;)V

    .line 297
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->currentStatus:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    sget-object v2, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;->PREEPILOGUE:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    if-eq v1, v2, :cond_0

    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->currentStatus:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    sget-object v2, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;->EPILOGUE:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    if-eq v1, v2, :cond_0

    .line 301
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->currentStatus:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    invoke-direct {p0, v1}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->decodeMultipart(Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;)Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;

    move-result-object v0

    goto :goto_0
.end method

.method private readDelimiter(Ljava/lang/String;)Ljava/lang/String;
    .locals 14
    .param p1, "delimiter"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$NotEnoughDataDecoderException;
        }
    .end annotation

    .prologue
    const/16 v13, 0xd

    const/16 v12, 0x2d

    const/16 v11, 0xa

    .line 985
    :try_start_0
    new-instance v6, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;

    iget-object v8, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-direct {v6, v8}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;-><init>(Lorg/jboss/netty/buffer/ChannelBuffer;)V
    :try_end_0
    .catch Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadNoBackArrayException; {:try_start_0 .. :try_end_0} :catch_1

    .line 989
    .local v6, "sao":Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;
    iget-object v8, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v8}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v5

    .line 990
    .local v5, "readerIndex":I
    const/4 v0, 0x0

    .line 991
    .local v0, "delimiterPos":I
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    .line 993
    .local v3, "len":I
    :try_start_1
    new-instance v7, Ljava/lang/StringBuilder;

    const/16 v8, 0x40

    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 995
    .local v7, "sb":Ljava/lang/StringBuilder;
    :goto_0
    iget v8, v6, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->pos:I

    iget v9, v6, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->limit:I

    if-ge v8, v9, :cond_1

    if-ge v0, v3, :cond_1

    .line 996
    iget-object v8, v6, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->bytes:[B

    iget v9, v6, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->pos:I

    add-int/lit8 v10, v9, 0x1

    iput v10, v6, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->pos:I

    aget-byte v4, v8, v9

    .line 997
    .local v4, "nextByte":B
    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v8

    if-ne v4, v8, :cond_0

    .line 998
    add-int/lit8 v0, v0, 0x1

    .line 999
    int-to-char v8, v4

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    :try_end_1
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 1081
    .end local v4    # "nextByte":B
    .end local v7    # "sb":Ljava/lang/StringBuilder;
    :catch_0
    move-exception v1

    .line 1082
    .local v1, "e":Ljava/lang/IndexOutOfBoundsException;
    iget-object v8, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v8, v5}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex(I)V

    .line 1083
    new-instance v8, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$NotEnoughDataDecoderException;

    invoke-direct {v8, v1}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$NotEnoughDataDecoderException;-><init>(Ljava/lang/Throwable;)V

    throw v8

    .line 986
    .end local v0    # "delimiterPos":I
    .end local v1    # "e":Ljava/lang/IndexOutOfBoundsException;
    .end local v3    # "len":I
    .end local v5    # "readerIndex":I
    .end local v6    # "sao":Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;
    :catch_1
    move-exception v2

    .line 987
    .local v2, "e1":Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadNoBackArrayException;
    invoke-direct {p0, p1}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->readDelimiterStandard(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 1074
    .end local v2    # "e1":Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadNoBackArrayException;
    :goto_1
    return-object v8

    .line 1002
    .restart local v0    # "delimiterPos":I
    .restart local v3    # "len":I
    .restart local v4    # "nextByte":B
    .restart local v5    # "readerIndex":I
    .restart local v6    # "sao":Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;
    .restart local v7    # "sb":Ljava/lang/StringBuilder;
    :cond_0
    :try_start_2
    iget-object v8, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v8, v5}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex(I)V

    .line 1003
    new-instance v8, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$NotEnoughDataDecoderException;

    invoke-direct {v8}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$NotEnoughDataDecoderException;-><init>()V

    throw v8

    .line 1007
    .end local v4    # "nextByte":B
    :cond_1
    iget v8, v6, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->pos:I

    iget v9, v6, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->limit:I

    if-ge v8, v9, :cond_b

    .line 1008
    iget-object v8, v6, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->bytes:[B

    iget v9, v6, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->pos:I

    add-int/lit8 v10, v9, 0x1

    iput v10, v6, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->pos:I

    aget-byte v4, v8, v9

    .line 1009
    .restart local v4    # "nextByte":B
    if-ne v4, v13, :cond_4

    .line 1011
    iget v8, v6, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->pos:I

    iget v9, v6, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->limit:I

    if-ge v8, v9, :cond_3

    .line 1012
    iget-object v8, v6, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->bytes:[B

    iget v9, v6, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->pos:I

    add-int/lit8 v10, v9, 0x1

    iput v10, v6, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->pos:I

    aget-byte v4, v8, v9

    .line 1013
    if-ne v4, v11, :cond_2

    .line 1014
    const/4 v8, 0x0

    invoke-virtual {v6, v8}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->setReadPosition(I)V

    .line 1015
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    goto :goto_1

    .line 1019
    :cond_2
    iget-object v8, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v8, v5}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex(I)V

    .line 1020
    new-instance v8, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$NotEnoughDataDecoderException;

    invoke-direct {v8}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$NotEnoughDataDecoderException;-><init>()V

    throw v8

    .line 1025
    :cond_3
    iget-object v8, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v8, v5}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex(I)V

    .line 1026
    new-instance v8, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$NotEnoughDataDecoderException;

    invoke-direct {v8}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$NotEnoughDataDecoderException;-><init>()V

    throw v8

    .line 1028
    :cond_4
    if-ne v4, v11, :cond_5

    .line 1030
    const/4 v8, 0x0

    invoke-virtual {v6, v8}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->setReadPosition(I)V

    .line 1031
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    goto :goto_1

    .line 1032
    :cond_5
    if-ne v4, v12, :cond_b

    .line 1033
    const/16 v8, 0x2d

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1035
    iget v8, v6, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->pos:I

    iget v9, v6, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->limit:I

    if-ge v8, v9, :cond_b

    .line 1036
    iget-object v8, v6, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->bytes:[B

    iget v9, v6, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->pos:I

    add-int/lit8 v10, v9, 0x1

    iput v10, v6, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->pos:I

    aget-byte v4, v8, v9

    .line 1037
    if-ne v4, v12, :cond_b

    .line 1038
    const/16 v8, 0x2d

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1040
    iget v8, v6, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->pos:I

    iget v9, v6, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->limit:I

    if-ge v8, v9, :cond_a

    .line 1041
    iget-object v8, v6, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->bytes:[B

    iget v9, v6, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->pos:I

    add-int/lit8 v10, v9, 0x1

    iput v10, v6, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->pos:I

    aget-byte v4, v8, v9

    .line 1042
    if-ne v4, v13, :cond_8

    .line 1043
    iget v8, v6, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->pos:I

    iget v9, v6, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->limit:I

    if-ge v8, v9, :cond_7

    .line 1044
    iget-object v8, v6, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->bytes:[B

    iget v9, v6, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->pos:I

    add-int/lit8 v10, v9, 0x1

    iput v10, v6, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->pos:I

    aget-byte v4, v8, v9

    .line 1045
    if-ne v4, v11, :cond_6

    .line 1046
    const/4 v8, 0x0

    invoke-virtual {v6, v8}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->setReadPosition(I)V

    .line 1047
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    goto/16 :goto_1

    .line 1051
    :cond_6
    iget-object v8, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v8, v5}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex(I)V

    .line 1052
    new-instance v8, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$NotEnoughDataDecoderException;

    invoke-direct {v8}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$NotEnoughDataDecoderException;-><init>()V

    throw v8

    .line 1057
    :cond_7
    iget-object v8, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v8, v5}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex(I)V

    .line 1058
    new-instance v8, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$NotEnoughDataDecoderException;

    invoke-direct {v8}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$NotEnoughDataDecoderException;-><init>()V

    throw v8

    .line 1060
    :cond_8
    if-ne v4, v11, :cond_9

    .line 1061
    const/4 v8, 0x0

    invoke-virtual {v6, v8}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->setReadPosition(I)V

    .line 1062
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    goto/16 :goto_1

    .line 1066
    :cond_9
    const/4 v8, 0x1

    invoke-virtual {v6, v8}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->setReadPosition(I)V

    .line 1067
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    goto/16 :goto_1

    .line 1073
    :cond_a
    const/4 v8, 0x0

    invoke-virtual {v6, v8}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->setReadPosition(I)V

    .line 1074
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_2
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_2 .. :try_end_2} :catch_0

    move-result-object v8

    goto/16 :goto_1

    .line 1085
    .end local v4    # "nextByte":B
    :cond_b
    iget-object v8, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v8, v5}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex(I)V

    .line 1086
    new-instance v8, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$NotEnoughDataDecoderException;

    invoke-direct {v8}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$NotEnoughDataDecoderException;-><init>()V

    throw v8
.end method

.method private readDelimiterStandard(Ljava/lang/String;)Ljava/lang/String;
    .locals 10
    .param p1, "delimiter"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$NotEnoughDataDecoderException;
        }
    .end annotation

    .prologue
    const/16 v9, 0xd

    const/16 v8, 0x2d

    const/16 v7, 0xa

    .line 895
    iget-object v6, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v6}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v4

    .line 897
    .local v4, "readerIndex":I
    :try_start_0
    new-instance v5, Ljava/lang/StringBuilder;

    const/16 v6, 0x40

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 898
    .local v5, "sb":Ljava/lang/StringBuilder;
    const/4 v0, 0x0

    .line 899
    .local v0, "delimiterPos":I
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    .line 900
    .local v2, "len":I
    :goto_0
    iget-object v6, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v6}, Lorg/jboss/netty/buffer/ChannelBuffer;->readable()Z

    move-result v6

    if-eqz v6, :cond_1

    if-ge v0, v2, :cond_1

    .line 901
    iget-object v6, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v6}, Lorg/jboss/netty/buffer/ChannelBuffer;->readByte()B

    move-result v3

    .line 902
    .local v3, "nextByte":B
    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v6

    if-ne v3, v6, :cond_0

    .line 903
    add-int/lit8 v0, v0, 0x1

    .line 904
    int-to-char v6, v3

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;
    :try_end_0
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 964
    .end local v0    # "delimiterPos":I
    .end local v2    # "len":I
    .end local v3    # "nextByte":B
    .end local v5    # "sb":Ljava/lang/StringBuilder;
    :catch_0
    move-exception v1

    .line 965
    .local v1, "e":Ljava/lang/IndexOutOfBoundsException;
    iget-object v6, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v6, v4}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex(I)V

    .line 966
    new-instance v6, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$NotEnoughDataDecoderException;

    invoke-direct {v6, v1}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$NotEnoughDataDecoderException;-><init>(Ljava/lang/Throwable;)V

    throw v6

    .line 907
    .end local v1    # "e":Ljava/lang/IndexOutOfBoundsException;
    .restart local v0    # "delimiterPos":I
    .restart local v2    # "len":I
    .restart local v3    # "nextByte":B
    .restart local v5    # "sb":Ljava/lang/StringBuilder;
    :cond_0
    :try_start_1
    iget-object v6, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v6, v4}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex(I)V

    .line 908
    new-instance v6, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$NotEnoughDataDecoderException;

    invoke-direct {v6}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$NotEnoughDataDecoderException;-><init>()V

    throw v6

    .line 912
    .end local v3    # "nextByte":B
    :cond_1
    iget-object v6, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v6}, Lorg/jboss/netty/buffer/ChannelBuffer;->readable()Z

    move-result v6

    if-eqz v6, :cond_9

    .line 913
    iget-object v6, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v6}, Lorg/jboss/netty/buffer/ChannelBuffer;->readByte()B

    move-result v3

    .line 915
    .restart local v3    # "nextByte":B
    if-ne v3, v9, :cond_3

    .line 916
    iget-object v6, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v6}, Lorg/jboss/netty/buffer/ChannelBuffer;->readByte()B

    move-result v3

    .line 917
    if-ne v3, v7, :cond_2

    .line 918
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 958
    :goto_1
    return-object v6

    .line 922
    :cond_2
    iget-object v6, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v6, v4}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex(I)V

    .line 923
    new-instance v6, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$NotEnoughDataDecoderException;

    invoke-direct {v6}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$NotEnoughDataDecoderException;-><init>()V

    throw v6

    .line 925
    :cond_3
    if-ne v3, v7, :cond_4

    .line 926
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    goto :goto_1

    .line 927
    :cond_4
    if-ne v3, v8, :cond_9

    .line 928
    const/16 v6, 0x2d

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 930
    iget-object v6, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v6}, Lorg/jboss/netty/buffer/ChannelBuffer;->readByte()B

    move-result v3

    .line 931
    if-ne v3, v8, :cond_9

    .line 932
    const/16 v6, 0x2d

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 934
    iget-object v6, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v6}, Lorg/jboss/netty/buffer/ChannelBuffer;->readable()Z

    move-result v6

    if-eqz v6, :cond_8

    .line 935
    iget-object v6, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v6}, Lorg/jboss/netty/buffer/ChannelBuffer;->readByte()B

    move-result v3

    .line 936
    if-ne v3, v9, :cond_6

    .line 937
    iget-object v6, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v6}, Lorg/jboss/netty/buffer/ChannelBuffer;->readByte()B

    move-result v3

    .line 938
    if-ne v3, v7, :cond_5

    .line 939
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    goto :goto_1

    .line 943
    :cond_5
    iget-object v6, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v6, v4}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex(I)V

    .line 944
    new-instance v6, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$NotEnoughDataDecoderException;

    invoke-direct {v6}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$NotEnoughDataDecoderException;-><init>()V

    throw v6

    .line 946
    :cond_6
    if-ne v3, v7, :cond_7

    .line 947
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    goto :goto_1

    .line 951
    :cond_7
    iget-object v6, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    iget-object v7, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v7}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v7

    add-int/lit8 v7, v7, -0x1

    invoke-interface {v6, v7}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex(I)V

    .line 952
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    goto :goto_1

    .line 958
    :cond_8
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v6

    goto :goto_1

    .line 968
    .end local v3    # "nextByte":B
    :cond_9
    iget-object v6, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v6, v4}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex(I)V

    .line 969
    new-instance v6, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$NotEnoughDataDecoderException;

    invoke-direct {v6}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$NotEnoughDataDecoderException;-><init>()V

    throw v6
.end method

.method private readFileUploadByteMultipart(Ljava/lang/String;)V
    .locals 14
    .param p1, "delimiter"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$NotEnoughDataDecoderException;,
            Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;
        }
    .end annotation

    .prologue
    .line 1205
    :try_start_0
    new-instance v10, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;

    iget-object v11, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-direct {v10, v11}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;-><init>(Lorg/jboss/netty/buffer/ChannelBuffer;)V
    :try_end_0
    .catch Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadNoBackArrayException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1210
    .local v10, "sao":Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;
    iget-object v11, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v11}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v9

    .line 1212
    .local v9, "readerIndex":I
    const/4 v7, 0x1

    .line 1213
    .local v7, "newLine":Z
    const/4 v4, 0x0

    .line 1214
    .local v4, "index":I
    iget v6, v10, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->pos:I

    .line 1216
    .local v6, "lastrealpos":I
    const/4 v3, 0x0

    .line 1218
    .local v3, "found":Z
    :cond_0
    :goto_0
    iget v11, v10, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->pos:I

    iget v12, v10, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->limit:I

    if-ge v11, v12, :cond_1

    .line 1219
    iget-object v11, v10, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->bytes:[B

    iget v12, v10, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->pos:I

    add-int/lit8 v13, v12, 0x1

    iput v13, v10, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->pos:I

    aget-byte v8, v11, v12

    .line 1220
    .local v8, "nextByte":B
    if-eqz v7, :cond_6

    .line 1222
    invoke-virtual {p1, v4}, Ljava/lang/String;->codePointAt(I)I

    move-result v11

    if-ne v8, v11, :cond_2

    .line 1223
    add-int/lit8 v4, v4, 0x1

    .line 1224
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v11

    if-ne v11, v4, :cond_0

    .line 1225
    const/4 v3, 0x1

    .line 1284
    .end local v8    # "nextByte":B
    :cond_1
    invoke-virtual {v10, v6}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->getReadPosition(I)I

    move-result v5

    .line 1285
    .local v5, "lastPosition":I
    iget-object v11, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    sub-int v12, v5, v9

    invoke-interface {v11, v9, v12}, Lorg/jboss/netty/buffer/ChannelBuffer;->slice(II)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    .line 1286
    .local v0, "buffer":Lorg/jboss/netty/buffer/ChannelBuffer;
    if-eqz v3, :cond_a

    .line 1289
    :try_start_1
    iget-object v11, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->currentFileUpload:Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;

    const/4 v12, 0x1

    invoke-interface {v11, v0, v12}, Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;->addContent(Lorg/jboss/netty/buffer/ChannelBuffer;Z)V

    .line 1291
    iget-object v11, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v11, v5}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex(I)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 1306
    .end local v0    # "buffer":Lorg/jboss/netty/buffer/ChannelBuffer;
    .end local v3    # "found":Z
    .end local v4    # "index":I
    .end local v5    # "lastPosition":I
    .end local v6    # "lastrealpos":I
    .end local v7    # "newLine":Z
    .end local v9    # "readerIndex":I
    .end local v10    # "sao":Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;
    :goto_1
    return-void

    .line 1206
    :catch_0
    move-exception v2

    .line 1207
    .local v2, "e1":Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadNoBackArrayException;
    invoke-direct {p0, p1}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->readFileUploadByteMultipartStandard(Ljava/lang/String;)V

    goto :goto_1

    .line 1230
    .end local v2    # "e1":Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadNoBackArrayException;
    .restart local v3    # "found":Z
    .restart local v4    # "index":I
    .restart local v6    # "lastrealpos":I
    .restart local v7    # "newLine":Z
    .restart local v8    # "nextByte":B
    .restart local v9    # "readerIndex":I
    .restart local v10    # "sao":Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;
    :cond_2
    const/4 v7, 0x0

    .line 1231
    const/4 v4, 0x0

    .line 1233
    const/16 v11, 0xd

    if-ne v8, v11, :cond_4

    .line 1234
    iget v11, v10, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->pos:I

    iget v12, v10, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->limit:I

    if-ge v11, v12, :cond_0

    .line 1235
    iget-object v11, v10, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->bytes:[B

    iget v12, v10, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->pos:I

    add-int/lit8 v13, v12, 0x1

    iput v13, v10, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->pos:I

    aget-byte v8, v11, v12

    .line 1236
    const/16 v11, 0xa

    if-ne v8, v11, :cond_3

    .line 1237
    const/4 v7, 0x1

    .line 1238
    const/4 v4, 0x0

    .line 1239
    iget v11, v10, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->pos:I

    add-int/lit8 v6, v11, -0x2

    goto :goto_0

    .line 1242
    :cond_3
    iget v11, v10, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->pos:I

    add-int/lit8 v11, v11, -0x1

    iput v11, v10, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->pos:I

    .line 1245
    iget v6, v10, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->pos:I

    goto :goto_0

    .line 1248
    :cond_4
    const/16 v11, 0xa

    if-ne v8, v11, :cond_5

    .line 1249
    const/4 v7, 0x1

    .line 1250
    const/4 v4, 0x0

    .line 1251
    iget v11, v10, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->pos:I

    add-int/lit8 v6, v11, -0x1

    goto :goto_0

    .line 1254
    :cond_5
    iget v6, v10, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->pos:I

    goto :goto_0

    .line 1259
    :cond_6
    const/16 v11, 0xd

    if-ne v8, v11, :cond_8

    .line 1260
    iget v11, v10, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->pos:I

    iget v12, v10, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->limit:I

    if-ge v11, v12, :cond_0

    .line 1261
    iget-object v11, v10, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->bytes:[B

    iget v12, v10, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->pos:I

    add-int/lit8 v13, v12, 0x1

    iput v13, v10, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->pos:I

    aget-byte v8, v11, v12

    .line 1262
    const/16 v11, 0xa

    if-ne v8, v11, :cond_7

    .line 1263
    const/4 v7, 0x1

    .line 1264
    const/4 v4, 0x0

    .line 1265
    iget v11, v10, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->pos:I

    add-int/lit8 v6, v11, -0x2

    goto/16 :goto_0

    .line 1268
    :cond_7
    iget v11, v10, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->pos:I

    add-int/lit8 v11, v11, -0x1

    iput v11, v10, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->pos:I

    .line 1271
    iget v6, v10, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->pos:I

    goto/16 :goto_0

    .line 1274
    :cond_8
    const/16 v11, 0xa

    if-ne v8, v11, :cond_9

    .line 1275
    const/4 v7, 0x1

    .line 1276
    const/4 v4, 0x0

    .line 1277
    iget v11, v10, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->pos:I

    add-int/lit8 v6, v11, -0x1

    goto/16 :goto_0

    .line 1280
    :cond_9
    iget v6, v10, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->pos:I

    goto/16 :goto_0

    .line 1292
    .end local v8    # "nextByte":B
    .restart local v0    # "buffer":Lorg/jboss/netty/buffer/ChannelBuffer;
    .restart local v5    # "lastPosition":I
    :catch_1
    move-exception v1

    .line 1293
    .local v1, "e":Ljava/io/IOException;
    new-instance v11, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;

    invoke-direct {v11, v1}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;-><init>(Ljava/lang/Throwable;)V

    throw v11

    .line 1298
    .end local v1    # "e":Ljava/io/IOException;
    :cond_a
    :try_start_2
    iget-object v11, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->currentFileUpload:Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;

    const/4 v12, 0x0

    invoke-interface {v11, v0, v12}, Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;->addContent(Lorg/jboss/netty/buffer/ChannelBuffer;Z)V

    .line 1300
    iget-object v11, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v11, v5}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex(I)V

    .line 1301
    new-instance v11, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$NotEnoughDataDecoderException;

    invoke-direct {v11}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$NotEnoughDataDecoderException;-><init>()V

    throw v11
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2

    .line 1302
    :catch_2
    move-exception v1

    .line 1303
    .restart local v1    # "e":Ljava/io/IOException;
    new-instance v11, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;

    invoke-direct {v11, v1}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;-><init>(Ljava/lang/Throwable;)V

    throw v11
.end method

.method private readFileUploadByteMultipartStandard(Ljava/lang/String;)V
    .locals 11
    .param p1, "delimiter"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$NotEnoughDataDecoderException;,
            Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;
        }
    .end annotation

    .prologue
    const/16 v10, 0xd

    const/16 v9, 0xa

    .line 1098
    iget-object v8, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v8}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v7

    .line 1100
    .local v7, "readerIndex":I
    const/4 v5, 0x1

    .line 1101
    .local v5, "newLine":Z
    const/4 v3, 0x0

    .line 1102
    .local v3, "index":I
    iget-object v8, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v8}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v4

    .line 1103
    .local v4, "lastPosition":I
    const/4 v2, 0x0

    .line 1104
    .local v2, "found":Z
    :cond_0
    :goto_0
    iget-object v8, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v8}, Lorg/jboss/netty/buffer/ChannelBuffer;->readable()Z

    move-result v8

    if-eqz v8, :cond_1

    .line 1105
    iget-object v8, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v8}, Lorg/jboss/netty/buffer/ChannelBuffer;->readByte()B

    move-result v6

    .line 1106
    .local v6, "nextByte":B
    if-eqz v5, :cond_6

    .line 1108
    invoke-virtual {p1, v3}, Ljava/lang/String;->codePointAt(I)I

    move-result v8

    if-ne v6, v8, :cond_2

    .line 1109
    add-int/lit8 v3, v3, 0x1

    .line 1110
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v8

    if-ne v8, v3, :cond_0

    .line 1111
    const/4 v2, 0x1

    .line 1170
    .end local v6    # "nextByte":B
    :cond_1
    iget-object v8, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    sub-int v9, v4, v7

    invoke-interface {v8, v7, v9}, Lorg/jboss/netty/buffer/ChannelBuffer;->slice(II)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    .line 1172
    .local v0, "buffer":Lorg/jboss/netty/buffer/ChannelBuffer;
    if-eqz v2, :cond_a

    .line 1175
    :try_start_0
    iget-object v8, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->currentFileUpload:Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;

    const/4 v9, 0x1

    invoke-interface {v8, v0, v9}, Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;->addContent(Lorg/jboss/netty/buffer/ChannelBuffer;Z)V

    .line 1177
    iget-object v8, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v8, v4}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex(I)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1192
    return-void

    .line 1116
    .end local v0    # "buffer":Lorg/jboss/netty/buffer/ChannelBuffer;
    .restart local v6    # "nextByte":B
    :cond_2
    const/4 v5, 0x0

    .line 1117
    const/4 v3, 0x0

    .line 1119
    if-ne v6, v10, :cond_4

    .line 1120
    iget-object v8, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v8}, Lorg/jboss/netty/buffer/ChannelBuffer;->readable()Z

    move-result v8

    if-eqz v8, :cond_0

    .line 1121
    iget-object v8, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v8}, Lorg/jboss/netty/buffer/ChannelBuffer;->readByte()B

    move-result v6

    .line 1122
    if-ne v6, v9, :cond_3

    .line 1123
    const/4 v5, 0x1

    .line 1124
    const/4 v3, 0x0

    .line 1125
    iget-object v8, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v8}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v8

    add-int/lit8 v4, v8, -0x2

    goto :goto_0

    .line 1128
    :cond_3
    iget-object v8, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v8}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v8

    add-int/lit8 v4, v8, -0x1

    .line 1131
    iget-object v8, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v8, v4}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex(I)V

    goto :goto_0

    .line 1134
    :cond_4
    if-ne v6, v9, :cond_5

    .line 1135
    const/4 v5, 0x1

    .line 1136
    const/4 v3, 0x0

    .line 1137
    iget-object v8, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v8}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v8

    add-int/lit8 v4, v8, -0x1

    goto :goto_0

    .line 1140
    :cond_5
    iget-object v8, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v8}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v4

    goto :goto_0

    .line 1145
    :cond_6
    if-ne v6, v10, :cond_8

    .line 1146
    iget-object v8, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v8}, Lorg/jboss/netty/buffer/ChannelBuffer;->readable()Z

    move-result v8

    if-eqz v8, :cond_0

    .line 1147
    iget-object v8, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v8}, Lorg/jboss/netty/buffer/ChannelBuffer;->readByte()B

    move-result v6

    .line 1148
    if-ne v6, v9, :cond_7

    .line 1149
    const/4 v5, 0x1

    .line 1150
    const/4 v3, 0x0

    .line 1151
    iget-object v8, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v8}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v8

    add-int/lit8 v4, v8, -0x2

    goto/16 :goto_0

    .line 1154
    :cond_7
    iget-object v8, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v8}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v8

    add-int/lit8 v4, v8, -0x1

    .line 1157
    iget-object v8, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v8, v4}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex(I)V

    goto/16 :goto_0

    .line 1160
    :cond_8
    if-ne v6, v9, :cond_9

    .line 1161
    const/4 v5, 0x1

    .line 1162
    const/4 v3, 0x0

    .line 1163
    iget-object v8, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v8}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v8

    add-int/lit8 v4, v8, -0x1

    goto/16 :goto_0

    .line 1166
    :cond_9
    iget-object v8, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v8}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v4

    goto/16 :goto_0

    .line 1178
    .end local v6    # "nextByte":B
    .restart local v0    # "buffer":Lorg/jboss/netty/buffer/ChannelBuffer;
    :catch_0
    move-exception v1

    .line 1179
    .local v1, "e":Ljava/io/IOException;
    new-instance v8, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;

    invoke-direct {v8, v1}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;-><init>(Ljava/lang/Throwable;)V

    throw v8

    .line 1184
    .end local v1    # "e":Ljava/io/IOException;
    :cond_a
    :try_start_1
    iget-object v8, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->currentFileUpload:Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;

    const/4 v9, 0x0

    invoke-interface {v8, v0, v9}, Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;->addContent(Lorg/jboss/netty/buffer/ChannelBuffer;Z)V

    .line 1186
    iget-object v8, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v8, v4}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex(I)V

    .line 1187
    new-instance v8, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$NotEnoughDataDecoderException;

    invoke-direct {v8}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$NotEnoughDataDecoderException;-><init>()V

    throw v8
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 1188
    :catch_1
    move-exception v1

    .line 1189
    .restart local v1    # "e":Ljava/io/IOException;
    new-instance v8, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;

    invoke-direct {v8, v1}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;-><init>(Ljava/lang/Throwable;)V

    throw v8
.end method

.method private readLine()Ljava/lang/String;
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$NotEnoughDataDecoderException;
        }
    .end annotation

    .prologue
    const/16 v10, 0xd

    const/16 v9, 0xa

    .line 845
    :try_start_0
    new-instance v5, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;

    iget-object v6, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-direct {v5, v6}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;-><init>(Lorg/jboss/netty/buffer/ChannelBuffer;)V
    :try_end_0
    .catch Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadNoBackArrayException; {:try_start_0 .. :try_end_0} :catch_0

    .line 849
    .local v5, "sao":Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;
    iget-object v6, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v6}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v4

    .line 851
    .local v4, "readerIndex":I
    const/16 v6, 0x40

    :try_start_1
    invoke-static {v6}, Lorg/jboss/netty/buffer/ChannelBuffers;->dynamicBuffer(I)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v2

    .line 852
    .local v2, "line":Lorg/jboss/netty/buffer/ChannelBuffer;
    :goto_0
    iget v6, v5, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->pos:I

    iget v7, v5, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->limit:I

    if-ge v6, v7, :cond_4

    .line 853
    iget-object v6, v5, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->bytes:[B

    iget v7, v5, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->pos:I

    add-int/lit8 v8, v7, 0x1

    iput v8, v5, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->pos:I

    aget-byte v3, v6, v7

    .line 854
    .local v3, "nextByte":B
    if-ne v3, v10, :cond_2

    .line 855
    iget v6, v5, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->pos:I

    iget v7, v5, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->limit:I

    if-ge v6, v7, :cond_1

    .line 856
    iget-object v6, v5, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->bytes:[B

    iget v7, v5, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->pos:I

    add-int/lit8 v8, v7, 0x1

    iput v8, v5, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->pos:I

    aget-byte v3, v6, v7

    .line 857
    if-ne v3, v9, :cond_0

    .line 858
    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->setReadPosition(I)V

    .line 859
    iget-object v6, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->charset:Ljava/nio/charset/Charset;

    invoke-interface {v2, v6}, Lorg/jboss/netty/buffer/ChannelBuffer;->toString(Ljava/nio/charset/Charset;)Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v6

    .line 870
    .end local v2    # "line":Lorg/jboss/netty/buffer/ChannelBuffer;
    .end local v3    # "nextByte":B
    .end local v4    # "readerIndex":I
    .end local v5    # "sao":Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;
    :goto_1
    return-object v6

    .line 846
    :catch_0
    move-exception v1

    .line 847
    .local v1, "e1":Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadNoBackArrayException;
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->readLineStandard()Ljava/lang/String;

    move-result-object v6

    goto :goto_1

    .line 862
    .end local v1    # "e1":Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadNoBackArrayException;
    .restart local v2    # "line":Lorg/jboss/netty/buffer/ChannelBuffer;
    .restart local v3    # "nextByte":B
    .restart local v4    # "readerIndex":I
    .restart local v5    # "sao":Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;
    :cond_0
    :try_start_2
    iget v6, v5, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->pos:I

    add-int/lit8 v6, v6, -0x1

    iput v6, v5, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->pos:I

    .line 863
    const/16 v6, 0xd

    invoke-interface {v2, v6}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeByte(I)V
    :try_end_2
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_0

    .line 875
    .end local v2    # "line":Lorg/jboss/netty/buffer/ChannelBuffer;
    .end local v3    # "nextByte":B
    :catch_1
    move-exception v0

    .line 876
    .local v0, "e":Ljava/lang/IndexOutOfBoundsException;
    iget-object v6, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v6, v4}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex(I)V

    .line 877
    new-instance v6, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$NotEnoughDataDecoderException;

    invoke-direct {v6, v0}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$NotEnoughDataDecoderException;-><init>(Ljava/lang/Throwable;)V

    throw v6

    .line 866
    .end local v0    # "e":Ljava/lang/IndexOutOfBoundsException;
    .restart local v2    # "line":Lorg/jboss/netty/buffer/ChannelBuffer;
    .restart local v3    # "nextByte":B
    :cond_1
    :try_start_3
    invoke-interface {v2, v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeByte(I)V

    goto :goto_0

    .line 868
    :cond_2
    if-ne v3, v9, :cond_3

    .line 869
    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->setReadPosition(I)V

    .line 870
    iget-object v6, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->charset:Ljava/nio/charset/Charset;

    invoke-interface {v2, v6}, Lorg/jboss/netty/buffer/ChannelBuffer;->toString(Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v6

    goto :goto_1

    .line 872
    :cond_3
    invoke-interface {v2, v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeByte(I)V
    :try_end_3
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_0

    .line 879
    .end local v3    # "nextByte":B
    :cond_4
    iget-object v6, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v6, v4}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex(I)V

    .line 880
    new-instance v6, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$NotEnoughDataDecoderException;

    invoke-direct {v6}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$NotEnoughDataDecoderException;-><init>()V

    throw v6
.end method

.method private readLineStandard()Ljava/lang/String;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$NotEnoughDataDecoderException;
        }
    .end annotation

    .prologue
    const/16 v7, 0xd

    const/16 v6, 0xa

    .line 806
    iget-object v4, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v4}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v3

    .line 808
    .local v3, "readerIndex":I
    const/16 v4, 0x40

    :try_start_0
    invoke-static {v4}, Lorg/jboss/netty/buffer/ChannelBuffers;->dynamicBuffer(I)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v1

    .line 810
    .local v1, "line":Lorg/jboss/netty/buffer/ChannelBuffer;
    :goto_0
    iget-object v4, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v4}, Lorg/jboss/netty/buffer/ChannelBuffer;->readable()Z

    move-result v4

    if-eqz v4, :cond_3

    .line 811
    iget-object v4, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v4}, Lorg/jboss/netty/buffer/ChannelBuffer;->readByte()B

    move-result v2

    .line 812
    .local v2, "nextByte":B
    if-ne v2, v7, :cond_1

    .line 814
    iget-object v4, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    iget-object v5, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v5}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v5

    invoke-interface {v4, v5}, Lorg/jboss/netty/buffer/ChannelBuffer;->getByte(I)B

    move-result v2

    .line 815
    if-ne v2, v6, :cond_0

    .line 817
    iget-object v4, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v4}, Lorg/jboss/netty/buffer/ChannelBuffer;->readByte()B

    .line 818
    iget-object v4, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->charset:Ljava/nio/charset/Charset;

    invoke-interface {v1, v4}, Lorg/jboss/netty/buffer/ChannelBuffer;->toString(Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v4

    .line 824
    :goto_1
    return-object v4

    .line 821
    :cond_0
    const/16 v4, 0xd

    invoke-interface {v1, v4}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeByte(I)V
    :try_end_0
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 829
    .end local v1    # "line":Lorg/jboss/netty/buffer/ChannelBuffer;
    .end local v2    # "nextByte":B
    :catch_0
    move-exception v0

    .line 830
    .local v0, "e":Ljava/lang/IndexOutOfBoundsException;
    iget-object v4, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v4, v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex(I)V

    .line 831
    new-instance v4, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$NotEnoughDataDecoderException;

    invoke-direct {v4, v0}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$NotEnoughDataDecoderException;-><init>(Ljava/lang/Throwable;)V

    throw v4

    .line 823
    .end local v0    # "e":Ljava/lang/IndexOutOfBoundsException;
    .restart local v1    # "line":Lorg/jboss/netty/buffer/ChannelBuffer;
    .restart local v2    # "nextByte":B
    :cond_1
    if-ne v2, v6, :cond_2

    .line 824
    :try_start_1
    iget-object v4, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->charset:Ljava/nio/charset/Charset;

    invoke-interface {v1, v4}, Lorg/jboss/netty/buffer/ChannelBuffer;->toString(Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v4

    goto :goto_1

    .line 826
    :cond_2
    invoke-interface {v1, v2}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeByte(I)V
    :try_end_1
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 833
    .end local v2    # "nextByte":B
    :cond_3
    iget-object v4, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v4, v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex(I)V

    .line 834
    new-instance v4, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$NotEnoughDataDecoderException;

    invoke-direct {v4}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$NotEnoughDataDecoderException;-><init>()V

    throw v4
.end method

.method private setMultipart(Ljava/lang/String;)V
    .locals 3
    .param p1, "contentType"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x1

    .line 175
    invoke-static {p1}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder;->getMultipartDataBoundary(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 176
    .local v0, "dataBoundary":[Ljava/lang/String;
    if-eqz v0, :cond_1

    .line 177
    const/4 v1, 0x0

    aget-object v1, v0, v1

    iput-object v1, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->multipartDataBoundary:Ljava/lang/String;

    .line 178
    array-length v1, v0

    if-le v1, v2, :cond_0

    aget-object v1, v0, v2

    if-eqz v1, :cond_0

    .line 179
    aget-object v1, v0, v2

    invoke-static {v1}, Ljava/nio/charset/Charset;->forName(Ljava/lang/String;)Ljava/nio/charset/Charset;

    move-result-object v1

    iput-object v1, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->charset:Ljava/nio/charset/Charset;

    .line 184
    :cond_0
    :goto_0
    sget-object v1, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;->HEADERDELIMITER:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    iput-object v1, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->currentStatus:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    .line 185
    return-void

    .line 182
    :cond_1
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->multipartDataBoundary:Ljava/lang/String;

    goto :goto_0
.end method

.method private skipOneLine()Z
    .locals 5

    .prologue
    const/16 v4, 0xa

    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 1558
    iget-object v3, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readable()Z

    move-result v3

    if-nez v3, :cond_0

    .line 1578
    :goto_0
    return v1

    .line 1561
    :cond_0
    iget-object v3, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readByte()B

    move-result v0

    .line 1562
    .local v0, "nextByte":B
    const/16 v3, 0xd

    if-ne v0, v3, :cond_3

    .line 1563
    iget-object v3, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readable()Z

    move-result v3

    if-nez v3, :cond_1

    .line 1564
    iget-object v2, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    iget-object v3, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-interface {v2, v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex(I)V

    goto :goto_0

    .line 1567
    :cond_1
    iget-object v3, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readByte()B

    move-result v0

    .line 1568
    if-ne v0, v4, :cond_2

    move v1, v2

    .line 1569
    goto :goto_0

    .line 1571
    :cond_2
    iget-object v2, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    iget-object v3, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v3

    add-int/lit8 v3, v3, -0x2

    invoke-interface {v2, v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex(I)V

    goto :goto_0

    .line 1574
    :cond_3
    if-ne v0, v4, :cond_4

    move v1, v2

    .line 1575
    goto :goto_0

    .line 1577
    :cond_4
    iget-object v2, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    iget-object v3, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-interface {v2, v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex(I)V

    goto :goto_0
.end method

.method private static splitMultipartHeader(Ljava/lang/String;)[Ljava/lang/String;
    .locals 19
    .param p0, "sb"    # Ljava/lang/String;

    .prologue
    .line 1587
    new-instance v6, Ljava/util/ArrayList;

    const/16 v17, 0x1

    move/from16 v0, v17

    invoke-direct {v6, v0}, Ljava/util/ArrayList;-><init>(I)V

    .line 1593
    .local v6, "headers":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const/16 v17, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-static {v0, v1}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil;->findNonWhitespace(Ljava/lang/String;I)I

    move-result v11

    .line 1594
    .local v11, "nameStart":I
    move v10, v11

    .local v10, "nameEnd":I
    :goto_0
    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->length()I

    move-result v17

    move/from16 v0, v17

    if-ge v10, v0, :cond_0

    .line 1595
    move-object/from16 v0, p0

    invoke-virtual {v0, v10}, Ljava/lang/String;->charAt(I)C

    move-result v4

    .line 1596
    .local v4, "ch":C
    const/16 v17, 0x3a

    move/from16 v0, v17

    if-eq v4, v0, :cond_0

    invoke-static {v4}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v17

    if-eqz v17, :cond_2

    .line 1600
    .end local v4    # "ch":C
    :cond_0
    move v5, v10

    .local v5, "colonEnd":I
    :goto_1
    invoke-virtual/range {p0 .. p0}, Ljava/lang/String;->length()I

    move-result v17

    move/from16 v0, v17

    if-ge v5, v0, :cond_1

    .line 1601
    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v17

    const/16 v18, 0x3a

    move/from16 v0, v17

    move/from16 v1, v18

    if-ne v0, v1, :cond_3

    .line 1602
    add-int/lit8 v5, v5, 0x1

    .line 1606
    :cond_1
    move-object/from16 v0, p0

    invoke-static {v0, v5}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil;->findNonWhitespace(Ljava/lang/String;I)I

    move-result v15

    .line 1607
    .local v15, "valueStart":I
    invoke-static/range {p0 .. p0}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil;->findEndOfString(Ljava/lang/String;)I

    move-result v14

    .line 1608
    .local v14, "valueEnd":I
    move-object/from16 v0, p0

    invoke-virtual {v0, v11, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v6, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1609
    move-object/from16 v0, p0

    invoke-virtual {v0, v15, v14}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v12

    .line 1611
    .local v12, "svalue":Ljava/lang/String;
    const/16 v17, 0x3b

    move/from16 v0, v17

    invoke-virtual {v12, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v17

    if-ltz v17, :cond_4

    .line 1612
    const/16 v17, 0x3b

    move/from16 v0, v17

    invoke-static {v12, v0}, Lorg/jboss/netty/util/internal/StringUtil;->split(Ljava/lang/String;C)[Ljava/lang/String;

    move-result-object v16

    .line 1616
    .local v16, "values":[Ljava/lang/String;
    :goto_2
    move-object/from16 v2, v16

    .local v2, "arr$":[Ljava/lang/String;
    array-length v9, v2

    .local v9, "len$":I
    const/4 v8, 0x0

    .local v8, "i$":I
    :goto_3
    if-ge v8, v9, :cond_5

    aget-object v13, v2, v8

    .line 1617
    .local v13, "value":Ljava/lang/String;
    invoke-virtual {v13}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-virtual {v6, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1616
    add-int/lit8 v8, v8, 0x1

    goto :goto_3

    .line 1594
    .end local v2    # "arr$":[Ljava/lang/String;
    .end local v5    # "colonEnd":I
    .end local v8    # "i$":I
    .end local v9    # "len$":I
    .end local v12    # "svalue":Ljava/lang/String;
    .end local v13    # "value":Ljava/lang/String;
    .end local v14    # "valueEnd":I
    .end local v15    # "valueStart":I
    .end local v16    # "values":[Ljava/lang/String;
    .restart local v4    # "ch":C
    :cond_2
    add-int/lit8 v10, v10, 0x1

    goto :goto_0

    .line 1600
    .end local v4    # "ch":C
    .restart local v5    # "colonEnd":I
    :cond_3
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 1614
    .restart local v12    # "svalue":Ljava/lang/String;
    .restart local v14    # "valueEnd":I
    .restart local v15    # "valueStart":I
    :cond_4
    const/16 v17, 0x2c

    move/from16 v0, v17

    invoke-static {v12, v0}, Lorg/jboss/netty/util/internal/StringUtil;->split(Ljava/lang/String;C)[Ljava/lang/String;

    move-result-object v16

    .restart local v16    # "values":[Ljava/lang/String;
    goto :goto_2

    .line 1619
    .restart local v2    # "arr$":[Ljava/lang/String;
    .restart local v8    # "i$":I
    .restart local v9    # "len$":I
    :cond_5
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v17

    move/from16 v0, v17

    new-array v3, v0, [Ljava/lang/String;

    .line 1620
    .local v3, "array":[Ljava/lang/String;
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_4
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v17

    move/from16 v0, v17

    if-ge v7, v0, :cond_6

    .line 1621
    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Ljava/lang/String;

    aput-object v17, v3, v7

    .line 1620
    add-int/lit8 v7, v7, 0x1

    goto :goto_4

    .line 1623
    :cond_6
    return-object v3
.end method


# virtual methods
.method public cleanFiles()V
    .locals 2

    .prologue
    .line 781
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->factory:Lorg/jboss/netty/handler/codec/http/multipart/HttpDataFactory;

    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->request:Lorg/jboss/netty/handler/codec/http/HttpRequest;

    invoke-interface {v0, v1}, Lorg/jboss/netty/handler/codec/http/multipart/HttpDataFactory;->cleanRequestHttpDatas(Lorg/jboss/netty/handler/codec/http/HttpRequest;)V

    .line 782
    return-void
.end method

.method public getBodyHttpData(Ljava/lang/String;)Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$NotEnoughDataDecoderException;
        }
    .end annotation

    .prologue
    .line 209
    iget-boolean v1, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->isLastChunk:Z

    if-nez v1, :cond_0

    .line 210
    new-instance v1, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$NotEnoughDataDecoderException;

    invoke-direct {v1}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$NotEnoughDataDecoderException;-><init>()V

    throw v1

    .line 212
    :cond_0
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->bodyMapHttpData:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 213
    .local v0, "list":Ljava/util/List;, "Ljava/util/List<Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;>;"
    if-eqz v0, :cond_1

    .line 214
    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;

    .line 216
    :goto_0
    return-object v1

    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public getBodyHttpDatas()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$NotEnoughDataDecoderException;
        }
    .end annotation

    .prologue
    .line 193
    iget-boolean v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->isLastChunk:Z

    if-nez v0, :cond_0

    .line 194
    new-instance v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$NotEnoughDataDecoderException;

    invoke-direct {v0}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$NotEnoughDataDecoderException;-><init>()V

    throw v0

    .line 196
    :cond_0
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->bodyListHttpData:Ljava/util/List;

    return-object v0
.end method

.method public getBodyHttpDatas(Ljava/lang/String;)Ljava/util/List;
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List",
            "<",
            "Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$NotEnoughDataDecoderException;
        }
    .end annotation

    .prologue
    .line 201
    iget-boolean v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->isLastChunk:Z

    if-nez v0, :cond_0

    .line 202
    new-instance v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$NotEnoughDataDecoderException;

    invoke-direct {v0}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$NotEnoughDataDecoderException;-><init>()V

    throw v0

    .line 204
    :cond_0
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->bodyMapHttpData:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    return-object v0
.end method

.method public hasNext()Z
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$EndOfDataDecoderException;
        }
    .end annotation

    .prologue
    .line 236
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->currentStatus:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    sget-object v1, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;->EPILOGUE:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    if-ne v0, v1, :cond_0

    .line 238
    iget v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->bodyListHttpDataRank:I

    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->bodyListHttpData:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-lt v0, v1, :cond_0

    .line 239
    new-instance v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$EndOfDataDecoderException;

    invoke-direct {v0}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$EndOfDataDecoderException;-><init>()V

    throw v0

    .line 242
    :cond_0
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->bodyListHttpData:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    iget v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->bodyListHttpDataRank:I

    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->bodyListHttpData:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_1

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isMultipart()Z
    .locals 1

    .prologue
    .line 188
    const/4 v0, 0x1

    return v0
.end method

.method public next()Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$EndOfDataDecoderException;
        }
    .end annotation

    .prologue
    .line 246
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 247
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->bodyListHttpData:Ljava/util/List;

    iget v1, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->bodyListHttpDataRank:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->bodyListHttpDataRank:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;

    .line 249
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public offer(Lorg/jboss/netty/handler/codec/http/HttpChunk;)V
    .locals 5
    .param p1, "chunk"    # Lorg/jboss/netty/handler/codec/http/HttpChunk;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;
        }
    .end annotation

    .prologue
    const/4 v4, 0x1

    .line 220
    invoke-interface {p1}, Lorg/jboss/netty/handler/codec/http/HttpChunk;->getContent()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    .line 221
    .local v0, "chunked":Lorg/jboss/netty/buffer/ChannelBuffer;
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    if-nez v1, :cond_1

    .line 222
    iput-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 229
    :goto_0
    invoke-interface {p1}, Lorg/jboss/netty/handler/codec/http/HttpChunk;->isLast()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 230
    iput-boolean v4, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->isLastChunk:Z

    .line 232
    :cond_0
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->parseBody()V

    .line 233
    return-void

    .line 226
    :cond_1
    const/4 v1, 0x2

    new-array v1, v1, [Lorg/jboss/netty/buffer/ChannelBuffer;

    const/4 v2, 0x0

    iget-object v3, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    aput-object v3, v1, v2

    aput-object v0, v1, v4

    invoke-static {v1}, Lorg/jboss/netty/buffer/ChannelBuffers;->wrappedBuffer([Lorg/jboss/netty/buffer/ChannelBuffer;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v1

    iput-object v1, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    goto :goto_0
.end method

.method public removeHttpDataFromClean(Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;)V
    .locals 2
    .param p1, "data"    # Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;

    .prologue
    .line 785
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->factory:Lorg/jboss/netty/handler/codec/http/multipart/HttpDataFactory;

    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->request:Lorg/jboss/netty/handler/codec/http/HttpRequest;

    invoke-interface {v0, v1, p1}, Lorg/jboss/netty/handler/codec/http/multipart/HttpDataFactory;->removeHttpDataFromClean(Lorg/jboss/netty/handler/codec/http/HttpRequest;Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;)V

    .line 786
    return-void
.end method

.method skipControlCharacters()V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$NotEnoughDataDecoderException;
        }
    .end annotation

    .prologue
    .line 423
    :try_start_0
    new-instance v3, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;

    iget-object v4, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-direct {v3, v4}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;-><init>(Lorg/jboss/netty/buffer/ChannelBuffer;)V
    :try_end_0
    .catch Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadNoBackArrayException; {:try_start_0 .. :try_end_0} :catch_0

    .line 433
    .local v3, "sao":Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;
    :cond_0
    iget v4, v3, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->pos:I

    iget v5, v3, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->limit:I

    if-ge v4, v5, :cond_1

    .line 434
    iget-object v4, v3, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->bytes:[B

    iget v5, v3, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->pos:I

    add-int/lit8 v6, v5, 0x1

    iput v6, v3, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->pos:I

    aget-byte v4, v4, v5

    and-int/lit16 v4, v4, 0xff

    int-to-char v0, v4

    .line 435
    .local v0, "c":C
    invoke-static {v0}, Ljava/lang/Character;->isISOControl(C)Z

    move-result v4

    if-nez v4, :cond_0

    invoke-static {v0}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v4

    if-nez v4, :cond_0

    .line 436
    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->setReadPosition(I)V

    .line 437
    .end local v0    # "c":C
    .end local v3    # "sao":Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;
    :goto_0
    return-void

    .line 424
    :catch_0
    move-exception v1

    .line 426
    .local v1, "e":Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadNoBackArrayException;
    :try_start_1
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->skipControlCharactersStandard()V
    :try_end_1
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 427
    :catch_1
    move-exception v2

    .line 428
    .local v2, "e1":Ljava/lang/IndexOutOfBoundsException;
    new-instance v4, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$NotEnoughDataDecoderException;

    invoke-direct {v4, v2}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$NotEnoughDataDecoderException;-><init>(Ljava/lang/Throwable;)V

    throw v4

    .line 440
    .end local v1    # "e":Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadNoBackArrayException;
    .end local v2    # "e1":Ljava/lang/IndexOutOfBoundsException;
    .restart local v3    # "sao":Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;
    :cond_1
    new-instance v4, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$NotEnoughDataDecoderException;

    const-string v5, "Access out of bounds"

    invoke-direct {v4, v5}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$NotEnoughDataDecoderException;-><init>(Ljava/lang/String;)V

    throw v4
.end method

.method skipControlCharactersStandard()V
    .locals 3

    .prologue
    .line 444
    :cond_0
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readUnsignedByte()S

    move-result v1

    int-to-char v0, v1

    .line 445
    .local v0, "c":C
    invoke-static {v0}, Ljava/lang/Character;->isISOControl(C)Z

    move-result v1

    if-nez v1, :cond_0

    invoke-static {v0}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v1

    if-nez v1, :cond_0

    .line 446
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    iget-object v2, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostMultipartRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v2}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-interface {v1, v2}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex(I)V

    .line 450
    return-void
.end method
