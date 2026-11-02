.class public abstract Lorg/jboss/netty/channel/AbstractChannel;
.super Ljava/lang/Object;
.source "AbstractChannel.java"

# interfaces
.implements Lorg/jboss/netty/channel/Channel;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jboss/netty/channel/AbstractChannel$ChannelCloseFuture;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z

.field private static final UNWRITABLE_UPDATER:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater",
            "<",
            "Lorg/jboss/netty/channel/AbstractChannel;",
            ">;"
        }
    .end annotation
.end field

.field static final allChannels:Ljava/util/concurrent/ConcurrentMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentMap",
            "<",
            "Ljava/lang/Integer;",
            "Lorg/jboss/netty/channel/Channel;",
            ">;"
        }
    .end annotation
.end field

.field private static final random:Ljava/util/Random;


# instance fields
.field private volatile attachment:Ljava/lang/Object;

.field private final closeFuture:Lorg/jboss/netty/channel/AbstractChannel$ChannelCloseFuture;

.field private final factory:Lorg/jboss/netty/channel/ChannelFactory;

.field private final id:Ljava/lang/Integer;

.field private volatile interestOps:I

.field private final parent:Lorg/jboss/netty/channel/Channel;

.field private final pipeline:Lorg/jboss/netty/channel/ChannelPipeline;

.field private strVal:Ljava/lang/String;

.field private strValConnected:Z

.field private final succeededFuture:Lorg/jboss/netty/channel/ChannelFuture;

.field private volatile unwritable:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 28
    const-class v0, Lorg/jboss/netty/channel/AbstractChannel;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lorg/jboss/netty/channel/AbstractChannel;->$assertionsDisabled:Z

    .line 30
    new-instance v0, Lorg/jboss/netty/util/internal/ConcurrentHashMap;

    invoke-direct {v0}, Lorg/jboss/netty/util/internal/ConcurrentHashMap;-><init>()V

    sput-object v0, Lorg/jboss/netty/channel/AbstractChannel;->allChannels:Ljava/util/concurrent/ConcurrentMap;

    .line 32
    new-instance v0, Ljava/util/Random;

    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    sput-object v0, Lorg/jboss/netty/channel/AbstractChannel;->random:Ljava/util/Random;

    .line 67
    const-class v0, Lorg/jboss/netty/channel/AbstractChannel;

    const-string v1, "unwritable"

    invoke-static {v0, v1}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    move-result-object v0

    sput-object v0, Lorg/jboss/netty/channel/AbstractChannel;->UNWRITABLE_UPDATER:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    .line 68
    return-void

    .line 28
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected constructor <init>(Ljava/lang/Integer;Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/channel/ChannelFactory;Lorg/jboss/netty/channel/ChannelPipeline;Lorg/jboss/netty/channel/ChannelSink;)V
    .locals 1
    .param p1, "id"    # Ljava/lang/Integer;
    .param p2, "parent"    # Lorg/jboss/netty/channel/Channel;
    .param p3, "factory"    # Lorg/jboss/netty/channel/ChannelFactory;
    .param p4, "pipeline"    # Lorg/jboss/netty/channel/ChannelPipeline;
    .param p5, "sink"    # Lorg/jboss/netty/channel/ChannelSink;

    .prologue
    .line 113
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    new-instance v0, Lorg/jboss/netty/channel/SucceededChannelFuture;

    invoke-direct {v0, p0}, Lorg/jboss/netty/channel/SucceededChannelFuture;-><init>(Lorg/jboss/netty/channel/Channel;)V

    iput-object v0, p0, Lorg/jboss/netty/channel/AbstractChannel;->succeededFuture:Lorg/jboss/netty/channel/ChannelFuture;

    .line 54
    new-instance v0, Lorg/jboss/netty/channel/AbstractChannel$ChannelCloseFuture;

    invoke-direct {v0, p0}, Lorg/jboss/netty/channel/AbstractChannel$ChannelCloseFuture;-><init>(Lorg/jboss/netty/channel/AbstractChannel;)V

    iput-object v0, p0, Lorg/jboss/netty/channel/AbstractChannel;->closeFuture:Lorg/jboss/netty/channel/AbstractChannel$ChannelCloseFuture;

    .line 55
    const/4 v0, 0x1

    iput v0, p0, Lorg/jboss/netty/channel/AbstractChannel;->interestOps:I

    .line 115
    iput-object p1, p0, Lorg/jboss/netty/channel/AbstractChannel;->id:Ljava/lang/Integer;

    .line 116
    iput-object p2, p0, Lorg/jboss/netty/channel/AbstractChannel;->parent:Lorg/jboss/netty/channel/Channel;

    .line 117
    iput-object p3, p0, Lorg/jboss/netty/channel/AbstractChannel;->factory:Lorg/jboss/netty/channel/ChannelFactory;

    .line 118
    iput-object p4, p0, Lorg/jboss/netty/channel/AbstractChannel;->pipeline:Lorg/jboss/netty/channel/ChannelPipeline;

    .line 119
    invoke-interface {p4, p0, p5}, Lorg/jboss/netty/channel/ChannelPipeline;->attach(Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/channel/ChannelSink;)V

    .line 120
    return-void
