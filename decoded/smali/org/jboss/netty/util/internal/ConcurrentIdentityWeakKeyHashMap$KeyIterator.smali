.class final Lorg/jboss/netty/util/internal/ConcurrentIdentityWeakKeyHashMap$KeyIterator;
.super Lorg/jboss/netty/util/internal/ConcurrentIdentityWeakKeyHashMap$HashIterator;
.source "ConcurrentIdentityWeakKeyHashMap.java"

# interfaces
.implements Lorg/jboss/netty/util/internal/ReusableIterator;
.implements Ljava/util/Enumeration;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jboss/netty/util/internal/ConcurrentIdentityWeakKeyHashMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "KeyIterator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lorg/jboss/netty/util/internal/ConcurrentIdentityWeakKeyHashMap",
        "<TK;TV;>.HashIterator;",
        "Lorg/jboss/netty/util/internal/ReusableIterator",
        "<TK;>;",
        "Ljava/util/Enumeration",
        "<TK;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lorg/jboss/netty/util/internal/ConcurrentIdentityWeakKeyHashMap;


# direct methods
.method constructor <init>(Lorg/jboss/netty/util/internal/ConcurrentIdentityWeakKeyHashMap;)V
    .locals 0

    .prologue
    .line 1254
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentIdentityWeakKeyHashMap$KeyIterator;, "Lorg/jboss/netty/util/internal/ConcurrentIdentityWeakKeyHashMap<TK;TV;>.KeyIterator;"
    iput-object p1, p0, Lorg/jboss/netty/util/internal/ConcurrentIdentityWeakKeyHashMap$KeyIterator;->this$0:Lorg/jboss/netty/util/internal/ConcurrentIdentityWeakKeyHashMap;

    invoke-direct {p0, p1}, Lorg/jboss/netty/util/internal/ConcurrentIdentityWeakKeyHashMap$HashIterator;-><init>(Lorg/jboss/netty/util/internal/ConcurrentIdentityWeakKeyHashMap;)V

    return-void
.end method


# virtual methods
.method public next()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TK;"
        }
    .end annotation

    .prologue
    .line 1258
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentIdentityWeakKeyHashMap$KeyIterator;, "Lorg/jboss/netty/util/internal/ConcurrentIdentityWeakKeyHashMap<TK;TV;>.KeyIterator;"
    invoke-virtual {p0}, Lorg/jboss/netty/util/internal/ConcurrentIdentityWeakKeyHashMap$KeyIterator;->nextEntry()Lorg/jboss/netty/util/internal/ConcurrentIdentityWeakKeyHashMap$HashEntry;

    move-result-object v0

    invoke-virtual {v0}, Lorg/jboss/netty/util/internal/ConcurrentIdentityWeakKeyHashMap$HashEntry;->key()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public nextElement()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TK;"
        }
    .end annotation

    .prologue
    .line 1262
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentIdentityWeakKeyHashMap$KeyIterator;, "Lorg/jboss/netty/util/internal/ConcurrentIdentityWeakKeyHashMap<TK;TV;>.KeyIterator;"
    invoke-virtual {p0}, Lorg/jboss/netty/util/internal/ConcurrentIdentityWeakKeyHashMap$KeyIterator;->nextEntry()Lorg/jboss/netty/util/internal/ConcurrentIdentityWeakKeyHashMap$HashEntry;

    move-result-object v0

    invoke-virtual {v0}, Lorg/jboss/netty/util/internal/ConcurrentIdentityWeakKeyHashMap$HashEntry;->key()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
