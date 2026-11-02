.class public Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;
.super Ljava/lang/Object;
.source "HttpPostRequestEncoder.java"

# interfaces
.implements Lorg/jboss/netty/handler/stream/ChunkedInput;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder$ErrorDataEncoderException;,
        Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder$EncoderMode;
    }
.end annotation


# static fields
.field private static final percentEncodings:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/util/regex/Pattern;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final bodyListDatas:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;",
            ">;"
        }
    .end annotation
.end field

.field private final charset:Ljava/nio/charset/Charset;

.field private currentBuffer:Lorg/jboss/netty/buffer/ChannelBuffer;

.field private currentData:Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;

.field private currentFileUpload:Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;

.field private duringMixedMode:Z

.field private final encoderMode:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder$EncoderMode;

.field private final factory:Lorg/jboss/netty/handler/codec/http/multipart/HttpDataFactory;

.field private globalBodySize:J

.field private headerFinalized:Z

.field private isChunked:Z

.field private isKey:Z

.field private isLastChunk:Z

.field private isLastChunkSent:Z

.field private final isMultipart:Z

.field private iterator:Ljava/util/ListIterator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ListIterator",
            "<",
            "Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;",
            ">;"
        }
    .end annotation
.end field

.field multipartDataBoundary:Ljava/lang/String;

.field final multipartHttpDatas:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;",
            ">;"
        }
    .end annotation
.end field

.field multipartMixedBoundary:Ljava/lang/String;

.field private final request:Lorg/jboss/netty/handler/codec/http/HttpRequest;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 72
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->percentEncodings:Ljava/util/Map;

    .line 75
    sget-object v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->percentEncodings:Ljava/util/Map;

    const-string v1, "\\*"

    invoke-static {v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v1

    const-string v2, "%2A"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    sget-object v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->percentEncodings:Ljava/util/Map;

    const-string v1, "\\+"

    invoke-static {v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v1

    const-string v2, "%20"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 77
    sget-object v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->percentEncodings:Ljava/util/Map;

    const-string v1, "%7E"

    invoke-static {v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v1

    const-string v2, "~"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 78
    return-void
.end method

.method public constructor <init>(Lorg/jboss/netty/handler/codec/http/HttpRequest;Z)V
    .locals 4
    .param p1, "request"    # Lorg/jboss/netty/handler/codec/http/HttpRequest;
    .param p2, "multipart"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder$ErrorDataEncoderException;
        }
    .end annotation

    .prologue
    .line 140
    new-instance v0, Lorg/jboss/netty/handler/codec/http/multipart/DefaultHttpDataFactory;

    const-wide/16 v2, 0x4000

    invoke-direct {v0, v2, v3}, Lorg/jboss/netty/handler/codec/http/multipart/DefaultHttpDataFactory;-><init>(J)V

    sget-object v1, Lorg/jboss/netty/handler/codec/http/HttpConstants;->DEFAULT_CHARSET:Ljava/nio/charset/Charset;

    invoke-direct {p0, v0, p1, p2, v1}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;-><init>(Lorg/jboss/netty/handler/codec/http/multipart/HttpDataFactory;Lorg/jboss/netty/handler/codec/http/HttpRequest;ZLjava/nio/charset/Charset;)V

    .line 142
    return-void
.end method

.method public constructor <init>(Lorg/jboss/netty/handler/codec/http/multipart/HttpDataFactory;Lorg/jboss/netty/handler/codec/http/HttpRequest;Z)V
    .locals 1
    .param p1, "factory"    # Lorg/jboss/netty/handler/codec/http/multipart/HttpDataFactory;
    .param p2, "request"    # Lorg/jboss/netty/handler/codec/http/HttpRequest;
    .param p3, "multipart"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder$ErrorDataEncoderException;
        }
    .end annotation

    .prologue
    .line 154
    sget-object v0, Lorg/jboss/netty/handler/codec/http/HttpConstants;->DEFAULT_CHARSET:Ljava/nio/charset/Charset;

    invoke-direct {p0, p1, p2, p3, v0}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;-><init>(Lorg/jboss/netty/handler/codec/http/multipart/HttpDataFactory;Lorg/jboss/netty/handler/codec/http/HttpRequest;ZLjava/nio/charset/Charset;)V

    .line 155
    return-void
.end method

.method public constructor <init>(Lorg/jboss/netty/handler/codec/http/multipart/HttpDataFactory;Lorg/jboss/netty/handler/codec/http/HttpRequest;ZLjava/nio/charset/Charset;)V
    .locals 6
    .param p1, "factory"    # Lorg/jboss/netty/handler/codec/http/multipart/HttpDataFactory;
    .param p2, "request"    # Lorg/jboss/netty/handler/codec/http/HttpRequest;
    .param p3, "multipart"    # Z
    .param p4, "charset"    # Ljava/nio/charset/Charset;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder$ErrorDataEncoderException;
        }
    .end annotation

    .prologue
    .line 168
    sget-object v5, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder$EncoderMode;->RFC1738:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder$EncoderMode;

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    move-object v4, p4

    invoke-direct/range {v0 .. v5}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;-><init>(Lorg/jboss/netty/handler/codec/http/multipart/HttpDataFactory;Lorg/jboss/netty/handler/codec/http/HttpRequest;ZLjava/nio/charset/Charset;Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder$EncoderMode;)V

    .line 169
    return-void
.end method

.method public constructor <init>(Lorg/jboss/netty/handler/codec/http/multipart/HttpDataFactory;Lorg/jboss/netty/handler/codec/http/HttpRequest;ZLjava/nio/charset/Charset;Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder$EncoderMode;)V
    .locals 3
    .param p1, "factory"    # Lorg/jboss/netty/handler/codec/http/multipart/HttpDataFactory;
    .param p2, "request"    # Lorg/jboss/netty/handler/codec/http/HttpRequest;
    .param p3, "multipart"    # Z
    .param p4, "charset"    # Ljava/nio/charset/Charset;
    .param p5, "encoderMode"    # Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder$EncoderMode;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder$ErrorDataEncoderException;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 182
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 775
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->isKey:Z

    .line 183
    if-nez p1, :cond_0

    .line 184
    new-instance v1, Ljava/lang/NullPointerException;

    const-string v2, "factory"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 186
    :cond_0
    if-nez p2, :cond_1

    .line 187
    new-instance v1, Ljava/lang/NullPointerException;

    const-string v2, "request"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 189
    :cond_1
    if-nez p4, :cond_2

    .line 190
    new-instance v1, Ljava/lang/NullPointerException;

    const-string v2, "charset"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 192
    :cond_2
    invoke-interface {p2}, Lorg/jboss/netty/handler/codec/http/HttpRequest;->getMethod()Lorg/jboss/netty/handler/codec/http/HttpMethod;

    move-result-object v0

    .line 193
    .local v0, "method":Lorg/jboss/netty/handler/codec/http/HttpMethod;
    sget-object v1, Lorg/jboss/netty/handler/codec/http/HttpMethod;->POST:Lorg/jboss/netty/handler/codec/http/HttpMethod;

    invoke-virtual {v0, v1}, Lorg/jboss/netty/handler/codec/http/HttpMethod;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    sget-object v1, Lorg/jboss/netty/handler/codec/http/HttpMethod;->PUT:Lorg/jboss/netty/handler/codec/http/HttpMethod;

    invoke-virtual {v0, v1}, Lorg/jboss/netty/handler/codec/http/HttpMethod;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    sget-object v1, Lorg/jboss/netty/handler/codec/http/HttpMethod;->PATCH:Lorg/jboss/netty/handler/codec/http/HttpMethod;

    invoke-virtual {v0, v1}, Lorg/jboss/netty/handler/codec/http/HttpMethod;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    .line 194
    new-instance v1, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder$ErrorDataEncoderException;

    const-string v2, "Cannot create a Encoder if not a POST"

    invoke-direct {v1, v2}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder$ErrorDataEncoderException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 196
    :cond_3
    iput-object p2, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->request:Lorg/jboss/netty/handler/codec/http/HttpRequest;

    .line 197
    iput-object p4, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->charset:Ljava/nio/charset/Charset;

    .line 198
    iput-object p1, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->factory:Lorg/jboss/netty/handler/codec/http/multipart/HttpDataFactory;

    .line 199
    iput-object p5, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->encoderMode:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder$EncoderMode;

    .line 201
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->bodyListDatas:Ljava/util/List;

    .line 203
    iput-boolean v2, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->isLastChunk:Z

    .line 204
    iput-boolean v2, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->isLastChunkSent:Z

    .line 205
    iput-boolean p3, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->isMultipart:Z

    .line 206
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->multipartHttpDatas:Ljava/util/List;

    .line 207
    iget-boolean v1, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->isMultipart:Z

    if-eqz v1, :cond_4

    .line 208
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->initDataMultipart()V

    .line 210
    :cond_4
    return-void
.end method

