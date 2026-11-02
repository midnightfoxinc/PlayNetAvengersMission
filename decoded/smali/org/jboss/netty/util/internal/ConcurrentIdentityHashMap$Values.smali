.class final Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Values;
.super Ljava/util/AbstractCollection;
.source "ConcurrentIdentityHashMap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "Values"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/AbstractCollection",
        "<TV;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap;


# direct methods
.method constructor <init>(Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap;)V
    .locals 0

    .prologue
    .line 1339
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Values;, "Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap<TK;TV;>.Values;"
    iput-object p1, p0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Values;->this$0:Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap;

    invoke-direct {p0}, Ljava/util/AbstractCollection;-><init>()V

    return-void
.end method


# virtual methods
.method public clear()V
    .locals 1

    .prologue
    .line 1362
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Values;, "Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap<TK;TV;>.Values;"
    iget-object v0, p0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Values;->this$0:Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap;

    invoke-virtual {v0}, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap;->clear()V

    .line 1363
    return-void
.end method

.method public contains(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 1357
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Values;, "Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap<TK;TV;>.Values;"
    iget-object v0, p0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Values;->this$0:Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap;

    invoke-virtual {v0, p1}, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap;->containsValue(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isEmpty()Z
    .locals 1

    .prologue
    .line 1352
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Values;, "Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap<TK;TV;>.Values;"
    iget-object v0, p0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Values;->this$0:Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap;

    invoke-virtual {v0}, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<TV;>;"
        }
    .end annotation

    .prologue
    .line 1342
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Values;, "Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap<TK;TV;>.Values;"
    new-instance v0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$ValueIterator;

    iget-object v1, p0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Values;->this$0:Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap;

    invoke-direct {v0, v1}, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$ValueIterator;-><init>(Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap;)V

    return-object v0
.end method

.method public size()I
    .locals 1

    .prologue
    .line 1347
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Values;, "Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap<TK;TV;>.Values;"
    iget-object v0, p0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$Values;->this$0:Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap;

    invoke-virtual {v0}, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap;->size()I

    move-result v0

    return v0
.end method
