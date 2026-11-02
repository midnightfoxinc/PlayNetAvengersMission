.class public abstract Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;
.super Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;
.source "HttpMessageDecoder.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder$1;,
        Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder$State;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder",
        "<",
        "Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder$State;",
        ">;"
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private chunkSize:J

.field private content:Lorg/jboss/netty/buffer/ChannelBuffer;

.field private contentRead:I

.field private headerSize:I

.field private final maxChunkSize:I

.field private final maxHeaderSize:I

.field private final maxInitialLineLength:I

.field private message:Lorg/jboss/netty/handler/codec/http/HttpMessage;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 102
    const-class v0, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected constructor <init>()V
    .locals 2

    .prologue
    const/16 v1, 0x2000

    .line 140
    const/16 v0, 0x1000

    invoke-direct {p0, v0, v1, v1}, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;-><init>(III)V

    .line 141
    return-void
.end method

.method protected constructor <init>(III)V
    .locals 3
    .param p1, "maxInitialLineLength"    # I
    .param p2, "maxHeaderSize"    # I
    .param p3, "maxChunkSize"    # I

    .prologue
    .line 149
    sget-object v0, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder$State;->SKIP_CONTROL_CHARS:Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder$State;

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Lorg/jboss/netty/handler/codec/replay/ReplayingDecoder;-><init>(Ljava/lang/Enum;Z)V

    .line 151
    if-gtz p1, :cond_0

    .line 152
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "maxInitialLineLength must be a positive integer: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 156
    :cond_0
    if-gtz p2, :cond_1

    .line 157
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "maxHeaderSize must be a positive integer: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 161
    :cond_1
    if-gez p3, :cond_2

    .line 162
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "maxChunkSize must be a positive integer: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 166
    :cond_2
    iput p1, p0, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->maxInitialLineLength:I

    .line 167
    iput p2, p0, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->maxHeaderSize:I

    .line 168
    iput p3, p0, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->maxChunkSize:I

    .line 169
    return-void
.end method

.method private static findEndOfString(Ljava/lang/String;)I
    .locals 2
    .param p0, "sb"    # Ljava/lang/String;

    .prologue
    .line 763
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    .local v0, "result":I
    :goto_0
    if-lez v0, :cond_0

    .line 764
    add-int/lit8 v1, v0, -0x1

    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-static {v1}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v1

    if-nez v1, :cond_1

    .line 768
    :cond_0
    return v0

    .line 763
    :cond_1
    add-int/lit8 v0, v0, -0x1

    goto :goto_0
.end method

