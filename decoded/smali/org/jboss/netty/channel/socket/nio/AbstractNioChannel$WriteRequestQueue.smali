.class final Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel$WriteRequestQueue;
.super Ljava/lang/Object;
.source "AbstractNioChannel.java"

# interfaces
.implements Ljava/util/Queue;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "WriteRequestQueue"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Queue",
        "<",
        "Lorg/jboss/netty/channel/MessageEvent;",
        ">;"
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private final notifying:Lorg/jboss/netty/util/internal/ThreadLocalBoolean;

.field private final queue:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue",
            "<",
            "Lorg/jboss/netty/channel/MessageEvent;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 175
    const-class v0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel$WriteRequestQueue;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>(Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;)V
    .locals 1

    .prologue
    .line 180
    .local p0, "this":Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel$WriteRequestQueue;, "Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel<TC;>.WriteRequestQueue;"
    iput-object p1, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel$WriteRequestQueue;->this$0:Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 176
    new-instance v0, Lorg/jboss/netty/util/internal/ThreadLocalBoolean;

    invoke-direct {v0}, Lorg/jboss/netty/util/internal/ThreadLocalBoolean;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel$WriteRequestQueue;->notifying:Lorg/jboss/netty/util/internal/ThreadLocalBoolean;

    .line 181
    new-instance v0, Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    iput-object v0, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel$WriteRequestQueue;->queue:Ljava/util/Queue;

    .line 182
    return-void
.end method

.method private getMessageSize(Lorg/jboss/netty/channel/MessageEvent;)I
    .locals 2
    .param p1, "e"    # Lorg/jboss/netty/channel/MessageEvent;

    .prologue
    .line 291
    .local p0, "this":Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel$WriteRequestQueue;, "Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel<TC;>.WriteRequestQueue;"
    invoke-interface {p1}, Lorg/jboss/netty/channel/MessageEvent;->getMessage()Ljava/lang/Object;

    move-result-object v0

    .line 292
    .local v0, "m":Ljava/lang/Object;
    instance-of v1, v0, Lorg/jboss/netty/buffer/ChannelBuffer;

    if-eqz v1, :cond_0

    .line 293
    check-cast v0, Lorg/jboss/netty/buffer/ChannelBuffer;

    .end local v0    # "m":Ljava/lang/Object;
    invoke-interface {v0}, Lorg/jboss/netty/buffer/ChannelBuffer;->readableBytes()I

    move-result v1

    .line 295
    :goto_0
    return v1

    .restart local v0    # "m":Ljava/lang/Object;
    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method


