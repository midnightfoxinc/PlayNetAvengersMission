.class public Lorg/jboss/netty/handler/codec/frame/DelimiterBasedFrameDecoder;
.super Lorg/jboss/netty/handler/codec/frame/FrameDecoder;
.source "DelimiterBasedFrameDecoder.java"


# instance fields
.field private final delimiters:[Lorg/jboss/netty/buffer/ChannelBuffer;

.field private discardingTooLongFrame:Z

.field private final failFast:Z

.field private final lineBasedDecoder:Lorg/jboss/netty/handler/codec/frame/LineBasedFrameDecoder;

.field private final maxFrameLength:I

.field private final stripDelimiter:Z

.field private tooLongFrameLength:I


# direct methods
.method public constructor <init>(ILorg/jboss/netty/buffer/ChannelBuffer;)V
    .locals 1
    .param p1, "maxFrameLength"    # I
    .param p2, "delimiter"    # Lorg/jboss/netty/buffer/ChannelBuffer;

    .prologue
    .line 81
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0, p2}, Lorg/jboss/netty/handler/codec/frame/DelimiterBasedFrameDecoder;-><init>(IZLorg/jboss/netty/buffer/ChannelBuffer;)V

    .line 82
    return-void
.end method

.method public constructor <init>(IZLorg/jboss/netty/buffer/ChannelBuffer;)V
    .locals 1
    .param p1, "maxFrameLength"    # I
    .param p2, "stripDelimiter"    # Z
    .param p3, "delimiter"    # Lorg/jboss/netty/buffer/ChannelBuffer;

    .prologue
    .line 96
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0, p3}, Lorg/jboss/netty/handler/codec/frame/DelimiterBasedFrameDecoder;-><init>(IZZLorg/jboss/netty/buffer/ChannelBuffer;)V

    .line 97
    return-void
.end method

