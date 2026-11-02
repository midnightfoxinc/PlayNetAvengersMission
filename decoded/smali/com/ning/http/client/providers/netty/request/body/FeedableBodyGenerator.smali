.class public Lcom/ning/http/client/providers/netty/request/body/FeedableBodyGenerator;
.super Ljava/lang/Object;
.source "FeedableBodyGenerator.java"

# interfaces
.implements Lcom/ning/http/client/BodyGenerator;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ning/http/client/providers/netty/request/body/FeedableBodyGenerator$1;,
        Lcom/ning/http/client/providers/netty/request/body/FeedableBodyGenerator$BodyPart;,
        Lcom/ning/http/client/providers/netty/request/body/FeedableBodyGenerator$PushBody;,
        Lcom/ning/http/client/providers/netty/request/body/FeedableBodyGenerator$FeedListener;
    }
.end annotation


# static fields
.field private static final END_PADDING:[B

.field private static final ZERO:[B


# instance fields
.field private listener:Lcom/ning/http/client/providers/netty/request/body/FeedableBodyGenerator$FeedListener;

.field private final queue:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue",
            "<",
            "Lcom/ning/http/client/providers/netty/request/body/FeedableBodyGenerator$BodyPart;",
            ">;"
        }
    .end annotation
.end field

.field private final queueSize:Ljava/util/concurrent/atomic/AtomicInteger;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 32
    const-string v0, "\r\n"

    sget-object v1, Ljava/nio/charset/StandardCharsets;->US_ASCII:Ljava/nio/charset/Charset;

    invoke-virtual {v0, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    sput-object v0, Lcom/ning/http/client/providers/netty/request/body/FeedableBodyGenerator;->END_PADDING:[B

    .line 33
    const-string v0, "0"

    sget-object v1, Ljava/nio/charset/StandardCharsets;->US_ASCII:Ljava/nio/charset/Charset;

    invoke-virtual {v0, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    sput-object v0, Lcom/ning/http/client/providers/netty/request/body/FeedableBodyGenerator;->ZERO:[B

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    new-instance v0, Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    iput-object v0, p0, Lcom/ning/http/client/providers/netty/request/body/FeedableBodyGenerator;->queue:Ljava/util/Queue;

    .line 35
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    iput-object v0, p0, Lcom/ning/http/client/providers/netty/request/body/FeedableBodyGenerator;->queueSize:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 114
    return-void
.end method

.method static synthetic access$100(Lcom/ning/http/client/providers/netty/request/body/FeedableBodyGenerator;)Ljava/util/Queue;
    .locals 1
    .param p0, "x0"    # Lcom/ning/http/client/providers/netty/request/body/FeedableBodyGenerator;

    .prologue
    .line 31
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/request/body/FeedableBodyGenerator;->queue:Ljava/util/Queue;

    return-object v0
.end method

.method static synthetic access$200()[B
    .locals 1

    .prologue
    .line 31
    sget-object v0, Lcom/ning/http/client/providers/netty/request/body/FeedableBodyGenerator;->ZERO:[B

    return-object v0
.end method

.method static synthetic access$300()[B
    .locals 1

    .prologue
    .line 31
    sget-object v0, Lcom/ning/http/client/providers/netty/request/body/FeedableBodyGenerator;->END_PADDING:[B

    return-object v0
.end method


# virtual methods
.method public createBody()Lcom/ning/http/client/Body;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 40
    new-instance v0, Lcom/ning/http/client/providers/netty/request/body/FeedableBodyGenerator$PushBody;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/ning/http/client/providers/netty/request/body/FeedableBodyGenerator$PushBody;-><init>(Lcom/ning/http/client/providers/netty/request/body/FeedableBodyGenerator;Lcom/ning/http/client/providers/netty/request/body/FeedableBodyGenerator$1;)V

    return-object v0
.end method

.method public feed(Ljava/nio/ByteBuffer;Z)V
    .locals 2
    .param p1, "buffer"    # Ljava/nio/ByteBuffer;
    .param p2, "isLast"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 44
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/request/body/FeedableBodyGenerator;->queue:Ljava/util/Queue;

    new-instance v1, Lcom/ning/http/client/providers/netty/request/body/FeedableBodyGenerator$BodyPart;

    invoke-direct {v1, p1, p2}, Lcom/ning/http/client/providers/netty/request/body/FeedableBodyGenerator$BodyPart;-><init>(Ljava/nio/ByteBuffer;Z)V

    invoke-interface {v0, v1}, Ljava/util/Queue;->offer(Ljava/lang/Object;)Z

    .line 45
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/request/body/FeedableBodyGenerator;->queueSize:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 46
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/request/body/FeedableBodyGenerator;->listener:Lcom/ning/http/client/providers/netty/request/body/FeedableBodyGenerator$FeedListener;

    if-eqz v0, :cond_0

    .line 47
    iget-object v0, p0, Lcom/ning/http/client/providers/netty/request/body/FeedableBodyGenerator;->listener:Lcom/ning/http/client/providers/netty/request/body/FeedableBodyGenerator$FeedListener;

    invoke-interface {v0}, Lcom/ning/http/client/providers/netty/request/body/FeedableBodyGenerator$FeedListener;->onContentAdded()V

    .line 49
    :cond_0
    return-void
.end method

.method public setListener(Lcom/ning/http/client/providers/netty/request/body/FeedableBodyGenerator$FeedListener;)V
    .locals 0
    .param p1, "listener"    # Lcom/ning/http/client/providers/netty/request/body/FeedableBodyGenerator$FeedListener;

    .prologue
    .line 56
    iput-object p1, p0, Lcom/ning/http/client/providers/netty/request/body/FeedableBodyGenerator;->listener:Lcom/ning/http/client/providers/netty/request/body/FeedableBodyGenerator$FeedListener;

    .line 57
    return-void
.end method
