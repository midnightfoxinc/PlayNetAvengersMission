.class public Lorg/jboss/netty/handler/logging/LoggingHandler;
.super Ljava/lang/Object;
.source "LoggingHandler.java"

# interfaces
.implements Lorg/jboss/netty/channel/ChannelUpstreamHandler;
.implements Lorg/jboss/netty/channel/ChannelDownstreamHandler;


# annotations
.annotation runtime Lorg/jboss/netty/channel/ChannelHandler$Sharable;
.end annotation


# static fields
.field private static final BYTE2CHAR:[C

.field private static final BYTE2HEX:[Ljava/lang/String;

.field private static final BYTEPADDING:[Ljava/lang/String;

.field private static final DEFAULT_LEVEL:Lorg/jboss/netty/logging/InternalLogLevel;

.field private static final HEXPADDING:[Ljava/lang/String;

.field private static final NEWLINE:Ljava/lang/String;


# instance fields
.field private final hexDump:Z

.field private final level:Lorg/jboss/netty/logging/InternalLogLevel;

.field private final logger:Lorg/jboss/netty/logging/InternalLogger;


# direct methods
.method static constructor <clinit>()V
    .locals 10

    .prologue
    const/16 v9, 0x100

    const/16 v8, 0x20

    const/16 v7, 0x10

    const/4 v6, 0x3

    .line 41
    sget-object v4, Lorg/jboss/netty/logging/InternalLogLevel;->DEBUG:Lorg/jboss/netty/logging/InternalLogLevel;

    sput-object v4, Lorg/jboss/netty/handler/logging/LoggingHandler;->DEFAULT_LEVEL:Lorg/jboss/netty/logging/InternalLogLevel;

    .line 42
    const-string v4, "%n"

    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/Object;

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    sput-object v4, Lorg/jboss/netty/handler/logging/LoggingHandler;->NEWLINE:Ljava/lang/String;

    .line 44
    new-array v4, v9, [Ljava/lang/String;

    sput-object v4, Lorg/jboss/netty/handler/logging/LoggingHandler;->BYTE2HEX:[Ljava/lang/String;

    .line 45
    new-array v4, v7, [Ljava/lang/String;

    sput-object v4, Lorg/jboss/netty/handler/logging/LoggingHandler;->HEXPADDING:[Ljava/lang/String;

    .line 46
    new-array v4, v7, [Ljava/lang/String;

    sput-object v4, Lorg/jboss/netty/handler/logging/LoggingHandler;->BYTEPADDING:[Ljava/lang/String;

    .line 47
    new-array v4, v9, [C

    sput-object v4, Lorg/jboss/netty/handler/logging/LoggingHandler;->BYTE2CHAR:[C

    .line 53
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    const/16 v4, 0xa

    if-ge v1, v4, :cond_0

    .line 54
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v6}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 55
    .local v0, "buf":Ljava/lang/StringBuilder;
    const-string v4, " 0"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 57
    sget-object v4, Lorg/jboss/netty/handler/logging/LoggingHandler;->BYTE2HEX:[Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v1

    .line 53
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 59
    .end local v0    # "buf":Ljava/lang/StringBuilder;
    :cond_0
    :goto_1
    if-ge v1, v7, :cond_1

    .line 60
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v6}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 61
    .restart local v0    # "buf":Ljava/lang/StringBuilder;
    const-string v4, " 0"

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    add-int/lit8 v4, v1, 0x61

    add-int/lit8 v4, v4, -0xa

    int-to-char v4, v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 63
    sget-object v4, Lorg/jboss/netty/handler/logging/LoggingHandler;->BYTE2HEX:[Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v1

    .line 59
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 65
    .end local v0    # "buf":Ljava/lang/StringBuilder;
    :cond_1
    :goto_2
    sget-object v4, Lorg/jboss/netty/handler/logging/LoggingHandler;->BYTE2HEX:[Ljava/lang/String;

    array-length v4, v4

    if-ge v1, v4, :cond_2

    .line 66
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v6}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 67
    .restart local v0    # "buf":Ljava/lang/StringBuilder;
    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 68
    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    sget-object v4, Lorg/jboss/netty/handler/logging/LoggingHandler;->BYTE2HEX:[Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v1

    .line 65
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 73
    .end local v0    # "buf":Ljava/lang/StringBuilder;
    :cond_2
    const/4 v1, 0x0

    :goto_3
    sget-object v4, Lorg/jboss/netty/handler/logging/LoggingHandler;->HEXPADDING:[Ljava/lang/String;

    array-length v4, v4

    if-ge v1, v4, :cond_4

    .line 74
    sget-object v4, Lorg/jboss/netty/handler/logging/LoggingHandler;->HEXPADDING:[Ljava/lang/String;

    array-length v4, v4

    sub-int v3, v4, v1

    .line 75
    .local v3, "padding":I
    new-instance v0, Ljava/lang/StringBuilder;

    mul-int/lit8 v4, v3, 0x3

    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 76
    .restart local v0    # "buf":Ljava/lang/StringBuilder;
    const/4 v2, 0x0

    .local v2, "j":I
    :goto_4
    if-ge v2, v3, :cond_3

    .line 77
    const-string v4, "   "

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    add-int/lit8 v2, v2, 0x1

    goto :goto_4

    .line 79
    :cond_3
    sget-object v4, Lorg/jboss/netty/handler/logging/LoggingHandler;->HEXPADDING:[Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v1

    .line 73
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 83
    .end local v0    # "buf":Ljava/lang/StringBuilder;
    .end local v2    # "j":I
    .end local v3    # "padding":I
    :cond_4
    const/4 v1, 0x0

    :goto_5
    sget-object v4, Lorg/jboss/netty/handler/logging/LoggingHandler;->BYTEPADDING:[Ljava/lang/String;

    array-length v4, v4

    if-ge v1, v4, :cond_6

    .line 84
    sget-object v4, Lorg/jboss/netty/handler/logging/LoggingHandler;->BYTEPADDING:[Ljava/lang/String;

    array-length v4, v4

    sub-int v3, v4, v1

    .line 85
    .restart local v3    # "padding":I
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 86
    .restart local v0    # "buf":Ljava/lang/StringBuilder;
    const/4 v2, 0x0

    .restart local v2    # "j":I
    :goto_6
    if-ge v2, v3, :cond_5

    .line 87
    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 86
    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    .line 89
    :cond_5
    sget-object v4, Lorg/jboss/netty/handler/logging/LoggingHandler;->BYTEPADDING:[Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v1

    .line 83
    add-int/lit8 v1, v1, 0x1

    goto :goto_5

    .line 93
    .end local v0    # "buf":Ljava/lang/StringBuilder;
    .end local v2    # "j":I
    .end local v3    # "padding":I
    :cond_6
    const/4 v1, 0x0

    :goto_7
    sget-object v4, Lorg/jboss/netty/handler/logging/LoggingHandler;->BYTE2CHAR:[C

    array-length v4, v4

    if-ge v1, v4, :cond_9

    .line 94
    const/16 v4, 0x1f

    if-le v1, v4, :cond_7

    const/16 v4, 0x7f

    if-lt v1, v4, :cond_8

    .line 95
    :cond_7
    sget-object v4, Lorg/jboss/netty/handler/logging/LoggingHandler;->BYTE2CHAR:[C

    const/16 v5, 0x2e

    aput-char v5, v4, v1

    .line 93
    :goto_8
    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    .line 97
    :cond_8
    sget-object v4, Lorg/jboss/netty/handler/logging/LoggingHandler;->BYTE2CHAR:[C

    int-to-char v5, v1

    aput-char v5, v4, v1

    goto :goto_8

    .line 100
    :cond_9
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 111
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lorg/jboss/netty/handler/logging/LoggingHandler;-><init>(Z)V

    .line 112
    return-void
.end method

.method public constructor <init>(Ljava/lang/Class;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 158
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lorg/jboss/netty/handler/logging/LoggingHandler;-><init>(Ljava/lang/Class;Z)V

    .line 159
    return-void
.end method

.method public constructor <init>(Ljava/lang/Class;Lorg/jboss/netty/logging/InternalLogLevel;)V
    .locals 1
    .param p2, "level"    # Lorg/jboss/netty/logging/InternalLogLevel;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Lorg/jboss/netty/logging/InternalLogLevel;",
            ")V"
        }
    .end annotation

    .prologue
    .line 177
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    const/4 v0, 0x1

    invoke-direct {p0, p1, p2, v0}, Lorg/jboss/netty/handler/logging/LoggingHandler;-><init>(Ljava/lang/Class;Lorg/jboss/netty/logging/InternalLogLevel;Z)V

    .line 178
    return-void
.end method

.method public constructor <init>(Ljava/lang/Class;Lorg/jboss/netty/logging/InternalLogLevel;Z)V
    .locals 2
    .param p2, "level"    # Lorg/jboss/netty/logging/InternalLogLevel;
    .param p3, "hexDump"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;",
            "Lorg/jboss/netty/logging/InternalLogLevel;",
            "Z)V"
        }
    .end annotation

    .prologue
    .line 187
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 188
    if-nez p1, :cond_0

    .line 189
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "clazz"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 191
    :cond_0
    if-nez p2, :cond_1

    .line 192
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "level"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 194
    :cond_1
    invoke-static {p1}, Lorg/jboss/netty/logging/InternalLoggerFactory;->getInstance(Ljava/lang/Class;)Lorg/jboss/netty/logging/InternalLogger;

    move-result-object v0

    iput-object v0, p0, Lorg/jboss/netty/handler/logging/LoggingHandler;->logger:Lorg/jboss/netty/logging/InternalLogger;

    .line 195
    iput-object p2, p0, Lorg/jboss/netty/handler/logging/LoggingHandler;->level:Lorg/jboss/netty/logging/InternalLogLevel;

    .line 196
    iput-boolean p3, p0, Lorg/jboss/netty/handler/logging/LoggingHandler;->hexDump:Z

    .line 197
    return-void
.end method

.method public constructor <init>(Ljava/lang/Class;Z)V
    .locals 1
    .param p2, "hexDump"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;Z)V"
        }
    .end annotation

    .prologue
    .line 168
    .local p1, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    sget-object v0, Lorg/jboss/netty/handler/logging/LoggingHandler;->DEFAULT_LEVEL:Lorg/jboss/netty/logging/InternalLogLevel;

    invoke-direct {p0, p1, v0, p2}, Lorg/jboss/netty/handler/logging/LoggingHandler;-><init>(Ljava/lang/Class;Lorg/jboss/netty/logging/InternalLogLevel;Z)V

    .line 169
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 204
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lorg/jboss/netty/handler/logging/LoggingHandler;-><init>(Ljava/lang/String;Z)V

    .line 205
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lorg/jboss/netty/logging/InternalLogLevel;Z)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "level"    # Lorg/jboss/netty/logging/InternalLogLevel;
    .param p3, "hexDump"    # Z

    .prologue
    .line 224
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 225
    if-nez p1, :cond_0

    .line 226
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "name"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 228
    :cond_0
    if-nez p2, :cond_1

    .line 229
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "level"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 231
    :cond_1
    invoke-static {p1}, Lorg/jboss/netty/logging/InternalLoggerFactory;->getInstance(Ljava/lang/String;)Lorg/jboss/netty/logging/InternalLogger;

    move-result-object v0

    iput-object v0, p0, Lorg/jboss/netty/handler/logging/LoggingHandler;->logger:Lorg/jboss/netty/logging/InternalLogger;

    .line 232
    iput-object p2, p0, Lorg/jboss/netty/handler/logging/LoggingHandler;->level:Lorg/jboss/netty/logging/InternalLogLevel;

    .line 233
    iput-boolean p3, p0, Lorg/jboss/netty/handler/logging/LoggingHandler;->hexDump:Z

    .line 234
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Z)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "hexDump"    # Z

    .prologue
    .line 214
    sget-object v0, Lorg/jboss/netty/handler/logging/LoggingHandler;->DEFAULT_LEVEL:Lorg/jboss/netty/logging/InternalLogLevel;

    invoke-direct {p0, p1, v0, p2}, Lorg/jboss/netty/handler/logging/LoggingHandler;-><init>(Ljava/lang/String;Lorg/jboss/netty/logging/InternalLogLevel;Z)V

    .line 215
    return-void
.end method

.method public constructor <init>(Lorg/jboss/netty/logging/InternalLogLevel;)V
    .locals 1
    .param p1, "level"    # Lorg/jboss/netty/logging/InternalLogLevel;

    .prologue
    .line 121
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lorg/jboss/netty/handler/logging/LoggingHandler;-><init>(Lorg/jboss/netty/logging/InternalLogLevel;Z)V

    .line 122
    return-void
.end method

.method public constructor <init>(Lorg/jboss/netty/logging/InternalLogLevel;Z)V
    .locals 2
    .param p1, "level"    # Lorg/jboss/netty/logging/InternalLogLevel;
    .param p2, "hexDump"    # Z

    .prologue
    .line 143
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 144
    if-nez p1, :cond_0

    .line 145
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "level"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 148
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lorg/jboss/netty/logging/InternalLoggerFactory;->getInstance(Ljava/lang/Class;)Lorg/jboss/netty/logging/InternalLogger;

    move-result-object v0

    iput-object v0, p0, Lorg/jboss/netty/handler/logging/LoggingHandler;->logger:Lorg/jboss/netty/logging/InternalLogger;

    .line 149
    iput-object p1, p0, Lorg/jboss/netty/handler/logging/LoggingHandler;->level:Lorg/jboss/netty/logging/InternalLogLevel;

    .line 150
    iput-boolean p2, p0, Lorg/jboss/netty/handler/logging/LoggingHandler;->hexDump:Z

    .line 151
    return-void
.end method

.method public constructor <init>(Z)V
    .locals 1
    .param p1, "hexDump"    # Z

    .prologue
    .line 132
    sget-object v0, Lorg/jboss/netty/handler/logging/LoggingHandler;->DEFAULT_LEVEL:Lorg/jboss/netty/logging/InternalLogLevel;

    invoke-direct {p0, v0, p1}, Lorg/jboss/netty/handler/logging/LoggingHandler;-><init>(Lorg/jboss/netty/logging/InternalLogLevel;Z)V

    .line 133
    return-void
.end method

.method private static formatBuffer(Lorg/jboss/netty/buffer/ChannelBuffer;)Ljava/lang/String;
    .locals 15
    .param p0, "buf"    # Lorg/jboss/netty/buffer/ChannelBuffer;

    .prologue
    const/16 v14, 0x7c

    .line 280
    invoke-interface {p0}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v4

    .line 281
    .local v4, "length":I
    div-int/lit8 v11, v4, 0x10

    rem-int/lit8 v10, v4, 0xf

    if-nez v10, :cond_1

    const/4 v10, 0x0

    :goto_0
    add-int/2addr v10, v11

    add-int/lit8 v8, v10, 0x4

    .line 282
    .local v8, "rows":I
    new-instance v0, Ljava/lang/StringBuilder;

    mul-int/lit8 v10, v8, 0x50

    invoke-direct {v0, v10}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 284
    .local v0, "dump":Ljava/lang/StringBuilder;
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v11, Lorg/jboss/netty/handler/logging/LoggingHandler;->NEWLINE:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "         +-------------------------------------------------+"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    sget-object v11, Lorg/jboss/netty/handler/logging/LoggingHandler;->NEWLINE:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "         |  0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f |"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    sget-object v11, Lorg/jboss/netty/handler/logging/LoggingHandler;->NEWLINE:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "+--------+-------------------------------------------------+----------------+"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 289
    invoke-interface {p0}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v9

    .line 290
    .local v9, "startIndex":I
    invoke-interface {p0}, Lorg/jboss/netty/buffer/ChannelBuffer;->writerIndex()I

    move-result v1

    .line 293
    .local v1, "endIndex":I
    move v2, v9

    .local v2, "i":I
    :goto_1
    if-ge v2, v1, :cond_4

    .line 294
    sub-int v5, v2, v9

    .line 295
    .local v5, "relIdx":I
    and-int/lit8 v6, v5, 0xf

    .line 296
    .local v6, "relIdxMod16":I
    if-nez v6, :cond_0

    .line 297
    sget-object v10, Lorg/jboss/netty/handler/logging/LoggingHandler;->NEWLINE:Ljava/lang/String;

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 298
    int-to-long v10, v5

    const-wide v12, 0xffffffffL

    and-long/2addr v10, v12

    const-wide v12, 0x100000000L

    or-long/2addr v10, v12

    invoke-static {v10, v11}, Ljava/lang/Long;->toHexString(J)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 299
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v10

    add-int/lit8 v10, v10, -0x9

    invoke-virtual {v0, v10, v14}, Ljava/lang/StringBuilder;->setCharAt(IC)V

    .line 300
    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 302
    :cond_0
    sget-object v10, Lorg/jboss/netty/handler/logging/LoggingHandler;->BYTE2HEX:[Ljava/lang/String;

    invoke-interface {p0, v2}, Lorg/jboss/netty/buffer/ChannelBuffer;->getUnsignedByte(I)S

    move-result v11

    aget-object v10, v10, v11

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 303
    const/16 v10, 0xf

    if-ne v6, v10, :cond_3

    .line 304
    const-string v10, " |"

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 305
    add-int/lit8 v3, v2, -0xf

    .local v3, "j":I
    :goto_2
    if-gt v3, v2, :cond_2

    .line 306
    sget-object v10, Lorg/jboss/netty/handler/logging/LoggingHandler;->BYTE2CHAR:[C

    invoke-interface {p0, v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->getUnsignedByte(I)S

    move-result v11

    aget-char v10, v10, v11

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 305
    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 281
    .end local v0    # "dump":Ljava/lang/StringBuilder;
    .end local v1    # "endIndex":I
    .end local v2    # "i":I
    .end local v3    # "j":I
    .end local v5    # "relIdx":I
    .end local v6    # "relIdxMod16":I
    .end local v8    # "rows":I
    .end local v9    # "startIndex":I
    :cond_1
    const/4 v10, 0x1

    goto/16 :goto_0

    .line 308
    .restart local v0    # "dump":Ljava/lang/StringBuilder;
    .restart local v1    # "endIndex":I
    .restart local v2    # "i":I
    .restart local v3    # "j":I
    .restart local v5    # "relIdx":I
    .restart local v6    # "relIdxMod16":I
    .restart local v8    # "rows":I
    .restart local v9    # "startIndex":I
    :cond_2
    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 293
    .end local v3    # "j":I
    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 312
    .end local v5    # "relIdx":I
    .end local v6    # "relIdxMod16":I
    :cond_4
    sub-int v10, v2, v9

    and-int/lit8 v10, v10, 0xf

    if-eqz v10, :cond_6

    .line 313
    and-int/lit8 v7, v4, 0xf

    .line 314
    .local v7, "remainder":I
    sget-object v10, Lorg/jboss/netty/handler/logging/LoggingHandler;->HEXPADDING:[Ljava/lang/String;

    aget-object v10, v10, v7

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 315
    const-string v10, " |"

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 316
    sub-int v3, v2, v7

    .restart local v3    # "j":I
    :goto_3
    if-ge v3, v2, :cond_5

    .line 317
    sget-object v10, Lorg/jboss/netty/handler/logging/LoggingHandler;->BYTE2CHAR:[C

    invoke-interface {p0, v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->getUnsignedByte(I)S

    move-result v11

    aget-char v10, v10, v11

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 316
    add-int/lit8 v3, v3, 0x1

    goto :goto_3

    .line 319
    :cond_5
    sget-object v10, Lorg/jboss/netty/handler/logging/LoggingHandler;->BYTEPADDING:[Ljava/lang/String;

    aget-object v10, v10, v7

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 320
    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 323
    .end local v3    # "j":I
    .end local v7    # "remainder":I
    :cond_6
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v11, Lorg/jboss/netty/handler/logging/LoggingHandler;->NEWLINE:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "+--------+-------------------------------------------------+----------------+"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 326
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    return-object v10
.end method


# virtual methods
.method public getLevel()Lorg/jboss/netty/logging/InternalLogLevel;
    .locals 1

    .prologue
    .line 249
    iget-object v0, p0, Lorg/jboss/netty/handler/logging/LoggingHandler;->level:Lorg/jboss/netty/logging/InternalLogLevel;

    return-object v0
.end method

.method public getLogger()Lorg/jboss/netty/logging/InternalLogger;
    .locals 1

    .prologue
    .line 241
    iget-object v0, p0, Lorg/jboss/netty/handler/logging/LoggingHandler;->logger:Lorg/jboss/netty/logging/InternalLogger;

    return-object v0
.end method

.method public handleDownstream(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelEvent;)V
    .locals 0
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "e"    # Lorg/jboss/netty/channel/ChannelEvent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 337
    invoke-virtual {p0, p2}, Lorg/jboss/netty/handler/logging/LoggingHandler;->log(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 338
    invoke-interface {p1, p2}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendDownstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 339
    return-void
.end method

.method public handleUpstream(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelEvent;)V
    .locals 0
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "e"    # Lorg/jboss/netty/channel/ChannelEvent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 331
    invoke-virtual {p0, p2}, Lorg/jboss/netty/handler/logging/LoggingHandler;->log(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 332
    invoke-interface {p1, p2}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendUpstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 333
    return-void
.end method

.method public log(Lorg/jboss/netty/channel/ChannelEvent;)V
    .locals 5
    .param p1, "e"    # Lorg/jboss/netty/channel/ChannelEvent;

    .prologue
    .line 259
    invoke-virtual {p0}, Lorg/jboss/netty/handler/logging/LoggingHandler;->getLogger()Lorg/jboss/netty/logging/InternalLogger;

    move-result-object v2

    iget-object v3, p0, Lorg/jboss/netty/handler/logging/LoggingHandler;->level:Lorg/jboss/netty/logging/InternalLogLevel;

    invoke-interface {v2, v3}, Lorg/jboss/netty/logging/InternalLogger;->isEnabled(Lorg/jboss/netty/logging/InternalLogLevel;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 260
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    .line 263
    .local v1, "msg":Ljava/lang/String;
    iget-boolean v2, p0, Lorg/jboss/netty/handler/logging/LoggingHandler;->hexDump:Z

    if-eqz v2, :cond_0

    instance-of v2, p1, Lorg/jboss/netty/channel/MessageEvent;

    if-eqz v2, :cond_0

    move-object v0, p1

    .line 264
    check-cast v0, Lorg/jboss/netty/channel/MessageEvent;

    .line 265
    .local v0, "me":Lorg/jboss/netty/channel/MessageEvent;
    invoke-interface {v0}, Lorg/jboss/netty/channel/MessageEvent;->getMessage()Ljava/lang/Object;

    move-result-object v2

    instance-of v2, v2, Lorg/jboss/netty/buffer/ChannelBuffer;

    if-eqz v2, :cond_0

    .line 266
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-interface {v0}, Lorg/jboss/netty/channel/MessageEvent;->getMessage()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-static {v2}, Lorg/jboss/netty/handler/logging/LoggingHandler;->formatBuffer(Lorg/jboss/netty/buffer/ChannelBuffer;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 271
    .end local v0    # "me":Lorg/jboss/netty/channel/MessageEvent;
    :cond_0
    instance-of v2, p1, Lorg/jboss/netty/channel/ExceptionEvent;

    if-eqz v2, :cond_2

    .line 272
    invoke-virtual {p0}, Lorg/jboss/netty/handler/logging/LoggingHandler;->getLogger()Lorg/jboss/netty/logging/InternalLogger;

    move-result-object v2

    iget-object v3, p0, Lorg/jboss/netty/handler/logging/LoggingHandler;->level:Lorg/jboss/netty/logging/InternalLogLevel;

    check-cast p1, Lorg/jboss/netty/channel/ExceptionEvent;

    .end local p1    # "e":Lorg/jboss/netty/channel/ChannelEvent;
    invoke-interface {p1}, Lorg/jboss/netty/channel/ExceptionEvent;->getCause()Ljava/lang/Throwable;

    move-result-object v4

    invoke-interface {v2, v3, v1, v4}, Lorg/jboss/netty/logging/InternalLogger;->log(Lorg/jboss/netty/logging/InternalLogLevel;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 277
    .end local v1    # "msg":Ljava/lang/String;
    :cond_1
    :goto_0
    return-void

    .line 274
    .restart local v1    # "msg":Ljava/lang/String;
    .restart local p1    # "e":Lorg/jboss/netty/channel/ChannelEvent;
    :cond_2
    invoke-virtual {p0}, Lorg/jboss/netty/handler/logging/LoggingHandler;->getLogger()Lorg/jboss/netty/logging/InternalLogger;

    move-result-object v2

    iget-object v3, p0, Lorg/jboss/netty/handler/logging/LoggingHandler;->level:Lorg/jboss/netty/logging/InternalLogLevel;

    invoke-interface {v2, v3, v1}, Lorg/jboss/netty/logging/InternalLogger;->log(Lorg/jboss/netty/logging/InternalLogLevel;Ljava/lang/String;)V

    goto :goto_0
.end method