.end method

.method protected constructor <init>(Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/channel/ChannelFactory;Lorg/jboss/netty/channel/ChannelPipeline;Lorg/jboss/netty/channel/ChannelSink;)V
    .locals 1
    .param p1, "parent"    # Lorg/jboss/netty/channel/Channel;
    .param p2, "factory"    # Lorg/jboss/netty/channel/ChannelFactory;
    .param p3, "pipeline"    # Lorg/jboss/netty/channel/ChannelPipeline;
    .param p4, "sink"    # Lorg/jboss/netty/channel/ChannelSink;

    .prologue
    .line 85
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    new-instance v0, Lorg/jboss/netty/channel/SucceededChannelFuture;

    invoke-direct {v0, p0}, Lorg/jboss/netty/channel/SucceededChannelFuture;-><init>(Lorg/jboss/netty/channel/Channel;)V

    iput-object v0, p0, Lorg/jboss/netty/channel/AbstractChannel;->succeededFuture:Lorg/jboss/netty/channel/ChannelFuture;

    .line 54
    new-instance v0, Lorg/jboss/netty/channel/AbstractChannel$ChannelCloseFuture;

    invoke-direct {v0, p0}, Lorg/jboss/netty/channel/AbstractChannel$ChannelCloseFuture;-><init>(Lorg/jboss/netty/channel/AbstractChannel;)V

    iput-object v0, p0, Lorg/jboss/netty/channel/AbstractChannel;->closeFuture:Lorg/jboss/netty/channel/AbstractChannel$ChannelCloseFuture;

    .line 55
    const/4 v0, 0x1

    iput v0, p0, Lorg/jboss/netty/channel/AbstractChannel;->interestOps:I

    .line 87
    iput-object p1, p0, Lorg/jboss/netty/channel/AbstractChannel;->parent:Lorg/jboss/netty/channel/Channel;

    .line 88
    iput-object p2, p0, Lorg/jboss/netty/channel/AbstractChannel;->factory:Lorg/jboss/netty/channel/ChannelFactory;

    .line 89
    iput-object p3, p0, Lorg/jboss/netty/channel/AbstractChannel;->pipeline:Lorg/jboss/netty/channel/ChannelPipeline;

    .line 91
    invoke-static {p0}, Lorg/jboss/netty/channel/AbstractChannel;->allocateId(Lorg/jboss/netty/channel/Channel;)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lorg/jboss/netty/channel/AbstractChannel;->id:Ljava/lang/Integer;

    .line 93
    invoke-interface {p3, p0, p4}, Lorg/jboss/netty/channel/ChannelPipeline;->attach(Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/channel/ChannelSink;)V

    .line 94
    return-void
