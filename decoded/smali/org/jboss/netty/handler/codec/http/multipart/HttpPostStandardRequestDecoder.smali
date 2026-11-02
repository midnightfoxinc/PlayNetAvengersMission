.class public Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;
.super Ljava/lang/Object;
.source "HttpPostStandardRequestDecoder.java"

# interfaces
.implements Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpPostRequestDecoder;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder$1;
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

.field private final charset:Ljava/nio/charset/Charset;

.field private currentAttribute:Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

.field private currentStatus:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

.field private final factory:Lorg/jboss/netty/handler/codec/http/multipart/HttpDataFactory;

.field private isLastChunk:Z

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
    .line 102
    new-instance v0, Lorg/jboss/netty/handler/codec/http/multipart/DefaultHttpDataFactory;

    const-wide/16 v2, 0x4000

    invoke-direct {v0, v2, v3}, Lorg/jboss/netty/handler/codec/http/multipart/DefaultHttpDataFactory;-><init>(J)V

    sget-object v1, Lorg/jboss/netty/handler/codec/http/HttpConstants;->DEFAULT_CHARSET:Ljava/nio/charset/Charset;

    invoke-direct {p0, v0, p1, v1}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;-><init>(Lorg/jboss/netty/handler/codec/http/multipart/HttpDataFactory;Lorg/jboss/netty/handler/codec/http/HttpRequest;Ljava/nio/charset/Charset;)V

    .line 104
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
    .line 115
    sget-object v0, Lorg/jboss/netty/handler/codec/http/HttpConstants;->DEFAULT_CHARSET:Ljava/nio/charset/Charset;

    invoke-direct {p0, p1, p2, v0}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;-><init>(Lorg/jboss/netty/handler/codec/http/multipart/HttpDataFactory;Lorg/jboss/netty/handler/codec/http/HttpRequest;Ljava/nio/charset/Charset;)V

    .line 116
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
    .line 127
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 67
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->bodyListHttpData:Ljava/util/List;

    .line 72
    new-instance v0, Ljava/util/TreeMap;

    sget-object v1, Lorg/jboss/netty/util/internal/CaseIgnoringComparator;->INSTANCE:Lorg/jboss/netty/util/internal/CaseIgnoringComparator;

    invoke-direct {v0, v1}, Ljava/util/TreeMap;-><init>(Ljava/util/Comparator;)V

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->bodyMapHttpData:Ljava/util/Map;

    .line 88
    sget-object v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;->NOTSTARTED:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->currentStatus:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    .line 128
    if-nez p1, :cond_0

    .line 129
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "factory"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 131
    :cond_0
    if-nez p2, :cond_1

    .line 132
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "request"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 134
    :cond_1
    if-nez p3, :cond_2

    .line 135
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "charset"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 137
    :cond_2
    iput-object p2, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->request:Lorg/jboss/netty/handler/codec/http/HttpRequest;

    .line 138
    iput-object p3, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->charset:Ljava/nio/charset/Charset;

    .line 139
    iput-object p1, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->factory:Lorg/jboss/netty/handler/codec/http/multipart/HttpDataFactory;

    .line 140
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->request:Lorg/jboss/netty/handler/codec/http/HttpRequest;

    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/HttpRequest;->isChunked()Z

    move-result v0

    if-nez v0, :cond_3

    .line 141
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->request:Lorg/jboss/netty/handler/codec/http/HttpRequest;

    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/HttpRequest;->getContent()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 142
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->isLastChunk:Z

    .line 143
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->parseBody()V

    .line 145
    :cond_3
    return-void
.end method

