.class public Lorg/jboss/netty/handler/codec/http/QueryStringDecoder;
.super Ljava/lang/Object;
.source "QueryStringDecoder.java"


# static fields
.field private static final DEFAULT_MAX_PARAMS:I = 0x400


# instance fields
.field private final charset:Ljava/nio/charset/Charset;

.field private final hasPath:Z

.field private final maxParams:I

.field private nParams:I

.field private params:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field private path:Ljava/lang/String;

.field private final uri:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "uri"    # Ljava/lang/String;

    .prologue
    .line 77
    sget-object v0, Lorg/jboss/netty/handler/codec/http/HttpConstants;->DEFAULT_CHARSET:Ljava/nio/charset/Charset;

    invoke-direct {p0, p1, v0}, Lorg/jboss/netty/handler/codec/http/QueryStringDecoder;-><init>(Ljava/lang/String;Ljava/nio/charset/Charset;)V

    .line 78
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/nio/charset/Charset;)V
    .locals 1
    .param p1, "uri"    # Ljava/lang/String;
    .param p2, "charset"    # Ljava/nio/charset/Charset;

    .prologue
    .line 93
    const/4 v0, 0x1

    invoke-direct {p0, p1, p2, v0}, Lorg/jboss/netty/handler/codec/http/QueryStringDecoder;-><init>(Ljava/lang/String;Ljava/nio/charset/Charset;Z)V

    .line 94
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/nio/charset/Charset;Z)V
    .locals 1
    .param p1, "uri"    # Ljava/lang/String;
    .param p2, "charset"    # Ljava/nio/charset/Charset;
    .param p3, "hasPath"    # Z

    .prologue
    .line 101
    const/16 v0, 0x400

    invoke-direct {p0, p1, p2, p3, v0}, Lorg/jboss/netty/handler/codec/http/QueryStringDecoder;-><init>(Ljava/lang/String;Ljava/nio/charset/Charset;ZI)V

    .line 102
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/nio/charset/Charset;ZI)V
    .locals 3
    .param p1, "uri"    # Ljava/lang/String;
    .param p2, "charset"    # Ljava/nio/charset/Charset;
    .param p3, "hasPath"    # Z
    .param p4, "maxParams"    # I

    .prologue
    .line 108
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 109
    if-nez p1, :cond_0

    .line 110
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "uri"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 112
    :cond_0
    if-nez p2, :cond_1

    .line 113
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "charset"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 115
    :cond_1
    if-gtz p4, :cond_2

    .line 116
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "maxParams: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " (expected: a positive integer)"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 120
    :cond_2
    iput-object p1, p0, Lorg/jboss/netty/handler/codec/http/QueryStringDecoder;->uri:Ljava/lang/String;

    .line 121
    iput-object p2, p0, Lorg/jboss/netty/handler/codec/http/QueryStringDecoder;->charset:Ljava/nio/charset/Charset;

    .line 122
    iput p4, p0, Lorg/jboss/netty/handler/codec/http/QueryStringDecoder;->maxParams:I

    .line 123
    iput-boolean p3, p0, Lorg/jboss/netty/handler/codec/http/QueryStringDecoder;->hasPath:Z

    .line 124
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Z)V
    .locals 1
    .param p1, "uri"    # Ljava/lang/String;
    .param p2, "hasPath"    # Z

    .prologue
    .line 85
    sget-object v0, Lorg/jboss/netty/handler/codec/http/HttpConstants;->DEFAULT_CHARSET:Ljava/nio/charset/Charset;

    invoke-direct {p0, p1, v0, p2}, Lorg/jboss/netty/handler/codec/http/QueryStringDecoder;-><init>(Ljava/lang/String;Ljava/nio/charset/Charset;Z)V

    .line 86
    return-void
.end method