.method public constructor <init>(IZZLorg/jboss/netty/buffer/ChannelBuffer;)V
    .locals 4
    .param p1, "maxFrameLength"    # I
    .param p2, "stripDelimiter"    # Z
    .param p3, "failFast"    # Z
    .param p4, "delimiter"    # Lorg/jboss/netty/buffer/ChannelBuffer;

    .prologue
    .line 119
    const/4 v0, 0x1

    new-array v0, v0, [Lorg/jboss/netty/buffer/ChannelBuffer;

    const/4 v1, 0x0

    invoke-interface {p4}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v2

    invoke-interface {p4}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v3

    invoke-interface {p4, v2, v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->slice(II)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v2

    aput-object v2, v0, v1

    invoke-direct {p0, p1, p2, p3, v0}, Lorg/jboss/netty/handler/codec/frame/DelimiterBasedFrameDecoder;-><init>(IZZ[Lorg/jboss/netty/buffer/ChannelBuffer;)V

    .line 122
    return-void
.end method

.method public varargs constructor <init>(IZZ[Lorg/jboss/netty/buffer/ChannelBuffer;)V
    .locals 6
    .param p1, "maxFrameLength"    # I
    .param p2, "stripDelimiter"    # Z
    .param p3, "failFast"    # Z
    .param p4, "delimiters"    # [Lorg/jboss/netty/buffer/ChannelBuffer;

    .prologue
    const/4 v5, 0x0

    .line 169
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/frame/FrameDecoder;-><init>()V

    .line 170
    invoke-static {p1}, Lorg/jboss/netty/handler/codec/frame/DelimiterBasedFrameDecoder;->validateMaxFrameLength(I)V

    .line 171
    if-nez p4, :cond_0

    .line 172
    new-instance v2, Ljava/lang/NullPointerException;

    const-string v3, "delimiters"

    invoke-direct {v2, v3}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 174
    :cond_0
    array-length v2, p4

    if-nez v2, :cond_1

    .line 175
    new-instance v2, Ljava/lang/IllegalArgumentException;

    const-string v3, "empty delimiters"

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 178
    :cond_1
    invoke-static {p4}, Lorg/jboss/netty/handler/codec/frame/DelimiterBasedFrameDecoder;->isLineBased([Lorg/jboss/netty/buffer/ChannelBuffer;)Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/frame/DelimiterBasedFrameDecoder;->isSubclass()Z

    move-result v2

    if-nez v2, :cond_2

    .line 179
    new-instance v2, Lorg/jboss/netty/handler/codec/frame/LineBasedFrameDecoder;

    invoke-direct {v2, p1, p2, p3}, Lorg/jboss/netty/handler/codec/frame/LineBasedFrameDecoder;-><init>(IZZ)V

    iput-object v2, p0, Lorg/jboss/netty/handler/codec/frame/DelimiterBasedFrameDecoder;->lineBasedDecoder:Lorg/jboss/netty/handler/codec/frame/LineBasedFrameDecoder;

    .line 180
    iput-object v5, p0, Lorg/jboss/netty/handler/codec/frame/DelimiterBasedFrameDecoder;->delimiters:[Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 190
    :goto_0
    iput p1, p0, Lorg/jboss/netty/handler/codec/frame/DelimiterBasedFrameDecoder;->maxFrameLength:I

    .line 191
    iput-boolean p2, p0, Lorg/jboss/netty/handler/codec/frame/DelimiterBasedFrameDecoder;->stripDelimiter:Z

    .line 192
    iput-boolean p3, p0, Lorg/jboss/netty/handler/codec/frame/DelimiterBasedFrameDecoder;->failFast:Z

    .line 193
    return-void

    .line 182
    :cond_2
    array-length v2, p4

    new-array v2, v2, [Lorg/jboss/netty/buffer/ChannelBuffer;

    iput-object v2, p0, Lorg/jboss/netty/handler/codec/frame/DelimiterBasedFrameDecoder;->delimiters:[Lorg/jboss/netty/buffer/ChannelBuffer;

    .line 183
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    array-length v2, p4

    if-ge v1, v2, :cond_3

    .line 184
    aget-object v0, p4, v1

    .line 185
    .local v0, "d":Lorg/jboss/netty/buffer/ChannelBuffer;
    invoke-static {v0}, Lorg/jboss/netty/handler/codec/frame/DelimiterBasedFrameDecoder;->validateDelimiter(Lorg/jboss/netty/buffer/ChannelBuffer;)V

    .line 186
    iget-object v2, p0, Lorg/jboss/netty/handler/codec/frame/DelimiterBasedFrameDecoder;->delimiters:[Lorg/jboss/netty/buffer/ChannelBuffer;

    invoke-interface {v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v3

    invoke-interface {v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v4

    invoke-interface {v0, v3, v4}, Lorg/jboss/netty/buffer/ChannelBuffer;->slice(II)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v3

    aput-object v3, v2, v1

    .line 183
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 188
    .end local v0    # "d":Lorg/jboss/netty/buffer/ChannelBuffer;
    :cond_3
    iput-object v5, p0, Lorg/jboss/netty/handler/codec/frame/DelimiterBasedFrameDecoder;->lineBasedDecoder:Lorg/jboss/netty/handler/codec/frame/LineBasedFrameDecoder;

    goto :goto_0
.end method

.method public varargs constructor <init>(IZ[Lorg/jboss/netty/buffer/ChannelBuffer;)V
    .locals 1
    .param p1, "maxFrameLength"    # I
    .param p2, "stripDelimiter"    # Z
    .param p3, "delimiters"    # [Lorg/jboss/netty/buffer/ChannelBuffer;

    .prologue
    .line 148
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0, p3}, Lorg/jboss/netty/handler/codec/frame/DelimiterBasedFrameDecoder;-><init>(IZZ[Lorg/jboss/netty/buffer/ChannelBuffer;)V

    .line 149
    return-void
.end method

.method public varargs constructor <init>(I[Lorg/jboss/netty/buffer/ChannelBuffer;)V
    .locals 1
    .param p1, "maxFrameLength"    # I
    .param p2, "delimiters"    # [Lorg/jboss/netty/buffer/ChannelBuffer;

    .prologue
    .line 133
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0, p2}, Lorg/jboss/netty/handler/codec/frame/DelimiterBasedFrameDecoder;-><init>(IZ[Lorg/jboss/netty/buffer/ChannelBuffer;)V

    .line 134
    return-void
.end method

.method private fail(Lorg/jboss/netty/channel/ChannelHandlerContext;J)V
    .locals 4
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "frameLength"    # J

    .prologue
    .line 289
    const-wide/16 v0, 0x0

    cmp-long v0, p2, v0

    if-lez v0, :cond_0

    .line 290
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v0

    new-instance v1, Lorg/jboss/netty/handler/codec/frame/TooLongFrameException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "frame length exceeds "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lorg/jboss/netty/handler/codec/frame/DelimiterBasedFrameDecoder;->maxFrameLength:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ": "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " - discarded"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/jboss/netty/handler/codec/frame/TooLongFrameException;-><init>(Ljava/lang/String;)V

    invoke-static {v0, v1}, Lorg/jboss/netty/channel/Channels;->fireExceptionCaught(Lorg/jboss/netty/channel/Channel;Ljava/lang/Throwable;)V

    .line 302
    :goto_0
    return-void

    .line 296
    :cond_0
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v0

    new-instance v1, Lorg/jboss/netty/handler/codec/frame/TooLongFrameException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "frame length exceeds "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lorg/jboss/netty/handler/codec/frame/DelimiterBasedFrameDecoder;->maxFrameLength:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " - discarding"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/jboss/netty/handler/codec/frame/TooLongFrameException;-><init>(Ljava/lang/String;)V

    invoke-static {v0, v1}, Lorg/jboss/netty/channel/Channels;->fireExceptionCaught(Lorg/jboss/netty/channel/Channel;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method private static indexOf(Lorg/jboss/netty/buffer/ChannelBuffer;Lorg/jboss/netty/buffer/ChannelBuffer;)I
    .locals 6
    .param p0, "haystack"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .param p1, "needle"    # Lorg/jboss/netty/buffer/ChannelBuffer;

    .prologue
    const/4 v3, -0x1

    .line 310
    invoke-interface {p0}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v1

    .local v1, "i":I
    :goto_0
    invoke-interface {p0}, Lorg/jboss/netty/buffer/ChannelBuffer;->writerIndex()I

    move-result v4

    if-ge v1, v4, :cond_1

    .line 311
    move v0, v1

    .line 313
    .local v0, "haystackIndex":I
    const/4 v2, 0x0

    .local v2, "needleIndex":I
    :goto_1
    invoke-interface {p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->capacity()I

    move-result v4

    if-ge v2, v4, :cond_0

    .line 314
    invoke-interface {p0, v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->getByte(I)B

    move-result v4

    invoke-interface {p1, v2}, Lorg/jboss/netty/buffer/ChannelBuffer;->getByte(I)B

    move-result v5

    if-eq v4, v5, :cond_2

    .line 325
    :cond_0
    invoke-interface {p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->capacity()I

    move-result v4

    if-ne v2, v4, :cond_4

    .line 327
    invoke-interface {p0}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v3

    sub-int v3, v1, v3

    .line 330
    .end local v0    # "haystackIndex":I
    .end local v2    # "needleIndex":I
    :cond_1
    return v3

    .line 317
    .restart local v0    # "haystackIndex":I
    .restart local v2    # "needleIndex":I
    :cond_2
    add-int/lit8 v0, v0, 0x1

    .line 318
    invoke-interface {p0}, Lorg/jboss/netty/buffer/ChannelBuffer;->writerIndex()I

    move-result v4

    if-ne v0, v4, :cond_3

    invoke-interface {p1}, Lorg/jboss/netty/buffer/ChannelBuffer;->capacity()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    if-ne v2, v4, :cond_1

    .line 313
    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 310
    :cond_4
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method

.method private static isLineBased([Lorg/jboss/netty/buffer/ChannelBuffer;)Z
    .locals 8
    .param p0, "delimiters"    # [Lorg/jboss/netty/buffer/ChannelBuffer;

    .prologue
    const/16 v7, 0xa

    const/4 v6, 0x2

    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 197
    array-length v4, p0

    if-eq v4, v6, :cond_0

    .line 206
    :goto_0
    return v3

    .line 200
    :cond_0
    aget-object v0, p0, v3

    .line 201
    .local v0, "a":Lorg/jboss/netty/buffer/ChannelBuffer;
    aget-object v1, p0, v2

    .line 202
    .local v1, "b":Lorg/jboss/netty/buffer/ChannelBuffer;
    invoke-interface {v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->capacity()I

    move-result v4

    invoke-interface {v1}, Lorg/jboss/netty/buffer/ChannelBuffer;->capacity()I

    move-result v5

    if-ge v4, v5, :cond_1

    .line 203
    aget-object v0, p0, v2

    .line 204
    aget-object v1, p0, v3

    .line 206
    :cond_1
    invoke-interface {v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->capacity()I

    move-result v4

    if-ne v4, v6, :cond_2

    invoke-interface {v1}, Lorg/jboss/netty/buffer/ChannelBuffer;->capacity()I

    move-result v4

    if-ne v4, v2, :cond_2

    invoke-interface {v0, v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->getByte(I)B

    move-result v4

    const/16 v5, 0xd

    if-ne v4, v5, :cond_2

    invoke-interface {v0, v2}, Lorg/jboss/netty/buffer/ChannelBuffer;->getByte(I)B

    move-result v4

    if-ne v4, v7, :cond_2

    invoke-interface {v1, v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->getByte(I)B

    move-result v4

    if-ne v4, v7, :cond_2

    :goto_1
    move v3, v2

    goto :goto_0

    :cond_2
    move v2, v3

    goto :goto_1
.end method

.method private isSubclass()Z
    .locals 2

    .prologue
    .line 215
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-class v1, Lorg/jboss/netty/handler/codec/frame/DelimiterBasedFrameDecoder;

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static validateDelimiter(Lorg/jboss/netty/buffer/ChannelBuffer;)V
    .locals 2
    .param p0, "delimiter"    # Lorg/jboss/netty/buffer/ChannelBuffer;

    .prologue
    .line 334
    if-nez p0, :cond_0

    .line 335
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "delimiter"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 337
    :cond_0
    invoke-interface {p0}, Lorg/jboss/netty/buffer/ChannelBuffer;->readable()Z

    move-result v0

    if-nez v0, :cond_1

    .line 338
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "empty delimiter"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 340
    :cond_1
    return-void
.end method

.method private static validateMaxFrameLength(I)V
    .locals 3
    .param p0, "maxFrameLength"    # I

    .prologue
    .line 343
    if-gtz p0, :cond_0

    .line 344
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "maxFrameLength must be a positive integer: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 348
    :cond_0
    return-void
.end method


# virtual methods
.method protected decode(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/buffer/ChannelBuffer;)Ljava/lang/Object;
    .locals 12
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p3, "buffer"    # Lorg/jboss/netty/buffer/ChannelBuffer;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v11, 0x0

    const/4 v2, 0x0

    .line 221
    iget-object v10, p0, Lorg/jboss/netty/handler/codec/frame/DelimiterBasedFrameDecoder;->lineBasedDecoder:Lorg/jboss/netty/handler/codec/frame/LineBasedFrameDecoder;

    if-eqz v10, :cond_1

    .line 222
    iget-object v10, p0, Lorg/jboss/netty/handler/codec/frame/DelimiterBasedFrameDecoder;->lineBasedDecoder:Lorg/jboss/netty/handler/codec/frame/LineBasedFrameDecoder;

    invoke-virtual {v10, p1, p2, p3}, Lorg/jboss/netty/handler/codec/frame/LineBasedFrameDecoder;->decode(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/buffer/ChannelBuffer;)Ljava/lang/Object;

    move-result-object v2

    .line 284
    :cond_0
    :goto_0
    return-object v2

    .line 225
    :cond_1
    const v8, 0x7fffffff

    .line 226
    .local v8, "minFrameLength":I
    const/4 v6, 0x0

    .line 227
    .local v6, "minDelim":Lorg/jboss/netty/buffer/ChannelBuffer;
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/frame/DelimiterBasedFrameDecoder;->delimiters:[Lorg/jboss/netty/buffer/ChannelBuffer;

    .local v0, "arr$":[Lorg/jboss/netty/buffer/ChannelBuffer;
    array-length v5, v0

    .local v5, "len$":I
    const/4 v4, 0x0

    .local v4, "i$":I
    :goto_1
    if-ge v4, v5, :cond_3

    aget-object v1, v0, v4

    .line 228
    .local v1, "delim":Lorg/jboss/netty/buffer/ChannelBuffer;
    invoke-static {p3, v1}, Lorg/jboss/netty/handler/codec/frame/DelimiterBasedFrameDecoder;->indexOf(Lorg/jboss/netty/buffer/ChannelBuffer;Lorg/jboss/netty/buffer/ChannelBuffer;)I

    move-result v3

    .line 229
    .local v3, "frameLength":I
    if-ltz v3, :cond_2

    if-ge v3, v8, :cond_2

    .line 230
    move v8, v3

    .line 231
    move-object v6, v1

    .line 227
    :cond_2
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 235
    .end local v1    # "delim":Lorg/jboss/netty/buffer/ChannelBuffer;
    .end local v3    # "frameLength":I
    :cond_3
    if-eqz v6, :cond_7

    .line 236
    invoke-interface {v6}, Lorg/jboss/netty/buffer/ChannelBuffer;->capacity()I

    move-result v7

    .line 239
    .local v7, "minDelimLength":I
    iget-boolean v10, p0, Lorg/jboss/netty/handler/codec/frame/DelimiterBasedFrameDecoder;->discardingTooLongFrame:Z

    if-eqz v10, :cond_4

    .line 242
    iput-boolean v11, p0, Lorg/jboss/netty/handler/codec/frame/DelimiterBasedFrameDecoder;->discardingTooLongFrame:Z

    .line 243
    add-int v10, v8, v7

    invoke-interface {p3, v10}, Lorg/jboss/netty/buffer/ChannelBuffer;->skipBytes(I)V

    .line 245
    iget v9, p0, Lorg/jboss/netty/handler/codec/frame/DelimiterBasedFrameDecoder;->tooLongFrameLength:I

    .line 246
    .local v9, "tooLongFrameLength":I
    iput v11, p0, Lorg/jboss/netty/handler/codec/frame/DelimiterBasedFrameDecoder;->tooLongFrameLength:I

    .line 247
    iget-boolean v10, p0, Lorg/jboss/netty/handler/codec/frame/DelimiterBasedFrameDecoder;->failFast:Z

    if-nez v10, :cond_0

    .line 248
    int-to-long v10, v9

    invoke-direct {p0, p1, v10, v11}, Lorg/jboss/netty/handler/codec/frame/DelimiterBasedFrameDecoder;->fail(Lorg/jboss/netty/channel/ChannelHandlerContext;J)V

    goto :goto_0

    .line 253
    .end local v9    # "tooLongFrameLength":I
    :cond_4
    iget v10, p0, Lorg/jboss/netty/handler/codec/frame/DelimiterBasedFrameDecoder;->maxFrameLength:I

    if-le v8, v10, :cond_5

    .line 255
    add-int v10, v8, v7

    invoke-interface {p3, v10}, Lorg/jboss/netty/buffer/ChannelBuffer;->skipBytes(I)V

    .line 256
    int-to-long v10, v8

    invoke-direct {p0, p1, v10, v11}, Lorg/jboss/netty/handler/codec/frame/DelimiterBasedFrameDecoder;->fail(Lorg/jboss/netty/channel/ChannelHandlerContext;J)V

    goto :goto_0

    .line 260
    :cond_5
    iget-boolean v10, p0, Lorg/jboss/netty/handler/codec/frame/DelimiterBasedFrameDecoder;->stripDelimiter:Z

    if-eqz v10, :cond_6

    .line 261
    invoke-interface {p3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v10

    invoke-virtual {p0, p3, v10, v8}, Lorg/jboss/netty/handler/codec/frame/DelimiterBasedFrameDecoder;->extractFrame(Lorg/jboss/netty/buffer/ChannelBuffer;II)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v2

    .line 265
    .local v2, "frame":Lorg/jboss/netty/buffer/ChannelBuffer;
    :goto_2
    add-int v10, v8, v7

    invoke-interface {p3, v10}, Lorg/jboss/netty/buffer/ChannelBuffer;->skipBytes(I)V

    goto :goto_0

    .line 263
    .end local v2    # "frame":Lorg/jboss/netty/buffer/ChannelBuffer;
    :cond_6
    invoke-interface {p3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readerIndex()I

    move-result v10

    add-int v11, v8, v7

    invoke-virtual {p0, p3, v10, v11}, Lorg/jboss/netty/handler/codec/frame/DelimiterBasedFrameDecoder;->extractFrame(Lorg/jboss/netty/buffer/ChannelBuffer;II)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v2

    .restart local v2    # "frame":Lorg/jboss/netty/buffer/ChannelBuffer;
    goto :goto_2

    .line 269
    .end local v2    # "frame":Lorg/jboss/netty/buffer/ChannelBuffer;
    .end local v7    # "minDelimLength":I
    :cond_7
    iget-boolean v10, p0, Lorg/jboss/netty/handler/codec/frame/DelimiterBasedFrameDecoder;->discardingTooLongFrame:Z

    if-nez v10, :cond_8

    .line 270
    invoke-interface {p3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v10

    iget v11, p0, Lorg/jboss/netty/handler/codec/frame/DelimiterBasedFrameDecoder;->maxFrameLength:I

    if-le v10, v11, :cond_0

    .line 272
    invoke-interface {p3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v10

    iput v10, p0, Lorg/jboss/netty/handler/codec/frame/DelimiterBasedFrameDecoder;->tooLongFrameLength:I

    .line 273
    invoke-interface {p3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v10

    invoke-interface {p3, v10}, Lorg/jboss/netty/buffer/ChannelBuffer;->skipBytes(I)V

    .line 274
    const/4 v10, 0x1

    iput-boolean v10, p0, Lorg/jboss/netty/handler/codec/frame/DelimiterBasedFrameDecoder;->discardingTooLongFrame:Z

    .line 275
    iget-boolean v10, p0, Lorg/jboss/netty/handler/codec/frame/DelimiterBasedFrameDecoder;->failFast:Z

    if-eqz v10, :cond_0

    .line 276
    iget v10, p0, Lorg/jboss/netty/handler/codec/frame/DelimiterBasedFrameDecoder;->tooLongFrameLength:I

    int-to-long v10, v10

    invoke-direct {p0, p1, v10, v11}, Lorg/jboss/netty/handler/codec/frame/DelimiterBasedFrameDecoder;->fail(Lorg/jboss/netty/channel/ChannelHandlerContext;J)V

    goto/16 :goto_0

    .line 281
    :cond_8
    iget v10, p0, Lorg/jboss/netty/handler/codec/frame/DelimiterBasedFrameDecoder;->tooLongFrameLength:I

    invoke-interface {p3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v11

    add-int/2addr v10, v11

    iput v10, p0, Lorg/jboss/netty/handler/codec/frame/DelimiterBasedFrameDecoder;->tooLongFrameLength:I

    .line 282
    invoke-interface {p3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v10

    invoke-interface {p3, v10}, Lorg/jboss/netty/buffer/ChannelBuffer;->skipBytes(I)V

    goto/16 :goto_0
.end method