# virtual methods
.method public bridge synthetic add(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 175
    .local p0, "this":Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel$WriteRequestQueue;, "Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel<TC;>.WriteRequestQueue;"
    check-cast p1, Lorg/jboss/netty/channel/MessageEvent;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel$WriteRequestQueue;->add(Lorg/jboss/netty/channel/MessageEvent;)Z

    move-result v0

    return v0
.end method

.method public add(Lorg/jboss/netty/channel/MessageEvent;)Z
    .locals 1
    .param p1, "e"    # Lorg/jboss/netty/channel/MessageEvent;

    .prologue
    .line 237
    .local p0, "this":Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel$WriteRequestQueue;, "Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel<TC;>.WriteRequestQueue;"
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel$WriteRequestQueue;->queue:Ljava/util/Queue;

    invoke-interface {v0, p1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public addAll(Ljava/util/Collection;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<+",
            "Lorg/jboss/netty/channel/MessageEvent;",
            ">;)Z"
        }
    .end annotation

    .prologue
    .line 221
    .local p0, "this":Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel$WriteRequestQueue;, "Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel<TC;>.WriteRequestQueue;"
    .local p1, "c":Ljava/util/Collection;, "Ljava/util/Collection<+Lorg/jboss/netty/channel/MessageEvent;>;"
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel$WriteRequestQueue;->queue:Ljava/util/Queue;

    invoke-interface {v0, p1}, Ljava/util/Queue;->addAll(Ljava/util/Collection;)Z

    move-result v0

    return v0
.end method

.method public clear()V
    .locals 1

    .prologue
    .line 233
    .local p0, "this":Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel$WriteRequestQueue;, "Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel<TC;>.WriteRequestQueue;"
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel$WriteRequestQueue;->queue:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->clear()V

    .line 234
    return-void
.end method

.method public contains(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 245
    .local p0, "this":Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel$WriteRequestQueue;, "Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel<TC;>.WriteRequestQueue;"
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel$WriteRequestQueue;->queue:Ljava/util/Queue;

    invoke-interface {v0, p1}, Ljava/util/Queue;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public containsAll(Ljava/util/Collection;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 217
    .local p0, "this":Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel$WriteRequestQueue;, "Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel<TC;>.WriteRequestQueue;"
    .local p1, "c":Ljava/util/Collection;, "Ljava/util/Collection<*>;"
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel$WriteRequestQueue;->queue:Ljava/util/Queue;

    invoke-interface {v0, p1}, Ljava/util/Queue;->containsAll(Ljava/util/Collection;)Z

    move-result v0

    return v0
.end method

.method public bridge synthetic element()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 175
    .local p0, "this":Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel$WriteRequestQueue;, "Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel<TC;>.WriteRequestQueue;"
    invoke-virtual {p0}, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel$WriteRequestQueue;->element()Lorg/jboss/netty/channel/MessageEvent;

    move-result-object v0

    return-object v0
.end method

.method public element()Lorg/jboss/netty/channel/MessageEvent;
    .locals 1

    .prologue
    .line 189
    .local p0, "this":Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel$WriteRequestQueue;, "Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel<TC;>.WriteRequestQueue;"
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel$WriteRequestQueue;->queue:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->element()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/channel/MessageEvent;

    return-object v0
.end method

.method public isEmpty()Z
    .locals 1

    .prologue
    .line 201
    .local p0, "this":Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel$WriteRequestQueue;, "Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel<TC;>.WriteRequestQueue;"
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel$WriteRequestQueue;->queue:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Lorg/jboss/netty/channel/MessageEvent;",
            ">;"
        }
    .end annotation

    .prologue
    .line 205
    .local p0, "this":Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel$WriteRequestQueue;, "Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel<TC;>.WriteRequestQueue;"
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel$WriteRequestQueue;->queue:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->iterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic offer(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 175
    .local p0, "this":Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel$WriteRequestQueue;, "Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel<TC;>.WriteRequestQueue;"
    check-cast p1, Lorg/jboss/netty/channel/MessageEvent;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel$WriteRequestQueue;->offer(Lorg/jboss/netty/channel/MessageEvent;)Z

    move-result v0

    return v0
.end method

.method public offer(Lorg/jboss/netty/channel/MessageEvent;)Z
    .locals 6
    .param p1, "e"    # Lorg/jboss/netty/channel/MessageEvent;

    .prologue
    .line 249
    .local p0, "this":Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel$WriteRequestQueue;, "Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel<TC;>.WriteRequestQueue;"
    iget-object v4, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel$WriteRequestQueue;->queue:Ljava/util/Queue;

    invoke-interface {v4, p1}, Ljava/util/Queue;->offer(Ljava/lang/Object;)Z

    move-result v3

    .line 250
    .local v3, "success":Z
    sget-boolean v4, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel$WriteRequestQueue;->$assertionsDisabled:Z

    if-nez v4, :cond_0

    if-nez v3, :cond_0

    new-instance v4, Ljava/lang/AssertionError;

    invoke-direct {v4}, Ljava/lang/AssertionError;-><init>()V

    throw v4

    .line 252
    :cond_0
    invoke-direct {p0, p1}, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel$WriteRequestQueue;->getMessageSize(Lorg/jboss/netty/channel/MessageEvent;)I

    move-result v1

    .line 253
    .local v1, "messageSize":I
    iget-object v4, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel$WriteRequestQueue;->this$0:Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;

    iget-object v4, v4, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->writeBufferSize:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v4, v1}, Ljava/util/concurrent/atomic/AtomicInteger;->addAndGet(I)I

    move-result v2

    .line 254
    .local v2, "newWriteBufferSize":I
    iget-object v4, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel$WriteRequestQueue;->this$0:Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;

    invoke-virtual {v4}, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->getConfig()Lorg/jboss/netty/channel/socket/nio/NioChannelConfig;

    move-result-object v4

    invoke-interface {v4}, Lorg/jboss/netty/channel/socket/nio/NioChannelConfig;->getWriteBufferHighWaterMark()I

    move-result v0

    .line 256
    .local v0, "highWaterMark":I
    if-lt v2, v0, :cond_1

    .line 257
    sub-int v4, v2, v1

    if-ge v4, v0, :cond_1

    .line 258
    iget-object v4, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel$WriteRequestQueue;->this$0:Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;

    iget-object v4, v4, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->highWaterMarkCounter:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 259
    iget-object v4, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel$WriteRequestQueue;->notifying:Lorg/jboss/netty/util/internal/ThreadLocalBoolean;

    invoke-virtual {v4}, Lorg/jboss/netty/util/internal/ThreadLocalBoolean;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Boolean;

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    if-nez v4, :cond_1

    iget-object v4, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel$WriteRequestQueue;->this$0:Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;

    invoke-static {v4}, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->access$000(Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 260
    iget-object v4, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel$WriteRequestQueue;->notifying:Lorg/jboss/netty/util/internal/ThreadLocalBoolean;

    sget-object v5, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v4, v5}, Lorg/jboss/netty/util/internal/ThreadLocalBoolean;->set(Ljava/lang/Object;)V

    .line 261
    iget-object v4, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel$WriteRequestQueue;->this$0:Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;

    invoke-static {v4}, Lorg/jboss/netty/channel/Channels;->fireChannelInterestChanged(Lorg/jboss/netty/channel/Channel;)V

    .line 262
    iget-object v4, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel$WriteRequestQueue;->notifying:Lorg/jboss/netty/util/internal/ThreadLocalBoolean;

    sget-object v5, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v4, v5}, Lorg/jboss/netty/util/internal/ThreadLocalBoolean;->set(Ljava/lang/Object;)V

    .line 266
    :cond_1
    const/4 v4, 0x1

    return v4
.end method

.method public bridge synthetic peek()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 175
    .local p0, "this":Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel$WriteRequestQueue;, "Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel<TC;>.WriteRequestQueue;"
    invoke-virtual {p0}, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel$WriteRequestQueue;->peek()Lorg/jboss/netty/channel/MessageEvent;

    move-result-object v0

    return-object v0
.end method

.method public peek()Lorg/jboss/netty/channel/MessageEvent;
    .locals 1

    .prologue
    .line 193
    .local p0, "this":Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel$WriteRequestQueue;, "Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel<TC;>.WriteRequestQueue;"
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel$WriteRequestQueue;->queue:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->peek()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/channel/MessageEvent;

    return-object v0
.end method

.method public bridge synthetic poll()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 175
    .local p0, "this":Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel$WriteRequestQueue;, "Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel<TC;>.WriteRequestQueue;"
    invoke-virtual {p0}, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel$WriteRequestQueue;->poll()Lorg/jboss/netty/channel/MessageEvent;

    move-result-object v0

    return-object v0
.end method

.method public poll()Lorg/jboss/netty/channel/MessageEvent;
    .locals 6

    .prologue
    .line 270
    .local p0, "this":Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel$WriteRequestQueue;, "Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel<TC;>.WriteRequestQueue;"
    iget-object v4, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel$WriteRequestQueue;->queue:Ljava/util/Queue;

    invoke-interface {v4}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/channel/MessageEvent;

    .line 271
    .local v0, "e":Lorg/jboss/netty/channel/MessageEvent;
    if-eqz v0, :cond_1

    .line 272
    invoke-direct {p0, v0}, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel$WriteRequestQueue;->getMessageSize(Lorg/jboss/netty/channel/MessageEvent;)I

    move-result v2

    .line 273
    .local v2, "messageSize":I
    iget-object v4, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel$WriteRequestQueue;->this$0:Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;

    iget-object v4, v4, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->writeBufferSize:Ljava/util/concurrent/atomic/AtomicInteger;

    neg-int v5, v2

    invoke-virtual {v4, v5}, Ljava/util/concurrent/atomic/AtomicInteger;->addAndGet(I)I

    move-result v3

    .line 274
    .local v3, "newWriteBufferSize":I
    iget-object v4, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel$WriteRequestQueue;->this$0:Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;

    invoke-virtual {v4}, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->getConfig()Lorg/jboss/netty/channel/socket/nio/NioChannelConfig;

    move-result-object v4

    invoke-interface {v4}, Lorg/jboss/netty/channel/socket/nio/NioChannelConfig;->getWriteBufferLowWaterMark()I

    move-result v1

    .line 276
    .local v1, "lowWaterMark":I
    if-eqz v3, :cond_0

    if-ge v3, v1, :cond_1

    .line 277
    :cond_0
    add-int v4, v3, v2

    if-lt v4, v1, :cond_1

    .line 278
    iget-object v4, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel$WriteRequestQueue;->this$0:Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;

    iget-object v4, v4, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->highWaterMarkCounter:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 279
    iget-object v4, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel$WriteRequestQueue;->this$0:Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;

    invoke-virtual {v4}, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->isConnected()Z

    move-result v4

    if-eqz v4, :cond_1

    iget-object v4, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel$WriteRequestQueue;->notifying:Lorg/jboss/netty/util/internal/ThreadLocalBoolean;

    invoke-virtual {v4}, Lorg/jboss/netty/util/internal/ThreadLocalBoolean;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Boolean;

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    if-nez v4, :cond_1

    iget-object v4, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel$WriteRequestQueue;->this$0:Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;

    invoke-static {v4}, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;->access$100(Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 280
    iget-object v4, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel$WriteRequestQueue;->notifying:Lorg/jboss/netty/util/internal/ThreadLocalBoolean;

    sget-object v5, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v4, v5}, Lorg/jboss/netty/util/internal/ThreadLocalBoolean;->set(Ljava/lang/Object;)V

    .line 281
    iget-object v4, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel$WriteRequestQueue;->this$0:Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel;

    invoke-static {v4}, Lorg/jboss/netty/channel/Channels;->fireChannelInterestChanged(Lorg/jboss/netty/channel/Channel;)V

    .line 282
    iget-object v4, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel$WriteRequestQueue;->notifying:Lorg/jboss/netty/util/internal/ThreadLocalBoolean;

    sget-object v5, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v4, v5}, Lorg/jboss/netty/util/internal/ThreadLocalBoolean;->set(Ljava/lang/Object;)V

    .line 287
    .end local v1    # "lowWaterMark":I
    .end local v2    # "messageSize":I
    .end local v3    # "newWriteBufferSize":I
    :cond_1
    return-object v0
.end method

.method public bridge synthetic remove()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 175
    .local p0, "this":Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel$WriteRequestQueue;, "Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel<TC;>.WriteRequestQueue;"
    invoke-virtual {p0}, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel$WriteRequestQueue;->remove()Lorg/jboss/netty/channel/MessageEvent;

    move-result-object v0

    return-object v0
.end method

.method public remove()Lorg/jboss/netty/channel/MessageEvent;
    .locals 1

    .prologue
    .line 185
    .local p0, "this":Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel$WriteRequestQueue;, "Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel<TC;>.WriteRequestQueue;"
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel$WriteRequestQueue;->queue:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->remove()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/channel/MessageEvent;

    return-object v0
.end method

.method public remove(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 241
    .local p0, "this":Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel$WriteRequestQueue;, "Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel<TC;>.WriteRequestQueue;"
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel$WriteRequestQueue;->queue:Ljava/util/Queue;

    invoke-interface {v0, p1}, Ljava/util/Queue;->remove(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public removeAll(Ljava/util/Collection;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 225
    .local p0, "this":Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel$WriteRequestQueue;, "Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel<TC;>.WriteRequestQueue;"
    .local p1, "c":Ljava/util/Collection;, "Ljava/util/Collection<*>;"
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel$WriteRequestQueue;->queue:Ljava/util/Queue;

    invoke-interface {v0, p1}, Ljava/util/Queue;->removeAll(Ljava/util/Collection;)Z

    move-result v0

    return v0
.end method

.method public retainAll(Ljava/util/Collection;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<*>;)Z"
        }
    .end annotation

    .prologue
    .line 229
    .local p0, "this":Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel$WriteRequestQueue;, "Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel<TC;>.WriteRequestQueue;"
    .local p1, "c":Ljava/util/Collection;, "Ljava/util/Collection<*>;"
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel$WriteRequestQueue;->queue:Ljava/util/Queue;

    invoke-interface {v0, p1}, Ljava/util/Queue;->retainAll(Ljava/util/Collection;)Z

    move-result v0

    return v0
.end method

.method public size()I
    .locals 1

    .prologue
    .line 197
    .local p0, "this":Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel$WriteRequestQueue;, "Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel<TC;>.WriteRequestQueue;"
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel$WriteRequestQueue;->queue:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->size()I

    move-result v0

    return v0
.end method

.method public toArray()[Ljava/lang/Object;
    .locals 1

    .prologue
    .line 209
    .local p0, "this":Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel$WriteRequestQueue;, "Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel<TC;>.WriteRequestQueue;"
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel$WriteRequestQueue;->queue:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->toArray()[Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public toArray([Ljava/lang/Object;)[Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;)[TT;"
        }
    .end annotation

    .prologue
    .line 213
    .local p0, "this":Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel$WriteRequestQueue;, "Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel<TC;>.WriteRequestQueue;"
    .local p1, "a":[Ljava/lang/Object;, "[TT;"
    iget-object v0, p0, Lorg/jboss/netty/channel/socket/nio/AbstractNioChannel$WriteRequestQueue;->queue:Ljava/util/Queue;

    invoke-interface {v0, p1}, Ljava/util/Queue;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