.end method

.method private static allocateId(Lorg/jboss/netty/channel/Channel;)Ljava/lang/Integer;
    .locals 2
    .param p0, "channel"    # Lorg/jboss/netty/channel/Channel;

    .prologue
    .line 35
    sget-object v1, Lorg/jboss/netty/channel/AbstractChannel;->random:Ljava/util/Random;

    invoke-virtual {v1}, Ljava/util/Random;->nextInt()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    .line 39
    .local v0, "id":Ljava/lang/Integer;
    :goto_0
    sget-object v1, Lorg/jboss/netty/channel/AbstractChannel;->allChannels:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v1, v0, p0}, Ljava/util/concurrent/ConcurrentMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_0

    .line 41
    return-object v0

    .line 44
    :cond_0
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    goto :goto_0
.end method

.method private clearUserDefinedWritability(I)V
    .locals 7
    .param p1, "index"    # I

    .prologue
    .line 289
    invoke-static {p1}, Lorg/jboss/netty/channel/AbstractChannel;->writabilityMask(I)I

    move-result v0

    .line 291
    .local v0, "mask":I
    :cond_0
    iget v2, p0, Lorg/jboss/netty/channel/AbstractChannel;->unwritable:I

    .line 292
    .local v2, "oldValue":I
    or-int v1, v2, v0

    .line 293
    .local v1, "newValue":I
    sget-object v3, Lorg/jboss/netty/channel/AbstractChannel;->UNWRITABLE_UPDATER:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    invoke-virtual {v3, p0, v2, v1}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->compareAndSet(Ljava/lang/Object;II)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 294
    if-nez v2, :cond_1

    if-eqz v1, :cond_1

    .line 295
    invoke-virtual {p0}, Lorg/jboss/netty/channel/AbstractChannel;->getPipeline()Lorg/jboss/netty/channel/ChannelPipeline;

    move-result-object v3

    new-instance v4, Lorg/jboss/netty/channel/UpstreamChannelStateEvent;

    sget-object v5, Lorg/jboss/netty/channel/ChannelState;->INTEREST_OPS:Lorg/jboss/netty/channel/ChannelState;

    invoke-virtual {p0}, Lorg/jboss/netty/channel/AbstractChannel;->getInterestOps()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-direct {v4, p0, v5, v6}, Lorg/jboss/netty/channel/UpstreamChannelStateEvent;-><init>(Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/channel/ChannelState;Ljava/lang/Object;)V

    invoke-interface {v3, v4}, Lorg/jboss/netty/channel/ChannelPipeline;->sendUpstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 302
    :cond_1
    return-void
.end method

.method private getIdString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 406
    iget-object v1, p0, Lorg/jboss/netty/channel/AbstractChannel;->id:Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v0

    .line 407
    .local v0, "answer":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 433
    :goto_0
    return-object v0

    .line 409
    :pswitch_0
    const-string v0, "00000000"

    .line 410
    goto :goto_0

    .line 412
    :pswitch_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "0000000"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 413
    goto :goto_0

    .line 415
    :pswitch_2
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "000000"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 416
    goto :goto_0

    .line 418
    :pswitch_3
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "00000"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 419
    goto :goto_0

    .line 421
    :pswitch_4
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "0000"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 422
    goto :goto_0

    .line 424
    :pswitch_5
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "000"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 425
    goto :goto_0

    .line 427
    :pswitch_6
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "00"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 428
    goto :goto_0

    .line 430
    :pswitch_7
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const/16 v2, 0x30

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_0

    .line 407
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
    .end packed-switch
.end method

