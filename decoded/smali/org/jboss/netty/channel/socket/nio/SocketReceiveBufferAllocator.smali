.class final Lorg/jboss/netty/channel/socket/nio/SocketReceiveBufferAllocator;
.super Ljava/lang/Object;
.source "SocketReceiveBufferAllocator.java"

# interfaces
.implements Lorg/jboss/netty/util/ExternalResourceReleasable;


# instance fields
.field private buf:Ljava/nio/ByteBuffer;

.field private exceedCount:I

.field private final maxExceedCount:I

.field private final percentual:I


# direct methods
.method constructor <init>()V
    .locals 2

    .prologue
    .line 31
    const/16 v0, 0x10

    const/16 v1, 0x50

    invoke-direct {p0, v0, v1}, Lorg/jboss/netty/channel/socket/nio/SocketReceiveBufferAllocator;-><init>(II)V

    .line 32
    return-void
.end method

.method constructor <init>(II)V
    .locals 0
    .param p1, "maxExceedCount"    # I
    .param p2, "percentual"    # I

    .prologue
    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    iput p1, p0, Lorg/jboss/netty/channel/socket/nio/SocketReceiveBufferAllocator;->maxExceedCount:I

    .line 36
    iput p2, p0, Lorg/jboss/netty/channel/socket/nio/SocketReceiveBufferAllocator;->percentual:I

    .line 37
    return-void
.end method

.method private newBuffer(I)Ljava/nio/ByteBuffer;
    .locals 1
    .param p1, "size"    # I

    .prologue
    .line 60
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/nio/SocketReceiveBufferAllocator;->buf:Ljava/nio/ByteBuffer;

    if-eqz v0, :cond_0

    .line 61
    const/4 v0, 0x0

    iput v0, p0, Lorg/jboss/netty/channel/socket/nio/SocketReceiveBufferAllocator;->exceedCount:I

    .line 62
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/nio/SocketReceiveBufferAllocator;->buf:Ljava/nio/ByteBuffer;

    invoke-static {v0}, Lorg/jboss/netty/util/internal/ByteBufferUtil;->destroy(Ljava/nio/ByteBuffer;)V

    .line 64
    :cond_0
    invoke-static {p1}, Lorg/jboss/netty/channel/socket/nio/SocketReceiveBufferAllocator;->normalizeCapacity(I)I

    move-result v0

    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    iput-object v0, p0, Lorg/jboss/netty/channel/socket/nio/SocketReceiveBufferAllocator;->buf:Ljava/nio/ByteBuffer;

    .line 65
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/nio/SocketReceiveBufferAllocator;->buf:Ljava/nio/ByteBuffer;

    return-object v0
.end method

.method private static normalizeCapacity(I)I
    .locals 3
    .param p0, "capacity"    # I

    .prologue
    .line 70
    ushr-int/lit8 v0, p0, 0xa

    .line 71
    .local v0, "q":I
    and-int/lit16 v1, p0, 0x3ff

    .line 72
    .local v1, "r":I
    if-eqz v1, :cond_0

    .line 73
    add-int/lit8 v0, v0, 0x1

    .line 75
    :cond_0
    shl-int/lit8 v2, v0, 0xa

    return v2
.end method


# virtual methods
.method get(I)Ljava/nio/ByteBuffer;
    .locals 2
    .param p1, "size"    # I

    .prologue
    .line 40
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/nio/SocketReceiveBufferAllocator;->buf:Ljava/nio/ByteBuffer;

    if-nez v0, :cond_0

    .line 41
    invoke-direct {p0, p1}, Lorg/jboss/netty/channel/socket/nio/SocketReceiveBufferAllocator;->newBuffer(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 56
    :goto_0
    return-object v0

    .line 43
    :cond_0
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/nio/SocketReceiveBufferAllocator;->buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v0

    if-ge v0, p1, :cond_1

    .line 44
    invoke-direct {p0, p1}, Lorg/jboss/netty/channel/socket/nio/SocketReceiveBufferAllocator;->newBuffer(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    goto :goto_0

    .line 46
    :cond_1
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/nio/SocketReceiveBufferAllocator;->buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v0

    iget v1, p0, Lorg/jboss/netty/channel/socket/nio/SocketReceiveBufferAllocator;->percentual:I

    mul-int/2addr v0, v1

    div-int/lit8 v0, v0, 0x64

    if-le v0, p1, :cond_3

    .line 47
    iget v0, p0, Lorg/jboss/netty/channel/socket/nio/SocketReceiveBufferAllocator;->exceedCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lorg/jboss/netty/channel/socket/nio/SocketReceiveBufferAllocator;->exceedCount:I

    iget v1, p0, Lorg/jboss/netty/channel/socket/nio/SocketReceiveBufferAllocator;->maxExceedCount:I

    if-ne v0, v1, :cond_2

    .line 48
    invoke-direct {p0, p1}, Lorg/jboss/netty/channel/socket/nio/SocketReceiveBufferAllocator;->newBuffer(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    goto :goto_0

    .line 50
    :cond_2
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/nio/SocketReceiveBufferAllocator;->buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 56
    :goto_1
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/nio/SocketReceiveBufferAllocator;->buf:Ljava/nio/ByteBuffer;

    goto :goto_0

    .line 53
    :cond_3
    const/4 v0, 0x0

    iput v0, p0, Lorg/jboss/netty/channel/socket/nio/SocketReceiveBufferAllocator;->exceedCount:I

    .line 54
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/nio/SocketReceiveBufferAllocator;->buf:Ljava/nio/ByteBuffer;

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    goto :goto_1
.end method

.method public releaseExternalResources()V
    .locals 1

    .prologue
    .line 79
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/nio/SocketReceiveBufferAllocator;->buf:Ljava/nio/ByteBuffer;

    if-eqz v0, :cond_0

    .line 80
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/nio/SocketReceiveBufferAllocator;->buf:Ljava/nio/ByteBuffer;

    invoke-static {v0}, Lorg/jboss/netty/util/internal/ByteBufferUtil;->destroy(Ljava/nio/ByteBuffer;)V

    .line 82
    :cond_0
    return-void
.end method