.method public constructor <init>(Ljava/net/URI;)V
    .locals 1
    .param p1, "uri"    # Ljava/net/URI;

    .prologue
    .line 131
    sget-object v0, Lorg/jboss/netty/handler/codec/http/HttpConstants;->DEFAULT_CHARSET:Ljava/nio/charset/Charset;

    invoke-direct {p0, p1, v0}, Lorg/jboss/netty/handler/codec/http/QueryStringDecoder;-><init>(Ljava/net/URI;Ljava/nio/charset/Charset;)V

    .line 132
    return-void
.end method

.method public constructor <init>(Ljava/net/URI;Ljava/nio/charset/Charset;)V
    .locals 1
    .param p1, "uri"    # Ljava/net/URI;
    .param p2, "charset"    # Ljava/nio/charset/Charset;

    .prologue
    .line 139
    const/16 v0, 0x400

    invoke-direct {p0, p1, p2, v0}, Lorg/jboss/netty/handler/codec/http/QueryStringDecoder;-><init>(Ljava/net/URI;Ljava/nio/charset/Charset;I)V

    .line 140
    return-void
.end method

.method public constructor <init>(Ljava/net/URI;Ljava/nio/charset/Charset;I)V
    .locals 4
    .param p1, "uri"    # Ljava/net/URI;
    .param p2, "charset"    # Ljava/nio/charset/Charset;
    .param p3, "maxParams"    # I

    .prologue
    .line 146
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 147
    if-nez p1, :cond_0

    .line 148
    new-instance v1, Ljava/lang/NullPointerException;

    const-string v2, "uri"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 150
    :cond_0
    if-nez p2, :cond_1

    .line 151
    new-instance v1, Ljava/lang/NullPointerException;

    const-string v2, "charset"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 153
    :cond_1
    if-gtz p3, :cond_2

    .line 154
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "maxParams: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " (expected: a positive integer)"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 158
    :cond_2
    invoke-virtual {p1}, Ljava/net/URI;->getRawPath()Ljava/lang/String;

    move-result-object v0

    .line 159
    .local v0, "rawPath":Ljava/lang/String;
    if-eqz v0, :cond_3

    .line 160
    const/4 v1, 0x1

    iput-boolean v1, p0, Lorg/jboss/netty/handler/codec/http/QueryStringDecoder;->hasPath:Z

    .line 166
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v2, 0x3f

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/net/URI;->getRawQuery()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/jboss/netty/handler/codec/http/QueryStringDecoder;->uri:Ljava/lang/String;

    .line 167
    iput-object p2, p0, Lorg/jboss/netty/handler/codec/http/QueryStringDecoder;->charset:Ljava/nio/charset/Charset;

    .line 168
    iput p3, p0, Lorg/jboss/netty/handler/codec/http/QueryStringDecoder;->maxParams:I

    .line 169
    return-void

    .line 162
    :cond_3
    const-string v0, ""

    .line 163
    const/4 v1, 0x0

    iput-boolean v1, p0, Lorg/jboss/netty/handler/codec/http/QueryStringDecoder;->hasPath:Z

    goto :goto_0
.end method

