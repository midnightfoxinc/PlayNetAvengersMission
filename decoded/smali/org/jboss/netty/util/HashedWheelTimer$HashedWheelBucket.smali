.class final Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelBucket;
.super Ljava/lang/Object;
.source "HashedWheelTimer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jboss/netty/util/HashedWheelTimer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "HashedWheelBucket"
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private head:Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;

.field private tail:Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 600
    const-class v0, Lorg/jboss/netty/util/HashedWheelTimer;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelBucket;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 600
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lorg/jboss/netty/util/HashedWheelTimer$1;)V
    .locals 0
    .param p1, "x0"    # Lorg/jboss/netty/util/HashedWheelTimer$1;

    .prologue
    .line 600
    invoke-direct {p0}, Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelBucket;-><init>()V

    return-void
.end method

.method private pollTimeout()Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 698
    iget-object v0, p0, Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelBucket;->head:Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;

    .line 699
    .local v0, "head":Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;
    if-nez v0, :cond_0

    move-object v0, v2

    .line 713
    .end local v0    # "head":Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;
    :goto_0
    return-object v0

    .line 702
    .restart local v0    # "head":Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;
    :cond_0
    iget-object v1, v0, Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;->next:Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;

    .line 703
    .local v1, "next":Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;
    if-nez v1, :cond_1

    .line 704
    iput-object v2, p0, Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelBucket;->head:Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;

    iput-object v2, p0, Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelBucket;->tail:Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;

    .line 711
    :goto_1
    iput-object v2, v0, Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;->next:Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;

    .line 712
    iput-object v2, v0, Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;->prev:Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;

    goto :goto_0

    .line 706
    :cond_1
    iput-object v1, p0, Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelBucket;->head:Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;

    .line 707
    iput-object v2, v1, Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;->prev:Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;

    goto :goto_1
.end method


# virtual methods
.method public addTimeout(Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;)V
    .locals 1
    .param p1, "timeout"    # Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;

    .prologue
    .line 610
    sget-boolean v0, Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelBucket;->$assertionsDisabled:Z

    if-nez v0, :cond_0

    iget-object v0, p1, Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;->bucket:Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelBucket;

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0}, Ljava/lang/AssertionError;-><init>()V

    throw v0

    .line 611
    :cond_0
    iput-object p0, p1, Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;->bucket:Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelBucket;

    .line 612
    iget-object v0, p0, Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelBucket;->head:Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;

    if-nez v0, :cond_1

    .line 613
    iput-object p1, p0, Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelBucket;->tail:Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;

    iput-object p1, p0, Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelBucket;->head:Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;

    .line 619
    :goto_0
    return-void

    .line 615
    :cond_1
    iget-object v0, p0, Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelBucket;->tail:Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;

    iput-object p1, v0, Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;->next:Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;

    .line 616
    iget-object v0, p0, Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelBucket;->tail:Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;

    iput-object v0, p1, Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;->prev:Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;

    .line 617
    iput-object p1, p0, Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelBucket;->tail:Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;

    goto :goto_0
.end method

