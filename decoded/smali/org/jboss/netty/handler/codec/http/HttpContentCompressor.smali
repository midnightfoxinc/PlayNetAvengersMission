.class public Lorg/jboss/netty/handler/codec/http/HttpContentCompressor;
.super Lorg/jboss/netty/handler/codec/http/HttpContentEncoder;
.source "HttpContentCompressor.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jboss/netty/handler/codec/http/HttpContentCompressor$1;
    }
.end annotation


# static fields
.field private static final DEFAULT_JDK_MEM_LEVEL:I = 0x8

.field private static final DEFAULT_JDK_WINDOW_SIZE:I = 0xf

.field private static final logger:Lorg/jboss/netty/logging/InternalLogger;

.field private static final noJdkZlibEncoder:Z


# instance fields
.field private final compressionLevel:I

.field private final memLevel:I

.field private final windowBits:I


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 38
    const-class v0, Lorg/jboss/netty/handler/codec/http/HttpContentCompressor;

    invoke-static {v0}, Lorg/jboss/netty/logging/InternalLoggerFactory;->getInstance(Ljava/lang/Class;)Lorg/jboss/netty/logging/InternalLogger;

    move-result-object v0

    sput-object v0, Lorg/jboss/netty/handler/codec/http/HttpContentCompressor;->logger:Lorg/jboss/netty/logging/InternalLogger;

    .line 46
    const-string v0, "io.netty.noJdkZlibEncoder"

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lorg/jboss/netty/util/internal/SystemPropertyUtil;->getBoolean(Ljava/lang/String;Z)Z

    move-result v0

    sput-boolean v0, Lorg/jboss/netty/handler/codec/http/HttpContentCompressor;->noJdkZlibEncoder:Z

    .line 47
    sget-object v0, Lorg/jboss/netty/handler/codec/http/HttpContentCompressor;->logger:Lorg/jboss/netty/logging/InternalLogger;

    invoke-interface {v0}, Lorg/jboss/netty/logging/InternalLogger;->isDebugEnabled()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 48
    sget-object v0, Lorg/jboss/netty/handler/codec/http/HttpContentCompressor;->logger:Lorg/jboss/netty/logging/InternalLogger;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "-Dio.netty.noJdkZlibEncoder: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-boolean v2, Lorg/jboss/netty/handler/codec/http/HttpContentCompressor;->noJdkZlibEncoder:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lorg/jboss/netty/logging/InternalLogger;->debug(Ljava/lang/String;)V

    .line 50
    :cond_0
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 61
    const/4 v0, 0x6

    invoke-direct {p0, v0}, Lorg/jboss/netty/handler/codec/http/HttpContentCompressor;-><init>(I)V

    .line 62
    return-void
.end method

.method public constructor <init>(I)V
    .locals 2
    .param p1, "compressionLevel"    # I

    .prologue
    .line 74
    const/16 v0, 0xf

    const/16 v1, 0x8

    invoke-direct {p0, p1, v0, v1}, Lorg/jboss/netty/handler/codec/http/HttpContentCompressor;-><init>(III)V

    .line 75
    return-void
.end method

.method public constructor <init>(III)V
    .locals 3
    .param p1, "compressionLevel"    # I
    .param p2, "windowBits"    # I
    .param p3, "memLevel"    # I

    .prologue
    const/16 v1, 0x9

    .line 95
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/http/HttpContentEncoder;-><init>()V

    .line 96
    if-ltz p1, :cond_0

    if-le p1, v1, :cond_1

    .line 97
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "compressionLevel: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " (expected: 0-9)"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 100
    :cond_1
    if-lt p2, v1, :cond_2

    const/16 v0, 0xf

    if-le p2, v0, :cond_3

    .line 101
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "windowBits: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " (expected: 9-15)"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 104
    :cond_3
    const/4 v0, 0x1

    if-lt p3, v0, :cond_4

    if-le p3, v1, :cond_5

    .line 105
    :cond_4
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "memLevel: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " (expected: 1-9)"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 108
    :cond_5
    iput p1, p0, Lorg/jboss/netty/handler/codec/http/HttpContentCompressor;->compressionLevel:I

    .line 109
    iput p2, p0, Lorg/jboss/netty/handler/codec/http/HttpContentCompressor;->windowBits:I

    .line 110
    iput p3, p0, Lorg/jboss/netty/handler/codec/http/HttpContentCompressor;->memLevel:I

    .line 111
    return-void
.end method

