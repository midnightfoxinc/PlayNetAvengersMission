.class final Lorg/jboss/netty/util/internal/AtomicFieldUpdaterUtil;
.super Ljava/lang/Object;
.source "AtomicFieldUpdaterUtil.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jboss/netty/util/internal/AtomicFieldUpdaterUtil$Node;
    }
.end annotation


# static fields
.field private static final AVAILABLE:Z


# direct methods
.method static constructor <clinit>()V
    .locals 6

    .prologue
    .line 30
    const/4 v0, 0x0

    .line 32
    .local v0, "available":Z
    :try_start_0
    const-class v3, Lorg/jboss/netty/util/internal/AtomicFieldUpdaterUtil$Node;

    const-class v4, Lorg/jboss/netty/util/internal/AtomicFieldUpdaterUtil$Node;

    const-string v5, "next"

    invoke-static {v3, v4, v5}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    move-result-object v2

    .line 37
    .local v2, "tmp":Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;, "Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater<Lorg/jboss/netty/util/internal/AtomicFieldUpdaterUtil$Node;Lorg/jboss/netty/util/internal/AtomicFieldUpdaterUtil$Node;>;"
    new-instance v1, Lorg/jboss/netty/util/internal/AtomicFieldUpdaterUtil$Node;

    invoke-direct {v1}, Lorg/jboss/netty/util/internal/AtomicFieldUpdaterUtil$Node;-><init>()V

    .line 38
    .local v1, "testNode":Lorg/jboss/netty/util/internal/AtomicFieldUpdaterUtil$Node;
    invoke-virtual {v2, v1, v1}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 39
    iget-object v3, v1, Lorg/jboss/netty/util/internal/AtomicFieldUpdaterUtil$Node;->next:Lorg/jboss/netty/util/internal/AtomicFieldUpdaterUtil$Node;

    if-eq v3, v1, :cond_0

    .line 41
    new-instance v3, Ljava/lang/Exception;

    invoke-direct {v3}, Ljava/lang/Exception;-><init>()V

    throw v3
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 44
    .end local v1    # "testNode":Lorg/jboss/netty/util/internal/AtomicFieldUpdaterUtil$Node;
    .end local v2    # "tmp":Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;, "Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater<Lorg/jboss/netty/util/internal/AtomicFieldUpdaterUtil$Node;Lorg/jboss/netty/util/internal/AtomicFieldUpdaterUtil$Node;>;"
    :catch_0
    move-exception v3

    .line 47
    :goto_0
    sput-boolean v0, Lorg/jboss/netty/util/internal/AtomicFieldUpdaterUtil;->AVAILABLE:Z

    .line 48
    return-void

    .line 43
    .restart local v1    # "testNode":Lorg/jboss/netty/util/internal/AtomicFieldUpdaterUtil$Node;
    .restart local v2    # "tmp":Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;, "Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater<Lorg/jboss/netty/util/internal/AtomicFieldUpdaterUtil$Node;Lorg/jboss/netty/util/internal/AtomicFieldUpdaterUtil$Node;>;"
    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 70
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 72
    return-void
.end method

.method static isAvailable()Z
    .locals 1

    .prologue
    .line 67
    sget-boolean v0, Lorg/jboss/netty/util/internal/AtomicFieldUpdaterUtil;->AVAILABLE:Z

    return v0
.end method

.method static newIntUpdater(Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;
    .locals 1
    .param p1, "fieldName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 59
    .local p0, "tclass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    sget-boolean v0, Lorg/jboss/netty/util/internal/AtomicFieldUpdaterUtil;->AVAILABLE:Z

    if-eqz v0, :cond_0

    .line 60
    invoke-static {p0, p1}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    move-result-object v0

    .line 62
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method static newRefUpdater(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;
    .locals 1
    .param p2, "fieldName"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class",
            "<TT;>;",
            "Ljava/lang/Class",
            "<TV;>;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater",
            "<TT;TV;>;"
        }
    .end annotation

    .prologue
    .line 51
    .local p0, "tclass":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    .local p1, "vclass":Ljava/lang/Class;, "Ljava/lang/Class<TV;>;"
    sget-boolean v0, Lorg/jboss/netty/util/internal/AtomicFieldUpdaterUtil;->AVAILABLE:Z

    if-eqz v0, :cond_0

    .line 52
    invoke-static {p0, p1, p2}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    move-result-object v0

    .line 54
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
