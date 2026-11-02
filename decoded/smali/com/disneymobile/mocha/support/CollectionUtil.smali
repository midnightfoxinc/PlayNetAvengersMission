.class public final Lcom/disneymobile/mocha/support/CollectionUtil;
.super Ljava/lang/Object;
.source "CollectionUtil.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/disneymobile/mocha/support/CollectionUtil$Function;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 59
    return-void
.end method

.method public static asArrayList(Ljava/util/Collection;)Ljava/util/ArrayList;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<X:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Collection",
            "<TX;>;)",
            "Ljava/util/ArrayList",
            "<TX;>;"
        }
    .end annotation

    .prologue
    .line 104
    .local p0, "collection":Ljava/util/Collection;, "Ljava/util/Collection<TX;>;"
    instance-of v1, p0, Ljava/util/ArrayList;

    if-eqz v1, :cond_0

    .line 105
    check-cast p0, Ljava/util/ArrayList;

    .line 112
    .end local p0    # "collection":Ljava/util/Collection;, "Ljava/util/Collection<TX;>;"
    .local v0, "arrayList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<TX;>;"
    :goto_0
    return-object p0

    .line 108
    .end local v0    # "arrayList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<TX;>;"
    .restart local p0    # "collection":Ljava/util/Collection;, "Ljava/util/Collection<TX;>;"
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 109
    .restart local v0    # "arrayList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<TX;>;"
    if-eqz p0, :cond_1

    .line 110
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    :cond_1
    move-object p0, v0

    .line 112
    goto :goto_0
.end method

.method public static asHashSet(Ljava/util/Collection;)Ljava/util/HashSet;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<X:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Collection",
            "<TX;>;)",
            "Ljava/util/HashSet",
            "<TX;>;"
        }
    .end annotation

    .prologue
    .line 80
    .local p0, "collection":Ljava/util/Collection;, "Ljava/util/Collection<TX;>;"
    instance-of v1, p0, Ljava/util/HashSet;

    if-eqz v1, :cond_0

    .line 81
    check-cast p0, Ljava/util/HashSet;

    .line 88
    .end local p0    # "collection":Ljava/util/Collection;, "Ljava/util/Collection<TX;>;"
    .local v0, "set":Ljava/util/HashSet;, "Ljava/util/HashSet<TX;>;"
    :goto_0
    return-object p0

    .line 84
    .end local v0    # "set":Ljava/util/HashSet;, "Ljava/util/HashSet<TX;>;"
    .restart local p0    # "collection":Ljava/util/Collection;, "Ljava/util/Collection<TX;>;"
    :cond_0
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 85
    .restart local v0    # "set":Ljava/util/HashSet;, "Ljava/util/HashSet<TX;>;"
    if-eqz p0, :cond_1

    .line 86
    invoke-virtual {v0, p0}, Ljava/util/HashSet;->addAll(Ljava/util/Collection;)Z

    :cond_1
    move-object p0, v0

    .line 88
    goto :goto_0
.end method

.method public static asIterable(Ljava/util/Iterator;)Ljava/lang/Iterable;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<X:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Iterator",
            "<TX;>;)",
            "Ljava/lang/Iterable",
            "<TX;>;"
        }
    .end annotation

    .prologue
    .line 124
    .local p0, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<TX;>;"
    new-instance v0, Lcom/disneymobile/mocha/support/CollectionUtil$1;

    invoke-direct {v0, p0}, Lcom/disneymobile/mocha/support/CollectionUtil$1;-><init>(Ljava/util/Iterator;)V

    return-object v0
.end method