.method private static determineWrapper(Ljava/lang/String;)Lorg/jboss/netty/handler/codec/compression/ZlibWrapper;
    .locals 13
    .param p0, "acceptEncoding"    # Ljava/lang/String;

    .prologue
    const/high16 v12, -0x40800000    # -1.0f

    const/4 v11, 0x0

    .line 156
    const/high16 v9, -0x40800000    # -1.0f

    .line 157
    .local v9, "starQ":F
    const/high16 v5, -0x40800000    # -1.0f

    .line 158
    .local v5, "gzipQ":F
    const/high16 v1, -0x40800000    # -1.0f

    .line 159
    .local v1, "deflateQ":F
    const/16 v10, 0x2c

    invoke-static {p0, v10}, Lorg/jboss/netty/util/internal/StringUtil;->split(Ljava/lang/String;C)[Ljava/lang/String;

    move-result-object v0

    .local v0, "arr$":[Ljava/lang/String;
    array-length v7, v0

    .local v7, "len$":I
    const/4 v6, 0x0

    .local v6, "i$":I
    :goto_0
    if-ge v6, v7, :cond_4

    aget-object v3, v0, v6

    .line 160
    .local v3, "encoding":Ljava/lang/String;
    const/high16 v8, 0x3f800000    # 1.0f

    .line 161
    .local v8, "q":F
    const/16 v10, 0x3d

    invoke-virtual {v3, v10}, Ljava/lang/String;->indexOf(I)I

    move-result v4

    .line 162
    .local v4, "equalsPos":I
    const/4 v10, -0x1

    if-eq v4, v10, :cond_0

    .line 164
    add-int/lit8 v10, v4, 0x1

    :try_start_0
    invoke-virtual {v3, v10}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Ljava/lang/Float;->valueOf(Ljava/lang/String;)Ljava/lang/Float;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Float;->floatValue()F
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v8

    .line 170
    :cond_0
    :goto_1
    const/16 v10, 0x2a

    invoke-virtual {v3, v10}, Ljava/lang/String;->indexOf(I)I

    move-result v10

    if-ltz v10, :cond_2

    .line 171
    move v9, v8

    .line 159
    :cond_1
    :goto_2
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 165
    :catch_0
    move-exception v2

    .line 167
    .local v2, "e":Ljava/lang/NumberFormatException;
    const/4 v8, 0x0

    goto :goto_1

    .line 172
    .end local v2    # "e":Ljava/lang/NumberFormatException;
    :cond_2
    const-string v10, "gzip"

    invoke-virtual {v3, v10}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v10

    if-eqz v10, :cond_3

    cmpl-float v10, v8, v5

    if-lez v10, :cond_3

    .line 173
    move v5, v8

    goto :goto_2

    .line 174
    :cond_3
    const-string v10, "deflate"

    invoke-virtual {v3, v10}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v10

    if-eqz v10, :cond_1

    cmpl-float v10, v8, v1

    if-lez v10, :cond_1

    .line 175
    move v1, v8

    goto :goto_2

    .line 178
    .end local v3    # "encoding":Ljava/lang/String;
    .end local v4    # "equalsPos":I
    .end local v8    # "q":F
    :cond_4
    cmpl-float v10, v5, v11

    if-gtz v10, :cond_5

    cmpl-float v10, v1, v11

    if-lez v10, :cond_7

    .line 179
    :cond_5
    cmpl-float v10, v5, v1

    if-ltz v10, :cond_6

    .line 180
    sget-object v10, Lorg/jboss/netty/handler/codec/compression/ZlibWrapper;->GZIP:Lorg/jboss/netty/handler/codec/compression/ZlibWrapper;

    .line 193
    :goto_3
    return-object v10

    .line 182
    :cond_6
    sget-object v10, Lorg/jboss/netty/handler/codec/compression/ZlibWrapper;->ZLIB:Lorg/jboss/netty/handler/codec/compression/ZlibWrapper;

    goto :goto_3

    .line 185
    :cond_7
    cmpl-float v10, v9, v11

    if-lez v10, :cond_9

    .line 186
    cmpl-float v10, v5, v12

    if-nez v10, :cond_8

    .line 187
    sget-object v10, Lorg/jboss/netty/handler/codec/compression/ZlibWrapper;->GZIP:Lorg/jboss/netty/handler/codec/compression/ZlibWrapper;

    goto :goto_3

    .line 189
    :cond_8
    cmpl-float v10, v1, v12

    if-nez v10, :cond_9

    .line 190
    sget-object v10, Lorg/jboss/netty/handler/codec/compression/ZlibWrapper;->ZLIB:Lorg/jboss/netty/handler/codec/compression/ZlibWrapper;

    goto :goto_3

    .line 193
    :cond_9
    const/4 v10, 0x0

    goto :goto_3
.end method


# virtual methods
.method protected getTargetContentEncoding(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "acceptEncoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 140
    invoke-static {p1}, Lorg/jboss/netty/handler/codec/http/HttpContentCompressor;->determineWrapper(Ljava/lang/String;)Lorg/jboss/netty/handler/codec/compression/ZlibWrapper;

    move-result-object v0

    .line 141
    .local v0, "wrapper":Lorg/jboss/netty/handler/codec/compression/ZlibWrapper;
    if-nez v0, :cond_0

    .line 142
    const/4 v1, 0x0

    .line 149
    :goto_0
    return-object v1

    .line 145
    :cond_0
    sget-object v1, Lorg/jboss/netty/handler/codec/http/HttpContentCompressor$1;->$SwitchMap$org$jboss$netty$handler$codec$compression$ZlibWrapper:[I

    invoke-virtual {v0}, Lorg/jboss/netty/handler/codec/compression/ZlibWrapper;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    .line 151
    new-instance v1, Ljava/lang/Error;

    invoke-direct {v1}, Ljava/lang/Error;-><init>()V

    throw v1

    .line 147
    :pswitch_0
    const-string v1, "gzip"

    goto :goto_0

    .line 149
    :pswitch_1
    const-string v1, "deflate"

    goto :goto_0

    .line 145
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method protected newContentEncoder(Lorg/jboss/netty/handler/codec/http/HttpMessage;Ljava/lang/String;)Lorg/jboss/netty/handler/codec/embedder/EncoderEmbedder;
    .locals 9
    .param p1, "msg"    # Lorg/jboss/netty/handler/codec/http/HttpMessage;
    .param p2, "acceptEncoding"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/jboss/netty/handler/codec/http/HttpMessage;",
            "Ljava/lang/String;",
            ")",
            "Lorg/jboss/netty/handler/codec/embedder/EncoderEmbedder",
            "<",
            "Lorg/jboss/netty/buffer/ChannelBuffer;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    const/4 v5, 0x1

    const/4 v8, 0x0

    .line 116
    invoke-interface {p1}, Lorg/jboss/netty/handler/codec/http/HttpMessage;->headers()Lorg/jboss/netty/handler/codec/http/HttpHeaders;

    move-result-object v3

    const-string v4, "Content-Encoding"

    invoke-virtual {v3, v4}, Lorg/jboss/netty/handler/codec/http/HttpHeaders;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 117
    .local v0, "contentEncoding":Ljava/lang/String;
    if-eqz v0, :cond_1

    const-string v3, "identity"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 133
    :cond_0
    :goto_0
    return-object v2

    .line 123
    :cond_1
    invoke-static {p2}, Lorg/jboss/netty/handler/codec/http/HttpContentCompressor;->determineWrapper(Ljava/lang/String;)Lorg/jboss/netty/handler/codec/compression/ZlibWrapper;

    move-result-object v1

    .line 124
    .local v1, "wrapper":Lorg/jboss/netty/handler/codec/compression/ZlibWrapper;
    if-eqz v1, :cond_0

    .line 128
    invoke-static {}, Lorg/jboss/netty/util/internal/DetectionUtil;->javaVersion()I

    move-result v2

    const/4 v3, 0x7

    if-lt v2, v3, :cond_2

    sget-boolean v2, Lorg/jboss/netty/handler/codec/http/HttpContentCompressor;->noJdkZlibEncoder:Z

    if-nez v2, :cond_2

    iget v2, p0, Lorg/jboss/netty/handler/codec/http/HttpContentCompressor;->windowBits:I

    const/16 v3, 0xf

    if-ne v2, v3, :cond_2

    iget v2, p0, Lorg/jboss/netty/handler/codec/http/HttpContentCompressor;->memLevel:I

    const/16 v3, 0x8

    if-eq v2, v3, :cond_3

    .line 130
    :cond_2
    new-instance v2, Lorg/jboss/netty/handler/codec/embedder/EncoderEmbedder;

    new-array v3, v5, [Lorg/jboss/netty/channel/ChannelDownstreamHandler;

    new-instance v4, Lorg/jboss/netty/handler/codec/compression/ZlibEncoder;

    iget v5, p0, Lorg/jboss/netty/handler/codec/http/HttpContentCompressor;->compressionLevel:I

    iget v6, p0, Lorg/jboss/netty/handler/codec/http/HttpContentCompressor;->windowBits:I

    iget v7, p0, Lorg/jboss/netty/handler/codec/http/HttpContentCompressor;->memLevel:I

    invoke-direct {v4, v1, v5, v6, v7}, Lorg/jboss/netty/handler/codec/compression/ZlibEncoder;-><init>(Lorg/jboss/netty/handler/codec/compression/ZlibWrapper;III)V

    aput-object v4, v3, v8

    invoke-direct {v2, v3}, Lorg/jboss/netty/handler/codec/embedder/EncoderEmbedder;-><init>([Lorg/jboss/netty/channel/ChannelDownstreamHandler;)V

    goto :goto_0

    .line 133
    :cond_3
    new-instance v2, Lorg/jboss/netty/handler/codec/embedder/EncoderEmbedder;

    new-array v3, v5, [Lorg/jboss/netty/channel/ChannelDownstreamHandler;

    new-instance v4, Lorg/jboss/netty/handler/codec/compression/JdkZlibEncoder;

    iget v5, p0, Lorg/jboss/netty/handler/codec/http/HttpContentCompressor;->compressionLevel:I

    invoke-direct {v4, v1, v5}, Lorg/jboss/netty/handler/codec/compression/JdkZlibEncoder;-><init>(Lorg/jboss/netty/handler/codec/compression/ZlibWrapper;I)V

    aput-object v4, v3, v8

    invoke-direct {v2, v3}, Lorg/jboss/netty/handler/codec/embedder/EncoderEmbedder;-><init>([Lorg/jboss/netty/channel/ChannelDownstreamHandler;)V

    goto :goto_0
.end method
