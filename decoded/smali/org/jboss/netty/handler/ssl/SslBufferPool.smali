.class public Lorg/jboss/netty/handler/ssl/SslBufferPool;
.super Ljava/lang/Object;
.source "SslBufferPool.java"


# static fields
.field private static final DEFAULT_POOL_SIZE:I = 0x1260000

.field private static final MAX_PACKET_SIZE_ALIGNED:I = 0x4980


# instance fields
.field private final allocateDirect:Z

.field private final maxBufferCount:I

.field private final numAllocations:Ljava/util/concurrent/atomic/AtomicInteger;

.field private final pool:Ljava/util/concurrent/BlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/BlockingQueue",
            "<",
            "Ljava/nio/ByteBuffer;",
            ">;"
        }
    .end annotation
.end field

.field private final preallocated:Ljava/nio/ByteBuffer;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 56
    const/high16 v0, 0x1260000

    invoke-direct {p0, v0}, Lorg/jboss/netty/handler/ssl/SslBufferPool;-><init>(I)V

    .line 57
    return-void
.end method

.method public constructor <init>(I)V
    .locals 1
    .param p1, "maxPoolSize"    # I

    .prologue
    const/4 v0, 0x0

    .line 76
    invoke-direct {p0, p1, v0, v0}, Lorg/jboss/netty/handler/ssl/SslBufferPool;-><init>(IZZ)V

    .line 77
    return-void
.end method

.method public constructor <init>(IZZ)V
    .locals 6
    .param p1, "maxPoolSize"    # I
    .param p2, "preallocate"    # Z
    .param p3, "allocateDirect"    # Z

    .prologue
    const/4 v4, 0x0

    .line 87
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 88
    if-gtz p1, :cond_0

    .line 89
    new-instance v3, Ljava/lang/IllegalArgumentException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "maxPoolSize: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 92
    :cond_0
    div-int/lit16 v1, p1, 0x4980

    .line 93
    .local v1, "maxBufferCount":I
    rem-int/lit16 v3, p1, 0x4980

    if-eqz v3, :cond_1

    .line 94
    add-int/lit8 v1, v1, 0x1

    .line 97
    :cond_1
    iput v1, p0, Lorg/jboss/netty/handler/ssl/SslBufferPool;->maxBufferCount:I

    .line 98
    iput-boolean p3, p0, Lorg/jboss/netty/handler/ssl/SslBufferPool;->allocateDirect:Z

    .line 100
    new-instance v3, Ljava/util/concurrent/ArrayBlockingQueue;

    invoke-direct {v3, v1}, Ljava/util/concurrent/ArrayBlockingQueue;-><init>(I)V

    iput-object v3, p0, Lorg/jboss/netty/handler/ssl/SslBufferPool;->pool:Ljava/util/concurrent/BlockingQueue;

    .line 102
    if-eqz p2, :cond_2

    .line 103
    mul-int/lit16 v3, v1, 0x4980

    invoke-direct {p0, v3}, Lorg/jboss/netty/handler/ssl/SslBufferPool;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v3

    iput-object v3, p0, Lorg/jboss/netty/handler/ssl/SslBufferPool;->preallocated:Ljava/nio/ByteBuffer;

    .line 104
    iput-object v4, p0, Lorg/jboss/netty/handler/ssl/SslBufferPool;->numAllocations:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 105
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, v1, :cond_3

    .line 106
    mul-int/lit16 v2, v0, 0x4980

    .line 107
    .local v2, "pos":I
    iget-object v3, p0, Lorg/jboss/netty/handler/ssl/SslBufferPool;->preallocated:Ljava/nio/ByteBuffer;

    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/nio/Buffer;->position(I)Ljava/nio/Buffer;

    move-result-object v3

    add-int/lit16 v4, v2, 0x4980

    invoke-virtual {v3, v4}, Ljava/nio/Buffer;->limit(I)Ljava/nio/Buffer;

    .line 108
    iget-object v3, p0, Lorg/jboss/netty/handler/ssl/SslBufferPool;->pool:Ljava/util/concurrent/BlockingQueue;

    iget-object v4, p0, Lorg/jboss/netty/handler/ssl/SslBufferPool;->preallocated:Ljava/nio/ByteBuffer;

    invoke-virtual {v4}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/concurrent/BlockingQueue;->add(Ljava/lang/Object;)Z

    .line 105
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 111
    .end local v0    # "i":I
    .end local v2    # "pos":I
    :cond_2
    iput-object v4, p0, Lorg/jboss/netty/handler/ssl/SslBufferPool;->preallocated:Ljava/nio/ByteBuffer;

    .line 112
    new-instance v3, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v3}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    iput-object v3, p0, Lorg/jboss/netty/handler/ssl/SslBufferPool;->numAllocations:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 114
    :cond_3
    return-void
