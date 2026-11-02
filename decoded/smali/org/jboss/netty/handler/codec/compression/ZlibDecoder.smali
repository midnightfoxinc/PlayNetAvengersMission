.class public Lorg/jboss/netty/handler/codec/compression/ZlibDecoder;
.super Lorg/jboss/netty/handler/codec/oneone/OneToOneDecoder;
.source "ZlibDecoder.java"


# instance fields
.field private dictionary:[B

.field private volatile finished:Z

.field private final z:Lorg/jboss/netty/util/internal/jzlib/ZStream;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 44
    sget-object v0, Lorg/jboss/netty/handler/codec/compression/ZlibWrapper;->ZLIB:Lorg/jboss/netty/handler/codec/compression/ZlibWrapper;

    invoke-direct {p0, v0}, Lorg/jboss/netty/handler/codec/compression/ZlibDecoder;-><init>(Lorg/jboss/netty/handler/codec/compression/ZlibWrapper;)V

    .line 45
    return-void
.end method

.method public constructor <init>(Lorg/jboss/netty/handler/codec/compression/ZlibWrapper;)V
    .locals 4
    .param p1, "wrapper"    # Lorg/jboss/netty/handler/codec/compression/ZlibWrapper;

    .prologue
    .line 52
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/oneone/OneToOneDecoder;-><init>()V

    .line 34
    new-instance v1, Lorg/jboss/netty/util/internal/jzlib/ZStream;

    invoke-direct {v1}, Lorg/jboss/netty/util/internal/jzlib/ZStream;-><init>()V

    iput-object v1, p0, Lorg/jboss/netty/handler/codec/compression/ZlibDecoder;->z:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    .line 53
    if-nez p1, :cond_0

    .line 54
    new-instance v1, Ljava/lang/NullPointerException;

    const-string v2, "wrapper"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 57
    :cond_0
    iget-object v2, p0, Lorg/jboss/netty/handler/codec/compression/ZlibDecoder;->z:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    monitor-enter v2

    .line 58
    :try_start_0
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/compression/ZlibDecoder;->z:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    invoke-static {p1}, Lorg/jboss/netty/handler/codec/compression/ZlibUtil;->convertWrapperType(Lorg/jboss/netty/handler/codec/compression/ZlibWrapper;)Ljava/lang/Enum;

    move-result-object v3

    invoke-virtual {v1, v3}, Lorg/jboss/netty/util/internal/jzlib/ZStream;->inflateInit(Ljava/lang/Enum;)I

    move-result v0

    .line 59
    .local v0, "resultCode":I
    if-eqz v0, :cond_1

    .line 60
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/compression/ZlibDecoder;->z:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    const-string v3, "initialization failure"

    invoke-static {v1, v3, v0}, Lorg/jboss/netty/handler/codec/compression/ZlibUtil;->fail(Lorg/jboss/netty/util/internal/jzlib/ZStream;Ljava/lang/String;I)V

    .line 62
    :cond_1
    monitor-exit v2

    .line 63
    return-void

    .line 62
    .end local v0    # "resultCode":I
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public constructor <init>([B)V
    .locals 4
    .param p1, "dictionary"    # [B

    .prologue
    .line 72
    invoke-direct {p0}, Lorg/jboss/netty/handler/codec/oneone/OneToOneDecoder;-><init>()V

    .line 34
    new-instance v1, Lorg/jboss/netty/util/internal/jzlib/ZStream;

    invoke-direct {v1}, Lorg/jboss/netty/util/internal/jzlib/ZStream;-><init>()V

    iput-object v1, p0, Lorg/jboss/netty/handler/codec/compression/ZlibDecoder;->z:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    .line 73
    if-nez p1, :cond_0

    .line 74
    new-instance v1, Ljava/lang/NullPointerException;

    const-string v2, "dictionary"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 76
    :cond_0
    iput-object p1, p0, Lorg/jboss/netty/handler/codec/compression/ZlibDecoder;->dictionary:[B

    .line 78
    iget-object v2, p0, Lorg/jboss/netty/handler/codec/compression/ZlibDecoder;->z:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    monitor-enter v2

    .line 80
    :try_start_0
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/compression/ZlibDecoder;->z:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    sget-object v3, Lorg/jboss/netty/util/internal/jzlib/JZlib;->W_ZLIB:Ljava/lang/Enum;

    invoke-virtual {v1, v3}, Lorg/jboss/netty/util/internal/jzlib/ZStream;->inflateInit(Ljava/lang/Enum;)I

    move-result v0

    .line 81
    .local v0, "resultCode":I
    if-eqz v0, :cond_1

    .line 82
    iget-object v1, p0, Lorg/jboss/netty/handler/codec/compression/ZlibDecoder;->z:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    const-string v3, "initialization failure"

    invoke-static {v1, v3, v0}, Lorg/jboss/netty/handler/codec/compression/ZlibUtil;->fail(Lorg/jboss/netty/util/internal/jzlib/ZStream;Ljava/lang/String;I)V

    .line 84
    :cond_1
    monitor-exit v2

    .line 85
    return-void

    .line 84
    .end local v0    # "resultCode":I
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method


# virtual methods
.method protected decode(Lorg/jboss/netty/channel/ChannelHandlerContext;Lorg/jboss/netty/channel/Channel;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 11
    .param p1, "ctx"    # Lorg/jboss/netty/channel/ChannelHandlerContext;
    .param p2, "channel"    # Lorg/jboss/netty/channel/Channel;
    .param p3, "msg"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 97
    instance-of v7, p3, Lorg/jboss/netty/buffer/ChannelBuffer;

    if-eqz v7, :cond_0

    iget-boolean v7, p0, Lorg/jboss/netty/handler/codec/compression/ZlibDecoder;->finished:Z

    if-eqz v7, :cond_1

    :cond_0
    move-object v2, p3

    .line 159
    :goto_0
    return-object v2

    .line 101
    :cond_1
    iget-object v7, p0, Lorg/jboss/netty/handler/codec/compression/ZlibDecoder;->z:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    monitor-enter v7

    .line 104
    :try_start_0
    move-object v0, p3

    check-cast v0, Lorg/jboss/netty/buffer/ChannelBuffer;

    move-object v1, v0

    .line 105
    .local v1, "compressed":Lorg/jboss/netty/buffer/ChannelBuffer;
    invoke-interface {v1}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v8

    new-array v3, v8, [B

    .line 106
    .local v3, "in":[B
    invoke-interface {v1, v3}, Lorg/jboss/netty/buffer/ChannelBuffer;->readBytes([B)V

    .line 107
    iget-object v8, p0, Lorg/jboss/netty/handler/codec/compression/ZlibDecoder;->z:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    iput-object v3, v8, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in:[B

    .line 108
    iget-object v8, p0, Lorg/jboss/netty/handler/codec/compression/ZlibDecoder;->z:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    const/4 v9, 0x0

    iput v9, v8, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in_index:I

    .line 109
    iget-object v8, p0, Lorg/jboss/netty/handler/codec/compression/ZlibDecoder;->z:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    array-length v9, v3

    iput v9, v8, Lorg/jboss/netty/util/internal/jzlib/ZStream;->avail_in:I

    .line 112
    array-length v8, v3

    shl-int/lit8 v8, v8, 0x1

    new-array v4, v8, [B

    .line 113
    .local v4, "out":[B
    invoke-interface {v1}, Lorg/jboss/netty/buffer/ChannelBuffer;->order()Ljava/nio/ByteOrder;

    move-result-object v8

    array-length v9, v4

    invoke-interface {p1}, Lorg/jboss/netty/channel/ChannelHandlerContext;->getChannel()Lorg/jboss/netty/channel/Channel;

    move-result-object v10

    invoke-interface {v10}, Lorg/jboss/netty/channel/Channel;->getConfig()Lorg/jboss/netty/channel/ChannelConfig;

    move-result-object v10

    invoke-interface {v10}, Lorg/jboss/netty/channel/ChannelConfig;->getBufferFactory()Lorg/jboss/netty/buffer/ChannelBufferFactory;

    move-result-object v10

    invoke-static {v8, v9, v10}, Lorg/jboss/netty/buffer/ChannelBuffers;->dynamicBuffer(Ljava/nio/ByteOrder;ILorg/jboss/netty/buffer/ChannelBufferFactory;)Lorg/jboss/netty/buffer/ChannelBuffer;

    move-result-object v2

    .line 116
    .local v2, "decompressed":Lorg/jboss/netty/buffer/ChannelBuffer;
    iget-object v8, p0, Lorg/jboss/netty/handler/codec/compression/ZlibDecoder;->z:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    iput-object v4, v8, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_out:[B

    .line 117
    iget-object v8, p0, Lorg/jboss/netty/handler/codec/compression/ZlibDecoder;->z:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    const/4 v9, 0x0

    iput v9, v8, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_out_index:I

    .line 118
    iget-object v8, p0, Lorg/jboss/netty/handler/codec/compression/ZlibDecoder;->z:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    array-length v9, v4

    iput v9, v8, Lorg/jboss/netty/util/internal/jzlib/ZStream;->avail_out:I

    .line 122
    :cond_2
    :goto_1
    :pswitch_0
    iget-object v8, p0, Lorg/jboss/netty/handler/codec/compression/ZlibDecoder;->z:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    const/4 v9, 0x2

    invoke-virtual {v8, v9}, Lorg/jboss/netty/util/internal/jzlib/ZStream;->inflate(I)I

    move-result v5

    .line 123
    .local v5, "resultCode":I
    iget-object v8, p0, Lorg/jboss/netty/handler/codec/compression/ZlibDecoder;->z:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    iget v8, v8, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_out_index:I

    if-lez v8, :cond_3

    .line 124
    const/4 v8, 0x0

    iget-object v9, p0, Lorg/jboss/netty/handler/codec/compression/ZlibDecoder;->z:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    iget v9, v9, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_out_index:I

    invoke-interface {v2, v4, v8, v9}, Lorg/jboss/netty/buffer/ChannelBuffer;->writeBytes([BII)V

    .line 125
    iget-object v8, p0, Lorg/jboss/netty/handler/codec/compression/ZlibDecoder;->z:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    array-length v9, v4

    iput v9, v8, Lorg/jboss/netty/util/internal/jzlib/ZStream;->avail_out:I

    .line 127
    :cond_3
    iget-object v8, p0, Lorg/jboss/netty/handler/codec/compression/ZlibDecoder;->z:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    const/4 v9, 0x0

    iput v9, v8, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_out_index:I

    .line 129
    packed-switch v5, :pswitch_data_0

    .line 152
    :pswitch_1
    iget-object v8, p0, Lorg/jboss/netty/handler/codec/compression/ZlibDecoder;->z:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    const-string v9, "decompression failure"

    invoke-static {v8, v9, v5}, Lorg/jboss/netty/handler/codec/compression/ZlibUtil;->fail(Lorg/jboss/netty/util/internal/jzlib/ZStream;Ljava/lang/String;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    .line 166
    .end local v1    # "compressed":Lorg/jboss/netty/buffer/ChannelBuffer;
    .end local v2    # "decompressed":Lorg/jboss/netty/buffer/ChannelBuffer;
    .end local v3    # "in":[B
    .end local v4    # "out":[B
    .end local v5    # "resultCode":I
    :catchall_0
    move-exception v6

    :try_start_1
    iget-object v8, p0, Lorg/jboss/netty/handler/codec/compression/ZlibDecoder;->z:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    const/4 v9, 0x0

    iput-object v9, v8, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in:[B

    .line 167
    iget-object v8, p0, Lorg/jboss/netty/handler/codec/compression/ZlibDecoder;->z:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    const/4 v9, 0x0

    iput-object v9, v8, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_out:[B

    .line 166
    throw v6

    .line 169
    :catchall_1
    move-exception v6

    monitor-exit v7
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    throw v6

    .line 131
    .restart local v1    # "compressed":Lorg/jboss/netty/buffer/ChannelBuffer;
    .restart local v2    # "decompressed":Lorg/jboss/netty/buffer/ChannelBuffer;
    .restart local v3    # "in":[B
    .restart local v4    # "out":[B
    .restart local v5    # "resultCode":I
    :pswitch_2
    :try_start_2
    iget-object v8, p0, Lorg/jboss/netty/handler/codec/compression/ZlibDecoder;->dictionary:[B

    if-nez v8, :cond_4

    .line 132
    iget-object v8, p0, Lorg/jboss/netty/handler/codec/compression/ZlibDecoder;->z:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    const-string v9, "decompression failure"

    invoke-static {v8, v9, v5}, Lorg/jboss/netty/handler/codec/compression/ZlibUtil;->fail(Lorg/jboss/netty/util/internal/jzlib/ZStream;Ljava/lang/String;I)V

    goto :goto_1

    .line 134
    :cond_4
    iget-object v8, p0, Lorg/jboss/netty/handler/codec/compression/ZlibDecoder;->z:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    iget-object v9, p0, Lorg/jboss/netty/handler/codec/compression/ZlibDecoder;->dictionary:[B

    iget-object v10, p0, Lorg/jboss/netty/handler/codec/compression/ZlibDecoder;->dictionary:[B

    array-length v10, v10

    invoke-virtual {v8, v9, v10}, Lorg/jboss/netty/util/internal/jzlib/ZStream;->inflateSetDictionary([BI)I

    move-result v5

    .line 135
    if-eqz v5, :cond_2

    .line 136
    iget-object v8, p0, Lorg/jboss/netty/handler/codec/compression/ZlibDecoder;->z:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    const-string v9, "failed to set the dictionary"

    invoke-static {v8, v9, v5}, Lorg/jboss/netty/handler/codec/compression/ZlibUtil;->fail(Lorg/jboss/netty/util/internal/jzlib/ZStream;Ljava/lang/String;I)V

    goto :goto_1

    .line 141
    :pswitch_3
    const/4 v8, 0x1

    iput-boolean v8, p0, Lorg/jboss/netty/handler/codec/compression/ZlibDecoder;->finished:Z

    .line 142
    iget-object v8, p0, Lorg/jboss/netty/handler/codec/compression/ZlibDecoder;->z:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    invoke-virtual {v8}, Lorg/jboss/netty/util/internal/jzlib/ZStream;->inflateEnd()I

    .line 156
    :goto_2
    invoke-interface {v2}, Lorg/jboss/netty/buffer/ChannelBuffer;->writerIndex()I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    move-result v8

    if-eqz v8, :cond_5

    .line 166
    :try_start_3
    iget-object v6, p0, Lorg/jboss/netty/handler/codec/compression/ZlibDecoder;->z:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    const/4 v8, 0x0

    iput-object v8, v6, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in:[B

    .line 167
    iget-object v6, p0, Lorg/jboss/netty/handler/codec/compression/ZlibDecoder;->z:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    const/4 v8, 0x0

    iput-object v8, v6, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_out:[B

    .line 157
    monitor-exit v7
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto/16 :goto_0

    .line 147
    :pswitch_4
    :try_start_4
    iget-object v8, p0, Lorg/jboss/netty/handler/codec/compression/ZlibDecoder;->z:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    iget v8, v8, Lorg/jboss/netty/util/internal/jzlib/ZStream;->avail_in:I
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    if-gtz v8, :cond_2

    goto :goto_2

    .line 166
    :cond_5
    :try_start_5
    iget-object v8, p0, Lorg/jboss/netty/handler/codec/compression/ZlibDecoder;->z:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    const/4 v9, 0x0

    iput-object v9, v8, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_in:[B

    .line 167
    iget-object v8, p0, Lorg/jboss/netty/handler/codec/compression/ZlibDecoder;->z:Lorg/jboss/netty/util/internal/jzlib/ZStream;

    const/4 v9, 0x0

    iput-object v9, v8, Lorg/jboss/netty/util/internal/jzlib/ZStream;->next_out:[B

    .line 159
    monitor-exit v7
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    move-object v2, v6

    goto/16 :goto_0

    .line 129
    nop

    :pswitch_data_0
    .packed-switch -0x5
        :pswitch_4
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_3
        :pswitch_2
    .end packed-switch
.end method

.method public isClosed()Z
    .locals 1

    .prologue
    .line 92
    iget-boolean v0, p0, Lorg/jboss/netty/handler/codec/compression/ZlibDecoder;->finished:Z

    return v0
.end method