.method public static asLinkedList(Ljava/util/Collection;)Ljava/util/LinkedList;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<X:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Collection",
            "<TX;>;)",
            "Ljava/util/LinkedList",
            "<TX;>;"
        }
    .end annotation

    .prologue
    .line 92
    .local p0, "collection":Ljava/util/Collection;, "Ljava/util/Collection<TX;>;"
    instance-of v1, p0, Ljava/util/HashSet;

    if-eqz v1, :cond_0

    .line 93
    check-cast p0, Ljava/util/LinkedList;

    .line 100
    .end local p0    # "collection":Ljava/util/Collection;, "Ljava/util/Collection<TX;>;"
    .local v0, "linkedList":Ljava/util/LinkedList;, "Ljava/util/LinkedList<TX;>;"
    :goto_0
    return-object p0

    .line 96
    .end local v0    # "linkedList":Ljava/util/LinkedList;, "Ljava/util/LinkedList<TX;>;"
    .restart local p0    # "collection":Ljava/util/Collection;, "Ljava/util/Collection<TX;>;"
    :cond_0
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 97
    .restart local v0    # "linkedList":Ljava/util/LinkedList;, "Ljava/util/LinkedList<TX;>;"
    if-eqz p0, :cond_1

    .line 98
    invoke-virtual {v0, p0}, Ljava/util/LinkedList;->addAll(Ljava/util/Collection;)Z

    :cond_1
    move-object p0, v0

    .line 100
    goto :goto_0
.end method

.method public static asList(Ljava/util/Collection;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<X:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Collection",
            "<TX;>;)",
            "Ljava/util/List",
            "<TX;>;"
        }
    .end annotation

    .prologue
    .line 116
    .local p0, "collection":Ljava/util/Collection;, "Ljava/util/Collection<TX;>;"
    instance-of v0, p0, Ljava/util/List;

    if-eqz v0, :cond_0

    .line 117
    check-cast p0, Ljava/util/List;

    .line 120
    .end local p0    # "collection":Ljava/util/Collection;, "Ljava/util/Collection<TX;>;"
    :goto_0
    return-object p0

    .restart local p0    # "collection":Ljava/util/Collection;, "Ljava/util/Collection<TX;>;"
    :cond_0
    invoke-static {p0}, Lcom/disneymobile/mocha/support/CollectionUtil;->asArrayList(Ljava/util/Collection;)Ljava/util/ArrayList;

    move-result-object p0

    goto :goto_0
.end method

