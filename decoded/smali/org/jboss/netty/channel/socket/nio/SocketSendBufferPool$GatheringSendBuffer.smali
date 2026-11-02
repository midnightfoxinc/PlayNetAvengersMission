.class Lorg/jboss/netty/channel/socket/nio/SocketSendBufferPool$GatheringSendBuffer;
.super Ljava/lang/Object;
.source "SocketSendBufferPool.java"

# interfaces
.implements Lorg/jboss/netty/channel/socket/nio/SocketSendBufferPool$SendBuffer;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jboss/netty/channel/socket/nio/SocketSendBufferPool;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "GatheringSendBuffer"
.end annotation


# instance fields
.field private final buffers:[Ljava/nio/ByteBuffer;

.field private final last:I

.field private final total:I

.field private written:J


# direct methods
.method constructor <init>([Ljava/nio/ByteBuffer;)V
    .locals 6
    .param p1, "buffers"    # [Ljava/nio/ByteBuffer;

    .prologue
    .line 243
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 244
    iput-object p1, p0, Lorg/jboss/netty/channel/socket/nio/SocketSendBufferPool$GatheringSendBuffer;->buffers:[Ljava/nio/ByteBuffer;

    .line 245
    array-length v5, p1

    add-int/lit8 v5, v5, -0x1

    iput v5, p0, Lorg/jboss/netty/channel/socket/nio/SocketSendBufferPool$GatheringSendBuffer;->last:I

    .line 246
    const/4 v4, 0x0

    .line 247
    .local v4, "total":I
    move-object v0, p1

    .local v0, "arr$":[Ljava/nio/ByteBuffer;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_0
    if-ge v2, v3, :cond_0

    aget-object v1, v0, v2

    .line 248
    .local v1, "buf":Ljava/nio/ByteBuffer;
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v5

    add-int/2addr v4, v5

    .line 247
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 250
    .end local v1    # "buf":Ljava/nio/ByteBuffer;
    :cond_0
    iput v4, p0, Lorg/jboss/netty/channel/socket/nio/SocketSendBufferPool$GatheringSendBuffer;->total:I

    .line 251
    return-void
.end method


# virtual methods
.method public finished()Z
    .locals 2

    .prologue
    .line 254
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/nio/SocketSendBufferPool$GatheringSendBuffer;->buffers:[Ljava/nio/ByteBuffer;

    iget v1, p0, Lorg/jboss/netty/channel/socket/nio/SocketSendBufferPool$GatheringSendBuffer;->last:I

    aget-object v0, v0, v1

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public release()V
    .locals 0

    .prologue
    .line 306
    return-void
.end method

.method public totalBytes()J
    .locals 2

    .prologue
    .line 262
    iget v0, p0, Lorg/jboss/netty/channel/socket/nio/SocketSendBufferPool$GatheringSendBuffer;->total:I

    int-to-long v0, v0

    return-wide v0
.end method

.method public transferTo(Ljava/nio/channels/DatagramChannel;Ljava/net/SocketAddress;)J
    .locals 10
    .param p1, "ch"    # Ljava/nio/channels/DatagramChannel;
    .param p2, "raddr"    # Ljava/net/SocketAddress;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 288
    const/4 v4, 0x0

    .line 289
    .local v4, "send":I
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/nio/SocketSendBufferPool$GatheringSendBuffer;->buffers:[Ljava/nio/ByteBuffer;

    .local v0, "arr$":[Ljava/nio/ByteBuffer;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_0
    if-ge v2, v3, :cond_0

    aget-object v1, v0, v2

    .line 290
    .local v1, "buf":Ljava/nio/ByteBuffer;
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v6

    if-eqz v6, :cond_2

    .line 291
    invoke-virtual {p1, v1, p2}, Ljava/nio/channels/DatagramChannel;->send(Ljava/nio/ByteBuffer;Ljava/net/SocketAddress;)I

    move-result v5

    .line 292
    .local v5, "w":I
    if-nez v5, :cond_1

    .line 299
    .end local v1    # "buf":Ljava/nio/ByteBuffer;
    .end local v5    # "w":I
    :cond_0
    iget-wide v6, p0, Lorg/jboss/netty/channel/socket/nio/SocketSendBufferPool$GatheringSendBuffer;->written:J

    int-to-long v8, v4

    add-long/2addr v6, v8

    iput-wide v6, p0, Lorg/jboss/netty/channel/socket/nio/SocketSendBufferPool$GatheringSendBuffer;->written:J

    .line 301
    int-to-long v6, v4

    return-wide v6

    .line 295
    .restart local v1    # "buf":Ljava/nio/ByteBuffer;
    .restart local v5    # "w":I
    :cond_1
    add-int/2addr v4, v5

    .line 289
    .end local v5    # "w":I
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0
.end method

.method public transferTo(Ljava/nio/channels/WritableByteChannel;)J
    .locals 12
    .param p1, "ch"    # Ljava/nio/channels/WritableByteChannel;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 266
    instance-of v5, p1, Ljava/nio/channels/GatheringByteChannel;

    if-eqz v5, :cond_0

    .line 267
    check-cast p1, Ljava/nio/channels/GatheringByteChannel;

    .end local p1    # "ch":Ljava/nio/channels/WritableByteChannel;
    iget-object v5, p0, Lorg/jboss/netty/channel/socket/nio/SocketSendBufferPool$GatheringSendBuffer;->buffers:[Ljava/nio/ByteBuffer;

    invoke-interface {p1, v5}, Ljava/nio/channels/GatheringByteChannel;->write([Ljava/nio/ByteBuffer;)J

    move-result-wide v6

    .line 268
    .local v6, "w":J
    iget-wide v8, p0, Lorg/jboss/netty/channel/socket/nio/SocketSendBufferPool$GatheringSendBuffer;->written:J

    add-long/2addr v8, v6

    iput-wide v8, p0, Lorg/jboss/netty/channel/socket/nio/SocketSendBufferPool$GatheringSendBuffer;->written:J

    .line 283
    .end local v6    # "w":J
    :goto_0
    return-wide v6

    .line 271
    .restart local p1    # "ch":Ljava/nio/channels/WritableByteChannel;
    :cond_0
    const/4 v4, 0x0

    .line 272
    .local v4, "send":I
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/nio/SocketSendBufferPool$GatheringSendBuffer;->buffers:[Ljava/nio/ByteBuffer;

    .local v0, "arr$":[Ljava/nio/ByteBuffer;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_1
    if-ge v2, v3, :cond_1

    aget-object v1, v0, v2

    .line 273
    .local v1, "buf":Ljava/nio/ByteBuffer;
    invoke-virtual {v1}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v5

    if-eqz v5, :cond_3

    .line 274
    invoke-interface {p1, v1}, Ljava/nio/channels/WritableByteChannel;->write(Ljava/nio/ByteBuffer;)I

    move-result v6

    .line 275
    .local v6, "w":I
    if-nez v6, :cond_2

    .line 282
    .end local v1    # "buf":Ljava/nio/ByteBuffer;
    .end local v6    # "w":I
    :cond_1
    iget-wide v8, p0, Lorg/jboss/netty/channel/socket/nio/SocketSendBufferPool$GatheringSendBuffer;->written:J

    int-to-long v10, v4

    add-long/2addr v8, v10

    iput-wide v8, p0, Lorg/jboss/netty/channel/socket/nio/SocketSendBufferPool$GatheringSendBuffer;->written:J

    .line 283
    int-to-long v6, v4

    goto :goto_0

    .line 278
    .restart local v1    # "buf":Ljava/nio/ByteBuffer;
    .restart local v6    # "w":I
    :cond_2
    add-int/2addr v4, v6

    .line 272
    .end local v6    # "w":I
    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_1
.end method

.method public writtenBytes()J
    .locals 2

    .prologue
    .line 258
    iget-wide v0, p0, Lorg/jboss/netty/channel/socket/nio/SocketSendBufferPool$GatheringSendBuffer;->written:J

    return-wide v0
.end method
