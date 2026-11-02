.class final Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;
.super Ljava/lang/Object;
.source "ConcurrentIdentityHashMap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap;
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

.field final key:Ljava/lang/Object;

.field final next:Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry",
            "<TK;TV;>;"
        }
    .end annotation
.end field

.field volatile value:Ljava/lang/Object;


# direct methods
.method constructor <init>(Ljava/lang/Object;ILorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;Ljava/lang/Object;)V
    .locals 0
    .param p2, "hash"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;I",
            "Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry",
            "<TK;TV;>;TV;)V"
        }
    .end annotation

    .prologue
    .line 163
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    .local p3, "next":Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry<TK;TV;>;"
    .local p4, "value":Ljava/lang/Object;, "TV;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 164
    iput p2, p0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;->hash:I

    .line 165
    iput-object p3, p0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;->next:Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;

    .line 166
    iput-object p1, p0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;->key:Ljava/lang/Object;

    .line 167
    iput-object p4, p0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;->value:Ljava/lang/Object;

    .line 168
    return-void
.end method

.method static newArray(I)[Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;
    .locals 1
    .param p0, "i"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(I)[",
            "Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry",
            "<TK;TV;>;"
        }
    .end annotation

    .prologue
    .line 186
    new-array v0, p0, [Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;

    return-object v0
.end method


# virtual methods
.method key()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TK;"
        }
    .end annotation

    .prologue
    .line 172
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry<TK;TV;>;"
    iget-object v0, p0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;->key:Ljava/lang/Object;

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
    .line 181
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry<TK;TV;>;"
    .local p1, "value":Ljava/lang/Object;, "TV;"
    iput-object p1, p0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;->value:Ljava/lang/Object;

    .line 182
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
    .line 177
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;, "Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry<TK;TV;>;"
    iget-object v0, p0, Lorg/jboss/netty/util/internal/ConcurrentIdentityHashMap$HashEntry;->value:Ljava/lang/Object;

    return-object v0
.end method