.method private setUserDefinedWritability(I)V
    .locals 7
    .param p1, "index"    # I

    .prologue
    .line 273
    invoke-static {p1}, Lorg/jboss/netty/channel/AbstractChannel;->writabilityMask(I)I

    move-result v3

    xor-int/lit8 v0, v3, -0x1

    .line 275
    .local v0, "mask":I
    :cond_0
    iget v2, p0, Lorg/jboss/netty/channel/AbstractChannel;->unwritable:I

    .line 276
    .local v2, "oldValue":I
    and-int v1, v2, v0

    .line 277
    .local v1, "newValue":I
    sget-object v3, Lorg/jboss/netty/channel/AbstractChannel;->UNWRITABLE_UPDATER:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    invoke-virtual {v3, p0, v2, v1}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->compareAndSet(Ljava/lang/Object;II)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 278
    if-eqz v2, :cond_1

    if-nez v1, :cond_1

    .line 279
    invoke-virtual {p0}, Lorg/jboss/netty/channel/AbstractChannel;->getPipeline()Lorg/jboss/netty/channel/ChannelPipeline;

    move-result-object v3

    new-instance v4, Lorg/jboss/netty/channel/UpstreamChannelStateEvent;

    sget-object v5, Lorg/jboss/netty/channel/ChannelState;->INTEREST_OPS:Lorg/jboss/netty/channel/ChannelState;

    invoke-virtual {p0}, Lorg/jboss/netty/channel/AbstractChannel;->getInterestOps()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-direct {v4, p0, v5, v6}, Lorg/jboss/netty/channel/UpstreamChannelStateEvent;-><init>(Lorg/jboss/netty/channel/Channel;Lorg/jboss/netty/channel/ChannelState;Ljava/lang/Object;)V

    invoke-interface {v3, v4}, Lorg/jboss/netty/channel/ChannelPipeline;->sendUpstream(Lorg/jboss/netty/channel/ChannelEvent;)V

    .line 286
    :cond_1
    return-void
.end method

.method private static writabilityMask(I)I
    .locals 3
    .param p0, "index"    # I

    .prologue
    const/4 v1, 0x1

    .line 305
    if-lt p0, v1, :cond_0

    const/16 v0, 0x1f

    if-le p0, v0, :cond_1

    .line 306
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "index: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " (expected: 1~31)"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 308
    :cond_1
    shl-int v0, v1, p0

    return v0
.end method


