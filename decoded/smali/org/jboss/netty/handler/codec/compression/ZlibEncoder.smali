.class public Lorg/jboss/netty/handler/codec/compression/ZlibEncoder;
.super Lorg/jboss/netty/handler/codec/oneone/OneToOneStrictEncoder;
.source "ZlibEncoder.java"

# interfaces
.implements Lorg/jboss/netty/channel/LifeCycleAwareChannelHandler;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jboss/netty/handler/codec/compression/ZlibEncoder$2;
    }
.end annotation


# static fields
.field private static final EMPTY_ARRAY:[B


# instance fields
.field private volatile ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

.field private final finished:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final wrapperOverhead:I

.field private final z:Lorg/jboss/netty/util/internal/jzlib/ZStream;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 42
    const/4 v0, 0x0

    new-array v0, v0, [B

    sput-object v0, Lorg/jboss/netty/handler/codec/compression/ZlibEncoder;->EMPTY_ARRAY:[B

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 57
    const/4 v0, 0x6

    invoke-direct {p0, v0}, Lorg/jboss/netty/handler/codec/compression/ZlibEncoder;-><init>(I)V

    .line 58
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "compressionLevel"    # I

    .prologue
    .line 73
    sget-object v0, Lorg/jboss/netty/handler/codec/compression/ZlibWrapper;->ZLIB:Lorg/jboss/netty/handler/codec/compression/ZlibWrapper;

    invoke-direct {p0, v0, p1}, Lorg/jboss/netty/handler/codec/compression/ZlibEncoder;-><init>(Lorg/jboss/netty/handler/codec/compression/ZlibWrapper;I)V

    .line 74
    return-void
.end method

.method public constructor <init>(III[B)V
    .locals 4
    .param p1, "compressionLevel"    # I
    .param p2, "windowBits"    # I
    .param p3, "memLevel"    # I
    .param p4, "dictionary"    # [B

    .prologue
    const/16 v2, 0x9

    .line 217
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/oneone/OneToOneStrictEncoder;-><init>()V

    .line 45
    new-instance v1, Lorg/jboss/netty/util/internal/jzlib/ZStream;

    invoke-direct {v1}, Lorg/jboss/netty/util/internal/jzlib/ZStream;-><init>()V

    iput-object v1, p0, Lorg/jboss/netty/handler/codec/compression/ZlibEncoder;->z:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    .line 46
    new-instance v1, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    iput-object v1, p0, Lorg/jboss/netty/handler/codec/compression/ZlibEncoder;->finished:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 218
    if-ltz p1, :cond_0

    if-le p1, v2, :cond_1

    .line 219
    :cond_0
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "compressionLevel: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " (expected: 0-9)"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 222
    :cond_1
    if-lt p2, v2, :cond_2

    const/16 v1, 0xf

    if-le p2, v1, :cond_3

    .line 223
    :cond_2
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "windowBits: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " (expected: 9-15)"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 226
    :cond_3
    const/4 v1, 0x1

    if-lt p3, v1, :cond_4

    if-le p3, v2, :cond_5

    .line 227
    :cond_4
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "memLevel: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " (expected: 1-9)"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 230
    :cond_5
    if-nez p4, :cond_6

    .line 231
    new-instance v1, Ljava/lang/NullPointerException;

    const-string v2, "dictionary"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 234
    :cond_6
    sget-object v1, Lorg/jboss/netty/handler/codec/compression/ZlibWrapper;->ZLIB:Lorg/jboss/netty/handler/codec/compression/ZlibWrapper;

    invoke-static {v1}, Lorg/jboss/netty/handler/codec/compression/ZlibUtil;->wrapperOverhead(Lorg/jboss/netty/handler/codec/compression/ZlibWrapper;)I

    move-result v1

    iput v1, p0, Lorg/jboss/netty/handler/codec/compression/ZlibEncoder;->wrapperOverhead:I

    .line 236
    iget-object v2, p0, Lorg/jboss/netty/handler/codec/compression/ZlibEncoder;->z:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    monitor-enter v2

    .line 238
    :try_start_0
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/compression/ZlibEncoder;->z:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    sget-object v3, Lorg/jboss/netty/util/internal/jzlib/JZlib;->W_ZLIB:Ljava/lang/Enum;

    invoke-virtual {v1, p1, p2, p3, v3}, Lorg/jboss/netty/util/internal/jzlib/ZStream;->deflateInit(IIILjava/lang/Enum;)I

    move-result v0

    .line 240
    .local v0, "resultCode":I
    if-eqz v0, :cond_8

    .line 241
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/compression/ZlibEncoder;->z:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    const-string v3, "initialization failure"

    invoke-static {v1, v3, v0}, Lorg/jboss/netty/handler/codec/compression/ZlibUtil;->fail(Lorg/jboss/netty/util/internal/jzlib/ZStream;Ljava/lang/String;I)V

    .line 248
    :cond_7
    :goto_0
    monitor-exit v2

    .line 249
    return-void

    .line 243
    :cond_8
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/compression/ZlibEncoder;->z:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    array-length v3, p4

    invoke-virtual {v1, p4, v3}, Lorg/jboss/netty/util/internal/jzlib/ZStream;->deflateSetDictionary([BI)I

    move-result v0

    .line 244
    if-eqz v0, :cond_7

    .line 245
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/compression/ZlibEncoder;->z:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    const-string v3, "failed to set the dictionary"

    invoke-static {v1, v3, v0}, Lorg/jboss/netty/handler/codec/compression/ZlibUtil;->fail(Lorg/jboss/netty/util/internal/jzlib/ZStream;Ljava/lang/String;I)V

    goto :goto_0

    .line 248
    .end local v0    # "resultCode":I
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public constructor <init>(I[B)V
    .locals 2
    .param p1, "compressionLevel"    # I
    .param p2, "dictionary"    # [B

    .prologue
    .line 189
    const/16 v0, 0xf

    const/16 v1, 0x8

    invoke-direct {p0, p1, v0, v1, p2}, Lorg/jboss/netty/handler/codec/compression/ZlibEncoder;-><init>(III[B)V

    .line 190
    return-void
.end method

.method public constructor <init>(Lorg/jboss/netty/handler/codec/compression/ZlibWrapper;)V
    .locals 1
    .param p1, "wrapper"    # Lorg/jboss/netty/handler/codec/compression/ZlibWrapper;

    .prologue
    .line 84
    const/4 v0, 0x6

    invoke-direct {p0, p1, v0}, Lorg/jboss/netty/handler/codec/compression/ZlibEncoder;-><init>(Lorg/jboss/netty/handler/codec/compression/ZlibWrapper;I)V

    .line 85
    return-void
.end method

.method public constructor <init>(Lorg/jboss/netty/handler/codec/compression/ZlibWrapper;I)V
    .locals 2
    .param p1, "wrapper"    # Lorg/jboss/netty/handler/codec/compression/ZlibWrapper;
    .param p2, "compressionLevel"    # I

    .prologue
    .line 100
    const/16 v0, 0xf

    const/16 v1, 0x8

    invoke-direct {p0, p1, p2, v0, v1}, Lorg/jboss/netty/handler/codec/compression/ZlibEncoder;-><init>(Lorg/jboss/netty/handler/codec/compression/ZlibWrapper;III)V

    .line 101
    return-void
.end method

.method public constructor <init>(Lorg/jboss/netty/handler/codec/compression/ZlibWrapper;III)V
    .locals 4
    .param p1, "wrapper"    # Lorg/jboss/netty/handler/codec/compression/ZlibWrapper;
    .param p2, "compressionLevel"    # I
    .param p3, "windowBits"    # I
    .param p4, "memLevel"    # I

    .prologue
    const/16 v2, 0x9

    .line 125
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/oneone/OneToOneStrictEncoder;-><init>()V

    .line 45
    new-instance v1, Lorg/jboss/netty/util/internal/jzlib/ZStream;

    invoke-direct {v1}, Lorg/jboss/netty/util/internal/jzlib/ZStream;-><init>()V

    iput-object v1, p0, Lorg/jboss/netty/handler/codec/compression/ZlibEncoder;->z:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    .line 46
    new-instance v1, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    iput-object v1, p0, Lorg/jboss/netty/handler/codec/compression/ZlibEncoder;->finished:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 126
    if-ltz p2, :cond_0

    if-le p2, v2, :cond_1

    .line 127
    :cond_0
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "compressionLevel: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " (expected: 0-9)"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 130
    :cond_1
    if-lt p3, v2, :cond_2

    const/16 v1, 0xf

    if-le p3, v1, :cond_3

    .line 131
    :cond_2
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "windowBits: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " (expected: 9-15)"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 134
    :cond_3
    const/4 v1, 0x1

    if-lt p4, v1, :cond_4

    if-le p4, v2, :cond_5

    .line 135
    :cond_4
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "memLevel: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " (expected: 1-9)"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 138
    :cond_5
    if-nez p1, :cond_6

    .line 139
    new-instance v1, Ljava/lang/NullPointerException;

    const-string v2, "wrapper"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 141
    :cond_6
    sget-object v1, Lorg/jboss/netty/handler/codec/compression/ZlibWrapper;->ZLIB_OR_NONE:Lorg/jboss/netty/handler/codec/compression/ZlibWrapper;

    if-ne p1, v1, :cond_7

    .line 142
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "wrapper \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    sget-object v3, Lorg/jboss/netty/handler/codec/compression/ZlibWrapper;->ZLIB_OR_NONE:Lorg/jboss/netty/handler/codec/compression/ZlibWrapper;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "\' is not "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "allowed for compression."

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 147
    :cond_7
    invoke-static {p1}, Lorg/jboss/netty/handler/codec/compression/ZlibUtil;->wrapperOverhead(Lorg/jboss/netty/handler/codec/compression/ZlibWrapper;)I

    move-result v1

    iput v1, p0, Lorg/jboss/netty/handler/codec/compression/ZlibEncoder;->wrapperOverhead:I

    .line 149
    iget-object v2, p0, Lorg/jboss/netty/handler/codec/compression/ZlibEncoder;->z:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    monitor-enter v2

    .line 150
    :try_start_0
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/compression/ZlibEncoder;->z:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    invoke-static {p1}, Lorg/jboss/netty/handler/codec/compression/ZlibUtil;->convertWrapperType(Lorg/jboss/netty/handler/codec/compression/ZlibWrapper;)Ljava/lang/Enum;

    move-result-object v3

    invoke-virtual {v1, p2, p3, p4, v3}, Lorg/jboss/netty/util/internal/jzlib/ZStream;->deflateInit(IIILjava/lang/Enum;)I

    move-result v0

    .line 152
    .local v0, "resultCode":I
    if-eqz v0, :cond_8

    .line 153
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/compression/ZlibEncoder;->z:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    const-string v3, "initialization failure"

    invoke-static {v1, v3, v0}, Lorg/jboss/netty/handler/codec/compression/ZlibUtil;->fail(Lorg/jboss/netty/util/internal/jzlib/ZStream;Ljava/lang/String;I)V

    .line 155
    :cond_8
    monitor-exit v2

    .line 156
    return-void

    .line 155
    .end local v0    # "resultCode":I
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public constructor <init>([B)V
    .locals 1
    .param p1, "dictionary"    # [B

    .prologue
    .line 170
    const/4 v0, 0x6

    invoke-direct {p0, v0, p1}, Lorg/jboss/netty/handler/codec/compression/ZlibEncoder;-><init>(I[B)V

    .line 171
    return-void
.end method

.method private finishEncode(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelEvent;)Lorg/jboss/netty/channel/ChannelFuture;
    .locals 8
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "evt"    # Lorg/jboss/netty/channel/ChannelEvent;

    .prologue
    const/4 v7, 0x1

    const/4 v5, 0x0

    .line 336
    iget-object v4, p0, Lorg/jboss/netty/handler/codec/compression/ZlibEncoder;->finished:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v4, v5, v7}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v4

    if-nez v4, :cond_2

    .line 337
    if-eqz p2, :cond_0

    .line 338
    invoke-interface {p1, p2}, Lorg/jboss/netty/channel/ChannelHandlerContext;->sendDownstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 340
    :cond_0
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v4

    invoke-static {v4}, Lorg/jboss/netty/channel/Channels;->succeededFuture(Lorg/jboss/netty/channel/Channel;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v1

    .line 401
    :cond_1
    :goto_0
    return-object v1

    .line 345
    :cond_2
    iget-object v5, p0, Lorg/jboss/netty/handler/codec/compression/ZlibEncoder;->z:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    monitor-enter v5

    .line 348
    :try_start_0
    iget-object v4, p0, Lorg/jboss/netty/handler/codec/compression/ZlibEncoder;->z:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    sget-object v6, Lorg/jboss/netty/handler/codec/compression/ZlibEncoder;->EMPTY_ARRAY:[B

    iput-object v6, v4, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in:[B

    .line 349
    iget-object v4, p0, Lorg/jboss/netty/handler/codec/compression/ZlibEncoder;->z:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    const/4 v6, 0x0

    iput v6, v4, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in_index:I

    .line 350
    iget-object v4, p0, Lorg/jboss/netty/handler/codec/compression/ZlibEncoder;->z:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    const/4 v6, 0x0

    iput v6, v4, Lorg/jboss/netty/util/internal/jzlib/ZStream;->avail_in:I

    .line 353
    const/16 v4, 0x20

    new-array v2, v4, [B

    .line 354
    .local v2, "out":[B
    iget-object v4, p0, Lorg/jboss/netty/handler/codec/compression/ZlibEncoder;->z:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    iput-object v2, v4, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_out:[B

    .line 355
    iget-object v4, p0, Lorg/jboss/netty/handler/codec/compression/ZlibEncoder;->z:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    const/4 v6, 0x0

    iput v6, v4, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_out_index:I

    .line 356
    iget-object v4, p0, Lorg/jboss/netty/handler/codec/compression/ZlibEncoder;->z:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    array-length v6, v2

    iput v6, v4, Lorg/jboss/netty/util/internal/jzlib/ZStream;->avail_out:I

    .line 359
    iget-object v4, p0, Lorg/jboss/netty/handler/codec/compression/ZlibEncoder;->z:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    const/4 v6, 0x4

    invoke-virtual {v4, v6}, Lorg/jboss/netty/util/internal/jzlib/ZStream;->deflate(I)I

    move-result v3

    .line 360
    .local v3, "resultCode":I
    if-eqz v3, :cond_4

    if-eq v3, v7, :cond_4

    .line 361
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v4

    iget-object v6, p0, Lorg/jboss/netty/handler/codec/compression/ZlibEncoder;->z:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    const-string v7, "compression failure"

    invoke-static {v6, v7, v3}, Lorg/jboss/netty/handler/codec/compression/ZlibUtil;->exception(Lorg/jboss/netty/util/internal/jzlib/ZStream;Ljava/lang/String;I)Lorg/jboss/netty/handler/codec/compression/CompressionException;

    move-result-object v6

    invoke-static {v4, v6}, Lorg/jboss/netty/channel/Channels;->failedFuture(Lorg/jboss/netty/channel/Channel;Ljava/lang/Throwable;)Lorg/jboss/netty/channel/ChannelFuture;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v1

    .line 364
    .local v1, "future":Lorg/jboss/netty/channel/ChannelFuture;
    const/4 v0, 0x0

    .line 378
    .local v0, "footer":Lorg/jboss/netty/buffer/ChannelBuffer;
    :goto_1
    :try_start_1
    iget-object v4, p0, Lorg/jboss/netty/handler/codec/compression/ZlibEncoder;->z:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    invoke-virtual {v4}, Lorg/jboss/netty/util/internal/jzlib/ZStream;->deflateEnd()I

    .line 384
    iget-object v4, p0, Lorg/jboss/netty/handler/codec/compression/ZlibEncoder;->z:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    const/4 v6, 0x0

    iput-object v6, v4, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in:[B

    .line 385
    iget-object v4, p0, Lorg/jboss/netty/handler/codec/compression/ZlibEncoder;->z:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    const/4 v6, 0x0

    iput-object v6, v4, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_out:[B

    .line 387
    monitor-exit v5
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 389
    if-eqz v0, :cond_3

    .line 390
    invoke-static {p1, v1, v0}, Lorg/jboss/netty/channel/Channels;->write(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelFuture;Ljava/lang/Object;)V

    .line 393
    :cond_3
    if-eqz p2, :cond_1

    .line 394
    new-instance v4, Lorg/jboss/netty/handler/codec/compression/ZlibEncoder$1;

    invoke-direct {v4, p0, p1, p2}, Lorg/jboss/netty/handler/codec/compression/ZlibEncoder$1;-><init>(Lorg/jboss/netty/handler/codec/compression/ZlibEncoder;Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelEvent;)V

    invoke-interface {v1, v4}, Lorg/jboss/netty/channel/ChannelFuture;->addListener(Lorg/jboss/netty/channel/ChannelFutureListener;)V

    goto :goto_0

    .line 365
    .end local v0    # "footer":Lorg/jboss/netty/buffer/ChannelBuffer;
    .end local v1    # "future":Lorg/jboss/netty/channel/ChannelFuture;
    :cond_4
    :try_start_2
    iget-object v4, p0, Lorg/jboss/netty/handler/codec/compression/ZlibEncoder;->z:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    iget v4, v4, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_out_index:I

    if-eqz v4, :cond_5

    .line 366
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v4

    invoke-static {v4}, Lorg/jboss/netty/channel/Channels;->future(Lorg/jboss/netty/channel/Channel;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v1

    .line 367
    .restart local v1    # "future":Lorg/jboss/netty/channel/ChannelFuture;
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v4

    invoke-interface {v4}, Lorg/jboss/netty/channel/Channel;->getConfig()Lorg/jboss/netty/channel/ChannelConfig;

    move-result-object v4

    invoke-interface {v4}, Lorg/jboss/netty/channel/ChannelConfig;->getBufferFactory()Lorg/jboss/netty/buffer/ChannelBufferFactory;

    move-result-object v4

    const/4 v6, 0x0

    iget-object v7, p0, Lorg/jboss/netty/handler/codec/compression/ZlibEncoder;->z:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    iget v7, v7, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_out_index:I

    invoke-interface {v4, v2, v6, v7}, Lorg/jboss/netty/buffer/ChannelBufferFactory;->getBuffer([BII)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v0

    .restart local v0    # "footer":Lorg/jboss/netty/buffer/ChannelBuffer;
    goto :goto_1

    .line 374
    .end local v0    # "footer":Lorg/jboss/netty/buffer/ChannelBuffer;
    .end local v1    # "future":Lorg/jboss/netty/channel/ChannelFuture;
    :cond_5
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v4

    invoke-static {v4}, Lorg/jboss/netty/channel/Channels;->future(Lorg/jboss/netty/channel/Channel;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v1

    .line 375
    .restart local v1    # "future":Lorg/jboss/netty/channel/ChannelFuture;
    sget-object v0, Lorg/jboss/netty/buffer/ChannelBuffers;->EMPTY_BUFFER:Lorg/jboss/netty/buffer/ChannelBuffer;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .restart local v0    # "footer":Lorg/jboss/netty/buffer/ChannelBuffer;
    goto :goto_1

    .line 378
    .end local v0    # "footer":Lorg/jboss/netty/buffer/ChannelBuffer;
    .end local v1    # "future":Lorg/jboss/netty/channel/ChannelFuture;
    .end local v2    # "out":[B
    .end local v3    # "resultCode":I
    :catchall_0
    move-exception v4

    :try_start_3
    iget-object v6, p0, Lorg/jboss/netty/handler/codec/compression/ZlibEncoder;->z:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    invoke-virtual {v6}, Lorg/jboss/netty/util/internal/jzlib/ZStream;->deflateEnd()I

    .line 384
    iget-object v6, p0, Lorg/jboss/netty/handler/codec/compression/ZlibEncoder;->z:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    const/4 v7, 0x0

    iput-object v7, v6, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in:[B

    .line 385
    iget-object v6, p0, Lorg/jboss/netty/handler/codec/compression/ZlibEncoder;->z:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    const/4 v7, 0x0

    iput-object v7, v6, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_out:[B

    .line 378
    throw v4

    .line 387
    :catchall_1
    move-exception v4

    monitor-exit v5
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw v4
.end method


# virtual methods
.method public afterAdd(Lorg/jboss/netty/channel/ChannelHandlerContext;)V
    .locals 0
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 410
    return-void
.end method

.method public afterRemove(Lorg/jboss/netty/channel/ChannelHandlerContext;)V
    .locals 0
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 418
    return-void
.end method

.method public beforeAdd(Lorg/jboss/netty/channel/ChannelHandlerContext;)V
    .locals 0
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 405
    iput-object p1, p0, Lorg/jboss/netty/handler/codec/compression/ZlibEncoder;->ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

    .line 406
    return-void
.end method

.method public beforeRemove(Lorg/jboss/netty/channel/ChannelHandlerContext;)V
    .locals 0
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 414
    return-void
.end method

.method public close()Lorg/jboss/netty/channel/ChannelFuture;
    .locals 3

    .prologue
    .line 252
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/compression/ZlibEncoder;->ctx:Lorg/jboss/netty/channel/ChannelHandlerContext;

    .line 253
    .local v0, "ctx":Lorg/jboss/netty/channel/ChannelHandlerContext;
    if-nez v0, :cond_0

    .line 254
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "not added to a pipeline"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 256
    :cond_0
    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lorg/jboss/netty/handler/codec/compression/ZlibEncoder;->finishEncode(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelEvent;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v1

    return-object v1
.end method

.method protected encode(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 14
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p3, "msg"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 265
    move-object/from16 v0, p3

    instance-of v8, v0, Lorg/jboss/netty/buffer/ChannelBuffer;

    if-eqz v8, :cond_0

    iget-object v8, p0, Lorg/jboss/netty/handler/codec/compression/ZlibEncoder;->finished:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v8}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v8

    if-eqz v8, :cond_1

    :cond_0
    move-object/from16 v6, p3

    .line 313
    :goto_0
    return-object v6

    .line 270
    :cond_1
    iget-object v9, p0, Lorg/jboss/netty/handler/codec/compression/ZlibEncoder;->z:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    monitor-enter v9

    .line 273
    :try_start_0
    move-object/from16 v0, p3

    check-cast v0, Lorg/jboss/netty/buffer/ChannelBuffer;

    move-object v6, v0

    .line 274
    .local v6, "uncompressed":Lorg/jboss/netty/buffer/ChannelBuffer;
    invoke-interface {v6}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    move-result v7

    .line 275
    .local v7, "uncompressedLen":I
    if-nez v7, :cond_2

    .line 308
    :try_start_1
    iget-object v8, p0, Lorg/jboss/netty/handler/codec/compression/ZlibEncoder;->z:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    const/4 v10, 0x0

    iput-object v10, v8, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in:[B

    .line 309
    iget-object v8, p0, Lorg/jboss/netty/handler/codec/compression/ZlibEncoder;->z:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    const/4 v10, 0x0

    iput-object v10, v8, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_out:[B

    .line 276
    monitor-exit v9

    goto :goto_0

    .line 311
    .end local v6    # "uncompressed":Lorg/jboss/netty/buffer/ChannelBuffer;
    .end local v7    # "uncompressedLen":I
    :catchall_0
    move-exception v8

    monitor-exit v9
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v8

    .line 279
    .restart local v6    # "uncompressed":Lorg/jboss/netty/buffer/ChannelBuffer;
    .restart local v7    # "uncompressedLen":I
    :cond_2
    :try_start_2
    new-array v2, v7, [B

    .line 280
    .local v2, "in":[B
    invoke-interface {v6, v2}, Lorg/jboss/netty/buffer/ChannelBuffer;->readBytes([B)V

    .line 281
    iget-object v8, p0, Lorg/jboss/netty/handler/codec/compression/ZlibEncoder;->z:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    iput-object v2, v8, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in:[B

    .line 282
    iget-object v8, p0, Lorg/jboss/netty/handler/codec/compression/ZlibEncoder;->z:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    const/4 v10, 0x0

    iput v10, v8, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in_index:I

    .line 283
    iget-object v8, p0, Lorg/jboss/netty/handler/codec/compression/ZlibEncoder;->z:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    iput v7, v8, Lorg/jboss/netty/util/internal/jzlib/ZStream;->avail_in:I

    .line 286
    int-to-double v10, v7

    const-wide v12, 0x3ff004189374bc6aL    # 1.001

    mul-double/2addr v10, v12

    invoke-static {v10, v11}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v10

    double-to-int v8, v10

    add-int/lit8 v8, v8, 0xc

    iget v10, p0, Lorg/jboss/netty/handler/codec/compression/ZlibEncoder;->wrapperOverhead:I

    add-int/2addr v8, v10

    new-array v3, v8, [B

    .line 287
    .local v3, "out":[B
    iget-object v8, p0, Lorg/jboss/netty/handler/codec/compression/ZlibEncoder;->z:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    iput-object v3, v8, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_out:[B

    .line 288
    iget-object v8, p0, Lorg/jboss/netty/handler/codec/compression/ZlibEncoder;->z:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    const/4 v10, 0x0

    iput v10, v8, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_out_index:I

    .line 289
    iget-object v8, p0, Lorg/jboss/netty/handler/codec/compression/ZlibEncoder;->z:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    array-length v10, v3

    iput v10, v8, Lorg/jboss/netty/util/internal/jzlib/ZStream;->avail_out:I

    .line 292
    iget-object v8, p0, Lorg/jboss/netty/handler/codec/compression/ZlibEncoder;->z:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    const/4 v10, 0x2

    invoke-virtual {v8, v10}, Lorg/jboss/netty/util/internal/jzlib/ZStream;->deflate(I)I

    move-result v5

    .line 293
    .local v5, "resultCode":I
    if-eqz v5, :cond_3

    .line 294
    iget-object v8, p0, Lorg/jboss/netty/handler/codec/compression/ZlibEncoder;->z:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    const-string v10, "compression failure"

    invoke-static {v8, v10, v5}, Lorg/jboss/netty/handler/codec/compression/ZlibUtil;->fail(Lorg/jboss/netty/util/internal/jzlib/ZStream;Ljava/lang/String;I)V

    .line 297
    :cond_3
    iget-object v8, p0, Lorg/jboss/netty/handler/codec/compression/ZlibEncoder;->z:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    iget v8, v8, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_out_index:I

    if-eqz v8, :cond_4

    .line 298
    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v8

    invoke-interface {v8}, Lorg/jboss/netty/channel/Channel;->getConfig()Lorg/jboss/netty/channel/ChannelConfig;

    move-result-object v8

    invoke-interface {v8}, Lorg/jboss/netty/channel/ChannelConfig;->getBufferFactory()Lorg/jboss/netty/buffer/ChannelBufferFactory;

    move-result-object v8

    invoke-interface {v6}, Lorg/jboss/netty/buffer/ChannelBuffer;->order()Ljava/nio/ByteOrder;

    move-result-object v10

    const/4 v11, 0x0

    iget-object v12, p0, Lorg/jboss/netty/handler/codec/compression/ZlibEncoder;->z:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    iget v12, v12, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_out_index:I

    invoke-interface {v8, v10, v3, v11, v12}, Lorg/jboss/netty/buffer/ChannelBufferFactory;->getBuffer(Ljava/nio/ByteOrder;[BII)Lorg/jboss/netty/buffer/ChannelBuffer;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    move-result-object v4

    .line 308
    .local v4, "result":Lorg/jboss/netty/buffer/ChannelBuffer;
    :goto_1
    :try_start_3
    iget-object v8, p0, Lorg/jboss/netty/handler/codec/compression/ZlibEncoder;->z:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    const/4 v10, 0x0

    iput-object v10, v8, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in:[B

    .line 309
    iget-object v8, p0, Lorg/jboss/netty/handler/codec/compression/ZlibEncoder;->z:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    const/4 v10, 0x0

    iput-object v10, v8, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_out:[B

    .line 311
    monitor-exit v9
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    move-object v6, v4

    .line 313
    goto/16 :goto_0

    .line 301
    .end local v4    # "result":Lorg/jboss/netty/buffer/ChannelBuffer;
    :cond_4
    :try_start_4
    sget-object v4, Lorg/jboss/netty/buffer/ChannelBuffers;->EMPTY_BUFFER:Lorg/jboss/netty/buffer/ChannelBuffer;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .restart local v4    # "result":Lorg/jboss/netty/buffer/ChannelBuffer;
    goto :goto_1

    .line 308
    .end local v2    # "in":[B
    .end local v3    # "out":[B
    .end local v4    # "result":Lorg/jboss/netty/buffer/ChannelBuffer;
    .end local v5    # "resultCode":I
    .end local v6    # "uncompressed":Lorg/jboss/netty/buffer/ChannelBuffer;
    .end local v7    # "uncompressedLen":I
    :catchall_1
    move-exception v8

    :try_start_5
    iget-object v10, p0, Lorg/jboss/netty/handler/codec/compression/ZlibEncoder;->z:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    const/4 v11, 0x0

    iput-object v11, v10, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in:[B

    .line 309
    iget-object v10, p0, Lorg/jboss/netty/handler/codec/compression/ZlibEncoder;->z:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    const/4 v11, 0x0

    iput-object v11, v10, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_out:[B

    .line 308
    throw v8
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0
.end method

.method public handleDownstream(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelEvent;)V
    .locals 3
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "evt"    # Lorg/jboss/netty/channel/ChannelEvent;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 319
    instance-of v1, p2, Lorg/jboss/netty/channel/ChannelStateEvent;

    if-eqz v1, :cond_0

    move-object v0, p2

    .line 320
    check-cast v0, Lorg/jboss/netty/channel/ChannelStateEvent;

    .line 321
    .local v0, "e":Lorg/jboss/netty/channel/ChannelStateEvent;
    sget-object v1, Lorg/jboss/netty/handler/codec/compression/ZlibEncoder$2;->$SwitchMap$org$jboss$netty$channel$ChannelState:[I

    invoke-interface {v0}, Lorg/jboss/netty/channel/ChannelStateEvent;->getState()Lorg/jboss/netty/channel/ChannelState;

    move-result-object v2

    invoke-virtual {v2}, Lorg/jboss/netty/channel/ChannelState;->ordinal()I

    move-result v2

    aget v1, v1, v2

    packed-switch v1, :pswitch_data_0

    .line 332
    .end local v0    # "e":Lorg/jboss/netty/channel/ChannelStateEvent;
    :cond_0
    invoke-super {p0, p1, p2}, Lorg/jboss/netty/handler/codec/oneone/OneToOneStrictEncoder;->handleDownstream(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 333
    :goto_0
    return-void

    .line 325
    .restart local v0    # "e":Lorg/jboss/netty/channel/ChannelStateEvent;
    :pswitch_0
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-interface {v0}, Lorg/jboss/netty/channel/ChannelStateEvent;->getValue()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    invoke-interface {v0}, Lorg/jboss/netty/channel/ChannelStateEvent;->getValue()Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_0

    .line 326
    :cond_1
    invoke-direct {p0, p1, p2}, Lorg/jboss/netty/handler/codec/compression/ZlibEncoder;->finishEncode(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/ChannelEvent;)Lorg/jboss/netty/channel/ChannelFuture;

    goto :goto_0

    .line 321
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public isClosed()Z
    .locals 1

    .prologue
    .line 260
    iget-object v0, p0, Lorg/jboss/netty/handler/codec/compression/ZlibEncoder;->finished:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    return v0
.end method