.method public static join(Ljava/util/Collection;)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Collection",
            "<TT;>;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 16
    .local p0, "values":Ljava/util/Collection;, "Ljava/util/Collection<TT;>;"
    const-string v0, ","

    invoke-static {p0, v0}, Lcom/disneymobile/mocha/support/CollectionUtil;->join(Ljava/util/Collection;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static join(Ljava/util/Collection;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "joinString"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Collection",
            "<TT;>;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 20
    .local p0, "values":Ljava/util/Collection;, "Ljava/util/Collection<TT;>;"
    invoke-interface {p0}, Ljava/util/Collection;->toArray()[Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/disneymobile/mocha/support/CollectionUtil;->join([Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static join([J)Ljava/lang/String;
    .locals 1
    .param p0, "values"    # [J

    .prologue
    .line 42
    const-string v0, ","

    invoke-static {p0, v0}, Lcom/disneymobile/mocha/support/CollectionUtil;->join([JLjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static join([JLjava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "values"    # [J
    .param p1, "joinString"    # Ljava/lang/String;

    .prologue
    .line 46
    array-length v2, p0

    if-nez v2, :cond_0

    .line 47
    const-string v2, ""

    .line 56
    :goto_0
    return-object v2

    .line 49
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 50
    .local v0, "builder":Ljava/lang/StringBuilder;
    const/4 v2, 0x0

    aget-wide v2, p0, v2

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 51
    const/4 v1, 0x1

    .local v1, "i":I
    :goto_1
    array-length v2, p0

    if-ge v1, v2, :cond_1

    .line 52
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    aget-wide v2, p0, v1

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 51
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 56
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_0
.end method

.method public static join([Ljava/lang/Object;)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 24
    .local p0, "values":[Ljava/lang/Object;, "[TT;"
    const-string v0, ","

    invoke-static {p0, v0}, Lcom/disneymobile/mocha/support/CollectionUtil;->join([Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static join([Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "joinString"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;",
            "Ljava/lang/String;",
            ")",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 28
    .local p0, "values":[Ljava/lang/Object;, "[TT;"
    array-length v2, p0

    if-nez v2, :cond_0

    .line 29
    const-string v2, ""

    .line 38
    :goto_0
    return-object v2

    .line 31
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 32
    .local v0, "builder":Ljava/lang/StringBuilder;
    const/4 v2, 0x0

    aget-object v2, p0, v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 33
    const/4 v1, 0x1

    .local v1, "i":I
    :goto_1
    array-length v2, p0

    if-ge v1, v2, :cond_1

    .line 34
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    aget-object v2, p0, v1

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 33
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 38
    :cond_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_0
.end method

.method public static map(Ljava/util/Collection;Lcom/disneymobile/mocha/support/CollectionUtil$Function;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<I:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Collection",
            "<TI;>;",
            "Lcom/disneymobile/mocha/support/CollectionUtil$Function",
            "<TI;TR;>;)",
            "Ljava/util/List",
            "<TR;>;"
        }
    .end annotation

    .prologue
    .line 72
    .local p0, "values":Ljava/util/Collection;, "Ljava/util/Collection<TI;>;"
    .local p1, "function":Lcom/disneymobile/mocha/support/CollectionUtil$Function;, "Lcom/disneymobile/mocha/support/CollectionUtil$Function<TI;TR;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 73
    .local v1, "output":Ljava/util/List;, "Ljava/util/List<TR;>;"
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 74
    .local v2, "value":Ljava/lang/Object;, "TI;"
    invoke-interface {p1, v2}, Lcom/disneymobile/mocha/support/CollectionUtil$Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 76
    .end local v2    # "value":Ljava/lang/Object;, "TI;"
    :cond_0
    return-object v1
.end method

.method public static map([Ljava/lang/Object;Lcom/disneymobile/mocha/support/CollectionUtil$Function;)Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<I:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">([TI;",
            "Lcom/disneymobile/mocha/support/CollectionUtil$Function",
            "<TI;TR;>;)",
            "Ljava/util/List",
            "<TR;>;"
        }
    .end annotation

    .prologue
    .line 64
    .local p0, "values":[Ljava/lang/Object;, "[TI;"
    .local p1, "function":Lcom/disneymobile/mocha/support/CollectionUtil$Function;, "Lcom/disneymobile/mocha/support/CollectionUtil$Function<TI;TR;>;"
    new-instance v3, Ljava/util/ArrayList;

    array-length v5, p0

    invoke-direct {v3, v5}, Ljava/util/ArrayList;-><init>(I)V

    .line 65
    .local v3, "output":Ljava/util/List;, "Ljava/util/List<TR;>;"
    move-object v0, p0

    .local v0, "arr$":[Ljava/lang/Object;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v2, :cond_0

    aget-object v4, v0, v1

    .line 66
    .local v4, "value":Ljava/lang/Object;, "TI;"
    invoke-interface {p1, v4}, Lcom/disneymobile/mocha/support/CollectionUtil$Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    invoke-interface {v3, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 65
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 68
    .end local v4    # "value":Ljava/lang/Object;, "TI;"
    :cond_0
    return-object v3
.end method

.method public static minus(Ljava/util/Set;Ljava/util/Set;)Ljava/util/Set;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<X:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Set",
            "<TX;>;",
            "Ljava/util/Set",
            "<TX;>;)",
            "Ljava/util/Set",
            "<TX;>;"
        }
    .end annotation

    .prologue
    .line 137
    .local p0, "lhs":Ljava/util/Set;, "Ljava/util/Set<TX;>;"
    .local p1, "rhs":Ljava/util/Set;, "Ljava/util/Set<TX;>;"
    if-eqz p0, :cond_0

    invoke-interface {p0}, Ljava/util/Set;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 138
    :cond_0
    invoke-static {}, Ljava/util/Collections;->emptySet()Ljava/util/Set;

    move-result-object v0

    .line 148
    :goto_0
    return-object v0

    .line 140
    :cond_1
    if-eqz p1, :cond_2

    invoke-interface {p1}, Ljava/util/Set;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_3

    :cond_2
    move-object v0, p0

    .line 141
    goto :goto_0

    .line 144
    :cond_3
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 145
    .local v0, "set":Ljava/util/HashSet;, "Ljava/util/HashSet<TX;>;"
    invoke-virtual {v0, p0}, Ljava/util/HashSet;->addAll(Ljava/util/Collection;)Z

    .line 146
    invoke-virtual {v0, p1}, Ljava/util/HashSet;->removeAll(Ljava/util/Collection;)Z

    goto :goto_0
.end method