.end method

.method public constructor <init>(ZZ)V
    .locals 1
    .param p1, "preallocate"    # Z
    .param p2, "allocateDirect"    # Z

    .prologue
    .line 67
    const/high16 v0, 0x1260000

    invoke-direct {p0, v0, p1, p2}, Lorg/jboss/netty/handler/ssl/SslBufferPool;-><init>(IZZ)V

    .line 68
    return-void
.end method

.method private allocate(I)Ljava/nio/ByteBuffer;
    .locals 1
    .param p1, "capacity"    # I

    .prologue
    .line 176
    iget-boolean v0, p0, Lorg/jboss/netty/handler/ssl/SslBufferPool;->allocateDirect:Z

    if-eqz v0, :cond_0

    .line 177
    invoke-static {p1}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 179
    :goto_0
    return-object v0

    :cond_0
    invoke-static {p1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    goto :goto_0
.end method


# virtual methods
.method public acquireBuffer()Ljava/nio/ByteBuffer;
    .locals 5

    .prologue
    .line 141
    iget-object v3, p0, Lorg/jboss/netty/handler/ssl/SslBufferPool;->preallocated:Ljava/nio/ByteBuffer;

    if-nez v3, :cond_0

    iget-object v3, p0, Lorg/jboss/netty/handler/ssl/SslBufferPool;->numAllocations:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v3

    iget v4, p0, Lorg/jboss/netty/handler/ssl/SslBufferPool;->maxBufferCount:I

    if-lt v3, v4, :cond_2

    .line 142
    :cond_0
    const/4 v2, 0x0

    .line 145
    .local v2, "interrupted":Z
    :goto_0
    :try_start_0
    iget-object v3, p0, Lorg/jboss/netty/handler/ssl/SslBufferPool;->pool:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {v3}, Ljava/util/concurrent/BlockingQueue;->take()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/nio/ByteBuffer;
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 151
    .local v0, "buf":Ljava/nio/ByteBuffer;
    if-eqz v2, :cond_1

    .line 152
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Thread;->interrupt()V

    .line 164
    .end local v2    # "interrupted":Z
    :cond_1
    :goto_1
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 165
    return-object v0

    .line 147
    .end local v0    # "buf":Ljava/nio/ByteBuffer;
    .restart local v2    # "interrupted":Z
    :catch_0
    move-exception v1

    .line 148
    .local v1, "ignore":Ljava/lang/InterruptedException;
    const/4 v2, 0x1

    .line 149
    goto :goto_0

    .line 155
    .end local v1    # "ignore":Ljava/lang/InterruptedException;
    .end local v2    # "interrupted":Z
    :cond_2
    iget-object v3, p0, Lorg/jboss/netty/handler/ssl/SslBufferPool;->pool:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {v3}, Ljava/util/concurrent/BlockingQueue;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/nio/ByteBuffer;

    .line 156
    .restart local v0    # "buf":Ljava/nio/ByteBuffer;
    if-nez v0, :cond_1

    .line 159
    iget-object v3, p0, Lorg/jboss/netty/handler/ssl/SslBufferPool;->numAllocations:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 160
    const/16 v3, 0x4919

    invoke-direct {p0, v3}, Lorg/jboss/netty/handler/ssl/SslBufferPool;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    goto :goto_1
.end method

.method public getMaxPoolSize()I
    .locals 1

    .prologue
    .line 121
    iget v0, p0, Lorg/jboss/netty/handler/ssl/SslBufferPool;->maxBufferCount:I

    mul-int/lit16 v0, v0, 0x4980

    return v0
.end method

.method public getUnacquiredPoolSize()I
    .locals 1

    .prologue
    .line 132
    iget-object v0, p0, Lorg/jboss/netty/handler/ssl/SslBufferPool;->pool:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {v0}, Ljava/util/concurrent/BlockingQueue;->size()I

    move-result v0

    mul-int/lit16 v0, v0, 0x4980

    return v0
.end method

.method public releaseBuffer(Ljava/nio/ByteBuffer;)V
    .locals 1
    .param p1, "buffer"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 172
    iget-object v0, p0, Lorg/jboss/netty/handler/ssl/SslBufferPool;->pool:Ljava/util/concurrent/BlockingQueue;

    invoke-interface {v0, p1}, Ljava/util/concurrent/BlockingQueue;->offer(Ljava/lang/Object;)Z

    .line 173
    return-void
.end method