# virtual methods
.method public bind(Ljava/net/SocketAddress;)Lorg/jboss/netty/channel/ChannelFuture;
    .locals 1
    .param p1, "localAddress"    # Ljava/net/SocketAddress;

    .prologue
    .line 198
    invoke-static {p0, p1}, Lorg/jboss/netty/channel/Channels;->bind(Lorg/jboss/netty/channel/Channel;Ljava/net/SocketAddress;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v0

    return-object v0
.end method

.method public close()Lorg/jboss/netty/channel/ChannelFuture;
    .locals 2

    .prologue
    .line 206
    invoke-static {p0}, Lorg/jboss/netty/channel/Channels;->close(Lorg/jboss/netty/channel/Channel;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v0

    .line 207
    .local v0, "returnedCloseFuture":Lorg/jboss/netty/channel/ChannelFuture;
    sget-boolean v1, Lorg/jboss/netty/channel/AbstractChannel;->$assertionsDisabled:Z

    if-nez v1, :cond_0

    iget-object v1, p0, Lorg/jboss/netty/channel/AbstractChannel;->closeFuture:Lorg/jboss/netty/channel/AbstractChannel$ChannelCloseFuture;

    if-eq v1, v0, :cond_0

    new-instance v1, Ljava/lang/AssertionError;

    invoke-direct {v1}, Ljava/lang/AssertionError;-><init>()V

    throw v1

    .line 208
    :cond_0
    iget-object v1, p0, Lorg/jboss/netty/channel/AbstractChannel;->closeFuture:Lorg/jboss/netty/channel/AbstractChannel$ChannelCloseFuture;

    return-object v1
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 28
    check-cast p1, Lorg/jboss/netty/channel/Channel;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lorg/jboss/netty/channel/AbstractChannel;->compareTo(Lorg/jboss/netty/channel/Channel;)I

    move-result v0

    return v0
.end method

.method public final compareTo(Lorg/jboss/netty/channel/Channel;)I
    .locals 2
    .param p1, "o"    # Lorg/jboss/netty/channel/Channel;

    .prologue
    .line 174
    invoke-virtual {p0}, Lorg/jboss/netty/channel/AbstractChannel;->getId()Ljava/lang/Integer;

    move-result-object v0

    invoke-interface {p1}, Lorg/jboss/netty/channel/Channel;->getId()Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Integer;->compareTo(Ljava/lang/Integer;)I

    move-result v0

    return v0
.end method

.method public connect(Ljava/net/SocketAddress;)Lorg/jboss/netty/channel/ChannelFuture;
    .locals 1
    .param p1, "remoteAddress"    # Ljava/net/SocketAddress;

    .prologue
    .line 216
    invoke-static {p0, p1}, Lorg/jboss/netty/channel/Channels;->connect(Lorg/jboss/netty/channel/Channel;Ljava/net/SocketAddress;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v0

    return-object v0
.end method

.method public disconnect()Lorg/jboss/netty/channel/ChannelFuture;
    .locals 1

    .prologue
    .line 220
    invoke-static {p0}, Lorg/jboss/netty/channel/Channels;->disconnect(Lorg/jboss/netty/channel/Channel;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v0

    return-object v0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 167
    if-ne p0, p1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getAttachment()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 356
    iget-object v0, p0, Lorg/jboss/netty/channel/AbstractChannel;->attachment:Ljava/lang/Object;

    return-object v0
.end method

.method public getCloseFuture()Lorg/jboss/netty/channel/ChannelFuture;
    .locals 1

    .prologue
    .line 212
    iget-object v0, p0, Lorg/jboss/netty/channel/AbstractChannel;->closeFuture:Lorg/jboss/netty/channel/AbstractChannel$ChannelCloseFuture;

    return-object v0
.end method

.method public getFactory()Lorg/jboss/netty/channel/ChannelFactory;
    .locals 1

    .prologue
    .line 131
    iget-object v0, p0, Lorg/jboss/netty/channel/AbstractChannel;->factory:Lorg/jboss/netty/channel/ChannelFactory;

    return-object v0
.end method

.method public final getId()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 123
    iget-object v0, p0, Lorg/jboss/netty/channel/AbstractChannel;->id:Ljava/lang/Integer;

    return-object v0
.end method

.method public getInterestOps()I
    .locals 2

    .prologue
    .line 224
    invoke-virtual {p0}, Lorg/jboss/netty/channel/AbstractChannel;->isOpen()Z

    move-result v1

    if-nez v1, :cond_1

    .line 225
    const/4 v0, 0x4

    .line 232
    :cond_0
    :goto_0
    return v0

    .line 228
    :cond_1
    invoke-virtual {p0}, Lorg/jboss/netty/channel/AbstractChannel;->getInternalInterestOps()I

    move-result v1

    and-int/lit8 v0, v1, -0x5

    .line 229
    .local v0, "interestOps":I
    invoke-virtual {p0}, Lorg/jboss/netty/channel/AbstractChannel;->isWritable()Z

    move-result v1

    if-nez v1, :cond_0

    .line 230
    or-int/lit8 v0, v0, 0x4

    goto :goto_0
.end method

.method protected getInternalInterestOps()I
    .locals 1

    .prologue
    .line 240
    iget v0, p0, Lorg/jboss/netty/channel/AbstractChannel;->interestOps:I

    return v0
.end method

.method public getParent()Lorg/jboss/netty/channel/Channel;
    .locals 1

    .prologue
    .line 127
    iget-object v0, p0, Lorg/jboss/netty/channel/AbstractChannel;->parent:Lorg/jboss/netty/channel/Channel;

    return-object v0
.end method

.method public getPipeline()Lorg/jboss/netty/channel/ChannelPipeline;
    .locals 1

    .prologue
    .line 135
    iget-object v0, p0, Lorg/jboss/netty/channel/AbstractChannel;->pipeline:Lorg/jboss/netty/channel/ChannelPipeline;

    return-object v0
.end method

.method protected getSucceededFuture()Lorg/jboss/netty/channel/ChannelFuture;
    .locals 1

    .prologue
    .line 142
    iget-object v0, p0, Lorg/jboss/netty/channel/AbstractChannel;->succeededFuture:Lorg/jboss/netty/channel/ChannelFuture;

    return-object v0
.end method

.method protected getUnsupportedOperationFuture()Lorg/jboss/netty/channel/ChannelFuture;
    .locals 2

    .prologue
    .line 150
    new-instance v0, Lorg/jboss/netty/channel/FailedChannelFuture;

    new-instance v1, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v1}, Ljava/lang/UnsupportedOperationException;-><init>()V

    invoke-direct {v0, p0, v1}, Lorg/jboss/netty/channel/FailedChannelFuture;-><init>(Lorg/jboss/netty/channel/Channel;Ljava/lang/Throwable;)V

    return-object v0
.end method

.method public final getUserDefinedWritability(I)Z
    .locals 2
    .param p1, "index"    # I

    .prologue
    .line 261
    iget v0, p0, Lorg/jboss/netty/channel/AbstractChannel;->unwritable:I

    invoke-static {p1}, Lorg/jboss/netty/channel/AbstractChannel;->writabilityMask(I)I

    move-result v1

    and-int/2addr v0, v1

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final hashCode()I
    .locals 1

    .prologue
    .line 158
    iget-object v0, p0, Lorg/jboss/netty/channel/AbstractChannel;->id:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method public isOpen()Z
    .locals 1

    .prologue
    .line 178
    iget-object v0, p0, Lorg/jboss/netty/channel/AbstractChannel;->closeFuture:Lorg/jboss/netty/channel/AbstractChannel$ChannelCloseFuture;

    invoke-virtual {v0}, Lorg/jboss/netty/channel/AbstractChannel$ChannelCloseFuture;->isDone()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isReadable()Z
    .locals 1

    .prologue
    .line 253
    invoke-virtual {p0}, Lorg/jboss/netty/channel/AbstractChannel;->getInternalInterestOps()I

    move-result v0

    and-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isWritable()Z
    .locals 1

    .prologue
    .line 257
    iget v0, p0, Lorg/jboss/netty/channel/AbstractChannel;->unwritable:I

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setAttachment(Ljava/lang/Object;)V
    .locals 0
    .param p1, "attachment"    # Ljava/lang/Object;

    .prologue
    .line 360
    iput-object p1, p0, Lorg/jboss/netty/channel/AbstractChannel;->attachment:Ljava/lang/Object;

    .line 361
    return-void
.end method

.method protected setClosed()Z
    .locals 2

    .prologue
    .line 192
    sget-object v0, Lorg/jboss/netty/channel/AbstractChannel;->allChannels:Ljava/util/concurrent/ConcurrentMap;

    iget-object v1, p0, Lorg/jboss/netty/channel/AbstractChannel;->id:Ljava/lang/Integer;

    invoke-interface {v0, v1}, Ljava/util/concurrent/ConcurrentMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 194
    iget-object v0, p0, Lorg/jboss/netty/channel/AbstractChannel;->closeFuture:Lorg/jboss/netty/channel/AbstractChannel$ChannelCloseFuture;

    invoke-virtual {v0}, Lorg/jboss/netty/channel/AbstractChannel$ChannelCloseFuture;->setClosed()Z

    move-result v0

    return v0
.end method

.method public setInterestOps(I)Lorg/jboss/netty/channel/ChannelFuture;
    .locals 1
    .param p1, "interestOps"    # I

    .prologue
    .line 236
    invoke-static {p0, p1}, Lorg/jboss/netty/channel/Channels;->setInterestOps(Lorg/jboss/netty/channel/Channel;I)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v0

    return-object v0
.end method

.method protected setInternalInterestOps(I)V
    .locals 0
    .param p1, "interestOps"    # I

    .prologue
    .line 249
    iput p1, p0, Lorg/jboss/netty/channel/AbstractChannel;->interestOps:I

    .line 250
    return-void
.end method

.method public setReadable(Z)Lorg/jboss/netty/channel/ChannelFuture;
    .locals 1
    .param p1, "readable"    # Z

    .prologue
    .line 340
    if-eqz p1, :cond_0

    .line 341
    invoke-virtual {p0}, Lorg/jboss/netty/channel/AbstractChannel;->getInterestOps()I

    move-result v0

    or-int/lit8 v0, v0, 0x1

    invoke-virtual {p0, v0}, Lorg/jboss/netty/channel/AbstractChannel;->setInterestOps(I)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v0

    .line 343
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Lorg/jboss/netty/channel/AbstractChannel;->getInterestOps()I

    move-result v0

    and-int/lit8 v0, v0, -0x2

    invoke-virtual {p0, v0}, Lorg/jboss/netty/channel/AbstractChannel;->setInterestOps(I)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v0

    goto :goto_0
.end method

.method protected setUnwritable()Z
    .locals 3

    .prologue
    .line 327
    :cond_0
    iget v1, p0, Lorg/jboss/netty/channel/AbstractChannel;->unwritable:I

    .line 328
    .local v1, "oldValue":I
    or-int/lit8 v0, v1, 0x1

    .line 329
    .local v0, "newValue":I
    sget-object v2, Lorg/jboss/netty/channel/AbstractChannel;->UNWRITABLE_UPDATER:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    invoke-virtual {v2, p0, v1, v0}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->compareAndSet(Ljava/lang/Object;II)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 330
    if-nez v1, :cond_1

    if-eqz v0, :cond_1

    .line 331
    const/4 v2, 0x1

    .line 336
    :goto_0
    return v2

    :cond_1
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public final setUserDefinedWritability(IZ)V
    .locals 0
    .param p1, "index"    # I
    .param p2, "writable"    # Z

    .prologue
    .line 265
    if-eqz p2, :cond_0

    .line 266
    invoke-direct {p0, p1}, Lorg/jboss/netty/channel/AbstractChannel;->setUserDefinedWritability(I)V

    .line 270
    :goto_0
    return-void

    .line 268
    :cond_0
    invoke-direct {p0, p1}, Lorg/jboss/netty/channel/AbstractChannel;->clearUserDefinedWritability(I)V

    goto :goto_0
.end method

.method protected setWritable()Z
    .locals 3

    .prologue
    .line 313
    :cond_0
    iget v1, p0, Lorg/jboss/netty/channel/AbstractChannel;->unwritable:I

    .line 314
    .local v1, "oldValue":I
    and-int/lit8 v0, v1, -0x2

    .line 315
    .local v0, "newValue":I
    sget-object v2, Lorg/jboss/netty/channel/AbstractChannel;->UNWRITABLE_UPDATER:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    invoke-virtual {v2, p0, v1, v0}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->compareAndSet(Ljava/lang/Object;II)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 316
    if-eqz v1, :cond_1

    if-nez v0, :cond_1

    .line 317
    const/4 v2, 0x1

    .line 322
    :goto_0
    return v2

    :cond_1
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 6

    .prologue
    .line 370
    invoke-virtual {p0}, Lorg/jboss/netty/channel/AbstractChannel;->isConnected()Z

    move-result v1

    .line 371
    .local v1, "connected":Z
    iget-boolean v5, p0, Lorg/jboss/netty/channel/AbstractChannel;->strValConnected:Z

    if-ne v5, v1, :cond_0

    iget-object v5, p0, Lorg/jboss/netty/channel/AbstractChannel;->strVal:Ljava/lang/String;

    if-eqz v5, :cond_0

    .line 372
    iget-object v4, p0, Lorg/jboss/netty/channel/AbstractChannel;->strVal:Ljava/lang/String;

    .line 402
    :goto_0
    return-object v4

    .line 375
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v5, 0x80

    invoke-direct {v0, v5}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 376
    .local v0, "buf":Ljava/lang/StringBuilder;
    const-string v5, "[id: 0x"

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 377
    invoke-direct {p0}, Lorg/jboss/netty/channel/AbstractChannel;->getIdString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 379
    invoke-virtual {p0}, Lorg/jboss/netty/channel/AbstractChannel;->getLocalAddress()Ljava/net/SocketAddress;

    move-result-object v2

    .line 380
    .local v2, "localAddress":Ljava/net/SocketAddress;
    invoke-virtual {p0}, Lorg/jboss/netty/channel/AbstractChannel;->getRemoteAddress()Ljava/net/SocketAddress;

    move-result-object v3

    .line 381
    .local v3, "remoteAddress":Ljava/net/SocketAddress;
    if-eqz v3, :cond_5

    .line 382
    const-string v5, ", "

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 383
    invoke-virtual {p0}, Lorg/jboss/netty/channel/AbstractChannel;->getParent()Lorg/jboss/netty/channel/Channel;

    move-result-object v5

    if-nez v5, :cond_3

    .line 384
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 385
    if-eqz v1, :cond_2

    const-string v5, " => "

    :goto_1
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 386
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 397
    :cond_1
    :goto_2
    const/16 v5, 0x5d

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 399
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 400
    .local v4, "strVal":Ljava/lang/String;
    iput-object v4, p0, Lorg/jboss/netty/channel/AbstractChannel;->strVal:Ljava/lang/String;

    .line 401
    iput-boolean v1, p0, Lorg/jboss/netty/channel/AbstractChannel;->strValConnected:Z

    goto :goto_0

    .line 385
    .end local v4    # "strVal":Ljava/lang/String;
    :cond_2
    const-string v5, " :> "

    goto :goto_1

    .line 388
    :cond_3
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 389
    if-eqz v1, :cond_4

    const-string v5, " => "

    :goto_3
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 390
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 389
    :cond_4
    const-string v5, " :> "

    goto :goto_3

    .line 392
    :cond_5
    if-eqz v2, :cond_1

    .line 393
    const-string v5, ", "

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 394
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    goto :goto_2
.end method

.method public unbind()Lorg/jboss/netty/channel/ChannelFuture;
    .locals 1

    .prologue
    .line 202
    invoke-static {p0}, Lorg/jboss/netty/channel/Channels;->unbind(Lorg/jboss/netty/channel/Channel;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v0

    return-object v0
.end method

.method public write(Ljava/lang/Object;)Lorg/jboss/netty/channel/ChannelFuture;
    .locals 1
    .param p1, "message"    # Ljava/lang/Object;

    .prologue
    .line 348
    invoke-static {p0, p1}, Lorg/jboss/netty/channel/Channels;->write(Lorg/jboss/netty/channel/Channel;Ljava/lang/Object;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v0

    return-object v0
.end method

.method public write(Ljava/lang/Object;Ljava/net/SocketAddress;)Lorg/jboss/netty/channel/ChannelFuture;
    .locals 1
    .param p1, "message"    # Ljava/lang/Object;
    .param p2, "remoteAddress"    # Ljava/net/SocketAddress;

    .prologue
    .line 352
    invoke-static {p0, p1, p2}, Lorg/jboss/netty/channel/Channels;->write(Lorg/jboss/netty/channel/Channel;Ljava/lang/Object;Ljava/net/SocketAddress;)Lorg/jboss/netty/channel/ChannelFuture;

    move-result-object v0

    return-object v0
.end method