.method public clearTimeouts(Ljava/util/Set;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Lorg/jboss/netty/util/Timeout;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 686
    .local p1, "set":Ljava/util/Set;, "Ljava/util/Set<Lorg/jboss/netty/util/Timeout;>;"
    :cond_0
    :goto_0
    invoke-direct {p0}, Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelBucket;->pollTimeout()Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;

    move-result-object v0

    .line 687
    .local v0, "timeout":Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;
    if-nez v0, :cond_1

    .line 688
    return-void

    .line 690
    :cond_1
    invoke-virtual {v0}, Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;->isExpired()Z

    move-result v1

    if-nez v1, :cond_0

    invoke-virtual {v0}, Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;->isCancelled()Z

    move-result v1

    if-nez v1, :cond_0

    .line 693
    invoke-interface {p1, v0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method public expireTimeouts(J)V
    .locals 11
    .param p1, "deadline"    # J

    .prologue
    .line 625
    iget-object v2, p0, Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelBucket;->head:Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;

    .line 628
    .local v2, "timeout":Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;
    :goto_0
    if-eqz v2, :cond_4

    .line 629
    const/4 v1, 0x0

    .line 630
    .local v1, "remove":Z
    iget-wide v4, v2, Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;->remainingRounds:J

    const-wide/16 v6, 0x0

    cmp-long v3, v4, v6

    if-gtz v3, :cond_2

    .line 631
    invoke-static {v2}, Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;->access$800(Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;)J

    move-result-wide v4

    cmp-long v3, v4, p1

    if-gtz v3, :cond_1

    .line 632
    invoke-virtual {v2}, Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;->expire()V

    .line 638
    const/4 v1, 0x1

    .line 645
    :goto_1
    iget-object v0, v2, Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;->next:Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;

    .line 646
    .local v0, "next":Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;
    if-eqz v1, :cond_0

    .line 647
    invoke-virtual {p0, v2}, Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelBucket;->remove(Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;)V

    .line 649
    :cond_0
    move-object v2, v0

    .line 650
    goto :goto_0

    .line 635
    .end local v0    # "next":Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;
    :cond_1
    new-instance v3, Ljava/lang/IllegalStateException;

    const-string v4, "timeout.deadline (%d) > deadline (%d)"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    invoke-static {v2}, Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;->access$800(Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;)J

    move-result-wide v8

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    aput-object v7, v5, v6

    const/4 v6, 0x1

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    aput-object v7, v5, v6

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 639
    :cond_2
    invoke-virtual {v2}, Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;->isCancelled()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 640
    const/4 v1, 0x1

    goto :goto_1

    .line 642
    :cond_3
    iget-wide v4, v2, Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;->remainingRounds:J

    const-wide/16 v6, 0x1

    sub-long/2addr v4, v6

    iput-wide v4, v2, Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;->remainingRounds:J

    goto :goto_1

    .line 651
    .end local v1    # "remove":Z
    :cond_4
    return-void
.end method

.method public remove(Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;)V
    .locals 4
    .param p1, "timeout"    # Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;

    .prologue
    const/4 v3, 0x0

    .line 654
    iget-object v0, p1, Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;->next:Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;

    .line 656
    .local v0, "next":Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;
    iget-object v1, p1, Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;->prev:Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;

    if-eqz v1, :cond_0

    .line 657
    iget-object v1, p1, Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;->prev:Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;

    iput-object v0, v1, Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;->next:Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;

    .line 659
    :cond_0
    iget-object v1, p1, Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;->next:Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;

    if-eqz v1, :cond_1

    .line 660
    iget-object v1, p1, Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;->next:Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;

    iget-object v2, p1, Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;->prev:Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;

    iput-object v2, v1, Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;->prev:Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;

    .line 663
    :cond_1
    iget-object v1, p0, Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelBucket;->head:Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;

    if-ne p1, v1, :cond_4

    .line 665
    iget-object v1, p0, Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelBucket;->tail:Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;

    if-ne p1, v1, :cond_3

    .line 666
    iput-object v3, p0, Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelBucket;->tail:Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;

    .line 667
    iput-object v3, p0, Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelBucket;->head:Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;

    .line 676
    :cond_2
    :goto_0
    iput-object v3, p1, Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;->prev:Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;

    .line 677
    iput-object v3, p1, Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;->next:Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;

    .line 678
    iput-object v3, p1, Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;->bucket:Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelBucket;

    .line 679
    return-void

    .line 669
    :cond_3
    iput-object v0, p0, Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelBucket;->head:Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;

    goto :goto_0

    .line 671
    :cond_4
    iget-object v1, p0, Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelBucket;->tail:Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;

    if-ne p1, v1, :cond_2

    .line 673
    iget-object v1, p1, Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;->prev:Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;

    iput-object v1, p0, Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelBucket;->tail:Lorg/jboss/netty/util/HashedWheelTimer$HashedWheelTimeout;

    goto :goto_0
.end method
