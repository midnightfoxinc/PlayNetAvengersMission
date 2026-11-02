.class final Lorg/jboss/netty/util/internal/ConcurrentHashMap$Values;
.super Ljava/util/AbstractCollection;
.source "ConcurrentHashMap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jboss/netty/util/internal/ConcurrentHashMap;
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
.field final synthetic this$0:Lorg/jboss/netty/util/internal/ConcurrentHashMap;


# direct methods
.method constructor <init>(Lorg/jboss/netty/util/internal/ConcurrentHashMap;)V
    .locals 0

    .prologue
    .line 1324
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentHashMap$Values;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap<TK;TV;>.Values;"
    iput-object p1, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Values;->this$0:Lorg/jboss/netty/util/internal/ConcurrentHashMap;

    invoke-direct {p0}, Ljava/util/AbstractCollection;-><init>()V

    return-void
.end method


# virtual methods
.method public clear()V
    .locals 1

    .prologue
    .line 1347
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentHashMap$Values;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap<TK;TV;>.Values;"
    iget-object v0, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Values;->this$0:Lorg/jboss/netty/util/internal/ConcurrentHashMap;

    invoke-virtual {v0}, Lorg/jboss/netty/util/internal/ConcurrentHashMap;->clear()V

    .line 1348
    return-void
.end method

.method public contains(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 1342
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentHashMap$Values;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap<TK;TV;>.Values;"
    iget-object v0, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Values;->this$0:Lorg/jboss/netty/util/internal/ConcurrentHashMap;

    invoke-virtual {v0, p1}, Lorg/jboss/netty/util/internal/ConcurrentHashMap;->containsValue(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isEmpty()Z
    .locals 1

    .prologue
    .line 1337
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentHashMap$Values;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap<TK;TV;>.Values;"
    iget-object v0, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Values;->this$0:Lorg/jboss/netty/util/internal/ConcurrentHashMap;

    invoke-virtual {v0}, Lorg/jboss/netty/util/internal/ConcurrentHashMap;->isEmpty()Z

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
    .line 1327
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentHashMap$Values;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap<TK;TV;>.Values;"
    new-instance v0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$ValueIterator;

    iget-object v1, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Values;->this$0:Lorg/jboss/netty/util/internal/ConcurrentHashMap;

    invoke-direct {v0, v1}, Lorg/jboss/netty/util/internal/ConcurrentHashMap$ValueIterator;-><init>(Lorg/jboss/netty/util/internal/ConcurrentHashMap;)V

    return-object v0
.end method

.method public size()I
    .locals 1

    .prologue
    .line 1332
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentHashMap$Values;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap<TK;TV;>.Values;"
    iget-object v0, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$Values;->this$0:Lorg/jboss/netty/util/internal/ConcurrentHashMap;

    invoke-virtual {v0}, Lorg/jboss/netty/util/internal/ConcurrentHashMap;->size()I

    move-result v0

    return v0
.end method