.method private encodeAttribute(Ljava/lang/String;Ljava/nio/charset/Charset;)Ljava/lang/String;
    .locals 7
    .param p1, "s"    # Ljava/lang/String;
    .param p2, "charset"    # Ljava/nio/charset/Charset;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder$ErrorDataEncoderException;
        }
    .end annotation

    .prologue
    .line 747
    if-nez p1, :cond_1

    .line 748
    const-string v1, ""

    .line 758
    :cond_0
    return-object v1

    .line 751
    :cond_1
    :try_start_0
    invoke-virtual {p2}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object v5

    invoke-static {p1, v5}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 752
    .local v1, "encoded":Ljava/lang/String;
    iget-object v5, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->encoderMode:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder$EncoderMode;

    sget-object v6, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder$EncoderMode;->RFC3986:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder$EncoderMode;

    if-ne v5, v6, :cond_0

    .line 753
    sget-object v5, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->percentEncodings:Ljava/util/Map;

    invoke-interface {v5}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 754
    .local v2, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/util/regex/Pattern;Ljava/lang/String;>;"
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 755
    .local v4, "replacement":Ljava/lang/String;
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/regex/Pattern;

    invoke-virtual {v5, v1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/util/regex/Matcher;->replaceAll(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 756
    goto :goto_0

    .line 759
    .end local v1    # "encoded":Ljava/lang/String;
    .end local v2    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/util/regex/Pattern;Ljava/lang/String;>;"
    .end local v3    # "i$":Ljava/util/Iterator;
    .end local v4    # "replacement":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 760
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v5, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder$ErrorDataEncoderException;

    invoke-virtual {p2}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6, v0}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder$ErrorDataEncoderException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v5
.end method

.method private encodeNextChunkMultipart(I)Lorg/jboss/netty/handler/codec/http/HttpChunk;
    .locals 6
    .param p1, "sizeleft"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder$ErrorDataEncoderException;
        }
    .end annotation

    .prologue
    const/4 v3, 0x0

    .line 807
    iget-object v2, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->currentData:Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;

    if-nez v2, :cond_0

    move-object v2, v3

    .line 846
    :goto_0
    return-object v2

    .line 811
    :cond_0
    iget-object v2, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->currentData:Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;

    instance-of v2, v2, Lorg/jboss/netty/handler/codec/http/multipart/InternalAttribute;

    if-eqz v2, :cond_2

    .line 813
    iget-object v2, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->currentData:Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;

    check-cast v2, Lorg/jboss/netty/handler/codec/http/multipart/InternalAttribute;

    invoke-virtual {v2}, Lorg/jboss/netty/handler/codec/http/multipart/InternalAttribute;->toChannelBuffer()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    .line 814
    .local v0, "buffer":Lorg/jboss/netty/buffer/ChannelBuffer;
    iput-object v3, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->currentData:Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;

    .line 835
    :cond_1
    iget-object v2, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->currentBuffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    if-nez v2, :cond_4

    .line 836
    iput-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->currentBuffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 841
    :goto_1
    iget-object v2, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->currentBuffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v2}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v2

    const/16 v4, 0x1fa0

    if-ge v2, v4, :cond_5

    .line 842
    iput-object v3, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->currentData:Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;

    move-object v2, v3

    .line 843
    goto :goto_0

    .line 816
    .end local v0    # "buffer":Lorg/jboss/netty/buffer/ChannelBuffer;
    :cond_2
    iget-object v2, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->currentData:Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;

    instance-of v2, v2, Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    if-eqz v2, :cond_3

    .line 818
    :try_start_0
    iget-object v2, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->currentData:Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;

    check-cast v2, Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    invoke-interface {v2, p1}, Lorg/jboss/netty/handler/codec/http/multipart/Attribute;->getChunk(I)Lorg/jboss/netty/buffer/ChannelBuffer;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 829
    .restart local v0    # "buffer":Lorg/jboss/netty/buffer/ChannelBuffer;
    :goto_2
    invoke-interface {v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->capacity()I

    move-result v2

    if-nez v2, :cond_1

    .line 831
    iput-object v3, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->currentData:Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;

    move-object v2, v3

    .line 832
    goto :goto_0

    .line 819
    .end local v0    # "buffer":Lorg/jboss/netty/buffer/ChannelBuffer;
    :catch_0
    move-exception v1

    .line 820
    .local v1, "e":Ljava/io/IOException;
    new-instance v2, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder$ErrorDataEncoderException;

    invoke-direct {v2, v1}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder$ErrorDataEncoderException;-><init>(Ljava/lang/Throwable;)V

    throw v2

    .line 824
    .end local v1    # "e":Ljava/io/IOException;
    :cond_3
    :try_start_1
    iget-object v2, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->currentData:Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;

    check-cast v2, Lorg/jboss/netty/handler/codec/http/multipart/HttpData;

    invoke-interface {v2, p1}, Lorg/jboss/netty/handler/codec/http/multipart/HttpData;->getChunk(I)Lorg/jboss/netty/buffer/ChannelBuffer;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v0

    .restart local v0    # "buffer":Lorg/jboss/netty/buffer/ChannelBuffer;
    goto :goto_2

    .line 825
    .end local v0    # "buffer":Lorg/jboss/netty/buffer/ChannelBuffer;
    :catch_1
    move-exception v1

    .line 826
    .restart local v1    # "e":Ljava/io/IOException;
    new-instance v2, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder$ErrorDataEncoderException;

    invoke-direct {v2, v1}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder$ErrorDataEncoderException;-><init>(Ljava/lang/Throwable;)V

    throw v2

    .line 838
    .end local v1    # "e":Ljava/io/IOException;
    .restart local v0    # "buffer":Lorg/jboss/netty/buffer/ChannelBuffer;
    :cond_4
    const/4 v2, 0x2

    new-array v2, v2, [Lorg/jboss/netty/buffer/ChannelBuffer;

    const/4 v4, 0x0

    iget-object v5, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->currentBuffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    aput-object v5, v2, v4

    const/4 v4, 0x1

    aput-object v0, v2, v4

    invoke-static {v2}, Lorg/jboss/netty/buffer/ChannelBuffers;->wrappedBuffer([Lorg/jboss/netty/buffer/ChannelBuffer;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v2

    iput-object v2, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->currentBuffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    goto :goto_1

    .line 845
    :cond_5
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->fillChannelBuffer()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    .line 846
    new-instance v2, Lorg/jboss/netty/handler/codec/http/DefaultHttpChunk;

    invoke-direct {v2, v0}, Lorg/jboss/netty/handler/codec/http/DefaultHttpChunk;-><init>(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    goto :goto_0
.end method

.method private encodeNextChunkUrlEncoded(I)Lorg/jboss/netty/handler/codec/http/HttpChunk;
    .locals 12
    .param p1, "sizeleft"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder$ErrorDataEncoderException;
        }
    .end annotation

    .prologue
    const/16 v11, 0x1fa0

    const/4 v6, 0x0

    const/4 v10, 0x2

    const/4 v9, 0x0

    const/4 v8, 0x1

    .line 859
    iget-object v5, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->currentData:Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;

    if-nez v5, :cond_1

    .line 939
    :cond_0
    :goto_0
    return-object v6

    .line 862
    :cond_1
    move v4, p1

    .line 864
    .local v4, "size":I
    iget-boolean v5, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->isKey:Z

    if-eqz v5, :cond_3

    .line 866
    iget-object v5, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->currentData:Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;

    invoke-interface {v5}, Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;->getName()Ljava/lang/String;

    move-result-object v3

    .line 867
    .local v3, "key":Ljava/lang/String;
    invoke-virtual {v3}, Ljava/lang/String;->getBytes()[B

    move-result-object v5

    invoke-static {v5}, Lorg/jboss/netty/buffer/ChannelBuffers;->wrappedBuffer([B)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    .line 868
    .local v0, "buffer":Lorg/jboss/netty/buffer/ChannelBuffer;
    iput-boolean v9, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->isKey:Z

    .line 869
    iget-object v5, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->currentBuffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    if-nez v5, :cond_2

    .line 870
    new-array v5, v10, [Lorg/jboss/netty/buffer/ChannelBuffer;

    aput-object v0, v5, v9

    const-string v7, "="

    invoke-virtual {v7}, Ljava/lang/String;->getBytes()[B

    move-result-object v7

    invoke-static {v7}, Lorg/jboss/netty/buffer/ChannelBuffers;->wrappedBuffer([B)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v7

    aput-object v7, v5, v8

    invoke-static {v5}, Lorg/jboss/netty/buffer/ChannelBuffers;->wrappedBuffer([Lorg/jboss/netty/buffer/ChannelBuffer;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v5

    iput-object v5, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->currentBuffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 873
    invoke-interface {v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v5

    add-int/lit8 v5, v5, 0x1

    sub-int/2addr v4, v5

    .line 880
    :goto_1
    iget-object v5, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->currentBuffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v5}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v5

    if-lt v5, v11, :cond_3

    .line 881
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->fillChannelBuffer()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    .line 882
    new-instance v6, Lorg/jboss/netty/handler/codec/http/DefaultHttpChunk;

    invoke-direct {v6, v0}, Lorg/jboss/netty/handler/codec/http/DefaultHttpChunk;-><init>(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    goto :goto_0

    .line 875
    :cond_2
    const/4 v5, 0x3

    new-array v5, v5, [Lorg/jboss/netty/buffer/ChannelBuffer;

    iget-object v7, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->currentBuffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    aput-object v7, v5, v9

    aput-object v0, v5, v8

    const-string v7, "="

    invoke-virtual {v7}, Ljava/lang/String;->getBytes()[B

    move-result-object v7

    invoke-static {v7}, Lorg/jboss/netty/buffer/ChannelBuffers;->wrappedBuffer([B)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v7

    aput-object v7, v5, v10

    invoke-static {v5}, Lorg/jboss/netty/buffer/ChannelBuffers;->wrappedBuffer([Lorg/jboss/netty/buffer/ChannelBuffer;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v5

    iput-object v5, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->currentBuffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 878
    invoke-interface {v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v5

    add-int/lit8 v5, v5, 0x1

    sub-int/2addr v4, v5

    goto :goto_1

    .line 886
    .end local v0    # "buffer":Lorg/jboss/netty/buffer/ChannelBuffer;
    .end local v3    # "key":Ljava/lang/String;
    :cond_3
    :try_start_0
    iget-object v5, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->currentData:Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;

    check-cast v5, Lorg/jboss/netty/handler/codec/http/multipart/HttpData;

    invoke-interface {v5, v4}, Lorg/jboss/netty/handler/codec/http/multipart/HttpData;->getChunk(I)Lorg/jboss/netty/buffer/ChannelBuffer;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 890
    .restart local v0    # "buffer":Lorg/jboss/netty/buffer/ChannelBuffer;
    const/4 v1, 0x0

    .line 891
    .local v1, "delimiter":Lorg/jboss/netty/buffer/ChannelBuffer;
    invoke-interface {v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v5

    if-ge v5, v4, :cond_4

    .line 893
    iput-boolean v8, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->isKey:Z

    .line 894
    iget-object v5, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->iterator:Ljava/util/ListIterator;

    invoke-interface {v5}, Ljava/util/ListIterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_6

    const-string v5, "&"

    invoke-virtual {v5}, Ljava/lang/String;->getBytes()[B

    move-result-object v5

    invoke-static {v5}, Lorg/jboss/netty/buffer/ChannelBuffers;->wrappedBuffer([B)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v1

    .line 898
    :cond_4
    :goto_2
    invoke-interface {v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->capacity()I

    move-result v5

    if-nez v5, :cond_8

    .line 900
    iput-object v6, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->currentData:Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;

    .line 901
    iget-object v5, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->currentBuffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    if-nez v5, :cond_7

    .line 902
    iput-object v1, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->currentBuffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 909
    :cond_5
    :goto_3
    iget-object v5, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->currentBuffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v5}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v5

    if-lt v5, v11, :cond_0

    .line 910
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->fillChannelBuffer()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    .line 911
    new-instance v6, Lorg/jboss/netty/handler/codec/http/DefaultHttpChunk;

    invoke-direct {v6, v0}, Lorg/jboss/netty/handler/codec/http/DefaultHttpChunk;-><init>(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    goto/16 :goto_0

    .line 887
    .end local v0    # "buffer":Lorg/jboss/netty/buffer/ChannelBuffer;
    .end local v1    # "delimiter":Lorg/jboss/netty/buffer/ChannelBuffer;
    :catch_0
    move-exception v2

    .line 888
    .local v2, "e":Ljava/io/IOException;
    new-instance v5, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder$ErrorDataEncoderException;

    invoke-direct {v5, v2}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder$ErrorDataEncoderException;-><init>(Ljava/lang/Throwable;)V

    throw v5

    .end local v2    # "e":Ljava/io/IOException;
    .restart local v0    # "buffer":Lorg/jboss/netty/buffer/ChannelBuffer;
    .restart local v1    # "delimiter":Lorg/jboss/netty/buffer/ChannelBuffer;
    :cond_6
    move-object v1, v6

    .line 894
    goto :goto_2

    .line 904
    :cond_7
    if-eqz v1, :cond_5

    .line 905
    new-array v5, v10, [Lorg/jboss/netty/buffer/ChannelBuffer;

    iget-object v7, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->currentBuffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    aput-object v7, v5, v9

    aput-object v1, v5, v8

    invoke-static {v5}, Lorg/jboss/netty/buffer/ChannelBuffers;->wrappedBuffer([Lorg/jboss/netty/buffer/ChannelBuffer;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v5

    iput-object v5, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->currentBuffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    goto :goto_3

    .line 915
    :cond_8
    iget-object v5, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->currentBuffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    if-nez v5, :cond_a

    .line 916
    if-eqz v1, :cond_9

    .line 917
    new-array v5, v10, [Lorg/jboss/netty/buffer/ChannelBuffer;

    aput-object v0, v5, v9

    aput-object v1, v5, v8

    invoke-static {v5}, Lorg/jboss/netty/buffer/ChannelBuffers;->wrappedBuffer([Lorg/jboss/netty/buffer/ChannelBuffer;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v5

    iput-object v5, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->currentBuffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 931
    :goto_4
    iget-object v5, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->currentBuffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v5}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v5

    if-ge v5, v11, :cond_c

    .line 933
    iput-object v6, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->currentData:Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;

    .line 934
    iput-boolean v8, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->isKey:Z

    goto/16 :goto_0

    .line 920
    :cond_9
    iput-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->currentBuffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    goto :goto_4

    .line 923
    :cond_a
    if-eqz v1, :cond_b

    .line 924
    const/4 v5, 0x3

    new-array v5, v5, [Lorg/jboss/netty/buffer/ChannelBuffer;

    iget-object v7, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->currentBuffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    aput-object v7, v5, v9

    aput-object v0, v5, v8

    aput-object v1, v5, v10

    invoke-static {v5}, Lorg/jboss/netty/buffer/ChannelBuffers;->wrappedBuffer([Lorg/jboss/netty/buffer/ChannelBuffer;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v5

    iput-object v5, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->currentBuffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    goto :goto_4

    .line 927
    :cond_b
    new-array v5, v10, [Lorg/jboss/netty/buffer/ChannelBuffer;

    iget-object v7, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->currentBuffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    aput-object v7, v5, v9

    aput-object v0, v5, v8

    invoke-static {v5}, Lorg/jboss/netty/buffer/ChannelBuffers;->wrappedBuffer([Lorg/jboss/netty/buffer/ChannelBuffer;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v5

    iput-object v5, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->currentBuffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    goto :goto_4

    .line 937
    :cond_c
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->fillChannelBuffer()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    .line 939
    new-instance v6, Lorg/jboss/netty/handler/codec/http/DefaultHttpChunk;

    invoke-direct {v6, v0}, Lorg/jboss/netty/handler/codec/http/DefaultHttpChunk;-><init>(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    goto/16 :goto_0
.end method

.method private fillChannelBuffer()Lorg/jboss/netty/buffer/ChannelBuffer;
    .locals 6

    .prologue
    const/16 v5, 0x1fa0

    .line 783
    iget-object v3, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->currentBuffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v0

    .line 784
    .local v0, "length":I
    if-le v0, v5, :cond_0

    .line 785
    iget-object v3, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->currentBuffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    iget-object v4, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->currentBuffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v4}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v4

    invoke-interface {v3, v4, v5}, Lorg/jboss/netty/buffer/ChannelBuffer;->slice(II)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v1

    .line 787
    .local v1, "slice":Lorg/jboss/netty/buffer/ChannelBuffer;
    iget-object v3, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->currentBuffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v3, v5}, Lorg/jboss/netty/buffer/ChannelBuffer;->skipBytes(I)V

    move-object v2, v1

    .line 793
    .end local v1    # "slice":Lorg/jboss/netty/buffer/ChannelBuffer;
    .local v2, "slice":Lorg/jboss/netty/buffer/ChannelBuffer;
    :goto_0
    return-object v2

    .line 791
    .end local v2    # "slice":Lorg/jboss/netty/buffer/ChannelBuffer;
    :cond_0
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->currentBuffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 792
    .restart local v1    # "slice":Lorg/jboss/netty/buffer/ChannelBuffer;
    const/4 v3, 0x0

    iput-object v3, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->currentBuffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    move-object v2, v1

    .line 793
    .end local v1    # "slice":Lorg/jboss/netty/buffer/ChannelBuffer;
    .restart local v2    # "slice":Lorg/jboss/netty/buffer/ChannelBuffer;
    goto :goto_0
.end method

.method private static getNewMultipartDelimiter()Ljava/lang/String;
    .locals 4

    .prologue
    .line 268
    new-instance v0, Ljava/util/Random;

    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    .line 269
    .local v0, "random":Ljava/util/Random;
    invoke-virtual {v0}, Ljava/util/Random;->nextLong()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->toHexString(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method private initDataMultipart()V
    .locals 1

    .prologue
    .line 252
    invoke-static {}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->getNewMultipartDelimiter()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->multipartDataBoundary:Ljava/lang/String;

    .line 253
    return-void
.end method

.method private initMixedMultipart()V
    .locals 1

    .prologue
    .line 259
    invoke-static {}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->getNewMultipartDelimiter()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->multipartMixedBoundary:Ljava/lang/String;

    .line 260
    return-void
.end method


# virtual methods
.method public addBodyAttribute(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder$ErrorDataEncoderException;
        }
    .end annotation

    .prologue
    .line 310
    if-nez p1, :cond_0

    .line 311
    new-instance v2, Ljava/lang/NullPointerException;

    const-string v3, "name"

    invoke-direct {v2, v3}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 313
    :cond_0
    move-object v1, p2

    .line 314
    .local v1, "svalue":Ljava/lang/String;
    if-nez p2, :cond_1

    .line 315
    const-string v1, ""

    .line 317
    :cond_1
    iget-object v2, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->factory:Lorg/jboss/netty/handler/codec/http/multipart/HttpDataFactory;

    iget-object v3, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->request:Lorg/jboss/netty/handler/codec/http/HttpRequest;

    invoke-interface {v2, v3, p1, v1}, Lorg/jboss/netty/handler/codec/http/multipart/HttpDataFactory;->createAttribute(Lorg/jboss/netty/handler/codec/http/HttpRequest;Ljava/lang/String;Ljava/lang/String;)Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    move-result-object v0

    .line 318
    .local v0, "data":Lorg/jboss/netty/handler/codec/http/multipart/Attribute;
    invoke-virtual {p0, v0}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->addBodyHttpData(Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;)V

    .line 319
    return-void
.end method

.method public addBodyFileUpload(Ljava/lang/String;Ljava/io/File;Ljava/lang/String;Z)V
    .locals 11
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "file"    # Ljava/io/File;
    .param p3, "contentType"    # Ljava/lang/String;
    .param p4, "isText"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder$ErrorDataEncoderException;
        }
    .end annotation

    .prologue
    .line 332
    if-nez p1, :cond_0

    .line 333
    new-instance v1, Ljava/lang/NullPointerException;

    const-string v2, "name"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 335
    :cond_0
    if-nez p2, :cond_1

    .line 336
    new-instance v1, Ljava/lang/NullPointerException;

    const-string v2, "file"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 338
    :cond_1
    move-object v5, p3

    .line 339
    .local v5, "scontentType":Ljava/lang/String;
    const/4 v6, 0x0

    .line 340
    .local v6, "contentTransferEncoding":Ljava/lang/String;
    if-nez p3, :cond_2

    .line 341
    if-eqz p4, :cond_4

    .line 342
    const-string v5, "text/plain"

    .line 347
    :cond_2
    :goto_0
    if-nez p4, :cond_3

    .line 348
    sget-object v1, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$TransferEncodingMechanism;->BINARY:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$TransferEncodingMechanism;

    invoke-virtual {v1}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$TransferEncodingMechanism;->value()Ljava/lang/String;

    move-result-object v6

    .line 350
    :cond_3
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->factory:Lorg/jboss/netty/handler/codec/http/multipart/HttpDataFactory;

    iget-object v2, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->request:Lorg/jboss/netty/handler/codec/http/HttpRequest;

    invoke-virtual {p2}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v4

    const/4 v7, 0x0

    invoke-virtual {p2}, Ljava/io/File;->length()J

    move-result-wide v8

    move-object v3, p1

    invoke-interface/range {v1 .. v9}, Lorg/jboss/netty/handler/codec/http/multipart/HttpDataFactory;->createFileUpload(Lorg/jboss/netty/handler/codec/http/HttpRequest;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/nio/charset/Charset;J)Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;

    move-result-object v10

    .line 353
    .local v10, "fileUpload":Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;
    :try_start_0
    invoke-interface {v10, p2}, Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;->setContent(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 357
    invoke-virtual {p0, v10}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->addBodyHttpData(Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;)V

    .line 358
    return-void

    .line 344
    .end local v10    # "fileUpload":Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;
    :cond_4
    const-string v5, "application/octet-stream"

    goto :goto_0

    .line 354
    .restart local v10    # "fileUpload":Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;
    :catch_0
    move-exception v0

    .line 355
    .local v0, "e":Ljava/io/IOException;
    new-instance v1, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder$ErrorDataEncoderException;

    invoke-direct {v1, v0}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder$ErrorDataEncoderException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method public addBodyFileUploads(Ljava/lang/String;[Ljava/io/File;[Ljava/lang/String;[Z)V
    .locals 4
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "file"    # [Ljava/io/File;
    .param p3, "contentType"    # [Ljava/lang/String;
    .param p4, "isText"    # [Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder$ErrorDataEncoderException;
        }
    .end annotation

    .prologue
    .line 371
    array-length v1, p2

    array-length v2, p3

    if-eq v1, v2, :cond_0

    array-length v1, p2

    array-length v2, p4

    if-eq v1, v2, :cond_0

    .line 372
    new-instance v1, Ljava/lang/NullPointerException;

    const-string v2, "Different array length"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 374
    :cond_0
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p2

    if-ge v0, v1, :cond_1

    .line 375
    aget-object v1, p2, v0

    aget-object v2, p3, v0

    aget-boolean v3, p4, v0

    invoke-virtual {p0, p1, v1, v2, v3}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->addBodyFileUpload(Ljava/lang/String;Ljava/io/File;Ljava/lang/String;Z)V

    .line 374
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 377
    :cond_1
    return-void
.end method

.method public addBodyHttpData(Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;)V
    .locals 20
    .param p1, "data"    # Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder$ErrorDataEncoderException;
        }
    .end annotation

    .prologue
    .line 386
    move-object/from16 v0, p0

    iget-boolean v14, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->headerFinalized:Z

    if-eqz v14, :cond_0

    .line 387
    new-instance v14, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder$ErrorDataEncoderException;

    const-string v15, "Cannot add value once finalized"

    invoke-direct {v14, v15}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder$ErrorDataEncoderException;-><init>(Ljava/lang/String;)V

    throw v14

    .line 389
    :cond_0
    if-nez p1, :cond_1

    .line 390
    new-instance v14, Ljava/lang/NullPointerException;

    const-string v15, "data"

    invoke-direct {v14, v15}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v14

    .line 392
    :cond_1
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->bodyListDatas:Ljava/util/List;

    move-object/from16 v0, p1

    invoke-interface {v14, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 393
    move-object/from16 v0, p0

    iget-boolean v14, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->isMultipart:Z

    if-nez v14, :cond_4

    .line 394
    move-object/from16 v0, p1

    instance-of v14, v0, Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    if-eqz v14, :cond_3

    move-object/from16 v2, p1

    .line 395
    check-cast v2, Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    .line 398
    .local v2, "attribute":Lorg/jboss/netty/handler/codec/http/multipart/Attribute;
    :try_start_0
    invoke-interface {v2}, Lorg/jboss/netty/handler/codec/http/multipart/Attribute;->getName()Ljava/lang/String;

    move-result-object v14

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->charset:Ljava/nio/charset/Charset;

    move-object/from16 v0, p0

    invoke-direct {v0, v14, v15}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->encodeAttribute(Ljava/lang/String;Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v7

    .line 399
    .local v7, "key":Ljava/lang/String;
    invoke-interface {v2}, Lorg/jboss/netty/handler/codec/http/multipart/Attribute;->getValue()Ljava/lang/String;

    move-result-object v14

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->charset:Ljava/nio/charset/Charset;

    move-object/from16 v0, p0

    invoke-direct {v0, v14, v15}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->encodeAttribute(Ljava/lang/String;Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v13

    .line 400
    .local v13, "value":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->factory:Lorg/jboss/netty/handler/codec/http/multipart/HttpDataFactory;

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->request:Lorg/jboss/netty/handler/codec/http/HttpRequest;

    invoke-interface {v14, v15, v7, v13}, Lorg/jboss/netty/handler/codec/http/multipart/HttpDataFactory;->createAttribute(Lorg/jboss/netty/handler/codec/http/HttpRequest;Ljava/lang/String;Ljava/lang/String;)Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    move-result-object v10

    .line 401
    .local v10, "newattribute":Lorg/jboss/netty/handler/codec/http/multipart/Attribute;
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->multipartHttpDatas:Ljava/util/List;

    invoke-interface {v14, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 402
    move-object/from16 v0, p0

    iget-wide v14, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->globalBodySize:J

    invoke-interface {v10}, Lorg/jboss/netty/handler/codec/http/multipart/Attribute;->getName()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/String;->length()I

    move-result v16

    add-int/lit8 v16, v16, 0x1

    move/from16 v0, v16

    int-to-long v0, v0

    move-wide/from16 v16, v0

    invoke-interface {v10}, Lorg/jboss/netty/handler/codec/http/multipart/Attribute;->length()J

    move-result-wide v18

    add-long v16, v16, v18

    const-wide/16 v18, 0x1

    add-long v16, v16, v18

    add-long v14, v14, v16

    move-object/from16 v0, p0

    iput-wide v14, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->globalBodySize:J
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 640
    .end local v2    # "attribute":Lorg/jboss/netty/handler/codec/http/multipart/Attribute;
    .end local v7    # "key":Ljava/lang/String;
    .end local v10    # "newattribute":Lorg/jboss/netty/handler/codec/http/multipart/Attribute;
    .end local v13    # "value":Ljava/lang/String;
    :cond_2
    :goto_0
    return-void

    .line 404
    .restart local v2    # "attribute":Lorg/jboss/netty/handler/codec/http/multipart/Attribute;
    :catch_0
    move-exception v4

    .line 405
    .local v4, "e":Ljava/io/IOException;
    new-instance v14, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder$ErrorDataEncoderException;

    invoke-direct {v14, v4}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder$ErrorDataEncoderException;-><init>(Ljava/lang/Throwable;)V

    throw v14

    .line 407
    .end local v2    # "attribute":Lorg/jboss/netty/handler/codec/http/multipart/Attribute;
    .end local v4    # "e":Ljava/io/IOException;
    :cond_3
    move-object/from16 v0, p1

    instance-of v14, v0, Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;

    if-eqz v14, :cond_2

    move-object/from16 v5, p1

    .line 409
    check-cast v5, Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;

    .line 411
    .local v5, "fileUpload":Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;
    invoke-interface {v5}, Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;->getName()Ljava/lang/String;

    move-result-object v14

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->charset:Ljava/nio/charset/Charset;

    move-object/from16 v0, p0

    invoke-direct {v0, v14, v15}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->encodeAttribute(Ljava/lang/String;Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v7

    .line 412
    .restart local v7    # "key":Ljava/lang/String;
    invoke-interface {v5}, Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;->getFilename()Ljava/lang/String;

    move-result-object v14

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->charset:Ljava/nio/charset/Charset;

    move-object/from16 v0, p0

    invoke-direct {v0, v14, v15}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->encodeAttribute(Ljava/lang/String;Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v13

    .line 413
    .restart local v13    # "value":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->factory:Lorg/jboss/netty/handler/codec/http/multipart/HttpDataFactory;

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->request:Lorg/jboss/netty/handler/codec/http/HttpRequest;

    invoke-interface {v14, v15, v7, v13}, Lorg/jboss/netty/handler/codec/http/multipart/HttpDataFactory;->createAttribute(Lorg/jboss/netty/handler/codec/http/HttpRequest;Ljava/lang/String;Ljava/lang/String;)Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    move-result-object v10

    .line 414
    .restart local v10    # "newattribute":Lorg/jboss/netty/handler/codec/http/multipart/Attribute;
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->multipartHttpDatas:Ljava/util/List;

    invoke-interface {v14, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 415
    move-object/from16 v0, p0

    iget-wide v14, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->globalBodySize:J

    invoke-interface {v10}, Lorg/jboss/netty/handler/codec/http/multipart/Attribute;->getName()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v16 .. v16}, Ljava/lang/String;->length()I

    move-result v16

    add-int/lit8 v16, v16, 0x1

    move/from16 v0, v16

    int-to-long v0, v0

    move-wide/from16 v16, v0

    invoke-interface {v10}, Lorg/jboss/netty/handler/codec/http/multipart/Attribute;->length()J

    move-result-wide v18

    add-long v16, v16, v18

    const-wide/16 v18, 0x1

    add-long v16, v16, v18

    add-long v14, v14, v16

    move-object/from16 v0, p0

    iput-wide v14, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->globalBodySize:J

    goto :goto_0

    .line 452
    .end local v5    # "fileUpload":Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;
    .end local v7    # "key":Ljava/lang/String;
    .end local v10    # "newattribute":Lorg/jboss/netty/handler/codec/http/multipart/Attribute;
    .end local v13    # "value":Ljava/lang/String;
    :cond_4
    move-object/from16 v0, p1

    instance-of v14, v0, Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    if-eqz v14, :cond_8

    .line 453
    move-object/from16 v0, p0

    iget-boolean v14, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->duringMixedMode:Z

    if-eqz v14, :cond_5

    .line 454
    new-instance v6, Lorg/jboss/netty/handler/codec/http/multipart/InternalAttribute;

    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->charset:Ljava/nio/charset/Charset;

    invoke-direct {v6, v14}, Lorg/jboss/netty/handler/codec/http/multipart/InternalAttribute;-><init>(Ljava/nio/charset/Charset;)V

    .line 455
    .local v6, "internal":Lorg/jboss/netty/handler/codec/http/multipart/InternalAttribute;
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "\r\n--"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->multipartMixedBoundary:Ljava/lang/String;

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "--"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v6, v14}, Lorg/jboss/netty/handler/codec/http/multipart/InternalAttribute;->addValue(Ljava/lang/String;)V

    .line 456
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->multipartHttpDatas:Ljava/util/List;

    invoke-interface {v14, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 457
    const/4 v14, 0x0

    move-object/from16 v0, p0

    iput-object v14, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->multipartMixedBoundary:Ljava/lang/String;

    .line 458
    const/4 v14, 0x0

    move-object/from16 v0, p0

    iput-object v14, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->currentFileUpload:Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;

    .line 459
    const/4 v14, 0x0

    move-object/from16 v0, p0

    iput-boolean v14, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->duringMixedMode:Z

    .line 461
    .end local v6    # "internal":Lorg/jboss/netty/handler/codec/http/multipart/InternalAttribute;
    :cond_5
    new-instance v6, Lorg/jboss/netty/handler/codec/http/multipart/InternalAttribute;

    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->charset:Ljava/nio/charset/Charset;

    invoke-direct {v6, v14}, Lorg/jboss/netty/handler/codec/http/multipart/InternalAttribute;-><init>(Ljava/nio/charset/Charset;)V

    .line 462
    .restart local v6    # "internal":Lorg/jboss/netty/handler/codec/http/multipart/InternalAttribute;
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->multipartHttpDatas:Ljava/util/List;

    invoke-interface {v14}, Ljava/util/List;->isEmpty()Z

    move-result v14

    if-nez v14, :cond_6

    .line 464
    const-string v14, "\r\n"

    invoke-virtual {v6, v14}, Lorg/jboss/netty/handler/codec/http/multipart/InternalAttribute;->addValue(Ljava/lang/String;)V

    .line 466
    :cond_6
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "--"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->multipartDataBoundary:Ljava/lang/String;

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "\r\n"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v6, v14}, Lorg/jboss/netty/handler/codec/http/multipart/InternalAttribute;->addValue(Ljava/lang/String;)V

    move-object/from16 v2, p1

    .line 468
    check-cast v2, Lorg/jboss/netty/handler/codec/http/multipart/Attribute;

    .line 469
    .restart local v2    # "attribute":Lorg/jboss/netty/handler/codec/http/multipart/Attribute;
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "Content-Disposition: form-data; name=\""

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-interface {v2}, Lorg/jboss/netty/handler/codec/http/multipart/Attribute;->getName()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "\"\r\n"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v6, v14}, Lorg/jboss/netty/handler/codec/http/multipart/InternalAttribute;->addValue(Ljava/lang/String;)V

    .line 472
    invoke-interface {v2}, Lorg/jboss/netty/handler/codec/http/multipart/Attribute;->getCharset()Ljava/nio/charset/Charset;

    move-result-object v9

    .line 473
    .local v9, "localcharset":Ljava/nio/charset/Charset;
    if-eqz v9, :cond_7

    .line 475
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "Content-Type: text/plain; charset="

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "\r\n"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v6, v14}, Lorg/jboss/netty/handler/codec/http/multipart/InternalAttribute;->addValue(Ljava/lang/String;)V

    .line 480
    :cond_7
    const-string v14, "\r\n"

    invoke-virtual {v6, v14}, Lorg/jboss/netty/handler/codec/http/multipart/InternalAttribute;->addValue(Ljava/lang/String;)V

    .line 481
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->multipartHttpDatas:Ljava/util/List;

    invoke-interface {v14, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 482
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->multipartHttpDatas:Ljava/util/List;

    move-object/from16 v0, p1

    invoke-interface {v14, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 483
    move-object/from16 v0, p0

    iget-wide v14, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->globalBodySize:J

    invoke-interface {v2}, Lorg/jboss/netty/handler/codec/http/multipart/Attribute;->length()J

    move-result-wide v16

    invoke-virtual {v6}, Lorg/jboss/netty/handler/codec/http/multipart/InternalAttribute;->size()I

    move-result v18

    move/from16 v0, v18

    int-to-long v0, v0

    move-wide/from16 v18, v0

    add-long v16, v16, v18

    add-long v14, v14, v16

    move-object/from16 v0, p0

    iput-wide v14, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->globalBodySize:J

    goto/16 :goto_0

    .line 484
    .end local v2    # "attribute":Lorg/jboss/netty/handler/codec/http/multipart/Attribute;
    .end local v6    # "internal":Lorg/jboss/netty/handler/codec/http/multipart/InternalAttribute;
    .end local v9    # "localcharset":Ljava/nio/charset/Charset;
    :cond_8
    move-object/from16 v0, p1

    instance-of v14, v0, Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;

    if-eqz v14, :cond_2

    move-object/from16 v5, p1

    .line 485
    check-cast v5, Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;

    .line 486
    .restart local v5    # "fileUpload":Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;
    new-instance v6, Lorg/jboss/netty/handler/codec/http/multipart/InternalAttribute;

    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->charset:Ljava/nio/charset/Charset;

    invoke-direct {v6, v14}, Lorg/jboss/netty/handler/codec/http/multipart/InternalAttribute;-><init>(Ljava/nio/charset/Charset;)V

    .line 487
    .restart local v6    # "internal":Lorg/jboss/netty/handler/codec/http/multipart/InternalAttribute;
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->multipartHttpDatas:Ljava/util/List;

    invoke-interface {v14}, Ljava/util/List;->isEmpty()Z

    move-result v14

    if-nez v14, :cond_9

    .line 489
    const-string v14, "\r\n"

    invoke-virtual {v6, v14}, Lorg/jboss/netty/handler/codec/http/multipart/InternalAttribute;->addValue(Ljava/lang/String;)V

    .line 492
    :cond_9
    move-object/from16 v0, p0

    iget-boolean v14, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->duringMixedMode:Z

    if-eqz v14, :cond_b

    .line 493
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->currentFileUpload:Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;

    if-eqz v14, :cond_a

    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->currentFileUpload:Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;

    invoke-interface {v14}, Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;->getName()Ljava/lang/String;

    move-result-object v14

    invoke-interface {v5}, Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;->getName()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_a

    .line 497
    const/4 v8, 0x1

    .line 599
    .local v8, "localMixed":Z
    :goto_1
    if-eqz v8, :cond_d

    .line 602
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "--"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->multipartMixedBoundary:Ljava/lang/String;

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "\r\n"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v6, v14}, Lorg/jboss/netty/handler/codec/http/multipart/InternalAttribute;->addValue(Ljava/lang/String;)V

    .line 604
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "Content-Disposition: attachment; filename=\""

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-interface {v5}, Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;->getFilename()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "\"\r\n"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v6, v14}, Lorg/jboss/netty/handler/codec/http/multipart/InternalAttribute;->addValue(Ljava/lang/String;)V

    .line 621
    :goto_2
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "Content-Type: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-interface {v5}, Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;->getContentType()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v6, v14}, Lorg/jboss/netty/handler/codec/http/multipart/InternalAttribute;->addValue(Ljava/lang/String;)V

    .line 623
    invoke-interface {v5}, Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;->getContentTransferEncoding()Ljava/lang/String;

    move-result-object v3

    .line 624
    .local v3, "contentTransferEncoding":Ljava/lang/String;
    if-eqz v3, :cond_e

    sget-object v14, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$TransferEncodingMechanism;->BINARY:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$TransferEncodingMechanism;

    invoke-virtual {v14}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$TransferEncodingMechanism;->value()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v3, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_e

    .line 627
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "\r\nContent-Transfer-Encoding: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    sget-object v15, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$TransferEncodingMechanism;->BINARY:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$TransferEncodingMechanism;

    invoke-virtual {v15}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostBodyUtil$TransferEncodingMechanism;->value()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "\r\n\r\n"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v6, v14}, Lorg/jboss/netty/handler/codec/http/multipart/InternalAttribute;->addValue(Ljava/lang/String;)V

    .line 636
    :goto_3
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->multipartHttpDatas:Ljava/util/List;

    invoke-interface {v14, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 637
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->multipartHttpDatas:Ljava/util/List;

    move-object/from16 v0, p1

    invoke-interface {v14, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 638
    move-object/from16 v0, p0

    iget-wide v14, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->globalBodySize:J

    invoke-interface {v5}, Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;->length()J

    move-result-wide v16

    invoke-virtual {v6}, Lorg/jboss/netty/handler/codec/http/multipart/InternalAttribute;->size()I

    move-result v18

    move/from16 v0, v18

    int-to-long v0, v0

    move-wide/from16 v18, v0

    add-long v16, v16, v18

    add-long v14, v14, v16

    move-object/from16 v0, p0

    iput-wide v14, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->globalBodySize:J

    goto/16 :goto_0

    .line 503
    .end local v3    # "contentTransferEncoding":Ljava/lang/String;
    .end local v8    # "localMixed":Z
    :cond_a
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "--"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->multipartMixedBoundary:Ljava/lang/String;

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "--"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v6, v14}, Lorg/jboss/netty/handler/codec/http/multipart/InternalAttribute;->addValue(Ljava/lang/String;)V

    .line 504
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->multipartHttpDatas:Ljava/util/List;

    invoke-interface {v14, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 505
    const/4 v14, 0x0

    move-object/from16 v0, p0

    iput-object v14, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->multipartMixedBoundary:Ljava/lang/String;

    .line 507
    new-instance v6, Lorg/jboss/netty/handler/codec/http/multipart/InternalAttribute;

    .end local v6    # "internal":Lorg/jboss/netty/handler/codec/http/multipart/InternalAttribute;
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->charset:Ljava/nio/charset/Charset;

    invoke-direct {v6, v14}, Lorg/jboss/netty/handler/codec/http/multipart/InternalAttribute;-><init>(Ljava/nio/charset/Charset;)V

    .line 508
    .restart local v6    # "internal":Lorg/jboss/netty/handler/codec/http/multipart/InternalAttribute;
    const-string v14, "\r\n"

    invoke-virtual {v6, v14}, Lorg/jboss/netty/handler/codec/http/multipart/InternalAttribute;->addValue(Ljava/lang/String;)V

    .line 509
    const/4 v8, 0x0

    .line 511
    .restart local v8    # "localMixed":Z
    move-object/from16 v0, p0

    iput-object v5, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->currentFileUpload:Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;

    .line 512
    const/4 v14, 0x0

    move-object/from16 v0, p0

    iput-boolean v14, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->duringMixedMode:Z

    goto/16 :goto_1

    .line 515
    .end local v8    # "localMixed":Z
    :cond_b
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->encoderMode:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder$EncoderMode;

    sget-object v15, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder$EncoderMode;->HTML5:Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder$EncoderMode;

    if-eq v14, v15, :cond_c

    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->currentFileUpload:Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;

    if-eqz v14, :cond_c

    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->currentFileUpload:Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;

    invoke-interface {v14}, Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;->getName()Ljava/lang/String;

    move-result-object v14

    invoke-interface {v5}, Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;->getName()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_c

    .line 535
    invoke-direct/range {p0 .. p0}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->initMixedMultipart()V

    .line 536
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->multipartHttpDatas:Ljava/util/List;

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->multipartHttpDatas:Ljava/util/List;

    invoke-interface {v15}, Ljava/util/List;->size()I

    move-result v15

    add-int/lit8 v15, v15, -0x2

    invoke-interface {v14, v15}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lorg/jboss/netty/handler/codec/http/multipart/InternalAttribute;

    .line 539
    .local v11, "pastAttribute":Lorg/jboss/netty/handler/codec/http/multipart/InternalAttribute;
    move-object/from16 v0, p0

    iget-wide v14, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->globalBodySize:J

    invoke-virtual {v11}, Lorg/jboss/netty/handler/codec/http/multipart/InternalAttribute;->size()I

    move-result v16

    move/from16 v0, v16

    int-to-long v0, v0

    move-wide/from16 v16, v0

    sub-long v14, v14, v16

    move-object/from16 v0, p0

    iput-wide v14, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->globalBodySize:J

    .line 540
    new-instance v12, Ljava/lang/StringBuilder;

    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->multipartDataBoundary:Ljava/lang/String;

    invoke-virtual {v14}, Ljava/lang/String;->length()I

    move-result v14

    add-int/lit16 v14, v14, 0x8b

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->multipartMixedBoundary:Ljava/lang/String;

    invoke-virtual {v15}, Ljava/lang/String;->length()I

    move-result v15

    mul-int/lit8 v15, v15, 0x2

    add-int/2addr v14, v15

    invoke-interface {v5}, Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;->getFilename()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/String;->length()I

    move-result v15

    add-int/2addr v14, v15

    invoke-interface {v5}, Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;->getName()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/String;->length()I

    move-result v15

    add-int/2addr v14, v15

    invoke-direct {v12, v14}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 544
    .local v12, "replacement":Ljava/lang/StringBuilder;
    const-string v14, "--"

    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 545
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->multipartDataBoundary:Ljava/lang/String;

    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 546
    const-string v14, "\r\n"

    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 548
    const-string v14, "Content-Disposition"

    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 549
    const-string v14, ": "

    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 550
    const-string v14, "form-data"

    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 551
    const-string v14, "; "

    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 552
    const-string v14, "name"

    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 553
    const-string v14, "=\""

    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 554
    invoke-interface {v5}, Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;->getName()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 555
    const-string v14, "\"\r\n"

    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 557
    const-string v14, "Content-Type"

    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 558
    const-string v14, ": "

    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 559
    const-string v14, "multipart/mixed"

    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 560
    const-string v14, "; "

    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 561
    const-string v14, "boundary"

    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 562
    const/16 v14, 0x3d

    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 563
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->multipartMixedBoundary:Ljava/lang/String;

    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 564
    const-string v14, "\r\n\r\n"

    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 566
    const-string v14, "--"

    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 567
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->multipartMixedBoundary:Ljava/lang/String;

    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 568
    const-string v14, "\r\n"

    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 570
    const-string v14, "Content-Disposition"

    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 571
    const-string v14, ": "

    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 572
    const-string v14, "attachment"

    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 573
    const-string v14, "; "

    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 574
    const-string v14, "filename"

    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 575
    const-string v14, "=\""

    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 576
    invoke-interface {v5}, Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;->getFilename()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 577
    const-string v14, "\"\r\n"

    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 579
    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    const/4 v15, 0x1

    invoke-virtual {v11, v14, v15}, Lorg/jboss/netty/handler/codec/http/multipart/InternalAttribute;->setValue(Ljava/lang/String;I)V

    .line 580
    const-string v14, ""

    const/4 v15, 0x2

    invoke-virtual {v11, v14, v15}, Lorg/jboss/netty/handler/codec/http/multipart/InternalAttribute;->setValue(Ljava/lang/String;I)V

    .line 583
    move-object/from16 v0, p0

    iget-wide v14, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->globalBodySize:J

    invoke-virtual {v11}, Lorg/jboss/netty/handler/codec/http/multipart/InternalAttribute;->size()I

    move-result v16

    move/from16 v0, v16

    int-to-long v0, v0

    move-wide/from16 v16, v0

    add-long v14, v14, v16

    move-object/from16 v0, p0

    iput-wide v14, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->globalBodySize:J

    .line 588
    const/4 v8, 0x1

    .line 589
    .restart local v8    # "localMixed":Z
    const/4 v14, 0x1

    move-object/from16 v0, p0

    iput-boolean v14, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->duringMixedMode:Z

    goto/16 :goto_1

    .line 593
    .end local v8    # "localMixed":Z
    .end local v11    # "pastAttribute":Lorg/jboss/netty/handler/codec/http/multipart/InternalAttribute;
    .end local v12    # "replacement":Ljava/lang/StringBuilder;
    :cond_c
    const/4 v8, 0x0

    .line 594
    .restart local v8    # "localMixed":Z
    move-object/from16 v0, p0

    iput-object v5, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->currentFileUpload:Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;

    .line 595
    const/4 v14, 0x0

    move-object/from16 v0, p0

    iput-boolean v14, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->duringMixedMode:Z

    goto/16 :goto_1

    .line 609
    :cond_d
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "--"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->multipartDataBoundary:Ljava/lang/String;

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "\r\n"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v6, v14}, Lorg/jboss/netty/handler/codec/http/multipart/InternalAttribute;->addValue(Ljava/lang/String;)V

    .line 611
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "Content-Disposition: form-data; name=\""

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-interface {v5}, Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;->getName()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "\"; "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "filename"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "=\""

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-interface {v5}, Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;->getFilename()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "\"\r\n"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v6, v14}, Lorg/jboss/netty/handler/codec/http/multipart/InternalAttribute;->addValue(Ljava/lang/String;)V

    goto/16 :goto_2

    .line 630
    .restart local v3    # "contentTransferEncoding":Ljava/lang/String;
    :cond_e
    invoke-interface {v5}, Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;->getCharset()Ljava/nio/charset/Charset;

    move-result-object v14

    if-eqz v14, :cond_f

    .line 631
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "; charset="

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-interface {v5}, Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;->getCharset()Ljava/nio/charset/Charset;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "\r\n\r\n"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v6, v14}, Lorg/jboss/netty/handler/codec/http/multipart/InternalAttribute;->addValue(Ljava/lang/String;)V

    goto/16 :goto_3

    .line 634
    :cond_f
    const-string v14, "\r\n\r\n"

    invoke-virtual {v6, v14}, Lorg/jboss/netty/handler/codec/http/multipart/InternalAttribute;->addValue(Ljava/lang/String;)V

    goto/16 :goto_3
.end method

.method public cleanFiles()V
    .locals 2

    .prologue
    .line 215
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->factory:Lorg/jboss/netty/handler/codec/http/multipart/HttpDataFactory;

    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->request:Lorg/jboss/netty/handler/codec/http/HttpRequest;

    invoke-interface {v0, v1}, Lorg/jboss/netty/handler/codec/http/multipart/HttpDataFactory;->cleanRequestHttpDatas(Lorg/jboss/netty/handler/codec/http/HttpRequest;)V

    .line 216
    return-void
.end method

.method public close()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 944
    return-void
.end method

.method public finalizeRequest()Lorg/jboss/netty/handler/codec/http/HttpRequest;
    .locals 18
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder$ErrorDataEncoderException;
        }
    .end annotation

    .prologue
    .line 659
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->request:Lorg/jboss/netty/handler/codec/http/HttpRequest;

    invoke-interface {v14}, Lorg/jboss/netty/handler/codec/http/HttpRequest;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v5

    .line 661
    .local v5, "headers":Lorg/jboss/netty/handler/codec/http/HttpHeaders;
    move-object/from16 v0, p0

    iget-boolean v14, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->headerFinalized:Z

    if-nez v14, :cond_3

    .line 662
    move-object/from16 v0, p0

    iget-boolean v14, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->isMultipart:Z

    if-eqz v14, :cond_1

    .line 663
    new-instance v7, Lorg/jboss/netty/handler/codec/http/multipart/InternalAttribute;

    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->charset:Ljava/nio/charset/Charset;

    invoke-direct {v7, v14}, Lorg/jboss/netty/handler/codec/http/multipart/InternalAttribute;-><init>(Ljava/nio/charset/Charset;)V

    .line 664
    .local v7, "internal":Lorg/jboss/netty/handler/codec/http/multipart/InternalAttribute;
    move-object/from16 v0, p0

    iget-boolean v14, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->duringMixedMode:Z

    if-eqz v14, :cond_0

    .line 665
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "\r\n--"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->multipartMixedBoundary:Ljava/lang/String;

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "--"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v7, v14}, Lorg/jboss/netty/handler/codec/http/multipart/InternalAttribute;->addValue(Ljava/lang/String;)V

    .line 667
    :cond_0
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "\r\n--"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->multipartDataBoundary:Ljava/lang/String;

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, "--\r\n"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v7, v14}, Lorg/jboss/netty/handler/codec/http/multipart/InternalAttribute;->addValue(Ljava/lang/String;)V

    .line 668
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->multipartHttpDatas:Ljava/util/List;

    invoke-interface {v14, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 669
    const/4 v14, 0x0

    move-object/from16 v0, p0

    iput-object v14, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->multipartMixedBoundary:Ljava/lang/String;

    .line 670
    const/4 v14, 0x0

    move-object/from16 v0, p0

    iput-object v14, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->currentFileUpload:Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;

    .line 671
    const/4 v14, 0x0

    move-object/from16 v0, p0

    iput-boolean v14, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->duringMixedMode:Z

    .line 672
    move-object/from16 v0, p0

    iget-wide v14, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->globalBodySize:J

    invoke-virtual {v7}, Lorg/jboss/netty/handler/codec/http/multipart/InternalAttribute;->size()I

    move-result v16

    move/from16 v0, v16

    int-to-long v0, v0

    move-wide/from16 v16, v0

    add-long v14, v14, v16

    move-object/from16 v0, p0

    iput-wide v14, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->globalBodySize:J

    .line 674
    .end local v7    # "internal":Lorg/jboss/netty/handler/codec/http/multipart/InternalAttribute;
    :cond_1
    const/4 v14, 0x1

    move-object/from16 v0, p0

    iput-boolean v14, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->headerFinalized:Z

    .line 678
    const-string v14, "Content-Type"

    invoke-virtual {v5, v14}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->getAll(Ljava/lang/String;)Ljava/util/List;

    move-result-object v4

    .line 679
    .local v4, "contentTypes":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const-string v14, "Transfer-Encoding"

    invoke-virtual {v5, v14}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->getAll(Ljava/lang/String;)Ljava/util/List;

    move-result-object v9

    .line 680
    .local v9, "transferEncoding":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-eqz v4, :cond_4

    .line 681
    const-string v14, "Content-Type"

    invoke-virtual {v5, v14}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->remove(Ljava/lang/String;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .line 682
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .local v6, "i$":Ljava/util/Iterator;
    :cond_2
    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_4

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 684
    .local v3, "contentType":Ljava/lang/String;
    invoke-virtual {v3}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v8

    .line 685
    .local v8, "lowercased":Ljava/lang/String;
    const-string v14, "multipart/form-data"

    invoke-virtual {v8, v14}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v14

    if-nez v14, :cond_2

    const-string v14, "application/x-www-form-urlencoded"

    invoke-virtual {v8, v14}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v14

    if-nez v14, :cond_2

    .line 689
    const-string v14, "Content-Type"

    invoke-virtual {v5, v14, v3}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->add(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    goto :goto_0

    .line 676
    .end local v3    # "contentType":Ljava/lang/String;
    .end local v4    # "contentTypes":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v6    # "i$":Ljava/util/Iterator;
    .end local v8    # "lowercased":Ljava/lang/String;
    .end local v9    # "transferEncoding":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_3
    new-instance v14, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder$ErrorDataEncoderException;

    const-string v15, "Header already encoded"

    invoke-direct {v14, v15}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder$ErrorDataEncoderException;-><init>(Ljava/lang/String;)V

    throw v14

    .line 693
    .restart local v4    # "contentTypes":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v9    # "transferEncoding":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_4
    move-object/from16 v0, p0

    iget-boolean v14, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->isMultipart:Z

    if-eqz v14, :cond_7

    .line 694
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "multipart/form-data; boundary="

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    move-object/from16 v0, p0

    iget-object v15, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->multipartDataBoundary:Ljava/lang/String;

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    .line 696
    .local v13, "value":Ljava/lang/String;
    const-string v14, "Content-Type"

    invoke-virtual {v5, v14, v13}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->add(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .line 703
    .end local v13    # "value":Ljava/lang/String;
    :goto_1
    move-object/from16 v0, p0

    iget-wide v10, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->globalBodySize:J

    .line 704
    .local v10, "realSize":J
    move-object/from16 v0, p0

    iget-boolean v14, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->isMultipart:Z

    if-eqz v14, :cond_8

    .line 705
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->multipartHttpDatas:Ljava/util/List;

    invoke-interface {v14}, Ljava/util/List;->listIterator()Ljava/util/ListIterator;

    move-result-object v14

    move-object/from16 v0, p0

    iput-object v14, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->iterator:Ljava/util/ListIterator;

    .line 710
    :goto_2
    const-string v14, "Content-Length"

    invoke-static {v10, v11}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v5, v14, v15}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->set(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .line 711
    const-wide/16 v14, 0x1fa0    # 4.0E-320

    cmp-long v14, v10, v14

    if-gtz v14, :cond_5

    move-object/from16 v0, p0

    iget-boolean v14, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->isMultipart:Z

    if-eqz v14, :cond_a

    .line 712
    :cond_5
    const/4 v14, 0x1

    move-object/from16 v0, p0

    iput-boolean v14, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->isChunked:Z

    .line 713
    if-eqz v9, :cond_9

    .line 714
    const-string v14, "Transfer-Encoding"

    invoke-virtual {v5, v14}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->remove(Ljava/lang/String;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .line 715
    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .restart local v6    # "i$":Ljava/util/Iterator;
    :cond_6
    :goto_3
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_9

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/String;

    .line 716
    .local v12, "v":Ljava/lang/String;
    const-string v14, "chunked"

    invoke-virtual {v12, v14}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v14

    if-nez v14, :cond_6

    .line 719
    const-string v14, "Transfer-Encoding"

    invoke-virtual {v5, v14, v12}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->add(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    goto :goto_3

    .line 699
    .end local v6    # "i$":Ljava/util/Iterator;
    .end local v10    # "realSize":J
    .end local v12    # "v":Ljava/lang/String;
    :cond_7
    const-string v14, "Content-Type"

    const-string v15, "application/x-www-form-urlencoded"

    invoke-virtual {v5, v14, v15}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->add(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    goto :goto_1

    .line 707
    .restart local v10    # "realSize":J
    :cond_8
    const-wide/16 v14, 0x1

    sub-long/2addr v10, v14

    .line 708
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->multipartHttpDatas:Ljava/util/List;

    invoke-interface {v14}, Ljava/util/List;->listIterator()Ljava/util/ListIterator;

    move-result-object v14

    move-object/from16 v0, p0

    iput-object v14, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->iterator:Ljava/util/ListIterator;

    goto :goto_2

    .line 723
    :cond_9
    const-string v14, "Transfer-Encoding"

    const-string v15, "chunked"

    invoke-virtual {v5, v14, v15}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->add(Ljava/lang/String;Ljava/lang/Object;)Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    .line 724
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->request:Lorg/jboss/netty/handler/codec/http/HttpRequest;

    sget-object v15, Lorg/jboss/netty/buffer/ChannelBuffers;->EMPTY_BUFFER:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v14, v15}, Lorg/jboss/netty/handler/codec/http/HttpRequest;->setContent(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    .line 730
    :goto_4
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->request:Lorg/jboss/netty/handler/codec/http/HttpRequest;

    return-object v14

    .line 727
    :cond_a
    invoke-virtual/range {p0 .. p0}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->nextChunk()Lorg/jboss/netty/handler/codec/http/HttpChunk;

    move-result-object v2

    .line 728
    .local v2, "chunk":Lorg/jboss/netty/handler/codec/http/HttpChunk;
    move-object/from16 v0, p0

    iget-object v14, v0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->request:Lorg/jboss/netty/handler/codec/http/HttpRequest;

    invoke-interface {v2}, Lorg/jboss/netty/handler/codec/http/HttpChunk;->getContent()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v15

    invoke-interface {v14, v15}, Lorg/jboss/netty/handler/codec/http/HttpRequest;->setContent(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    goto :goto_4
.end method

.method public getBodyListAttributes()Ljava/util/List;
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

    .prologue
    .line 278
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->bodyListDatas:Ljava/util/List;

    return-object v0
.end method

.method public hasNextChunk()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 1027
    iget-boolean v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->isLastChunkSent:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isChunked()Z
    .locals 1

    .prologue
    .line 737
    iget-boolean v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->isChunked:Z

    return v0
.end method

.method public isEndOfInput()Z
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 1023
    iget-boolean v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->isLastChunkSent:Z

    return v0
.end method

.method public isMultipart()Z
    .locals 1

    .prologue
    .line 245
    iget-boolean v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->isMultipart:Z

    return v0
.end method

.method public bridge synthetic nextChunk()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 44
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->nextChunk()Lorg/jboss/netty/handler/codec/http/HttpChunk;

    move-result-object v0

    return-object v0
.end method

.method public nextChunk()Lorg/jboss/netty/handler/codec/http/HttpChunk;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder$ErrorDataEncoderException;
        }
    .end annotation

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 954
    iget-boolean v3, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->isLastChunk:Z

    if-eqz v3, :cond_1

    .line 955
    iput-boolean v4, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->isLastChunkSent:Z

    .line 956
    new-instance v1, Lorg/jboss/netty/handler/codec/http/DefaultHttpChunk;

    sget-object v3, Lorg/jboss/netty/buffer/ChannelBuffers;->EMPTY_BUFFER:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-direct {v1, v3}, Lorg/jboss/netty/handler/codec/http/DefaultHttpChunk;-><init>(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    .line 1019
    :cond_0
    :goto_0
    return-object v1

    .line 959
    :cond_1
    const/16 v2, 0x1fa0

    .line 961
    .local v2, "size":I
    iget-object v3, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->currentBuffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    if-eqz v3, :cond_2

    .line 962
    iget-object v3, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->currentBuffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v3

    sub-int/2addr v2, v3

    .line 964
    :cond_2
    if-gtz v2, :cond_3

    .line 966
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->fillChannelBuffer()Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    .line 967
    .local v0, "buffer":Lorg/jboss/netty/buffer/ChannelBuffer;
    new-instance v1, Lorg/jboss/netty/handler/codec/http/DefaultHttpChunk;

    invoke-direct {v1, v0}, Lorg/jboss/netty/handler/codec/http/DefaultHttpChunk;-><init>(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    goto :goto_0

    .line 970
    .end local v0    # "buffer":Lorg/jboss/netty/buffer/ChannelBuffer;
    :cond_3
    iget-object v3, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->currentData:Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;

    if-eqz v3, :cond_5

    .line 972
    iget-boolean v3, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->isMultipart:Z

    if-eqz v3, :cond_6

    .line 973
    invoke-direct {p0, v2}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->encodeNextChunkMultipart(I)Lorg/jboss/netty/handler/codec/http/HttpChunk;

    move-result-object v1

    .line 974
    .local v1, "chunk":Lorg/jboss/netty/handler/codec/http/HttpChunk;
    if-nez v1, :cond_0

    .line 984
    :cond_4
    iget-object v3, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->currentBuffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v3

    rsub-int v2, v3, 0x1fa0

    .line 986
    .end local v1    # "chunk":Lorg/jboss/netty/handler/codec/http/HttpChunk;
    :cond_5
    iget-object v3, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->iterator:Ljava/util/ListIterator;

    invoke-interface {v3}, Ljava/util/ListIterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_7

    .line 987
    iput-boolean v4, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->isLastChunk:Z

    .line 989
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->currentBuffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 990
    .restart local v0    # "buffer":Lorg/jboss/netty/buffer/ChannelBuffer;
    iput-object v5, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->currentBuffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 991
    new-instance v1, Lorg/jboss/netty/handler/codec/http/DefaultHttpChunk;

    invoke-direct {v1, v0}, Lorg/jboss/netty/handler/codec/http/DefaultHttpChunk;-><init>(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    goto :goto_0

    .line 978
    .end local v0    # "buffer":Lorg/jboss/netty/buffer/ChannelBuffer;
    :cond_6
    invoke-direct {p0, v2}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->encodeNextChunkUrlEncoded(I)Lorg/jboss/netty/handler/codec/http/HttpChunk;

    move-result-object v1

    .line 979
    .restart local v1    # "chunk":Lorg/jboss/netty/handler/codec/http/HttpChunk;
    if-eqz v1, :cond_4

    goto :goto_0

    .line 993
    .end local v1    # "chunk":Lorg/jboss/netty/handler/codec/http/HttpChunk;
    :cond_7
    :goto_1
    if-lez v2, :cond_9

    iget-object v3, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->iterator:Ljava/util/ListIterator;

    invoke-interface {v3}, Ljava/util/ListIterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_9

    .line 994
    iget-object v3, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->iterator:Ljava/util/ListIterator;

    invoke-interface {v3}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;

    iput-object v3, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->currentData:Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;

    .line 996
    iget-boolean v3, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->isMultipart:Z

    if-eqz v3, :cond_8

    .line 997
    invoke-direct {p0, v2}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->encodeNextChunkMultipart(I)Lorg/jboss/netty/handler/codec/http/HttpChunk;

    move-result-object v1

    .line 1001
    .restart local v1    # "chunk":Lorg/jboss/netty/handler/codec/http/HttpChunk;
    :goto_2
    if-nez v1, :cond_0

    .line 1003
    iget-object v3, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->currentBuffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v3

    rsub-int v2, v3, 0x1fa0

    .line 1004
    goto :goto_1

    .line 999
    .end local v1    # "chunk":Lorg/jboss/netty/handler/codec/http/HttpChunk;
    :cond_8
    invoke-direct {p0, v2}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->encodeNextChunkUrlEncoded(I)Lorg/jboss/netty/handler/codec/http/HttpChunk;

    move-result-object v1

    .restart local v1    # "chunk":Lorg/jboss/netty/handler/codec/http/HttpChunk;
    goto :goto_2

    .line 1010
    .end local v1    # "chunk":Lorg/jboss/netty/handler/codec/http/HttpChunk;
    :cond_9
    iput-boolean v4, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->isLastChunk:Z

    .line 1011
    iget-object v3, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->currentBuffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    if-nez v3, :cond_a

    .line 1012
    iput-boolean v4, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->isLastChunkSent:Z

    .line 1014
    new-instance v1, Lorg/jboss/netty/handler/codec/http/DefaultHttpChunk;

    sget-object v3, Lorg/jboss/netty/buffer/ChannelBuffers;->EMPTY_BUFFER:Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-direct {v1, v3}, Lorg/jboss/netty/handler/codec/http/DefaultHttpChunk;-><init>(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    goto/16 :goto_0

    .line 1017
    :cond_a
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->currentBuffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 1018
    .restart local v0    # "buffer":Lorg/jboss/netty/buffer/ChannelBuffer;
    iput-object v5, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->currentBuffer:Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 1019
    new-instance v1, Lorg/jboss/netty/handler/codec/http/DefaultHttpChunk;

    invoke-direct {v1, v0}, Lorg/jboss/netty/handler/codec/http/DefaultHttpChunk;-><init>(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    goto/16 :goto_0
.end method

.method public setBodyHttpDatas(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder$ErrorDataEncoderException;
        }
    .end annotation

    .prologue
    .line 288
    .local p1, "datas":Ljava/util/List;, "Ljava/util/List<Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;>;"
    if-nez p1, :cond_0

    .line 289
    new-instance v2, Ljava/lang/NullPointerException;

    const-string v3, "datas"

    invoke-direct {v2, v3}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 291
    :cond_0
    const-wide/16 v2, 0x0

    iput-wide v2, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->globalBodySize:J

    .line 292
    iget-object v2, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->bodyListDatas:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 293
    const/4 v2, 0x0

    iput-object v2, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->currentFileUpload:Lorg/jboss/netty/handler/codec/http/multipart/FileUpload;

    .line 294
    const/4 v2, 0x0

    iput-boolean v2, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->duringMixedMode:Z

    .line 295
    iget-object v2, p0, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->multipartHttpDatas:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 296
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;

    .line 297
    .local v0, "data":Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;
    invoke-virtual {p0, v0}, Lorg/jboss/netty/handler/codec/http/multipart/HttpPostRequestEncoder;->addBodyHttpData(Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;)V

    goto :goto_0

    .line 299
    .end local v0    # "data":Lorg/jboss/netty/handler/codec/http/multipart/InterfaceHttpData;
    :cond_1
    return-void
.end method
