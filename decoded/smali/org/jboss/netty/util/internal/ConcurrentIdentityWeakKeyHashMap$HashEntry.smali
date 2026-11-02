.class final Lorg/jboss/netty/util/internal/ConcurrentIdentityWeakKeyHashMap$HashEntry;
.super Ljava/lang/Object;
.source "ConcurrentIdentityWeakKeyHashMap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jboss/netty/util/internal/ConcurrentIdentityWeakKeyHashMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "HashEntry"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field final hash:I

.field final keyRef:Ljava/lang/Object;

.field final next:Lorg/jboss/netty/util/internal/ConcurrentIdentityWeakKeyHashMap$HashEntry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/jboss/netty/util/internal/ConcurrentIdentityWeakKeyHashMap$HashEntry",
            "<TK;TV;>;"
        }
    .end annotation
.end field

.field volatile valueRef:Ljava/lang/Object;


# direct methods
.method constructor <init>(Ljava/lang/Object;ILorg/jboss/netty/util/internal/ConcurrentIdentityWeakKeyHashMap$HashEntry;Ljava/lang/Object;Ljava/lang/ref/ReferenceQueue;)V
    .locals 1
    .param p2, "hash"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;I",
            "Lorg/jboss/netty/util/internal/ConcurrentIdentityWeakKeyHashMap$HashEntry",
            "<TK;TV;>;TV;",
            "Ljava/lang/ref/ReferenceQueue",
            "<",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 193
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentIdentityWeakKeyHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentIdentityWeakKeyHashMap$HashEntry<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    .local p3, "next":Lorg/jboss/netty/util/internal/ConcurrentIdentityWeakKeyHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentIdentityWeakKeyHashMap$HashEntry<TK;TV;>;"
    .local p4, "value":Ljava/lang/Object;, "TV;"
    .local p5, "refQueue":Ljava/lang/ref/ReferenceQueue;, "Ljava/lang/ref/ReferenceQueue<Ljava/lang/Object;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 194
    iput p2, p0, Lorg/jboss/netty/util/internal/ConcurrentIdentityWeakKeyHashMap$HashEntry;->hash:I

    .line 195
    iput-object p3, p0, Lorg/jboss/netty/util/internal/ConcurrentIdentityWeakKeyHashMap$HashEntry;->next:Lorg/jboss/netty/util/internal/ConcurrentIdentityWeakKeyHashMap$HashEntry;

    .line 196
    new-instance v0, Lorg/jboss/netty/util/internal/ConcurrentIdentityWeakKeyHashMap$WeakKeyReference;

    invoke-direct {v0, p1, p2, p5}, Lorg/jboss/netty/util/internal/ConcurrentIdentityWeakKeyHashMap$WeakKeyReference;-><init>(Ljava/lang/Object;ILjava/lang/ref/ReferenceQueue;)V

    iput-object v0, p0, Lorg/jboss/netty/util/internal/ConcurrentIdentityWeakKeyHashMap$HashEntry;->keyRef:Ljava/lang/Object;

    .line 197
    iput-object p4, p0, Lorg/jboss/netty/util/internal/ConcurrentIdentityWeakKeyHashMap$HashEntry;->valueRef:Ljava/lang/Object;

    .line 198
    return-void
.end method

.method static newArray(I)[Lorg/jboss/netty/util/internal/ConcurrentIdentityWeakKeyHashMap$HashEntry;
    .locals 1
    .param p0, "i"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(I)[",
            "Lorg/jboss/netty/util/internal/ConcurrentIdentityWeakKeyHashMap$HashEntry",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 224
    new-array v0, p0, [Lorg/jboss/netty/util/internal/ConcurrentIdentityWeakKeyHashMap$HashEntry;

    return-object v0
.end method


# virtual methods
.method dereferenceValue(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "value"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")TV;"
        }
    .end annotation

    .prologue
    .line 211
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentIdentityWeakKeyHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentIdentityWeakKeyHashMap$HashEntry<TK;TV;>;"
    instance-of v0, p1, Lorg/jboss/netty/util/internal/ConcurrentIdentityWeakKeyHashMap$WeakKeyReference;

    if-eqz v0, :cond_0

    .line 212
    check-cast p1, Ljava/lang/ref/Reference;

    .end local p1    # "value":Ljava/lang/Object;
    invoke-virtual {p1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p1

    .line 215
    :cond_0
    return-object p1
.end method

.method key()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TK;"
        }
    .end annotation

    .prologue
    .line 202
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentIdentityWeakKeyHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentIdentityWeakKeyHashMap$HashEntry<TK;TV;>;"
    iget-object v0, p0, Lorg/jboss/netty/util/internal/ConcurrentIdentityWeakKeyHashMap$HashEntry;->keyRef:Ljava/lang/Object;

    check-cast v0, Ljava/lang/ref/Reference;

    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method setValue(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TV;)V"
        }
    .end annotation

    .prologue
    .line 219
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentIdentityWeakKeyHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentIdentityWeakKeyHashMap$HashEntry<TK;TV;>;"
    .local p1, "value":Ljava/lang/Object;, "TV;"
    iput-object p1, p0, Lorg/jboss/netty/util/internal/ConcurrentIdentityWeakKeyHashMap$HashEntry;->valueRef:Ljava/lang/Object;

    .line 220
    return-void
.end method

.method value()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TV;"
        }
    .end annotation

    .prologue
    .line 206
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentIdentityWeakKeyHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentIdentityWeakKeyHashMap$HashEntry<TK;TV;>;"
    iget-object v0, p0, Lorg/jboss/netty/util/internal/ConcurrentIdentityWeakKeyHashMap$HashEntry;->valueRef:Ljava/lang/Object;

    invoke-virtual {p0, v0}, Lorg/jboss/netty/util/internal/ConcurrentIdentityWeakKeyHashMap$HashEntry;->dereferenceValue(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method
