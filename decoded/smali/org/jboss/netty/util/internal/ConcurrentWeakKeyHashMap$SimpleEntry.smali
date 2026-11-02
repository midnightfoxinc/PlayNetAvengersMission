.class Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$SimpleEntry;
.super Ljava/lang/Object;
.source "ConcurrentWeakKeyHashMap.java"

# interfaces
.implements Ljava/util/Map$Entry;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "SimpleEntry"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/util/Map$Entry",
        "<TK;TV;>;"
    }
.end annotation


# instance fields
.field private final key:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TK;"
        }
    .end annotation
.end field

.field private value:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TV;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TV;)V"
        }
    .end annotation

    .prologue
    .line 1287
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$SimpleEntry;, "Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$SimpleEntry<TK;TV;>;"
    .local p1, "key":Ljava/lang/Object;, "TK;"
    .local p2, "value":Ljava/lang/Object;, "TV;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1288
    iput-object p1, p0, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$SimpleEntry;->key:Ljava/lang/Object;

    .line 1289
    iput-object p2, p0, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$SimpleEntry;->value:Ljava/lang/Object;

    .line 1290
    return-void
.end method

.method public constructor <init>(Ljava/util/Map$Entry;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map$Entry",
            "<+TK;+TV;>;)V"
        }
    .end annotation

    .prologue
    .line 1292
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$SimpleEntry;, "Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$SimpleEntry<TK;TV;>;"
    .local p1, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<+TK;+TV;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1293
    invoke-interface {p1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$SimpleEntry;->key:Ljava/lang/Object;

    .line 1294
    invoke-interface {p1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$SimpleEntry;->value:Ljava/lang/Object;

    .line 1295
    return-void
.end method

.method private static eq(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 1
    .param p0, "o1"    # Ljava/lang/Object;
    .param p1, "o2"    # Ljava/lang/Object;

    .prologue
    .line 1332
    if-nez p0, :cond_1

    if-nez p1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    :cond_1
    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$SimpleEntry;, "Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$SimpleEntry<TK;TV;>;"
    const/4 v1, 0x0

    .line 1313
    instance-of v2, p1, Ljava/util/Map$Entry;

    if-nez v2, :cond_1

    .line 1318
    :cond_0
    :goto_0
    return v1

    :cond_1
    move-object v0, p1

    .line 1317
    check-cast v0, Ljava/util/Map$Entry;

    .line 1318
    .local v0, "e":Ljava/util/Map$Entry;
    iget-object v2, p0, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$SimpleEntry;->key:Ljava/lang/Object;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    invoke-static {v2, v3}, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$SimpleEntry;->eq(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$SimpleEntry;->value:Ljava/lang/Object;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    invoke-static {v2, v3}, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$SimpleEntry;->eq(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v1, 0x1

    goto :goto_0
.end method

.method public getKey()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TK;"
        }
    .end annotation

    .prologue
    .line 1298
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$SimpleEntry;, "Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$SimpleEntry<TK;TV;>;"
    iget-object v0, p0, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$SimpleEntry;->key:Ljava/lang/Object;

    return-object v0
.end method

.method public getValue()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TV;"
        }
    .end annotation

    .prologue
    .line 1302
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$SimpleEntry;, "Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$SimpleEntry<TK;TV;>;"
    iget-object v0, p0, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$SimpleEntry;->value:Ljava/lang/Object;

    return-object v0
.end method

.method public hashCode()I
    .locals 3

    .prologue
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$SimpleEntry;, "Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$SimpleEntry<TK;TV;>;"
    const/4 v1, 0x0

    .line 1323
    iget-object v0, p0, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$SimpleEntry;->key:Ljava/lang/Object;

    if-nez v0, :cond_0

    move v0, v1

    :goto_0
    iget-object v2, p0, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$SimpleEntry;->value:Ljava/lang/Object;

    if-nez v2, :cond_1

    :goto_1
    xor-int/2addr v0, v1

    return v0

    :cond_0
    iget-object v0, p0, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$SimpleEntry;->key:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    goto :goto_0

    :cond_1
    iget-object v1, p0, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$SimpleEntry;->value:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->hashCode()I

    move-result v1

    goto :goto_1
.end method

.method public setValue(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TV;)TV;"
        }
    .end annotation

    .prologue
    .line 1306
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$SimpleEntry;, "Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$SimpleEntry<TK;TV;>;"
    .local p1, "value":Ljava/lang/Object;, "TV;"
    iget-object v0, p0, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$SimpleEntry;->value:Ljava/lang/Object;

    .line 1307
    .local v0, "oldValue":Ljava/lang/Object;, "TV;"
    iput-object p1, p0, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$SimpleEntry;->value:Ljava/lang/Object;

    .line 1308
    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 1328
    .local p0, "this":Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$SimpleEntry;, "Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$SimpleEntry<TK;TV;>;"
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$SimpleEntry;->key:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lorg/jboss/netty/util/internal/ConcurrentWeakKeyHashMap$SimpleEntry;->value:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
