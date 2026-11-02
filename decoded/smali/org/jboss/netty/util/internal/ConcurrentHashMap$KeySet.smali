.class final Lorg/jboss/netty/util/internal/ConcurrentHashMap$KeySet;
.super Ljava/util/AbstractSet;
.source "ConcurrentHashMap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jboss/netty/util/internal/ConcurrentHashMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "KeySet"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/AbstractSet",
        "<TK;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lorg/jboss/netty/util/internal/ConcurrentHashMap;


# direct methods
.method constructor <init>(Lorg/jboss/netty/util/internal/ConcurrentHashMap;)V
    .locals 0

    .prologue
    .line 1292
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentHashMap$KeySet;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap<TK;TV;>.KeySet;"
    iput-object p1, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$KeySet;->this$0:Lorg/jboss/netty/util/internal/ConcurrentHashMap;

    invoke-direct {p0}, Ljava/util/AbstractSet;-><init>()V

    return-void
.end method


# virtual methods
.method public clear()V
    .locals 1

    .prologue
    .line 1320
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentHashMap$KeySet;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap<TK;TV;>.KeySet;"
    iget-object v0, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$KeySet;->this$0:Lorg/jboss/netty/util/internal/ConcurrentHashMap;

    invoke-virtual {v0}, Lorg/jboss/netty/util/internal/ConcurrentHashMap;->clear()V

    .line 1321
    return-void
.end method

.method public contains(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 1310
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentHashMap$KeySet;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap<TK;TV;>.KeySet;"
    iget-object v0, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$KeySet;->this$0:Lorg/jboss/netty/util/internal/ConcurrentHashMap;

    invoke-virtual {v0, p1}, Lorg/jboss/netty/util/internal/ConcurrentHashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isEmpty()Z
    .locals 1

    .prologue
    .line 1305
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentHashMap$KeySet;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap<TK;TV;>.KeySet;"
    iget-object v0, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$KeySet;->this$0:Lorg/jboss/netty/util/internal/ConcurrentHashMap;

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
            "<TK;>;"
        }
    .end annotation

    .prologue
    .line 1295
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentHashMap$KeySet;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap<TK;TV;>.KeySet;"
    new-instance v0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$KeyIterator;

    iget-object v1, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$KeySet;->this$0:Lorg/jboss/netty/util/internal/ConcurrentHashMap;

    invoke-direct {v0, v1}, Lorg/jboss/netty/util/internal/ConcurrentHashMap$KeyIterator;-><init>(Lorg/jboss/netty/util/internal/ConcurrentHashMap;)V

    return-object v0
.end method

.method public remove(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 1315
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentHashMap$KeySet;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap<TK;TV;>.KeySet;"
    iget-object v0, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$KeySet;->this$0:Lorg/jboss/netty/util/internal/ConcurrentHashMap;

    invoke-virtual {v0, p1}, Lorg/jboss/netty/util/internal/ConcurrentHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public size()I
    .locals 1

    .prologue
    .line 1300
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentHashMap$KeySet;, "Lorg/jboss/netty/util/internal/ConcurrentHashMap<TK;TV;>.KeySet;"
    iget-object v0, p0, Lorg/jboss/netty/util/internal/ConcurrentHashMap$KeySet;->this$0:Lorg/jboss/netty/util/internal/ConcurrentHashMap;

    invoke-virtual {v0}, Lorg/jboss/netty/util/internal/ConcurrentHashMap;->size()I

    move-result v0

    return v0
.end method