.method private addHttpData(Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;)V
    .locals 3
    .param p1, "data"    # Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;

    .prologue
    .line 232
    if-nez p1, :cond_0

    .line 242
    :goto_0
    return-void

    .line 235
    :cond_0
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->bodyMapHttpData:Ljava/util/Map;

    invoke-interface {p1}, Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 236
    .local v0, "datas":Ljava/util/List;, "Ljava/util/List<Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;>;"
    if-nez v0, :cond_1

    .line 237
    new-instance v0, Ljava/util/ArrayList;

    .end local v0    # "datas":Ljava/util/List;, "Ljava/util/List<Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;>;"
    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 238
    .restart local v0    # "datas":Ljava/util/List;, "Ljava/util/List<Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;>;"
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->bodyMapHttpData:Ljava/util/Map;

    invoke-interface {p1}, Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 240
    :cond_1
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 241
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->bodyListHttpData:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method private static decodeAttribute(Ljava/lang/String;Ljava/nio/charset/Charset;)Ljava/lang/String;
    .locals 4
    .param p0, "s"    # Ljava/lang/String;
    .param p1, "charset"    # Ljava/nio/charset/Charset;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;
        }
    .end annotation

    .prologue
    .line 517
    if-nez p0, :cond_0

    .line 518
    const-string v1, ""

    .line 521
    :goto_0
    return-object v1

    :cond_0
    :try_start_0
    invoke-virtual {p1}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v1

    goto :goto_0

    .line 522
    :catch_0
    move-exception v0

    .line 523
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v1, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;

    invoke-virtual {p1}, Ljava/nio/charset/Charset;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1

    .line 524
    .end local v0    # "e":Ljava/io/UnsupportedEncodingException;
    :catch_1
    move-exception v0

    .line 525
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    new-instance v1, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Bad string: \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const/16 v3, 0x27

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method private parseBody()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;
        }
    .end annotation

    .prologue
    .line 218
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->currentStatus:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    sget-object v1, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;->PREEPILOGUE:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->currentStatus:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    sget-object v1, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;->EPILOGUE:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    if-ne v0, v1, :cond_2

    .line 220
    :cond_0
    iget-boolean v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->isLastChunk:Z

    if-eqz v0, :cond_1

    .line 221
    sget-object v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;->EPILOGUE:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->currentStatus:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    .line 226
    :cond_1
    :goto_0
    return-void

    .line 225
    :cond_2
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->parseBodyAttributes()V

    goto :goto_0
.end method

