.class final Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$ValueIterator;
.super Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashIterator;
.source "ConcurrentIdentityHashMap.java"

# interfaces
.implements Lorg/jboss/netty/util/internal/ReusableIterator;
.implements Ljava/util/Enumeration;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "ValueIterator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap",
        "<TK;TV;>.HashIterator;",
        "Lorg/jboss/netty/util/internal/ReusableIterator",
        "<TV;>;",
        "Ljava/util/Enumeration",
        "<TV;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap;


# direct methods
.method constructor <init>(Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap;)V
    .locals 0

    .prologue
    .line 1199
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$ValueIterator;, "Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap<TK;TV;>.ValueIterator;"
    iput-object p1, p0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$ValueIterator;->this$0:Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap;

    invoke-direct {p0, p1}, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashIterator;-><init>(Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap;)V

    return-void
.end method


# virtual methods
.method public next()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TV;"
        }
    .end annotation

    .prologue
    .line 1203
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$ValueIterator;, "Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap<TK;TV;>.ValueIterator;"
    invoke-virtual {p0}, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$ValueIterator;->nextEntry()Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;

    move-result-object v0

    invoke-virtual {v0}, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;->value()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public nextElement()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TV;"
        }
    .end annotation

    .prologue
    .line 1207
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$ValueIterator;, "Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap<TK;TV;>.ValueIterator;"
    invoke-virtual {p0}, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$ValueIterator;->nextEntry()Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;

    move-result-object v0

    invoke-virtual {v0}, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;->value()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