.method private static findNonWhitespace(Ljava/lang/String;I)I
    .locals 2
    .param p0, "sb"    # Ljava/lang/String;
    .param p1, "offset"    # I

    .prologue
    .line 743
    move v0, p1

    .local v0, "result":I
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 744
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-static {v1}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v1

    if-nez v1, :cond_1

    .line 748
    :cond_0
    return v0

    .line 743
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method private static findWhitespace(Ljava/lang/String;I)I
    .locals 2
    .param p0, "sb"    # Ljava/lang/String;
    .param p1, "offset"    # I

    .prologue
    .line 753
    move v0, p1

    .local v0, "result":I
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 754
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-static {v1}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 758
    :cond_0
    return v0

    .line 753
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method private static getChunkSize(Ljava/lang/String;)I
    .locals 3
    .param p0, "hex"    # Ljava/lang/String;

    .prologue
    .line 640
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    .line 641
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 642
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 643
    .local v0, "c":C
    const/16 v2, 0x3b

    if-eq v0, v2, :cond_0

    invoke-static {v0}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v2

    if-nez v2, :cond_0

    invoke-static {v0}, Ljava/lang/Character;->isISOControl(C)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 644
    :cond_0
    const/4 v2, 0x0

    invoke-virtual {p0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    .line 649
    .end local v0    # "c":C
    :cond_1
    const/16 v2, 0x10

    invoke-static {p0, v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I

    move-result v2

    return v2

    .line 641
    .restart local v0    # "c":C
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method private readFixedLengthContent(Lorg/jboss/netty/buffer/ChannelBuffer;)Ljava/lang/Object;
    .locals 7
    .param p1, "buffer"    # Lorg/jboss/netty/buffer/ChannelBuffer;

    .prologue
    const/4 v6, 0x1

    .line 487
    iget-object v3, p0, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->message:Lorg/jboss/netty/handler/codec/http/HttpMessage;

    const-wide/16 v4, -0x1

    invoke-static {v3, v4, v5}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->getContentLength(Lorg/jboss/netty/handler/codec/http/HttpMessage;J)J

    move-result-wide v0

    .line 488
    .local v0, "length":J
    sget-boolean v3, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->$assertionsDisabled:Z

    if-nez v3, :cond_0

    const-wide/32 v4, 0x7fffffff

    cmp-long v3, v0, v4

    if-lez v3, :cond_0

    new-instance v3, Ljava/lang/AssertionError;

    invoke-direct {v3}, Ljava/lang/AssertionError;-><init>()V

    throw v3

    .line 489
    :cond_0
    long-to-int v3, v0

    iget v4, p0, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->contentRead:I

    sub-int v2, v3, v4

    .line 490
    .local v2, "toRead":I
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->actualReadableBytes()I

    move-result v3

    if-le v2, v3, :cond_1

    .line 491
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->actualReadableBytes()I

    move-result v2

    .line 493
    :cond_1
    iget v3, p0, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->contentRead:I

    add-int/2addr v3, v2

    iput v3, p0, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->contentRead:I

    .line 494
    iget v3, p0, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->contentRead:I

    int-to-long v4, v3

    cmp-long v3, v0, v4

    if-gez v3, :cond_3

    .line 495
    iget-object v3, p0, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->message:Lorg/jboss/netty/handler/codec/http/HttpMessage;

    invoke-interface {v3}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->isChunked()Z

    move-result v3

    if-nez v3, :cond_2

    .line 496
    iget-object v3, p0, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->message:Lorg/jboss/netty/handler/codec/http/HttpMessage;

    invoke-interface {v3, v6}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->setChunked(Z)V

    .line 497
    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    iget-object v5, p0, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->message:Lorg/jboss/netty/handler/codec/http/HttpMessage;

    aput-object v5, v3, v4

    new-instance v4, Lorg/jboss/netty/handler/codec/http/DefaultHttpChunk;

    invoke-interface {p1, v2}, Lorg/jboss/netty/buffer/ChannelBuffer;->readBytes(I)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v5

    invoke-direct {v4, v5}, Lorg/jboss/netty/handler/codec/http/DefaultHttpChunk;-><init>(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    aput-object v4, v3, v6

    .line 507
    :goto_0
    return-object v3

    .line 499
    :cond_2
    new-instance v3, Lorg/jboss/netty/handler/codec/http/DefaultHttpChunk;

    invoke-interface {p1, v2}, Lorg/jboss/netty/buffer/ChannelBuffer;->readBytes(I)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/jboss/netty/handler/codec/http/DefaultHttpChunk;-><init>(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    goto :goto_0

    .line 502
    :cond_3
    iget-object v3, p0, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->content:Lorg/jboss/netty/buffer/ChannelBuffer;

    if-nez v3, :cond_4

    .line 503
    long-to-int v3, v0

    invoke-interface {p1, v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readBytes(I)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v3

    iput-object v3, p0, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->content:Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 507
    :goto_1
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->reset()Ljava/lang/Object;

    move-result-object v3

    goto :goto_0

    .line 505
    :cond_4
    iget-object v3, p0, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->content:Lorg/jboss/netty/buffer/ChannelBuffer;

    long-to-int v4, v0

    invoke-interface {v3, p1, v4}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeBytes(Lorg/jboss/netty/buffer/ChannelBuffer;I)V

    goto :goto_1
.end method

.method private readHeader(Lorg/jboss/netty/buffer/ChannelBuffer;)Ljava/lang/String;
    .locals 6
    .param p1, "buffer"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jboss/netty/handler/codec/frame/TooLongFrameException;
        }
    .end annotation

    .prologue
    .line 598
    new-instance v2, Ljava/lang/StringBuilder;

    const/16 v3, 0x40

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 599
    .local v2, "sb":Ljava/lang/StringBuilder;
    iget v0, p0, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->headerSize:I

    .line 603
    .local v0, "headerSize":I
    :goto_0
    invoke-interface {p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readByte()B

    move-result v3

    int-to-char v1, v3

    .line 604
    .local v1, "nextByte":C
    add-int/lit8 v0, v0, 0x1

    .line 606
    packed-switch v1, :pswitch_data_0

    .line 619
    :cond_0
    :pswitch_0
    iget v3, p0, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->maxHeaderSize:I

    if-lt v0, v3, :cond_1

    .line 624
    new-instance v3, Lorg/jboss/netty/handler/codec/frame/TooLongFrameException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "HTTP header is larger than "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, p0, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->maxHeaderSize:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " bytes."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/jboss/netty/handler/codec/frame/TooLongFrameException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 608
    :pswitch_1
    invoke-interface {p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readByte()B

    move-result v3

    int-to-char v1, v3

    .line 609
    add-int/lit8 v0, v0, 0x1

    .line 610
    const/16 v3, 0xa

    if-ne v1, v3, :cond_0

    .line 632
    :pswitch_2
    iput v0, p0, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->headerSize:I

    .line 633
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    return-object v3

    .line 629
    :cond_1
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 606
    :pswitch_data_0
    .packed-switch 0xa
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method private readHeaders(Lorg/jboss/netty/buffer/ChannelBuffer;)Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder$State;
    .locals 12
    .param p1, "buffer"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jboss/netty/handler/codec/frame/TooLongFrameException;
        }
    .end annotation

    .prologue
    const/16 v10, 0x20

    const/4 v9, 0x0

    .line 511
    iput v9, p0, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->headerSize:I

    .line 512
    iget-object v3, p0, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->message:Lorg/jboss/netty/handler/codec/http/HttpMessage;

    .line 513
    .local v3, "message":Lorg/jboss/netty/handler/codec/http/HttpMessage;
    invoke-direct {p0, p1}, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->readHeader(Lorg/jboss/netty/buffer/ChannelBuffer;)Ljava/lang/String;

    move-result-object v2

    .line 514
    .local v2, "line":Ljava/lang/String;
    const/4 v4, 0x0

    .line 515
    .local v4, "name":Ljava/lang/String;
    const/4 v6, 0x0

    .line 516
    .local v6, "value":Ljava/lang/String;
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v7

    if-eqz v7, :cond_2

    .line 517
    invoke-interface {v3}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v7

    invoke-virtual {v7}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->clear()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .line 519
    :cond_0
    invoke-virtual {v2, v9}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 520
    .local v0, "firstChar":C
    if-eqz v4, :cond_3

    if-eq v0, v10, :cond_1

    const/16 v7, 0x9

    if-ne v0, v7, :cond_3

    .line 521
    :cond_1
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 531
    :goto_0
    invoke-direct {p0, p1}, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->readHeader(Lorg/jboss/netty/buffer/ChannelBuffer;)Ljava/lang/String;

    move-result-object v2

    .line 532
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v7

    if-nez v7, :cond_0

    .line 535
    if-eqz v4, :cond_2

    .line 536
    invoke-interface {v3}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v7

    invoke-virtual {v7, v4, v6}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->add(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .line 542
    .end local v0    # "firstChar":C
    :cond_2
    invoke-virtual {p0, v3}, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->isContentAlwaysEmpty(Lorg/jboss/netty/handler/codec/http/HttpMessage;)Z

    move-result v7

    if-eqz v7, :cond_5

    .line 543
    sget-object v5, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder$State;->SKIP_CONTROL_CHARS:Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder$State;

    .line 557
    .local v5, "nextState":Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder$State;
    :goto_1
    return-object v5

    .line 523
    .end local v5    # "nextState":Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder$State;
    .restart local v0    # "firstChar":C
    :cond_3
    if-eqz v4, :cond_4

    .line 524
    invoke-interface {v3}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v7

    invoke-virtual {v7, v4, v6}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->add(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .line 526
    :cond_4
    invoke-static {v2}, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->splitHeader(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 527
    .local v1, "header":[Ljava/lang/String;
    aget-object v4, v1, v9

    .line 528
    const/4 v7, 0x1

    aget-object v6, v1, v7

    goto :goto_0

    .line 544
    .end local v0    # "firstChar":C
    .end local v1    # "header":[Ljava/lang/String;
    :cond_5
    invoke-interface {v3}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->isChunked()Z

    move-result v7

    if-eqz v7, :cond_6

    .line 551
    sget-object v5, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder$State;->READ_CHUNK_SIZE:Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder$State;

    .restart local v5    # "nextState":Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder$State;
    goto :goto_1

    .line 552
    .end local v5    # "nextState":Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder$State;
    :cond_6
    const-wide/16 v8, -0x1

    invoke-static {v3, v8, v9}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->getContentLength(Lorg/jboss/netty/handler/codec/http/HttpMessage;J)J

    move-result-wide v8

    const-wide/16 v10, 0x0

    cmp-long v7, v8, v10

    if-ltz v7, :cond_7

    .line 553
    sget-object v5, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder$State;->READ_FIXED_LENGTH_CONTENT:Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder$State;

    .restart local v5    # "nextState":Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder$State;
    goto :goto_1

    .line 555
    .end local v5    # "nextState":Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder$State;
    :cond_7
    sget-object v5, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder$State;->READ_VARIABLE_LENGTH_CONTENT:Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder$State;

    .restart local v5    # "nextState":Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder$State;
    goto :goto_1
.end method

.method private static readLine(Lorg/jboss/netty/buffer/ChannelBuffer;I)Ljava/lang/String;
    .locals 6
    .param p0, "buffer"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p1, "maxLineLength"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jboss/netty/handler/codec/frame/TooLongFrameException;
        }
    .end annotation

    .prologue
    const/16 v4, 0xa

    .line 653
    new-instance v2, Ljava/lang/StringBuilder;

    const/16 v3, 0x40

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 654
    .local v2, "sb":Ljava/lang/StringBuilder;
    const/4 v0, 0x0

    .line 656
    .local v0, "lineLength":I
    :cond_0
    :goto_0
    invoke-interface {p0}, Lorg/jboss/netty/buffer/ChannelBuffer;->readByte()B

    move-result v1

    .line 657
    .local v1, "nextByte":B
    const/16 v3, 0xd

    if-ne v1, v3, :cond_1

    .line 658
    invoke-interface {p0}, Lorg/jboss/netty/buffer/ChannelBuffer;->readByte()B

    move-result v1

    .line 659
    if-ne v1, v4, :cond_0

    .line 660
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 663
    :goto_1
    return-object v3

    .line 662
    :cond_1
    if-ne v1, v4, :cond_2

    .line 663
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_1

    .line 665
    :cond_2
    if-lt v0, p1, :cond_3

    .line 670
    new-instance v3, Lorg/jboss/netty/handler/codec/frame/TooLongFrameException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "An HTTP line is larger than "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " bytes."

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Lorg/jboss/netty/handler/codec/frame/TooLongFrameException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 674
    :cond_3
    add-int/lit8 v0, v0, 0x1

    .line 675
    int-to-char v3, v1

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_0
.end method

.method private readTrailingHeaders(Lorg/jboss/netty/buffer/ChannelBuffer;)Lorg/jboss/netty/handler/codec/http/HttpChunkTrailer;
    .locals 12
    .param p1, "buffer"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jboss/netty/handler/codec/frame/TooLongFrameException;
        }
    .end annotation

    .prologue
    const/4 v11, 0x0

    .line 561
    iput v11, p0, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->headerSize:I

    .line 562
    invoke-direct {p0, p1}, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->readHeader(Lorg/jboss/netty/buffer/ChannelBuffer;)Ljava/lang/String;

    move-result-object v5

    .line 563
    .local v5, "line":Ljava/lang/String;
    const/4 v3, 0x0

    .line 564
    .local v3, "lastHeader":Ljava/lang/String;
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v9

    if-eqz v9, :cond_5

    .line 565
    new-instance v8, Lorg/jboss/netty/handler/codec/http/DefaultHttpChunkTrailer;

    invoke-direct {v8}, Lorg/jboss/netty/handler/codec/http/DefaultHttpChunkTrailer;-><init>()V

    .line 567
    .local v8, "trailer":Lorg/jboss/netty/handler/codec/http/HttpChunkTrailer;
    :cond_0
    invoke-virtual {v5, v11}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 568
    .local v1, "firstChar":C
    if-eqz v3, :cond_3

    const/16 v9, 0x20

    if-eq v1, v9, :cond_1

    const/16 v9, 0x9

    if-ne v1, v9, :cond_3

    .line 569
    :cond_1
    invoke-interface {v8}, Lorg/jboss/netty/handler/codec/http/HttpChunkTrailer;->trailingHeaders()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v9

    invoke-virtual {v9, v3}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->getAll(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    .line 570
    .local v0, "current":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v9

    if-nez v9, :cond_2

    .line 571
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v9

    add-int/lit8 v4, v9, -0x1

    .line 572
    .local v4, "lastPos":I
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 573
    .local v7, "newString":Ljava/lang/String;
    invoke-interface {v0, v4, v7}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 588
    .end local v0    # "current":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v4    # "lastPos":I
    .end local v7    # "newString":Ljava/lang/String;
    :cond_2
    :goto_0
    invoke-direct {p0, p1}, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->readHeader(Lorg/jboss/netty/buffer/ChannelBuffer;)Ljava/lang/String;

    move-result-object v5

    .line 589
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v9

    if-nez v9, :cond_0

    .line 594
    .end local v1    # "firstChar":C
    .end local v8    # "trailer":Lorg/jboss/netty/handler/codec/http/HttpChunkTrailer;
    :goto_1
    return-object v8

    .line 578
    .restart local v1    # "firstChar":C
    .restart local v8    # "trailer":Lorg/jboss/netty/handler/codec/http/HttpChunkTrailer;
    :cond_3
    invoke-static {v5}, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->splitHeader(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 579
    .local v2, "header":[Ljava/lang/String;
    aget-object v6, v2, v11

    .line 580
    .local v6, "name":Ljava/lang/String;
    const-string v9, "Content-Length"

    invoke-virtual {v6, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v9

    if-nez v9, :cond_4

    const-string v9, "Transfer-Encoding"

    invoke-virtual {v6, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v9

    if-nez v9, :cond_4

    const-string v9, "Trailer"

    invoke-virtual {v6, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v9

    if-nez v9, :cond_4

    .line 583
    invoke-interface {v8}, Lorg/jboss/netty/handler/codec/http/HttpChunkTrailer;->trailingHeaders()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v9

    const/4 v10, 0x1

    aget-object v10, v2, v10

    invoke-virtual {v9, v6, v10}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->add(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .line 585
    :cond_4
    move-object v3, v6

    goto :goto_0

    .line 594
    .end local v1    # "firstChar":C
    .end local v2    # "header":[Ljava/lang/String;
    .end local v6    # "name":Ljava/lang/String;
    .end local v8    # "trailer":Lorg/jboss/netty/handler/codec/http/HttpChunkTrailer;
    :cond_5
    sget-object v8, Lorg/jboss/netty/handler/codec/http/HttpChunk;->LAST_CHUNK:Lorg/jboss/netty/handler/codec/http/HttpChunkTrailer;

    goto :goto_1
.end method

.method private reset()Ljava/lang/Object;
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 448
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->message:Lorg/jboss/netty/handler/codec/http/HttpMessage;

    .line 449
    .local v1, "message":Lorg/jboss/netty/handler/codec/http/HttpMessage;
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->content:Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 451
    .local v0, "content":Lorg/jboss/netty/buffer/ChannelBuffer;
    if-eqz v0, :cond_0

    .line 452
    invoke-interface {v1, v0}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->setContent(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    .line 453
    iput-object v2, p0, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->content:Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 456
    :cond_0
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->resetState()V

    .line 457
    iput-object v2, p0, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->message:Lorg/jboss/netty/handler/codec/http/HttpMessage;

    .line 459
    return-object v1
.end method

.method private resetState()V
    .locals 3

    .prologue
    .line 463
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->isDecodingRequest()Z

    move-result v1

    if-nez v1, :cond_0

    .line 464
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->message:Lorg/jboss/netty/handler/codec/http/HttpMessage;

    check-cast v0, Lorg/jboss/netty/handler/codec/http/HttpResponse;

    .line 465
    .local v0, "res":Lorg/jboss/netty/handler/codec/http/HttpResponse;
    if-eqz v0, :cond_0

    invoke-interface {v0}, Lorg/jboss/netty/handler/codec/http/HttpResponse;->getStatus()Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;

    move-result-object v1

    invoke-virtual {v1}, Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;->getCode()I

    move-result v1

    const/16 v2, 0x65

    if-ne v1, v2, :cond_0

    .line 466
    sget-object v1, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder$State;->UPGRADED:Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder$State;

    invoke-virtual {p0, v1}, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->checkpoint(Ljava/lang/Enum;)V

    .line 472
    .end local v0    # "res":Lorg/jboss/netty/handler/codec/http/HttpResponse;
    :goto_0
    return-void

    .line 471
    :cond_0
    sget-object v1, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder$State;->SKIP_CONTROL_CHARS:Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder$State;

    invoke-virtual {p0, v1}, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->checkpoint(Ljava/lang/Enum;)V

    goto :goto_0
.end method

.method private static skipControlCharacters(Lorg/jboss/netty/buffer/ChannelBuffer;)V
    .locals 2
    .param p0, "buffer"    # Lorg/jboss/netty/buffer/ChannelBuffer;

    .prologue
    .line 476
    :cond_0
    invoke-interface {p0}, Lorg/jboss/netty/buffer/ChannelBuffer;->readUnsignedByte()S

    move-result v1

    int-to-char v0, v1

    .line 477
    .local v0, "c":C
    invoke-static {v0}, Ljava/lang/Character;->isISOControl(C)Z

    move-result v1

    if-nez v1, :cond_0

    invoke-static {v0}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v1

    if-nez v1, :cond_0

    .line 479
    invoke-interface {p0}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-interface {p0, v1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex(I)V

    .line 483
    return-void
.end method

.method private static splitHeader(Ljava/lang/String;)[Ljava/lang/String;
    .locals 12
    .param p0, "sb"    # Ljava/lang/String;

    .prologue
    const/16 v11, 0x3a

    const/4 v8, 0x2

    const/4 v10, 0x1

    const/4 v9, 0x0

    .line 704
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    .line 711
    .local v2, "length":I
    invoke-static {p0, v9}, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->findNonWhitespace(Ljava/lang/String;I)I

    move-result v4

    .line 712
    .local v4, "nameStart":I
    move v3, v4

    .local v3, "nameEnd":I
    :goto_0
    if-ge v3, v2, :cond_0

    .line 713
    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 714
    .local v0, "ch":C
    if-eq v0, v11, :cond_0

    invoke-static {v0}, Ljava/lang/Character;->isWhitespace(C)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 719
    .end local v0    # "ch":C
    :cond_0
    move v1, v3

    .local v1, "colonEnd":I
    :goto_1
    if-ge v1, v2, :cond_1

    .line 720
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v7

    if-ne v7, v11, :cond_3

    .line 721
    add-int/lit8 v1, v1, 0x1

    .line 726
    :cond_1
    invoke-static {p0, v1}, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->findNonWhitespace(Ljava/lang/String;I)I

    move-result v6

    .line 727
    .local v6, "valueStart":I
    if-ne v6, v2, :cond_4

    .line 728
    new-array v7, v8, [Ljava/lang/String;

    invoke-virtual {p0, v4, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v7, v9

    const-string v8, ""

    aput-object v8, v7, v10

    .line 735
    :goto_2
    return-object v7

    .line 712
    .end local v1    # "colonEnd":I
    .end local v6    # "valueStart":I
    .restart local v0    # "ch":C
    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 719
    .end local v0    # "ch":C
    .restart local v1    # "colonEnd":I
    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 734
    .restart local v6    # "valueStart":I
    :cond_4
    invoke-static {p0}, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->findEndOfString(Ljava/lang/String;)I

    move-result v5

    .line 735
    .local v5, "valueEnd":I
    new-array v7, v8, [Ljava/lang/String;

    invoke-virtual {p0, v4, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v7, v9

    invoke-virtual {p0, v6, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v7, v10

    goto :goto_2
.end method

.method private static splitInitialLine(Ljava/lang/String;)[Ljava/lang/String;
    .locals 9
    .param p0, "sb"    # Ljava/lang/String;

    .prologue
    const/4 v8, 0x0

    .line 688
    invoke-static {p0, v8}, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->findNonWhitespace(Ljava/lang/String;I)I

    move-result v1

    .line 689
    .local v1, "aStart":I
    invoke-static {p0, v1}, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->findWhitespace(Ljava/lang/String;I)I

    move-result v0

    .line 691
    .local v0, "aEnd":I
    invoke-static {p0, v0}, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->findNonWhitespace(Ljava/lang/String;I)I

    move-result v3

    .line 692
    .local v3, "bStart":I
    invoke-static {p0, v3}, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->findWhitespace(Ljava/lang/String;I)I

    move-result v2

    .line 694
    .local v2, "bEnd":I
    invoke-static {p0, v2}, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->findNonWhitespace(Ljava/lang/String;I)I

    move-result v5

    .line 695
    .local v5, "cStart":I
    invoke-static {p0}, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->findEndOfString(Ljava/lang/String;)I

    move-result v4

    .line 697
    .local v4, "cEnd":I
    const/4 v6, 0x3

    new-array v7, v6, [Ljava/lang/String;

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v7, v8

    const/4 v6, 0x1

    invoke-virtual {p0, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v7, v6

    const/4 v8, 0x2

    if-ge v5, v4, :cond_0

    invoke-virtual {p0, v5, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    :goto_0
    aput-object v6, v7, v8

    return-object v7

    :cond_0
    const-string v6, ""

    goto :goto_0
.end method


# virtual methods
.method protected abstract createMessage([Ljava/lang/String;)Lorg/jboss/netty/handler/codec/http/HttpMessage;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method

.method protected bridge synthetic decode(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/buffer/ChannelBuffer;Ljava/lang/Enum;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "x1"    # Lorg/jboss/netty/channel/Channel;
    .param p3, "x2"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p4, "x3"    # Ljava/lang/Enum;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 102
    check-cast p4, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder$State;

    .end local p4    # "x3":Ljava/lang/Enum;
    invoke-virtual {p0, p1, p2, p3, p4}, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->decode(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/buffer/ChannelBuffer;Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder$State;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method protected decode(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/buffer/ChannelBuffer;Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder$State;)Ljava/lang/Object;
    .locals 22
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p3, "buffer"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p4, "state"    # Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder$State;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 174
    sget-object v17, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder$1;->$SwitchMap$org$jboss$netty$handler$codec$http$HttpMessageDecoder$State:[I

    invoke-virtual/range {p4 .. p4}, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder$State;->ordinal()I

    move-result v18

    aget v17, v17, v18

    packed-switch v17, :pswitch_data_0

    .line 416
    new-instance v17, Ljava/lang/Error;

    const-string v18, "Shouldn\'t reach here."

    invoke-direct/range {v17 .. v18}, Ljava/lang/Error;-><init>(Ljava/lang/String;)V

    throw v17

    .line 177
    :pswitch_0
    :try_start_0
    invoke-static/range {p3 .. p3}, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->skipControlCharacters(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    .line 178
    sget-object v17, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder$State;->READ_INITIAL:Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder$State;

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->checkpoint(Ljava/lang/Enum;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 180
    invoke-virtual/range {p0 .. p0}, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->checkpoint()V

    .line 184
    :pswitch_1
    move-object/from16 v0, p0

    iget v0, v0, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->maxInitialLineLength:I

    move/from16 v17, v0

    move-object/from16 v0, p3

    move/from16 v1, v17

    invoke-static {v0, v1}, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->readLine(Lorg/jboss/netty/buffer/ChannelBuffer;I)Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v17 .. v17}, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->splitInitialLine(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    .line 185
    .local v5, "initialLine":[Ljava/lang/String;
    array-length v0, v5

    move/from16 v17, v0

    const/16 v18, 0x3

    move/from16 v0, v17

    move/from16 v1, v18

    if-ge v0, v1, :cond_1

    .line 187
    sget-object v17, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder$State;->SKIP_CONTROL_CHARS:Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder$State;

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->checkpoint(Ljava/lang/Enum;)V

    .line 188
    const/4 v4, 0x0

    .line 412
    .end local v5    # "initialLine":[Ljava/lang/String;
    :cond_0
    :goto_0
    return-object v4

    .line 180
    :catchall_0
    move-exception v17

    invoke-virtual/range {p0 .. p0}, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->checkpoint()V

    throw v17

    .line 191
    .restart local v5    # "initialLine":[Ljava/lang/String;
    :cond_1
    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->createMessage([Ljava/lang/String;)Lorg/jboss/netty/handler/codec/http/HttpMessage;

    move-result-object v17

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->message:Lorg/jboss/netty/handler/codec/http/HttpMessage;

    .line 192
    sget-object v17, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder$State;->READ_HEADER:Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder$State;

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->checkpoint(Ljava/lang/Enum;)V

    .line 195
    .end local v5    # "initialLine":[Ljava/lang/String;
    :pswitch_2
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0, v1}, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->readHeaders(Lorg/jboss/netty/buffer/ChannelBuffer;)Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder$State;

    move-result-object v12

    .line 196
    .local v12, "nextState":Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder$State;
    move-object/from16 v0, p0

    invoke-virtual {v0, v12}, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->checkpoint(Ljava/lang/Enum;)V

    .line 197
    sget-object v17, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder$State;->READ_CHUNK_SIZE:Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder$State;

    move-object/from16 v0, v17

    if-ne v12, v0, :cond_2

    .line 199
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->message:Lorg/jboss/netty/handler/codec/http/HttpMessage;

    move-object/from16 v17, v0

    const/16 v18, 0x1

    invoke-interface/range {v17 .. v18}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->setChunked(Z)V

    .line 201
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->message:Lorg/jboss/netty/handler/codec/http/HttpMessage;

    goto :goto_0

    .line 203
    :cond_2
    sget-object v17, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder$State;->SKIP_CONTROL_CHARS:Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder$State;

    move-object/from16 v0, v17

    if-ne v12, v0, :cond_3

    .line 207
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->message:Lorg/jboss/netty/handler/codec/http/HttpMessage;

    move-object/from16 v17, v0

    invoke-interface/range {v17 .. v17}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v17

    const-string v18, "Transfer-Encoding"

    invoke-virtual/range {v17 .. v18}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->remove(Ljava/lang/String;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .line 208
    invoke-direct/range {p0 .. p0}, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->resetState()V

    .line 209
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->message:Lorg/jboss/netty/handler/codec/http/HttpMessage;

    goto :goto_0

    .line 211
    :cond_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->message:Lorg/jboss/netty/handler/codec/http/HttpMessage;

    move-object/from16 v17, v0

    const-wide/16 v18, -0x1

    invoke-static/range {v17 .. v19}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->getContentLength(Lorg/jboss/netty/handler/codec/http/HttpMessage;J)J

    move-result-wide v8

    .line 212
    .local v8, "contentLength":J
    const-wide/16 v18, 0x0

    cmp-long v17, v8, v18

    if-eqz v17, :cond_4

    const-wide/16 v18, -0x1

    cmp-long v17, v8, v18

    if-nez v17, :cond_5

    invoke-virtual/range {p0 .. p0}, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->isDecodingRequest()Z

    move-result v17

    if-eqz v17, :cond_5

    .line 213
    :cond_4
    sget-object v17, Lorg/jboss/netty/buffer/ChannelBuffers;->EMPTY_BUFFER:Lorg/jboss/netty/buffer/ChannelBuffer;

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    iput-object v0, v1, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->content:Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 214
    invoke-direct/range {p0 .. p0}, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->reset()Ljava/lang/Object;

    move-result-object v4

    goto/16 :goto_0

    .line 217
    :cond_5
    sget-object v17, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder$1;->$SwitchMap$org$jboss$netty$handler$codec$http$HttpMessageDecoder$State:[I

    invoke-virtual {v12}, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder$State;->ordinal()I

    move-result v18

    aget v17, v17, v18

    packed-switch v17, :pswitch_data_1

    .line 238
    new-instance v17, Ljava/lang/IllegalStateException;

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "Unexpected state: "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-direct/range {v17 .. v18}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v17

    .line 219
    :pswitch_3
    move-object/from16 v0, p0

    iget v0, v0, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->maxChunkSize:I

    move/from16 v17, v0

    move/from16 v0, v17

    int-to-long v0, v0

    move-wide/from16 v18, v0

    cmp-long v17, v8, v18

    if-gtz v17, :cond_6

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->message:Lorg/jboss/netty/handler/codec/http/HttpMessage;

    move-object/from16 v17, v0

    invoke-static/range {v17 .. v17}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->is100ContinueExpected(Lorg/jboss/netty/handler/codec/http/HttpMessage;)Z

    move-result v17

    if-eqz v17, :cond_8

    .line 221
    :cond_6
    sget-object v17, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder$State;->READ_FIXED_LENGTH_CONTENT_AS_CHUNKS:Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder$State;

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->checkpoint(Ljava/lang/Enum;)V

    .line 222
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->message:Lorg/jboss/netty/handler/codec/http/HttpMessage;

    move-object/from16 v17, v0

    const/16 v18, 0x1

    invoke-interface/range {v17 .. v18}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->setChunked(Z)V

    .line 225
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->message:Lorg/jboss/netty/handler/codec/http/HttpMessage;

    move-object/from16 v17, v0

    const-wide/16 v18, -0x1

    invoke-static/range {v17 .. v19}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->getContentLength(Lorg/jboss/netty/handler/codec/http/HttpMessage;J)J

    move-result-wide v18

    move-wide/from16 v0, v18

    move-object/from16 v2, p0

    iput-wide v0, v2, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->chunkSize:J

    .line 226
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->message:Lorg/jboss/netty/handler/codec/http/HttpMessage;

    goto/16 :goto_0

    .line 230
    :pswitch_4
    invoke-interface/range {p3 .. p3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v17

    move-object/from16 v0, p0

    iget v0, v0, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->maxChunkSize:I

    move/from16 v18, v0

    move/from16 v0, v17

    move/from16 v1, v18

    if-gt v0, v1, :cond_7

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->message:Lorg/jboss/netty/handler/codec/http/HttpMessage;

    move-object/from16 v17, v0

    invoke-static/range {v17 .. v17}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->is100ContinueExpected(Lorg/jboss/netty/handler/codec/http/HttpMessage;)Z

    move-result v17

    if-eqz v17, :cond_8

    .line 232
    :cond_7
    sget-object v17, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder$State;->READ_VARIABLE_LENGTH_CONTENT_AS_CHUNKS:Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder$State;

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->checkpoint(Ljava/lang/Enum;)V

    .line 233
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->message:Lorg/jboss/netty/handler/codec/http/HttpMessage;

    move-object/from16 v17, v0

    const/16 v18, 0x1

    invoke-interface/range {v17 .. v18}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->setChunked(Z)V

    .line 234
    move-object/from16 v0, p0

    iget-object v4, v0, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->message:Lorg/jboss/netty/handler/codec/http/HttpMessage;

    goto/16 :goto_0

    .line 241
    :cond_8
    const/4 v4, 0x0

    goto/16 :goto_0

    .line 244
    .end local v8    # "contentLength":J
    .end local v12    # "nextState":Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder$State;
    :pswitch_5
    invoke-virtual/range {p0 .. p0}, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->actualReadableBytes()I

    move-result v15

    .line 245
    .local v15, "toRead":I
    move-object/from16 v0, p0

    iget v0, v0, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->maxChunkSize:I

    move/from16 v17, v0

    move/from16 v0, v17

    if-le v15, v0, :cond_9

    .line 246
    move-object/from16 v0, p0

    iget v15, v0, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->maxChunkSize:I

    .line 248
    :cond_9
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->message:Lorg/jboss/netty/handler/codec/http/HttpMessage;

    move-object/from16 v17, v0

    invoke-interface/range {v17 .. v17}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->isChunked()Z

    move-result v17

    if-nez v17, :cond_a

    .line 249
    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->message:Lorg/jboss/netty/handler/codec/http/HttpMessage;

    move-object/from16 v17, v0

    const/16 v18, 0x1

    invoke-interface/range {v17 .. v18}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->setChunked(Z)V

    .line 250
    const/16 v17, 0x2

    move/from16 v0, v17

    new-array v4, v0, [Ljava/lang/Object;

    const/16 v17, 0x0

    move-object/from16 v0, p0

    iget-object v0, v0, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->message:Lorg/jboss/netty/handler/codec/http/HttpMessage;

    move-object/from16 v18, v0

    aput-object v18, v4, v17

    const/16 v17, 0x1

    new-instance v18, Lorg/jboss/netty/handler/codec/http/DefaultHttpChunk;

    move-object/from16 v0, p3

    invoke-interface {v0, v15}, Lorg/jboss/netty/buffer/ChannelBuffer;->readBytes(I)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v19

    invoke-direct/range {v18 .. v19}, Lorg/jboss/netty/handler/codec/http/DefaultHttpChunk;-><init>(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    aput-object v18, v4, v17

    goto/16 :goto_0

    .line 252
    :cond_a
    new-instance v4, Lorg/jboss/netty/handler/codec/http/DefaultHttpChunk;

    move-object/from16 v0, p3

    invoke-interface {v0, v15}, Lorg/jboss/netty/buffer/ChannelBuffer;->readBytes(I)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-direct {v4, v0}, Lorg/jboss/netty/handler/codec/http/DefaultHttpChunk;-><init>(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    goto/16 :goto_0

    .line 257
    .end local v15    # "toRead":I
    :pswitch_6
    invoke-virtual/range {p0 .. p0}, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->actualReadableBytes()I

    move-result v15

    .line 258
    .restart local v15    # "toRead":I
    move-object/from16 v0, p0

    iget v0, v0, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->maxChunkSize:I

    move/from16 v17, v0

    move/from16 v0, v17

    if-le v15, v0, :cond_b

    .line 259
    move-object/from16 v0, p0

    iget v15, v0, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->maxChunkSize:I

    .line 261
    :cond_b
    new-instance v4, Lorg/jboss/netty/handler/codec/http/DefaultHttpChunk;

    move-object/from16 v0, p3

    invoke-interface {v0, v15}, Lorg/jboss/netty/buffer/ChannelBuffer;->readBytes(I)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-direct {v4, v0}, Lorg/jboss/netty/handler/codec/http/DefaultHttpChunk;-><init>(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    .line 263
    .local v4, "chunk":Lorg/jboss/netty/handler/codec/http/HttpChunk;
    invoke-interface/range {p3 .. p3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readable()Z

    move-result v17

    if-nez v17, :cond_0

    .line 265
    invoke-direct/range {p0 .. p0}, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->reset()Ljava/lang/Object;

    .line 266
    invoke-interface {v4}, Lorg/jboss/netty/handler/codec/http/HttpChunk;->isLast()Z

    move-result v17

    if-nez v17, :cond_0

    .line 268
    const/16 v17, 0x2

    move/from16 v0, v17

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    aput-object v4, v16, v17

    const/16 v17, 0x1

    sget-object v18, Lorg/jboss/netty/handler/codec/http/HttpChunk;->LAST_CHUNK:Lorg/jboss/netty/handler/codec/http/HttpChunkTrailer;

    aput-object v18, v16, v17

    move-object/from16 v4, v16

    goto/16 :goto_0

    .line 274
    .end local v4    # "chunk":Lorg/jboss/netty/handler/codec/http/HttpChunk;
    .end local v15    # "toRead":I
    :pswitch_7
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0, v1}, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->readFixedLengthContent(Lorg/jboss/netty/buffer/ChannelBuffer;)Ljava/lang/Object;

    move-result-object v4

    goto/16 :goto_0

    .line 277
    :pswitch_8
    move-object/from16 v0, p0

    iget-wide v6, v0, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->chunkSize:J

    .line 278
    .local v6, "chunkSize":J
    invoke-virtual/range {p0 .. p0}, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->actualReadableBytes()I

    move-result v13

    .line 286
    .local v13, "readLimit":I
    if-nez v13, :cond_c

    .line 287
    const/4 v4, 0x0

    goto/16 :goto_0

    .line 290
    :cond_c
    move v15, v13

    .line 291
    .restart local v15    # "toRead":I
    move-object/from16 v0, p0

    iget v0, v0, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->maxChunkSize:I

    move/from16 v17, v0

    move/from16 v0, v17

    if-le v15, v0, :cond_d

    .line 292
    move-object/from16 v0, p0

    iget v15, v0, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->maxChunkSize:I

    .line 294
    :cond_d
    int-to-long v0, v15

    move-wide/from16 v18, v0

    cmp-long v17, v18, v6

    if-lez v17, :cond_e

    .line 295
    long-to-int v15, v6

    .line 297
    :cond_e
    new-instance v4, Lorg/jboss/netty/handler/codec/http/DefaultHttpChunk;

    move-object/from16 v0, p3

    invoke-interface {v0, v15}, Lorg/jboss/netty/buffer/ChannelBuffer;->readBytes(I)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-direct {v4, v0}, Lorg/jboss/netty/handler/codec/http/DefaultHttpChunk;-><init>(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    .line 298
    .restart local v4    # "chunk":Lorg/jboss/netty/handler/codec/http/HttpChunk;
    int-to-long v0, v15

    move-wide/from16 v18, v0

    cmp-long v17, v6, v18

    if-lez v17, :cond_f

    .line 299
    int-to-long v0, v15

    move-wide/from16 v18, v0

    sub-long v6, v6, v18

    .line 303
    :goto_1
    move-object/from16 v0, p0

    iput-wide v6, v0, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->chunkSize:J

    .line 305
    const-wide/16 v18, 0x0

    cmp-long v17, v6, v18

    if-nez v17, :cond_0

    .line 307
    invoke-direct/range {p0 .. p0}, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->reset()Ljava/lang/Object;

    .line 308
    invoke-interface {v4}, Lorg/jboss/netty/handler/codec/http/HttpChunk;->isLast()Z

    move-result v17

    if-nez v17, :cond_0

    .line 310
    const/16 v17, 0x2

    move/from16 v0, v17

    new-array v0, v0, [Ljava/lang/Object;

    move-object/from16 v16, v0

    const/16 v17, 0x0

    aput-object v4, v16, v17

    const/16 v17, 0x1

    sget-object v18, Lorg/jboss/netty/handler/codec/http/HttpChunk;->LAST_CHUNK:Lorg/jboss/netty/handler/codec/http/HttpChunkTrailer;

    aput-object v18, v16, v17

    move-object/from16 v4, v16

    goto/16 :goto_0

    .line 301
    :cond_f
    const-wide/16 v6, 0x0

    goto :goto_1

    .line 320
    .end local v4    # "chunk":Lorg/jboss/netty/handler/codec/http/HttpChunk;
    .end local v6    # "chunkSize":J
    .end local v13    # "readLimit":I
    .end local v15    # "toRead":I
    :pswitch_9
    move-object/from16 v0, p0

    iget v0, v0, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->maxInitialLineLength:I

    move/from16 v17, v0

    move-object/from16 v0, p3

    move/from16 v1, v17

    invoke-static {v0, v1}, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->readLine(Lorg/jboss/netty/buffer/ChannelBuffer;I)Ljava/lang/String;

    move-result-object v10

    .line 321
    .local v10, "line":Ljava/lang/String;
    invoke-static {v10}, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->getChunkSize(Ljava/lang/String;)I

    move-result v6

    .line 322
    .local v6, "chunkSize":I
    int-to-long v0, v6

    move-wide/from16 v18, v0

    move-wide/from16 v0, v18

    move-object/from16 v2, p0

    iput-wide v0, v2, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->chunkSize:J

    .line 323
    if-nez v6, :cond_10

    .line 324
    sget-object v17, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder$State;->READ_CHUNK_FOOTER:Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder$State;

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->checkpoint(Ljava/lang/Enum;)V

    .line 325
    const/4 v4, 0x0

    goto/16 :goto_0

    .line 326
    :cond_10
    move-object/from16 v0, p0

    iget v0, v0, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->maxChunkSize:I

    move/from16 v17, v0

    move/from16 v0, v17

    if-le v6, v0, :cond_11

    .line 328
    sget-object v17, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder$State;->READ_CHUNKED_CONTENT_AS_CHUNKS:Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder$State;

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->checkpoint(Ljava/lang/Enum;)V

    .line 334
    .end local v6    # "chunkSize":I
    .end local v10    # "line":Ljava/lang/String;
    :goto_2
    :pswitch_a
    sget-boolean v17, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->$assertionsDisabled:Z

    if-nez v17, :cond_12

    move-object/from16 v0, p0

    iget-wide v0, v0, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->chunkSize:J

    move-wide/from16 v18, v0

    const-wide/32 v20, 0x7fffffff

    cmp-long v17, v18, v20

    if-lez v17, :cond_12

    new-instance v17, Ljava/lang/AssertionError;

    invoke-direct/range {v17 .. v17}, Ljava/lang/AssertionError;-><init>()V

    throw v17

    .line 330
    .restart local v6    # "chunkSize":I
    .restart local v10    # "line":Ljava/lang/String;
    :cond_11
    sget-object v17, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder$State;->READ_CHUNKED_CONTENT:Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder$State;

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->checkpoint(Ljava/lang/Enum;)V

    goto :goto_2

    .line 335
    .end local v6    # "chunkSize":I
    .end local v10    # "line":Ljava/lang/String;
    :cond_12
    new-instance v4, Lorg/jboss/netty/handler/codec/http/DefaultHttpChunk;

    move-object/from16 v0, p0

    iget-wide v0, v0, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->chunkSize:J

    move-wide/from16 v18, v0

    move-wide/from16 v0, v18

    long-to-int v0, v0

    move/from16 v17, v0

    move-object/from16 v0, p3

    move/from16 v1, v17

    invoke-interface {v0, v1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readBytes(I)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-direct {v4, v0}, Lorg/jboss/netty/handler/codec/http/DefaultHttpChunk;-><init>(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    .line 336
    .restart local v4    # "chunk":Lorg/jboss/netty/handler/codec/http/HttpChunk;
    sget-object v17, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder$State;->READ_CHUNK_DELIMITER:Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder$State;

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->checkpoint(Ljava/lang/Enum;)V

    goto/16 :goto_0

    .line 340
    .end local v4    # "chunk":Lorg/jboss/netty/handler/codec/http/HttpChunk;
    :pswitch_b
    sget-boolean v17, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->$assertionsDisabled:Z

    if-nez v17, :cond_13

    move-object/from16 v0, p0

    iget-wide v0, v0, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->chunkSize:J

    move-wide/from16 v18, v0

    const-wide/32 v20, 0x7fffffff

    cmp-long v17, v18, v20

    if-lez v17, :cond_13

    new-instance v17, Ljava/lang/AssertionError;

    invoke-direct/range {v17 .. v17}, Ljava/lang/AssertionError;-><init>()V

    throw v17

    .line 341
    :cond_13
    move-object/from16 v0, p0

    iget-wide v0, v0, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->chunkSize:J

    move-wide/from16 v18, v0

    move-wide/from16 v0, v18

    long-to-int v6, v0

    .line 342
    .restart local v6    # "chunkSize":I
    invoke-virtual/range {p0 .. p0}, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->actualReadableBytes()I

    move-result v13

    .line 350
    .restart local v13    # "readLimit":I
    if-nez v13, :cond_14

    .line 351
    const/4 v4, 0x0

    goto/16 :goto_0

    .line 354
    :cond_14
    move v15, v6

    .line 355
    .restart local v15    # "toRead":I
    move-object/from16 v0, p0

    iget v0, v0, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->maxChunkSize:I

    move/from16 v17, v0

    move/from16 v0, v17

    if-le v15, v0, :cond_15

    .line 356
    move-object/from16 v0, p0

    iget v15, v0, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->maxChunkSize:I

    .line 358
    :cond_15
    if-le v15, v13, :cond_16

    .line 359
    move v15, v13

    .line 361
    :cond_16
    new-instance v4, Lorg/jboss/netty/handler/codec/http/DefaultHttpChunk;

    move-object/from16 v0, p3

    invoke-interface {v0, v15}, Lorg/jboss/netty/buffer/ChannelBuffer;->readBytes(I)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-direct {v4, v0}, Lorg/jboss/netty/handler/codec/http/DefaultHttpChunk;-><init>(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    .line 362
    .restart local v4    # "chunk":Lorg/jboss/netty/handler/codec/http/HttpChunk;
    if-le v6, v15, :cond_19

    .line 363
    sub-int/2addr v6, v15

    .line 367
    :goto_3
    int-to-long v0, v6

    move-wide/from16 v18, v0

    move-wide/from16 v0, v18

    move-object/from16 v2, p0

    iput-wide v0, v2, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->chunkSize:J

    .line 369
    if-nez v6, :cond_17

    .line 371
    sget-object v17, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder$State;->READ_CHUNK_DELIMITER:Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder$State;

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->checkpoint(Ljava/lang/Enum;)V

    .line 374
    :cond_17
    invoke-interface {v4}, Lorg/jboss/netty/handler/codec/http/HttpChunk;->isLast()Z

    move-result v17

    if-eqz v17, :cond_0

    .line 380
    .end local v4    # "chunk":Lorg/jboss/netty/handler/codec/http/HttpChunk;
    .end local v6    # "chunkSize":I
    .end local v13    # "readLimit":I
    .end local v15    # "toRead":I
    :cond_18
    :pswitch_c
    invoke-interface/range {p3 .. p3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readByte()B

    move-result v11

    .line 381
    .local v11, "next":B
    const/16 v17, 0xd

    move/from16 v0, v17

    if-ne v11, v0, :cond_1a

    .line 382
    invoke-interface/range {p3 .. p3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readByte()B

    move-result v17

    const/16 v18, 0xa

    move/from16 v0, v17

    move/from16 v1, v18

    if-ne v0, v1, :cond_18

    .line 383
    sget-object v17, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder$State;->READ_CHUNK_SIZE:Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder$State;

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->checkpoint(Ljava/lang/Enum;)V

    .line 384
    const/4 v4, 0x0

    goto/16 :goto_0

    .line 365
    .end local v11    # "next":B
    .restart local v4    # "chunk":Lorg/jboss/netty/handler/codec/http/HttpChunk;
    .restart local v6    # "chunkSize":I
    .restart local v13    # "readLimit":I
    .restart local v15    # "toRead":I
    :cond_19
    const/4 v6, 0x0

    goto :goto_3

    .line 386
    .end local v4    # "chunk":Lorg/jboss/netty/handler/codec/http/HttpChunk;
    .end local v6    # "chunkSize":I
    .end local v13    # "readLimit":I
    .end local v15    # "toRead":I
    .restart local v11    # "next":B
    :cond_1a
    const/16 v17, 0xa

    move/from16 v0, v17

    if-ne v11, v0, :cond_18

    .line 387
    sget-object v17, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder$State;->READ_CHUNK_SIZE:Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder$State;

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->checkpoint(Ljava/lang/Enum;)V

    .line 388
    const/4 v4, 0x0

    goto/16 :goto_0

    .line 393
    .end local v11    # "next":B
    :pswitch_d
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-direct {v0, v1}, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->readTrailingHeaders(Lorg/jboss/netty/buffer/ChannelBuffer;)Lorg/jboss/netty/handler/codec/http/HttpChunkTrailer;

    move-result-object v16

    .line 394
    .local v16, "trailer":Lorg/jboss/netty/handler/codec/http/HttpChunkTrailer;
    move-object/from16 v0, p0

    iget v0, v0, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->maxChunkSize:I

    move/from16 v17, v0

    if-nez v17, :cond_1b

    .line 396
    invoke-direct/range {p0 .. p0}, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->reset()Ljava/lang/Object;

    move-result-object v4

    goto/16 :goto_0

    .line 398
    :cond_1b
    invoke-direct/range {p0 .. p0}, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->reset()Ljava/lang/Object;

    move-object/from16 v4, v16

    .line 400
    goto/16 :goto_0

    .line 404
    .end local v16    # "trailer":Lorg/jboss/netty/handler/codec/http/HttpChunkTrailer;
    :pswitch_e
    invoke-virtual/range {p0 .. p0}, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->actualReadableBytes()I

    move-result v14

    .line 405
    .local v14, "readableBytes":I
    if-lez v14, :cond_1c

    .line 410
    invoke-virtual/range {p0 .. p0}, Lorg/jboss/netty/handler/codec/http/HttpMessageDecoder;->actualReadableBytes()I

    move-result v17

    move-object/from16 v0, p3

    move/from16 v1, v17

    invoke-interface {v0, v1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readBytes(I)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v4

    goto/16 :goto_0

    .line 412
    :cond_1c
    const/4 v4, 0x0

    goto/16 :goto_0

    .line 174
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_7
        :pswitch_5
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_6
        :pswitch_8
        :pswitch_9
        :pswitch_a
        :pswitch_b
        :pswitch_c
        :pswitch_d
        :pswitch_e
    .end packed-switch

    .line 217
    :pswitch_data_1
    .packed-switch 0x1
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method

.method protected isContentAlwaysEmpty(Lorg/jboss/netty/handler/codec/http/HttpMessage;)Z
    .locals 6
    .param p1, "msg"    # Lorg/jboss/netty/handler/codec/http/HttpMessage;

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 422
    instance-of v4, p1, Lorg/jboss/netty/handler/codec/http/HttpResponse;

    if-eqz v4, :cond_0

    move-object v1, p1

    .line 423
    check-cast v1, Lorg/jboss/netty/handler/codec/http/HttpResponse;

    .line 424
    .local v1, "res":Lorg/jboss/netty/handler/codec/http/HttpResponse;
    invoke-interface {v1}, Lorg/jboss/netty/handler/codec/http/HttpResponse;->getStatus()Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;

    move-result-object v4

    invoke-virtual {v4}, Lorg/jboss/netty/handler/codec/http/HttpResponseStatus;->getCode()I

    move-result v0

    .line 431
    .local v0, "code":I
    const/16 v4, 0x64

    if-lt v0, v4, :cond_2

    const/16 v4, 0xc8

    if-ge v0, v4, :cond_2

    .line 432
    const/16 v4, 0x65

    if-ne v0, v4, :cond_1

    invoke-interface {v1}, Lorg/jboss/netty/handler/codec/http/HttpResponse;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v4

    const-string v5, "Sec-WebSocket-Accept"

    invoke-virtual {v4, v5}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->contains(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 444
    .end local v0    # "code":I
    .end local v1    # "res":Lorg/jboss/netty/handler/codec/http/HttpResponse;
    :cond_0
    :goto_0
    return v2

    .restart local v0    # "code":I
    .restart local v1    # "res":Lorg/jboss/netty/handler/codec/http/HttpResponse;
    :cond_1
    move v2, v3

    .line 436
    goto :goto_0

    .line 439
    :cond_2
    sparse-switch v0, :sswitch_data_0

    goto :goto_0

    :sswitch_0
    move v2, v3

    .line 441
    goto :goto_0

    .line 439
    :sswitch_data_0
    .sparse-switch
        0xcc -> :sswitch_0
        0xcd -> :sswitch_0
        0x130 -> :sswitch_0
    .end sparse-switch
.end method

.method protected abstract isDecodingRequest()Z
.end method