.method private parseBodyAttributes()V
    .locals 15
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;
        }
    .end annotation

    .prologue
    const/16 v14, 0x26

    const/16 v13, 0xa

    .line 374
    :try_start_0
    new-instance v9, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;

    iget-object v10, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-direct {v9, v10}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;-><init>(Lorg/jboss/netty/buffer/ChannelBuffer;)V
    :try_end_0
    .catch Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadNoBackArrayException; {:try_start_0 .. :try_end_0} :catch_0

    .line 379
    .local v9, "sao":Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;
    iget-object v10, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v10}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v6

    .line 380
    .local v6, "firstpos":I
    move v2, v6

    .line 383
    .local v2, "currentpos":I
    iget-object v10, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->currentStatus:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    sget-object v11, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;->NOTSTARTED:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    if-ne v10, v11, :cond_0

    .line 384
    sget-object v10, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;->DISPOSITION:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    iput-object v10, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->currentStatus:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    .line 386
    :cond_0
    const/4 v1, 0x1

    .line 389
    .local v1, "contRead":Z
    :cond_1
    :goto_0
    :try_start_1
    iget v10, v9, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->pos:I

    iget v11, v9, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->limit:I

    if-ge v10, v11, :cond_2

    .line 390
    iget-object v10, v9, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->bytes:[B

    iget v11, v9, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->pos:I

    add-int/lit8 v12, v11, 0x1

    iput v12, v9, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->pos:I

    aget-byte v10, v10, v11

    and-int/lit16 v10, v10, 0xff

    int-to-char v8, v10

    .line 391
    .local v8, "read":C
    add-int/lit8 v2, v2, 0x1

    .line 392
    sget-object v10, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder$1;->$SwitchMap$org$jboss$netty$handler$codec$http$multipart$HttpPostRequestDecoder$MultiPartStatus:[I

    iget-object v11, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->currentStatus:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    invoke-virtual {v11}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;->ordinal()I

    move-result v11

    aget v10, v10, v11

    packed-switch v10, :pswitch_data_0

    .line 458
    const/4 v10, 0x0

    invoke-virtual {v9, v10}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->setReadPosition(I)V

    .line 459
    const/4 v1, 0x0

    .line 463
    .end local v8    # "read":C
    :cond_2
    :goto_1
    iget-boolean v10, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->isLastChunk:Z

    if-eqz v10, :cond_a

    iget-object v10, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->currentAttribute:Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    if-eqz v10, :cond_a

    .line 465
    move v0, v2

    .line 466
    .local v0, "ampersandpos":I
    if-le v0, v6, :cond_9

    .line 467
    iget-object v10, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    sub-int v11, v0, v6

    invoke-interface {v10, v6, v11}, Lorg/jboss/netty/buffer/ChannelBuffer;->slice(II)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v10

    invoke-direct {p0, v10}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->setFinalBuffer(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    .line 472
    :cond_3
    :goto_2
    move v6, v2

    .line 473
    sget-object v10, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;->EPILOGUE:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    iput-object v10, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->currentStatus:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    .line 474
    iget-object v10, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v10, v6}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex(I)V
    :try_end_1
    .catch Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2

    .line 499
    .end local v0    # "ampersandpos":I
    .end local v1    # "contRead":Z
    .end local v2    # "currentpos":I
    .end local v6    # "firstpos":I
    .end local v9    # "sao":Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;
    :goto_3
    return-void

    .line 375
    :catch_0
    move-exception v4

    .line 376
    .local v4, "e1":Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadNoBackArrayException;
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->parseBodyAttributesStandard()V

    goto :goto_3

    .line 394
    .end local v4    # "e1":Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadNoBackArrayException;
    .restart local v1    # "contRead":Z
    .restart local v2    # "currentpos":I
    .restart local v6    # "firstpos":I
    .restart local v8    # "read":C
    .restart local v9    # "sao":Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;
    :pswitch_0
    const/16 v10, 0x3d

    if-ne v8, v10, :cond_4

    .line 395
    :try_start_2
    sget-object v10, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;->FIELD:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    iput-object v10, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->currentStatus:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    .line 396
    add-int/lit8 v5, v2, -0x1

    .line 397
    .local v5, "equalpos":I
    iget-object v10, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    sub-int v11, v5, v6

    iget-object v12, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->charset:Ljava/nio/charset/Charset;

    invoke-interface {v10, v6, v11, v12}, Lorg/jboss/netty/buffer/ChannelBuffer;->toString(IILjava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v10

    iget-object v11, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->charset:Ljava/nio/charset/Charset;

    invoke-static {v10, v11}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->decodeAttribute(Ljava/lang/String;Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v7

    .line 400
    .local v7, "key":Ljava/lang/String;
    iget-object v10, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->factory:Lorg/jboss/netty/handler/codec/http/multipart/HttpDataFactory;

    iget-object v11, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->request:Lorg/jboss/netty/handler/codec/http/HttpRequest;

    invoke-interface {v10, v11, v7}, Lorg/jboss/netty/handler/codec/http/multipart/HttpDataFactory;->createAttribute(Lorg/jboss/netty/handler/codec/http/HttpRequest;Ljava/lang/String;)Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    move-result-object v10

    iput-object v10, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->currentAttribute:Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    .line 401
    move v6, v2

    .line 402
    goto :goto_0

    .end local v5    # "equalpos":I
    .end local v7    # "key":Ljava/lang/String;
    :cond_4
    if-ne v8, v14, :cond_1

    .line 403
    sget-object v10, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;->DISPOSITION:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    iput-object v10, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->currentStatus:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    .line 404
    add-int/lit8 v0, v2, -0x1

    .line 405
    .restart local v0    # "ampersandpos":I
    iget-object v10, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    sub-int v11, v0, v6

    iget-object v12, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->charset:Ljava/nio/charset/Charset;

    invoke-interface {v10, v6, v11, v12}, Lorg/jboss/netty/buffer/ChannelBuffer;->toString(IILjava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v10

    iget-object v11, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->charset:Ljava/nio/charset/Charset;

    invoke-static {v10, v11}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->decodeAttribute(Ljava/lang/String;Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v7

    .line 407
    .restart local v7    # "key":Ljava/lang/String;
    iget-object v10, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->factory:Lorg/jboss/netty/handler/codec/http/multipart/HttpDataFactory;

    iget-object v11, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->request:Lorg/jboss/netty/handler/codec/http/HttpRequest;

    invoke-interface {v10, v11, v7}, Lorg/jboss/netty/handler/codec/http/multipart/HttpDataFactory;->createAttribute(Lorg/jboss/netty/handler/codec/http/HttpRequest;Ljava/lang/String;)Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    move-result-object v10

    iput-object v10, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->currentAttribute:Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    .line 408
    iget-object v10, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->currentAttribute:Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    const-string v11, ""

    invoke-interface {v10, v11}, Lorg/jboss/netty/handler/codec/http/multipart/Attribute;->setValue(Ljava/lang/String;)V

    .line 409
    iget-object v10, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->currentAttribute:Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    invoke-direct {p0, v10}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->addHttpData(Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;)V

    .line 410
    const/4 v10, 0x0

    iput-object v10, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->currentAttribute:Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    .line 411
    move v6, v2

    .line 412
    const/4 v1, 0x1

    .line 413
    goto/16 :goto_0

    .line 416
    .end local v0    # "ampersandpos":I
    .end local v7    # "key":Ljava/lang/String;
    :pswitch_1
    if-ne v8, v14, :cond_5

    .line 417
    sget-object v10, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;->DISPOSITION:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    iput-object v10, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->currentStatus:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    .line 418
    add-int/lit8 v0, v2, -0x1

    .line 419
    .restart local v0    # "ampersandpos":I
    iget-object v10, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    sub-int v11, v0, v6

    invoke-interface {v10, v6, v11}, Lorg/jboss/netty/buffer/ChannelBuffer;->slice(II)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v10

    invoke-direct {p0, v10}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->setFinalBuffer(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    .line 420
    move v6, v2

    .line 421
    const/4 v1, 0x1

    goto/16 :goto_0

    .line 422
    .end local v0    # "ampersandpos":I
    :cond_5
    const/16 v10, 0xd

    if-ne v8, v10, :cond_8

    .line 423
    iget v10, v9, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->pos:I

    iget v11, v9, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->limit:I

    if-ge v10, v11, :cond_7

    .line 424
    iget-object v10, v9, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->bytes:[B

    iget v11, v9, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->pos:I

    add-int/lit8 v12, v11, 0x1

    iput v12, v9, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->pos:I

    aget-byte v10, v10, v11

    and-int/lit16 v10, v10, 0xff

    int-to-char v8, v10

    .line 425
    add-int/lit8 v2, v2, 0x1

    .line 426
    if-ne v8, v13, :cond_6

    .line 427
    sget-object v10, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;->PREEPILOGUE:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    iput-object v10, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->currentStatus:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    .line 428
    add-int/lit8 v0, v2, -0x2

    .line 429
    .restart local v0    # "ampersandpos":I
    const/4 v10, 0x0

    invoke-virtual {v9, v10}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->setReadPosition(I)V

    .line 430
    iget-object v10, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    sub-int v11, v0, v6

    invoke-interface {v10, v6, v11}, Lorg/jboss/netty/buffer/ChannelBuffer;->slice(II)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v10

    invoke-direct {p0, v10}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->setFinalBuffer(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    .line 432
    move v6, v2

    .line 433
    const/4 v1, 0x0

    .line 434
    goto/16 :goto_1

    .line 437
    .end local v0    # "ampersandpos":I
    :cond_6
    const/4 v10, 0x0

    invoke-virtual {v9, v10}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->setReadPosition(I)V

    .line 438
    new-instance v10, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;

    const-string v11, "Bad end of line"

    invoke-direct {v10, v11}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;-><init>(Ljava/lang/String;)V

    throw v10
    :try_end_2
    .catch Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2

    .line 490
    .end local v8    # "read":C
    :catch_1
    move-exception v3

    .line 492
    .local v3, "e":Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;
    iget-object v10, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v10, v6}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex(I)V

    .line 493
    throw v3

    .line 441
    .end local v3    # "e":Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;
    .restart local v8    # "read":C
    :cond_7
    :try_start_3
    iget v10, v9, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->limit:I

    if-lez v10, :cond_1

    .line 442
    add-int/lit8 v2, v2, -0x1

    goto/16 :goto_0

    .line 445
    :cond_8
    if-ne v8, v13, :cond_1

    .line 446
    sget-object v10, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;->PREEPILOGUE:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    iput-object v10, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->currentStatus:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    .line 447
    add-int/lit8 v0, v2, -0x1

    .line 448
    .restart local v0    # "ampersandpos":I
    const/4 v10, 0x0

    invoke-virtual {v9, v10}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$SeekAheadOptimize;->setReadPosition(I)V

    .line 449
    iget-object v10, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    sub-int v11, v0, v6

    invoke-interface {v10, v6, v11}, Lorg/jboss/netty/buffer/ChannelBuffer;->slice(II)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v10

    invoke-direct {p0, v10}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->setFinalBuffer(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    .line 451
    move v6, v2

    .line 452
    const/4 v1, 0x0

    .line 453
    goto/16 :goto_1

    .line 469
    .end local v8    # "read":C
    :cond_9
    iget-object v10, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->currentAttribute:Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    invoke-interface {v10}, Lorg/jboss/netty/handler/codec/http/multipart/Attribute;->isCompleted()Z

    move-result v10

    if-nez v10, :cond_3

    .line 470
    sget-object v10, Lorg/jboss/netty/buffer/ChannelBuffers;->EMPTY_BUFFER:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-direct {p0, v10}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->setFinalBuffer(Lorg/jboss/netty/buffer/ChannelBuffer;)V
    :try_end_3
    .catch Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2

    goto/16 :goto_2

    .line 494
    .end local v0    # "ampersandpos":I
    :catch_2
    move-exception v3

    .line 496
    .local v3, "e":Ljava/io/IOException;
    iget-object v10, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v10, v6}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex(I)V

    .line 497
    new-instance v10, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;

    invoke-direct {v10, v3}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;-><init>(Ljava/lang/Throwable;)V

    throw v10

    .line 477
    .end local v3    # "e":Ljava/io/IOException;
    :cond_a
    if-eqz v1, :cond_c

    :try_start_4
    iget-object v10, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->currentAttribute:Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    if-eqz v10, :cond_c

    .line 479
    iget-object v10, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->currentStatus:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    sget-object v11, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;->FIELD:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    if-ne v10, v11, :cond_b

    .line 480
    iget-object v10, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->currentAttribute:Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    iget-object v11, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    sub-int v12, v2, v6

    invoke-interface {v11, v6, v12}, Lorg/jboss/netty/buffer/ChannelBuffer;->slice(II)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v11

    const/4 v12, 0x0

    invoke-interface {v10, v11, v12}, Lorg/jboss/netty/handler/codec/http/multipart/Attribute;->addContent(Lorg/jboss/netty/buffer/ChannelBuffer;Z)V

    .line 483
    move v6, v2

    .line 485
    :cond_b
    iget-object v10, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v10, v6}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex(I)V

    goto/16 :goto_3

    .line 488
    :cond_c
    iget-object v10, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v10, v6}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex(I)V
    :try_end_4
    .catch Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2

    goto/16 :goto_3

    .line 392
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method private parseBodyAttributesStandard()V
    .locals 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;
        }
    .end annotation

    .prologue
    const/16 v12, 0x26

    const/16 v11, 0xa

    .line 252
    iget-object v8, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v8}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v5

    .line 253
    .local v5, "firstpos":I
    move v2, v5

    .line 256
    .local v2, "currentpos":I
    iget-object v8, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->currentStatus:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    sget-object v9, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;->NOTSTARTED:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    if-ne v8, v9, :cond_0

    .line 257
    sget-object v8, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;->DISPOSITION:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    iput-object v8, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->currentStatus:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    .line 259
    :cond_0
    const/4 v1, 0x1

    .line 261
    .local v1, "contRead":Z
    :cond_1
    :goto_0
    :try_start_0
    iget-object v8, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v8}, Lorg/jboss/netty/buffer/ChannelBuffer;->readable()Z

    move-result v8

    if-eqz v8, :cond_7

    if-eqz v1, :cond_7

    .line 262
    iget-object v8, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v8}, Lorg/jboss/netty/buffer/ChannelBuffer;->readUnsignedByte()S

    move-result v8

    int-to-char v7, v8

    .line 263
    .local v7, "read":C
    add-int/lit8 v2, v2, 0x1

    .line 264
    sget-object v8, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder$1;->$SwitchMap$org$jboss$netty$handler$codec$http$multipart$HttpPostRequestDecoder$MultiPartStatus:[I

    iget-object v9, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->currentStatus:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    invoke-virtual {v9}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;->ordinal()I

    move-result v9

    aget v8, v8, v9

    packed-switch v8, :pswitch_data_0

    .line 323
    const/4 v1, 0x0

    goto :goto_0

    .line 266
    :pswitch_0
    const/16 v8, 0x3d

    if-ne v7, v8, :cond_2

    .line 267
    sget-object v8, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;->FIELD:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    iput-object v8, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->currentStatus:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    .line 268
    add-int/lit8 v4, v2, -0x1

    .line 269
    .local v4, "equalpos":I
    iget-object v8, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    sub-int v9, v4, v5

    iget-object v10, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->charset:Ljava/nio/charset/Charset;

    invoke-interface {v8, v5, v9, v10}, Lorg/jboss/netty/buffer/ChannelBuffer;->toString(IILjava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v8

    iget-object v9, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->charset:Ljava/nio/charset/Charset;

    invoke-static {v8, v9}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->decodeAttribute(Ljava/lang/String;Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v6

    .line 272
    .local v6, "key":Ljava/lang/String;
    iget-object v8, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->factory:Lorg/jboss/netty/handler/codec/http/multipart/HttpDataFactory;

    iget-object v9, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->request:Lorg/jboss/netty/handler/codec/http/HttpRequest;

    invoke-interface {v8, v9, v6}, Lorg/jboss/netty/handler/codec/http/multipart/HttpDataFactory;->createAttribute(Lorg/jboss/netty/handler/codec/http/HttpRequest;Ljava/lang/String;)Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    move-result-object v8

    iput-object v8, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->currentAttribute:Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    .line 273
    move v5, v2

    .line 274
    goto :goto_0

    .end local v4    # "equalpos":I
    .end local v6    # "key":Ljava/lang/String;
    :cond_2
    if-ne v7, v12, :cond_1

    .line 275
    sget-object v8, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;->DISPOSITION:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    iput-object v8, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->currentStatus:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    .line 276
    add-int/lit8 v0, v2, -0x1

    .line 277
    .local v0, "ampersandpos":I
    iget-object v8, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    sub-int v9, v0, v5

    iget-object v10, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->charset:Ljava/nio/charset/Charset;

    invoke-interface {v8, v5, v9, v10}, Lorg/jboss/netty/buffer/ChannelBuffer;->toString(IILjava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v8

    iget-object v9, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->charset:Ljava/nio/charset/Charset;

    invoke-static {v8, v9}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->decodeAttribute(Ljava/lang/String;Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v6

    .line 279
    .restart local v6    # "key":Ljava/lang/String;
    iget-object v8, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->factory:Lorg/jboss/netty/handler/codec/http/multipart/HttpDataFactory;

    iget-object v9, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->request:Lorg/jboss/netty/handler/codec/http/HttpRequest;

    invoke-interface {v8, v9, v6}, Lorg/jboss/netty/handler/codec/http/multipart/HttpDataFactory;->createAttribute(Lorg/jboss/netty/handler/codec/http/HttpRequest;Ljava/lang/String;)Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    move-result-object v8

    iput-object v8, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->currentAttribute:Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    .line 280
    iget-object v8, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->currentAttribute:Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    const-string v9, ""

    invoke-interface {v8, v9}, Lorg/jboss/netty/handler/codec/http/multipart/Attribute;->setValue(Ljava/lang/String;)V

    .line 281
    iget-object v8, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->currentAttribute:Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    invoke-direct {p0, v8}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->addHttpData(Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;)V

    .line 282
    const/4 v8, 0x0

    iput-object v8, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->currentAttribute:Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    .line 283
    move v5, v2

    .line 284
    const/4 v1, 0x1

    .line 285
    goto :goto_0

    .line 288
    .end local v0    # "ampersandpos":I
    .end local v6    # "key":Ljava/lang/String;
    :pswitch_1
    if-ne v7, v12, :cond_3

    .line 289
    sget-object v8, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;->DISPOSITION:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    iput-object v8, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->currentStatus:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    .line 290
    add-int/lit8 v0, v2, -0x1

    .line 291
    .restart local v0    # "ampersandpos":I
    iget-object v8, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    sub-int v9, v0, v5

    invoke-interface {v8, v5, v9}, Lorg/jboss/netty/buffer/ChannelBuffer;->slice(II)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v8

    invoke-direct {p0, v8}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->setFinalBuffer(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    .line 292
    move v5, v2

    .line 293
    const/4 v1, 0x1

    goto/16 :goto_0

    .line 294
    .end local v0    # "ampersandpos":I
    :cond_3
    const/16 v8, 0xd

    if-ne v7, v8, :cond_6

    .line 295
    iget-object v8, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v8}, Lorg/jboss/netty/buffer/ChannelBuffer;->readable()Z

    move-result v8

    if-eqz v8, :cond_5

    .line 296
    iget-object v8, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v8}, Lorg/jboss/netty/buffer/ChannelBuffer;->readUnsignedByte()S

    move-result v8

    int-to-char v7, v8

    .line 297
    add-int/lit8 v2, v2, 0x1

    .line 298
    if-ne v7, v11, :cond_4

    .line 299
    sget-object v8, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;->PREEPILOGUE:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    iput-object v8, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->currentStatus:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    .line 300
    add-int/lit8 v0, v2, -0x2

    .line 301
    .restart local v0    # "ampersandpos":I
    iget-object v8, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    sub-int v9, v0, v5

    invoke-interface {v8, v5, v9}, Lorg/jboss/netty/buffer/ChannelBuffer;->slice(II)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v8

    invoke-direct {p0, v8}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->setFinalBuffer(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    .line 303
    move v5, v2

    .line 304
    const/4 v1, 0x0

    goto/16 :goto_0

    .line 307
    .end local v0    # "ampersandpos":I
    :cond_4
    new-instance v8, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;

    const-string v9, "Bad end of line"

    invoke-direct {v8, v9}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;-><init>(Ljava/lang/String;)V

    throw v8
    :try_end_0
    .catch Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 353
    .end local v7    # "read":C
    :catch_0
    move-exception v3

    .line 355
    .local v3, "e":Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;
    iget-object v8, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v8, v5}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex(I)V

    .line 356
    throw v3

    .line 310
    .end local v3    # "e":Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;
    .restart local v7    # "read":C
    :cond_5
    add-int/lit8 v2, v2, -0x1

    goto/16 :goto_0

    .line 312
    :cond_6
    if-ne v7, v11, :cond_1

    .line 313
    :try_start_1
    sget-object v8, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;->PREEPILOGUE:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    iput-object v8, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->currentStatus:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    .line 314
    add-int/lit8 v0, v2, -0x1

    .line 315
    .restart local v0    # "ampersandpos":I
    iget-object v8, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    sub-int v9, v0, v5

    invoke-interface {v8, v5, v9}, Lorg/jboss/netty/buffer/ChannelBuffer;->slice(II)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v8

    invoke-direct {p0, v8}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->setFinalBuffer(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    .line 317
    move v5, v2

    .line 318
    const/4 v1, 0x0

    goto/16 :goto_0

    .line 326
    .end local v0    # "ampersandpos":I
    .end local v7    # "read":C
    :cond_7
    iget-boolean v8, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->isLastChunk:Z

    if-eqz v8, :cond_a

    iget-object v8, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->currentAttribute:Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    if-eqz v8, :cond_a

    .line 328
    move v0, v2

    .line 329
    .restart local v0    # "ampersandpos":I
    if-le v0, v5, :cond_9

    .line 330
    iget-object v8, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    sub-int v9, v0, v5

    invoke-interface {v8, v5, v9}, Lorg/jboss/netty/buffer/ChannelBuffer;->slice(II)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v8

    invoke-direct {p0, v8}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->setFinalBuffer(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    .line 335
    :cond_8
    :goto_1
    move v5, v2

    .line 336
    sget-object v8, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;->EPILOGUE:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    iput-object v8, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->currentStatus:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    .line 337
    iget-object v8, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v8, v5}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex(I)V

    .line 362
    .end local v0    # "ampersandpos":I
    :goto_2
    return-void

    .line 332
    .restart local v0    # "ampersandpos":I
    :cond_9
    iget-object v8, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->currentAttribute:Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    invoke-interface {v8}, Lorg/jboss/netty/handler/codec/http/multipart/Attribute;->isCompleted()Z

    move-result v8

    if-nez v8, :cond_8

    .line 333
    sget-object v8, Lorg/jboss/netty/buffer/ChannelBuffers;->EMPTY_BUFFER:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-direct {p0, v8}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->setFinalBuffer(Lorg/jboss/netty/buffer/ChannelBuffer;)V
    :try_end_1
    .catch Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    .line 357
    .end local v0    # "ampersandpos":I
    :catch_1
    move-exception v3

    .line 359
    .local v3, "e":Ljava/io/IOException;
    iget-object v8, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v8, v5}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex(I)V

    .line 360
    new-instance v8, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;

    invoke-direct {v8, v3}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;-><init>(Ljava/lang/Throwable;)V

    throw v8

    .line 340
    .end local v3    # "e":Ljava/io/IOException;
    :cond_a
    if-eqz v1, :cond_c

    :try_start_2
    iget-object v8, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->currentAttribute:Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    if-eqz v8, :cond_c

    .line 342
    iget-object v8, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->currentStatus:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    sget-object v9, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;->FIELD:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    if-ne v8, v9, :cond_b

    .line 343
    iget-object v8, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->currentAttribute:Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    iget-object v9, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    sub-int v10, v2, v5

    invoke-interface {v9, v5, v10}, Lorg/jboss/netty/buffer/ChannelBuffer;->slice(II)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v9

    const/4 v10, 0x0

    invoke-interface {v8, v9, v10}, Lorg/jboss/netty/handler/codec/http/multipart/Attribute;->addContent(Lorg/jboss/netty/buffer/ChannelBuffer;Z)V

    .line 346
    move v5, v2

    .line 348
    :cond_b
    iget-object v8, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v8, v5}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex(I)V

    goto :goto_2

    .line 351
    :cond_c
    iget-object v8, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v8, v5}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex(I)V
    :try_end_2
    .catch Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_2

    .line 264
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method private setFinalBuffer(Lorg/jboss/netty/buffer/ChannelBuffer;)V
    .locals 3
    .param p1, "buffer"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$ErrorDataDecoderException;,
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 502
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->currentAttribute:Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    const/4 v2, 0x1

    invoke-interface {v1, p1, v2}, Lorg/jboss/netty/handler/codec/http/multipart/Attribute;->addContent(Lorg/jboss/netty/buffer/ChannelBuffer;Z)V

    .line 503
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->currentAttribute:Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    invoke-interface {v1}, Lorg/jboss/netty/handler/codec/http/multipart/Attribute;->getChannelBuffer()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v1

    iget-object v2, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->charset:Ljava/nio/charset/Charset;

    invoke-interface {v1, v2}, Lorg/jboss/netty/buffer/ChannelBuffer;->toString(Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->charset:Ljava/nio/charset/Charset;

    invoke-static {v1, v2}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->decodeAttribute(Ljava/lang/String;Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v0

    .line 506
    .local v0, "value":Ljava/lang/String;
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->currentAttribute:Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    invoke-interface {v1, v0}, Lorg/jboss/netty/handler/codec/http/multipart/Attribute;->setValue(Ljava/lang/String;)V

    .line 507
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->currentAttribute:Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    invoke-direct {p0, v1}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->addHttpData(Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;)V

    .line 508
    const/4 v1, 0x0

    iput-object v1, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->currentAttribute:Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    .line 509
    return-void
.end method


# virtual methods
.method public cleanFiles()V
    .locals 2

    .prologue
    .line 530
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->factory:Lorg/jboss/netty/handler/codec/http/multipart/HttpDataFactory;

    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->request:Lorg/jboss/netty/handler/codec/http/HttpRequest;

    invoke-interface {v0, v1}, Lorg/jboss/netty/handler/codec/http/multipart/HttpDataFactory;->cleanRequestHttpDatas(Lorg/jboss/netty/handler/codec/http/HttpRequest;)V

    .line 531
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
    .line 169
    iget-boolean v1, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->isLastChunk:Z

    if-nez v1, :cond_0

    .line 170
    new-instance v1, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$NotEnoughDataDecoderException;

    invoke-direct {v1}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$NotEnoughDataDecoderException;-><init>()V

    throw v1

    .line 172
    :cond_0
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->bodyMapHttpData:Ljava/util/Map;

    invoke-interface {v1, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 173
    .local v0, "list":Ljava/util/List;, "Ljava/util/List<Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;>;"
    if-eqz v0, :cond_1

    .line 174
    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;

    .line 176
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
    .line 153
    iget-boolean v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->isLastChunk:Z

    if-nez v0, :cond_0

    .line 154
    new-instance v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$NotEnoughDataDecoderException;

    invoke-direct {v0}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$NotEnoughDataDecoderException;-><init>()V

    throw v0

    .line 156
    :cond_0
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->bodyListHttpData:Ljava/util/List;

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
    .line 161
    iget-boolean v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->isLastChunk:Z

    if-nez v0, :cond_0

    .line 162
    new-instance v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$NotEnoughDataDecoderException;

    invoke-direct {v0}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$NotEnoughDataDecoderException;-><init>()V

    throw v0

    .line 164
    :cond_0
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->bodyMapHttpData:Ljava/util/Map;

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
    .line 196
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->currentStatus:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    sget-object v1, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;->EPILOGUE:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$MultiPartStatus;

    if-ne v0, v1, :cond_0

    .line 198
    iget v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->bodyListHttpDataRank:I

    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->bodyListHttpData:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-lt v0, v1, :cond_0

    .line 199
    new-instance v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$EndOfDataDecoderException;

    invoke-direct {v0}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestDecoder$EndOfDataDecoderException;-><init>()V

    throw v0

    .line 202
    :cond_0
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->bodyListHttpData:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    iget v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->bodyListHttpDataRank:I

    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->bodyListHttpData:Ljava/util/List;

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
    .line 148
    const/4 v0, 0x0

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
    .line 206
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 207
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->bodyListHttpData:Ljava/util/List;

    iget v1, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->bodyListHttpDataRank:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->bodyListHttpDataRank:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;

    .line 209
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

    .line 180
    invoke-interface {p1}, Lorg/jboss/netty/handler/codec/http/HttpChunk;->getContent()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    .line 181
    .local v0, "chunked":Lorg/jboss/netty/buffer/ChannelBuffer;
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    if-nez v1, :cond_1

    .line 182
    iput-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 189
    :goto_0
    invoke-interface {p1}, Lorg/jboss/netty/handler/codec/http/HttpChunk;->isLast()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 190
    iput-boolean v4, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->isLastChunk:Z

    .line 192
    :cond_0
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->parseBody()V

    .line 193
    return-void

    .line 186
    :cond_1
    const/4 v1, 0x2

    new-array v1, v1, [Lorg/jboss/netty/buffer/ChannelBuffer;

    const/4 v2, 0x0

    iget-object v3, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    aput-object v3, v1, v2

    aput-object v0, v1, v4

    invoke-static {v1}, Lorg/jboss/netty/buffer/ChannelBuffers;->wrappedBuffer([Lorg/jboss/netty/buffer/ChannelBuffer;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v1

    iput-object v1, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->undecodedChunk:Lorg/jboss/netty/buffer/ChannelBuffer;

    goto :goto_0
.end method

.method public removeHttpDataFromClean(Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;)V
    .locals 2
    .param p1, "data"    # Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;

    .prologue
    .line 534
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->factory:Lorg/jboss/netty/handler/codec/http/multipart/HttpDataFactory;

    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostStandardRequestDecoder;->request:Lorg/jboss/netty/handler/codec/http/HttpRequest;

    invoke-interface {v0, v1, p1}, Lorg/jboss/netty/handler/codec/http/multipart/HttpDataFactory;->removeHttpDataFromClean(Lorg/jboss/netty/handler/codec/http/HttpRequest;Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;)V

    .line 535
    return-void
.end method