.method private addParam(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 4
    .param p2, "name"    # Ljava/lang/String;
    .param p3, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;>;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")Z"
        }
    .end annotation

    .prologue
    .local p1, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    const/4 v1, 0x1

    .line 256
    iget v2, p0, Lorg/jboss/netty/handler/codec/http/QueryStringDecoder;->nParams:I

    iget v3, p0, Lorg/jboss/netty/handler/codec/http/QueryStringDecoder;->maxParams:I

    if-lt v2, v3, :cond_0

    .line 257
    const/4 v1, 0x0

    .line 267
    :goto_0
    return v1

    .line 260
    :cond_0
    invoke-interface {p1, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    .line 261
    .local v0, "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-nez v0, :cond_1

    .line 262
    new-instance v0, Ljava/util/ArrayList;

    .end local v0    # "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 263
    .restart local v0    # "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {p1, p2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 265
    :cond_1
    invoke-interface {v0, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 266
    iget v2, p0, Lorg/jboss/netty/handler/codec/http/QueryStringDecoder;->nParams:I

    add-int/lit8 v2, v2, 0x1

    iput v2, p0, Lorg/jboss/netty/handler/codec/http/QueryStringDecoder;->nParams:I

    goto :goto_0
.end method

.method public static decodeComponent(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p0, "s"    # Ljava/lang/String;

    .prologue
    .line 282
    sget-object v0, Lorg/jboss/netty/handler/codec/http/HttpConstants;->DEFAULT_CHARSET:Ljava/nio/charset/Charset;

    invoke-static {p0, v0}, Lorg/jboss/netty/handler/codec/http/QueryStringDecoder;->decodeComponent(Ljava/lang/String;Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static decodeComponent(Ljava/lang/String;Ljava/nio/charset/Charset;)Ljava/lang/String;
    .locals 12
    .param p0, "s"    # Ljava/lang/String;
    .param p1, "charset"    # Ljava/nio/charset/Charset;

    .prologue
    const v11, 0xffff

    const/16 v10, 0x25

    .line 310
    if-nez p0, :cond_1

    .line 311
    const-string p0, ""

    .line 368
    .end local p0    # "s":Ljava/lang/String;
    :cond_0
    :goto_0
    return-object p0

    .line 313
    .restart local p0    # "s":Ljava/lang/String;
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v8

    .line 314
    .local v8, "size":I
    const/4 v5, 0x0

    .line 315
    .local v5, "modified":Z
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_1
    if-ge v4, v8, :cond_2

    .line 316
    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 317
    .local v1, "c":C
    sparse-switch v1, :sswitch_data_0

    .line 315
    :goto_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 319
    :sswitch_0
    add-int/lit8 v4, v4, 0x1

    .line 322
    :sswitch_1
    const/4 v5, 0x1

    goto :goto_2

    .line 326
    .end local v1    # "c":C
    :cond_2
    if-eqz v5, :cond_0

    .line 329
    new-array v0, v8, [B

    .line 330
    .local v0, "buf":[B
    const/4 v6, 0x0

    .line 331
    .local v6, "pos":I
    const/4 v4, 0x0

    move v7, v6

    .end local v6    # "pos":I
    .local v7, "pos":I
    :goto_3
    if-ge v4, v8, :cond_8

    .line 332
    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 333
    .restart local v1    # "c":C
    sparse-switch v1, :sswitch_data_1

    .line 363
    :goto_4
    add-int/lit8 v6, v7, 0x1

    .end local v7    # "pos":I
    .restart local v6    # "pos":I
    int-to-byte v9, v1

    aput-byte v9, v0, v7

    .line 331
    :goto_5
    add-int/lit8 v4, v4, 0x1

    move v7, v6

    .end local v6    # "pos":I
    .restart local v7    # "pos":I
    goto :goto_3

    .line 335
    :sswitch_2
    add-int/lit8 v6, v7, 0x1

    .end local v7    # "pos":I
    .restart local v6    # "pos":I
    const/16 v9, 0x20

    aput-byte v9, v0, v7

    goto :goto_5

    .line 338
    .end local v6    # "pos":I
    .restart local v7    # "pos":I
    :sswitch_3
    add-int/lit8 v9, v8, -0x1

    if-ne v4, v9, :cond_3

    .line 339
    new-instance v9, Ljava/lang/IllegalArgumentException;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "unterminated escape sequence at end of string: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 342
    :cond_3
    add-int/lit8 v4, v4, 0x1

    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v1

    .line 343
    if-ne v1, v10, :cond_4

    .line 344
    add-int/lit8 v6, v7, 0x1

    .end local v7    # "pos":I
    .restart local v6    # "pos":I
    aput-byte v10, v0, v7

    goto :goto_5

    .line 348
    .end local v6    # "pos":I
    .restart local v7    # "pos":I
    :cond_4
    add-int/lit8 v9, v8, -0x1

    if-ne v4, v9, :cond_5

    .line 349
    new-instance v9, Ljava/lang/IllegalArgumentException;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "partial escape sequence at end of string: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 352
    :cond_5
    invoke-static {v1}, Lorg/jboss/netty/handler/codec/http/QueryStringDecoder;->decodeHexNibble(C)C

    move-result v1

    .line 353
    add-int/lit8 v4, v4, 0x1

    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v9

    invoke-static {v9}, Lorg/jboss/netty/handler/codec/http/QueryStringDecoder;->decodeHexNibble(C)C

    move-result v2

    .line 354
    .local v2, "c2":C
    if-eq v1, v11, :cond_6

    if-ne v2, v11, :cond_7

    .line 355
    :cond_6
    new-instance v9, Ljava/lang/IllegalArgumentException;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "invalid escape sequence `%"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    add-int/lit8 v11, v4, -0x1

    invoke-virtual {p0, v11}, Ljava/lang/String;->charAt(I)C

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "\' at index "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    add-int/lit8 v11, v4, -0x2

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, " of: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v9

    .line 360
    :cond_7
    mul-int/lit8 v9, v1, 0x10

    add-int/2addr v9, v2

    int-to-char v1, v9

    goto/16 :goto_4

    .line 368
    .end local v1    # "c":C
    .end local v2    # "c2":C
    :cond_8
    :try_start_0
    new-instance p0, Ljava/lang/String;

    .end local p0    # "s":Ljava/lang/String;
    const/4 v9, 0x0

    invoke-virtual {p1}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object v10

    invoke-direct {p0, v0, v9, v7, v10}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    goto/16 :goto_0

    .line 369
    :catch_0
    move-exception v3

    .line 370
    .local v3, "e":Ljava/io/UnsupportedEncodingException;
    new-instance v9, Ljava/lang/IllegalArgumentException;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "unsupported encoding: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {p1}, Ljava/nio/charset/Charset;->name()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-direct {v9, v10, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v9

    .line 317
    :sswitch_data_0
    .sparse-switch
        0x25 -> :sswitch_0
        0x2b -> :sswitch_1
    .end sparse-switch

    .line 333
    :sswitch_data_1
    .sparse-switch
        0x25 -> :sswitch_3
        0x2b -> :sswitch_2
    .end sparse-switch
.end method

.method private static decodeHexNibble(C)C
    .locals 1
    .param p0, "c"    # C

    .prologue
    .line 382
    const/16 v0, 0x30

    if-gt v0, p0, :cond_0

    const/16 v0, 0x39

    if-gt p0, v0, :cond_0

    .line 383
    add-int/lit8 v0, p0, -0x30

    int-to-char v0, v0

    .line 389
    :goto_0
    return v0

    .line 384
    :cond_0
    const/16 v0, 0x61

    if-gt v0, p0, :cond_1

    const/16 v0, 0x66

    if-gt p0, v0, :cond_1

    .line 385
    add-int/lit8 v0, p0, -0x61

    add-int/lit8 v0, v0, 0xa

    int-to-char v0, v0

    goto :goto_0

    .line 386
    :cond_1
    const/16 v0, 0x41

    if-gt v0, p0, :cond_2

    const/16 v0, 0x46

    if-gt p0, v0, :cond_2

    .line 387
    add-int/lit8 v0, p0, -0x41

    add-int/lit8 v0, v0, 0xa

    int-to-char v0, v0

    goto :goto_0

    .line 389
    :cond_2
    const v0, 0xffff

    goto :goto_0
.end method

.method private decodeParams(Ljava/lang/String;)V
    .locals 7
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 212
    new-instance v3, Ljava/util/LinkedHashMap;

    invoke-direct {v3}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v3, p0, Lorg/jboss/netty/handler/codec/http/QueryStringDecoder;->params:Ljava/util/Map;

    .line 213
    .local v3, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    const/4 v5, 0x0

    iput v5, p0, Lorg/jboss/netty/handler/codec/http/QueryStringDecoder;->nParams:I

    .line 214
    const/4 v2, 0x0

    .line 215
    .local v2, "name":Ljava/lang/String;
    const/4 v4, 0x0

    .line 218
    .local v4, "pos":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    if-ge v1, v5, :cond_7

    .line 219
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 220
    .local v0, "c":C
    const/16 v5, 0x3d

    if-ne v0, v5, :cond_2

    if-nez v2, :cond_2

    .line 221
    if-eq v4, v1, :cond_0

    .line 222
    invoke-virtual {p1, v4, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    iget-object v6, p0, Lorg/jboss/netty/handler/codec/http/QueryStringDecoder;->charset:Ljava/nio/charset/Charset;

    invoke-static {v5, v6}, Lorg/jboss/netty/handler/codec/http/QueryStringDecoder;->decodeComponent(Ljava/lang/String;Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v2

    .line 224
    :cond_0
    add-int/lit8 v4, v1, 0x1

    .line 218
    :cond_1
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 226
    :cond_2
    const/16 v5, 0x26

    if-eq v0, v5, :cond_3

    const/16 v5, 0x3b

    if-ne v0, v5, :cond_1

    .line 227
    :cond_3
    if-nez v2, :cond_5

    if-eq v4, v1, :cond_5

    .line 231
    invoke-virtual {p1, v4, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    iget-object v6, p0, Lorg/jboss/netty/handler/codec/http/QueryStringDecoder;->charset:Ljava/nio/charset/Charset;

    invoke-static {v5, v6}, Lorg/jboss/netty/handler/codec/http/QueryStringDecoder;->decodeComponent(Ljava/lang/String;Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v5

    const-string v6, ""

    invoke-direct {p0, v3, v5, v6}, Lorg/jboss/netty/handler/codec/http/QueryStringDecoder;->addParam(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_6

    .line 253
    .end local v0    # "c":C
    :cond_4
    :goto_2
    return-void

    .line 234
    .restart local v0    # "c":C
    :cond_5
    if-eqz v2, :cond_6

    .line 235
    invoke-virtual {p1, v4, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    iget-object v6, p0, Lorg/jboss/netty/handler/codec/http/QueryStringDecoder;->charset:Ljava/nio/charset/Charset;

    invoke-static {v5, v6}, Lorg/jboss/netty/handler/codec/http/QueryStringDecoder;->decodeComponent(Ljava/lang/String;Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v3, v2, v5}, Lorg/jboss/netty/handler/codec/http/QueryStringDecoder;->addParam(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 238
    const/4 v2, 0x0

    .line 240
    :cond_6
    add-int/lit8 v4, v1, 0x1

    goto :goto_1

    .line 244
    .end local v0    # "c":C
    :cond_7
    if-eq v4, v1, :cond_9

    .line 245
    if-nez v2, :cond_8

    .line 246
    invoke-virtual {p1, v4, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    iget-object v6, p0, Lorg/jboss/netty/handler/codec/http/QueryStringDecoder;->charset:Ljava/nio/charset/Charset;

    invoke-static {v5, v6}, Lorg/jboss/netty/handler/codec/http/QueryStringDecoder;->decodeComponent(Ljava/lang/String;Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v5

    const-string v6, ""

    invoke-direct {p0, v3, v5, v6}, Lorg/jboss/netty/handler/codec/http/QueryStringDecoder;->addParam(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)Z

    goto :goto_2

    .line 248
    :cond_8
    invoke-virtual {p1, v4, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    iget-object v6, p0, Lorg/jboss/netty/handler/codec/http/QueryStringDecoder;->charset:Ljava/nio/charset/Charset;

    invoke-static {v5, v6}, Lorg/jboss/netty/handler/codec/http/QueryStringDecoder;->decodeComponent(Ljava/lang/String;Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v3, v2, v5}, Lorg/jboss/netty/handler/codec/http/QueryStringDecoder;->addParam(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)Z

    goto :goto_2

    .line 250
    :cond_9
    if-eqz v2, :cond_4

    .line 251
    const-string v5, ""

    invoke-direct {p0, v3, v2, v5}, Lorg/jboss/netty/handler/codec/http/QueryStringDecoder;->addParam(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)Z

    goto :goto_2
.end method


# virtual methods
.method public getParameters()Ljava/util/Map;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 194
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/QueryStringDecoder;->params:Ljava/util/Map;

    if-nez v1, :cond_1

    .line 195
    iget-boolean v1, p0, Lorg/jboss/netty/handler/codec/http/QueryStringDecoder;->hasPath:Z

    if-eqz v1, :cond_2

    .line 196
    invoke-virtual {p0}, Lorg/jboss/netty/handler/codec/http/QueryStringDecoder;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v0

    .line 197
    .local v0, "pathLength":I
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/QueryStringDecoder;->uri:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-ne v1, v0, :cond_0

    .line 198
    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v1

    .line 208
    .end local v0    # "pathLength":I
    :goto_0
    return-object v1

    .line 200
    .restart local v0    # "pathLength":I
    :cond_0
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/QueryStringDecoder;->uri:Ljava/lang/String;

    add-int/lit8 v2, v0, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lorg/jboss/netty/handler/codec/http/QueryStringDecoder;->decodeParams(Ljava/lang/String;)V

    .line 208
    .end local v0    # "pathLength":I
    :cond_1
    :goto_1
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/QueryStringDecoder;->params:Ljava/util/Map;

    goto :goto_0

    .line 202
    :cond_2
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/QueryStringDecoder;->uri:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_3

    .line 203
    invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;

    move-result-object v1

    goto :goto_0

    .line 205
    :cond_3
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/QueryStringDecoder;->uri:Ljava/lang/String;

    invoke-direct {p0, v1}, Lorg/jboss/netty/handler/codec/http/QueryStringDecoder;->decodeParams(Ljava/lang/String;)V

    goto :goto_1
.end method

.method public getPath()Ljava/lang/String;
    .locals 3

    .prologue
    .line 175
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/QueryStringDecoder;->path:Ljava/lang/String;

    if-nez v1, :cond_1

    .line 176
    iget-boolean v1, p0, Lorg/jboss/netty/handler/codec/http/QueryStringDecoder;->hasPath:Z

    if-nez v1, :cond_0

    .line 177
    const-string v1, ""

    iput-object v1, p0, Lorg/jboss/netty/handler/codec/http/QueryStringDecoder;->path:Ljava/lang/String;

    .line 187
    :goto_0
    return-object v1

    .line 180
    :cond_0
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/QueryStringDecoder;->uri:Ljava/lang/String;

    const/16 v2, 0x3f

    invoke-virtual {v1, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 181
    .local v0, "pathEndPos":I
    if-gez v0, :cond_2

    .line 182
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/QueryStringDecoder;->uri:Ljava/lang/String;

    iput-object v1, p0, Lorg/jboss/netty/handler/codec/http/QueryStringDecoder;->path:Ljava/lang/String;

    .line 187
    .end local v0    # "pathEndPos":I
    :cond_1
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/QueryStringDecoder;->path:Ljava/lang/String;

    goto :goto_0

    .line 184
    .restart local v0    # "pathEndPos":I
    :cond_2
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/http/QueryStringDecoder;->uri:Ljava/lang/String;

    const/4 v2, 0x0

    invoke-virtual {v1, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lorg/jboss/netty/handler/codec/http/QueryStringDecoder;->path:Ljava/lang/String;

    goto :goto_0
.end method
