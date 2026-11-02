.class public Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;
.super Ljava/lang/Object;
.source "FluentCaseInsensitiveStringsMap.java"

# interfaces
.implements Ljava/util/Map;
.implements Ljava/lang/Iterable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Map",
        "<",
        "Ljava/lang/String;",
        "Ljava/util/List",
        "<",
        "Ljava/lang/String;",
        ">;>;",
        "Ljava/lang/Iterable",
        "<",
        "Ljava/util/Map$Entry",
        "<",
        "Ljava/lang/String;",
        "Ljava/util/List",
        "<",
        "Ljava/lang/String;",
        ">;>;>;"
    }
.end annotation


# instance fields
.field private final keyLookup:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final values:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->values:Ljava/util/Map;

    .line 42
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->keyLookup:Ljava/util/Map;

    .line 45
    return-void
.end method

.method public constructor <init>(Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;)V
    .locals 4
    .param p1, "src"    # Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    .prologue
    .line 47
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    new-instance v2, Ljava/util/LinkedHashMap;

    invoke-direct {v2}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v2, p0, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->values:Ljava/util/Map;

    .line 42
    new-instance v2, Ljava/util/LinkedHashMap;

    invoke-direct {v2}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v2, p0, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->keyLookup:Ljava/util/Map;

    .line 48
    if-eqz p1, :cond_0

    .line 49
    invoke-virtual {p1}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 50
    .local v0, "header":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Collection;

    invoke-virtual {p0, v2, v3}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->add(Ljava/lang/String;Ljava/util/Collection;)Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    goto :goto_0

    .line 53
    .end local v0    # "header":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    .end local v1    # "i$":Ljava/util/Iterator;
    :cond_0
    return-void
.end method

.method public constructor <init>(Ljava/util/Map;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;>;)V"
        }
    .end annotation

    .prologue
    .line 55
    .local p1, "src":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/Collection<Ljava/lang/String;>;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    new-instance v2, Ljava/util/LinkedHashMap;

    invoke-direct {v2}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v2, p0, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->values:Ljava/util/Map;

    .line 42
    new-instance v2, Ljava/util/LinkedHashMap;

    invoke-direct {v2}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v2, p0, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->keyLookup:Ljava/util/Map;

    .line 56
    if-eqz p1, :cond_0

    .line 57
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 58
    .local v0, "header":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/Collection<Ljava/lang/String;>;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Collection;

    invoke-virtual {p0, v2, v3}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->add(Ljava/lang/String;Ljava/util/Collection;)Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    goto :goto_0

    .line 61
    .end local v0    # "header":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/Collection<Ljava/lang/String;>;>;"
    .end local v1    # "i$":Ljava/util/Iterator;
    :cond_0
    return-void
.end method

.method private fetchValues(Ljava/util/Collection;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 98
    .local p1, "values":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    const/4 v1, 0x0

    .line 100
    .local v1, "result":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-eqz p1, :cond_2

    .line 101
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 102
    .local v2, "value":Ljava/lang/String;
    if-nez v2, :cond_0

    .line 103
    const-string v2, ""

    .line 105
    :cond_0
    if-nez v1, :cond_1

    .line 107
    new-instance v1, Ljava/util/ArrayList;

    .end local v1    # "result":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 109
    .restart local v1    # "result":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_1
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 112
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v2    # "value":Ljava/lang/String;
    :cond_2
    return-object v1
.end method


# virtual methods
.method public add(Ljava/lang/String;Ljava/lang/String;)Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;
    .locals 5
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 64
    if-eqz p1, :cond_0

    .line 65
    sget-object v4, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {p1, v4}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    .line 66
    .local v1, "lcKey":Ljava/lang/String;
    iget-object v4, p0, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->keyLookup:Ljava/util/Map;

    invoke-interface {v4, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 68
    .local v3, "realKey":Ljava/lang/String;
    const/4 v0, 0x0

    .line 69
    .local v0, "curValues":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-nez v3, :cond_1

    .line 70
    iget-object v4, p0, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->keyLookup:Ljava/util/Map;

    invoke-interface {v4, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 71
    new-instance v0, Ljava/util/ArrayList;

    .end local v0    # "curValues":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 72
    .restart local v0    # "curValues":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iget-object v4, p0, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->values:Ljava/util/Map;

    invoke-interface {v4, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 77
    :goto_0
    if-eqz p2, :cond_2

    move-object v2, p2

    .line 78
    .local v2, "nonNullValue":Ljava/lang/String;
    :goto_1
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 80
    .end local v0    # "curValues":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v1    # "lcKey":Ljava/lang/String;
    .end local v2    # "nonNullValue":Ljava/lang/String;
    .end local v3    # "realKey":Ljava/lang/String;
    :cond_0
    return-object p0

    .line 74
    .restart local v0    # "curValues":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v1    # "lcKey":Ljava/lang/String;
    .restart local v3    # "realKey":Ljava/lang/String;
    :cond_1
    iget-object v4, p0, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->values:Ljava/util/Map;

    invoke-interface {v4, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "curValues":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    check-cast v0, Ljava/util/List;

    .restart local v0    # "curValues":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    goto :goto_0

    .line 77
    :cond_2
    const-string v2, ""

    goto :goto_1
.end method

.method public add(Ljava/lang/String;Ljava/util/Collection;)Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;
    .locals 5
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;"
        }
    .end annotation

    .prologue
    .line 124
    .local p2, "values":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    if-eqz p1, :cond_1

    .line 125
    invoke-direct {p0, p2}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->fetchValues(Ljava/util/Collection;)Ljava/util/List;

    move-result-object v2

    .line 127
    .local v2, "nonNullValues":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-eqz v2, :cond_1

    .line 128
    sget-object v4, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {p1, v4}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    .line 129
    .local v1, "lcKey":Ljava/lang/String;
    iget-object v4, p0, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->keyLookup:Ljava/util/Map;

    invoke-interface {v4, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 130
    .local v3, "realKey":Ljava/lang/String;
    const/4 v0, 0x0

    .line 132
    .local v0, "curValues":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-nez v3, :cond_2

    .line 133
    move-object v3, p1

    .line 134
    iget-object v4, p0, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->keyLookup:Ljava/util/Map;

    invoke-interface {v4, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 139
    :goto_0
    if-nez v0, :cond_0

    .line 140
    new-instance v0, Ljava/util/ArrayList;

    .end local v0    # "curValues":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 141
    .restart local v0    # "curValues":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iget-object v4, p0, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->values:Ljava/util/Map;

    invoke-interface {v4, v3, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 143
    :cond_0
    invoke-interface {v0, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 146
    .end local v0    # "curValues":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v1    # "lcKey":Ljava/lang/String;
    .end local v2    # "nonNullValues":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v3    # "realKey":Ljava/lang/String;
    :cond_1
    return-object p0

    .line 136
    .restart local v0    # "curValues":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v1    # "lcKey":Ljava/lang/String;
    .restart local v2    # "nonNullValues":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v3    # "realKey":Ljava/lang/String;
    :cond_2
    iget-object v4, p0, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->values:Ljava/util/Map;

    invoke-interface {v4, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .end local v0    # "curValues":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    check-cast v0, Ljava/util/List;

    .restart local v0    # "curValues":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    goto :goto_0
.end method

.method public varargs add(Ljava/lang/String;[Ljava/lang/String;)Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "values"    # [Ljava/lang/String;

    .prologue
    .line 91
    invoke-static {p2}, Lcom/ning/http/util/MiscUtils;->isNonEmpty([Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 92
    invoke-static {p2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->add(Ljava/lang/String;Ljava/util/Collection;)Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    .line 94
    :cond_0
    return-object p0
.end method

.method public addAll(Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;)Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;
    .locals 4
    .param p1, "src"    # Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    .prologue
    .line 156
    if-eqz p1, :cond_0

    .line 157
    invoke-virtual {p1}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 158
    .local v0, "header":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Collection;

    invoke-virtual {p0, v2, v3}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->add(Ljava/lang/String;Ljava/util/Collection;)Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    goto :goto_0

    .line 161
    .end local v0    # "header":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    .end local v1    # "i$":Ljava/util/Iterator;
    :cond_0
    return-object p0
.end method

.method public addAll(Ljava/util/Map;)Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;>;)",
            "Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;"
        }
    .end annotation

    .prologue
    .line 171
    .local p1, "src":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/Collection<Ljava/lang/String;>;>;"
    if-eqz p1, :cond_0

    .line 172
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 173
    .local v0, "header":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/Collection<Ljava/lang/String;>;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Collection;

    invoke-virtual {p0, v2, v3}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->add(Ljava/lang/String;Ljava/util/Collection;)Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    goto :goto_0

    .line 176
    .end local v0    # "header":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/Collection<Ljava/lang/String;>;>;"
    .end local v1    # "i$":Ljava/util/Iterator;
    :cond_0
    return-object p0
.end method

.method public clear()V
    .locals 1

    .prologue
    .line 330
    iget-object v0, p0, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->keyLookup:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 331
    iget-object v0, p0, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->values:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 332
    return-void
.end method

.method public containsKey(Ljava/lang/Object;)Z
    .locals 3
    .param p1, "key"    # Ljava/lang/Object;

    .prologue
    .line 361
    if-nez p1, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->keyLookup:Ljava/util/Map;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v1, v2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_0
.end method

.method public containsValue(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .line 366
    iget-object v0, p0, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->values:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->containsValue(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public delete(Ljava/lang/String;)Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;
    .locals 3
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 275
    if-eqz p1, :cond_0

    .line 276
    sget-object v2, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {p1, v2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    .line 277
    .local v0, "lcKey":Ljava/lang/String;
    iget-object v2, p0, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->keyLookup:Ljava/util/Map;

    invoke-interface {v2, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 279
    .local v1, "realKey":Ljava/lang/String;
    if-eqz v1, :cond_0

    .line 280
    iget-object v2, p0, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->values:Ljava/util/Map;

    invoke-interface {v2, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 283
    .end local v0    # "lcKey":Ljava/lang/String;
    .end local v1    # "realKey":Ljava/lang/String;
    :cond_0
    return-object p0
.end method

.method public deleteAll(Ljava/util/Collection;)Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;"
        }
    .end annotation

    .prologue
    .line 308
    .local p1, "keys":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    if-eqz p1, :cond_0

    .line 309
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 310
    .local v1, "key":Ljava/lang/String;
    invoke-virtual {p0, v1}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->remove(Ljava/lang/Object;)Ljava/util/List;

    goto :goto_0

    .line 313
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "key":Ljava/lang/String;
    :cond_0
    return-object p0
.end method

.method public varargs deleteAll([Ljava/lang/String;)Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;
    .locals 4
    .param p1, "keys"    # [Ljava/lang/String;

    .prologue
    .line 293
    if-eqz p1, :cond_0

    .line 294
    move-object v0, p1

    .local v0, "arr$":[Ljava/lang/String;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v3, :cond_0

    aget-object v2, v0, v1

    .line 295
    .local v2, "key":Ljava/lang/String;
    invoke-virtual {p0, v2}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->remove(Ljava/lang/Object;)Ljava/util/List;

    .line 294
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 298
    .end local v0    # "arr$":[Ljava/lang/String;
    .end local v1    # "i$":I
    .end local v2    # "key":Ljava/lang/String;
    .end local v3    # "len$":I
    :cond_0
    return-object p0
.end method

.method public entrySet()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/util/Map$Entry",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;>;>;"
        }
    .end annotation

    .prologue
    .line 346
    iget-object v0, p0, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->values:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 430
    if-ne p0, p1, :cond_1

    .line 449
    :cond_0
    :goto_0
    return v1

    .line 433
    :cond_1
    if-nez p1, :cond_2

    move v1, v2

    .line 434
    goto :goto_0

    .line 436
    :cond_2
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_3

    move v1, v2

    .line 437
    goto :goto_0

    :cond_3
    move-object v0, p1

    .line 440
    check-cast v0, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    .line 442
    .local v0, "other":Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;
    iget-object v3, p0, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->values:Ljava/util/Map;

    if-nez v3, :cond_4

    .line 443
    iget-object v3, v0, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->values:Ljava/util/Map;

    if-eqz v3, :cond_0

    move v1, v2

    .line 444
    goto :goto_0

    .line 446
    :cond_4
    iget-object v3, p0, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->values:Ljava/util/Map;

    iget-object v4, v0, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->values:Ljava/util/Map;

    invoke-interface {v3, v4}, Ljava/util/Map;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    move v1, v2

    .line 447
    goto :goto_0
.end method

.method public bridge synthetic get(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 40
    invoke-virtual {p0, p1}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->get(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public get(Ljava/lang/Object;)Ljava/util/List;
    .locals 4
    .param p1, "key"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 414
    if-nez p1, :cond_0

    .line 415
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v2

    .line 420
    :goto_0
    return-object v2

    .line 417
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    sget-object v3, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {v2, v3}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    .line 418
    .local v0, "lcKey":Ljava/lang/String;
    iget-object v2, p0, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->keyLookup:Ljava/util/Map;

    invoke-interface {v2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 420
    .local v1, "realKey":Ljava/lang/String;
    if-eqz v1, :cond_1

    iget-object v2, p0, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->values:Ljava/util/Map;

    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    goto :goto_0

    :cond_1
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v2

    goto :goto_0
.end method

.method public getFirstValue(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 377
    invoke-virtual {p0, p1}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->get(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    .line 379
    .local v0, "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 380
    const/4 v1, 0x0

    .line 382
    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    goto :goto_0
.end method

.method public getJoinedValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 6
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "delimiter"    # Ljava/lang/String;

    .prologue
    .line 393
    invoke-virtual {p0, p1}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->get(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    .line 395
    .local v3, "values":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 396
    const/4 v4, 0x0

    .line 408
    :goto_0
    return-object v4

    .line 397
    :cond_0
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v4

    const/4 v5, 0x1

    if-ne v4, v5, :cond_1

    .line 398
    const/4 v4, 0x0

    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    goto :goto_0

    .line 400
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 402
    .local v1, "result":Ljava/lang/StringBuilder;
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 403
    .local v2, "value":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    if-lez v4, :cond_2

    .line 404
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 406
    :cond_2
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 408
    .end local v2    # "value":Ljava/lang/String;
    :cond_3
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_0
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 454
    iget-object v0, p0, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->values:Ljava/util/Map;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->values:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->hashCode()I

    move-result v0

    goto :goto_0
.end method

.method public isEmpty()Z
    .locals 1

    .prologue
    .line 356
    iget-object v0, p0, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->values:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator",
            "<",
            "Ljava/util/Map$Entry",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;>;>;"
        }
    .end annotation

    .prologue
    .line 336
    iget-object v0, p0, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->values:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public keySet()Ljava/util/Set;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 341
    new-instance v0, Ljava/util/LinkedHashSet;

    iget-object v1, p0, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->keyLookup:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/LinkedHashSet;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method

.method public bridge synthetic put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 40
    check-cast p1, Ljava/lang/String;

    .end local p1    # "x0":Ljava/lang/Object;
    check-cast p2, Ljava/util/List;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->put(Ljava/lang/String;Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public put(Ljava/lang/String;Ljava/util/List;)Ljava/util/List;
    .locals 3
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 253
    .local p2, "value":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-nez p1, :cond_0

    .line 254
    new-instance v1, Ljava/lang/NullPointerException;

    const-string v2, "Null keys are not allowed"

    invoke-direct {v1, v2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 257
    :cond_0
    invoke-virtual {p0, p1}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->get(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    .line 259
    .local v0, "oldValue":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-virtual {p0, p1, p2}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->replaceWith(Ljava/lang/String;Ljava/util/Collection;)Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    .line 260
    return-object v0
.end method

.method public putAll(Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<+",
            "Ljava/lang/String;",
            "+",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;>;)V"
        }
    .end annotation

    .prologue
    .line 265
    .local p1, "values":Ljava/util/Map;, "Ljava/util/Map<+Ljava/lang/String;+Ljava/util/List<Ljava/lang/String;>;>;"
    invoke-virtual {p0, p1}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->replaceAll(Ljava/util/Map;)Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    .line 266
    return-void
.end method

.method public bridge synthetic remove(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 40
    invoke-virtual {p0, p1}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->remove(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public remove(Ljava/lang/Object;)Ljava/util/List;
    .locals 2
    .param p1, "key"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 318
    if-nez p1, :cond_0

    .line 319
    const/4 v0, 0x0

    .line 324
    :goto_0
    return-object v0

    .line 321
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->get(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    .line 323
    .local v0, "oldValues":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->delete(Ljava/lang/String;)Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    goto :goto_0
.end method

.method public replaceAll(Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;)Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;
    .locals 4
    .param p1, "src"    # Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    .prologue
    .line 227
    if-eqz p1, :cond_0

    .line 228
    invoke-virtual {p1}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 229
    .local v0, "header":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Collection;

    invoke-virtual {p0, v2, v3}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->replaceWith(Ljava/lang/String;Ljava/util/Collection;)Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    goto :goto_0

    .line 232
    .end local v0    # "header":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    .end local v1    # "i$":Ljava/util/Iterator;
    :cond_0
    return-object p0
.end method

.method public replaceAll(Ljava/util/Map;)Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<+",
            "Ljava/lang/String;",
            "+",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;>;)",
            "Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;"
        }
    .end annotation

    .prologue
    .line 243
    .local p1, "src":Ljava/util/Map;, "Ljava/util/Map<+Ljava/lang/String;+Ljava/util/Collection<Ljava/lang/String;>;>;"
    if-eqz p1, :cond_0

    .line 244
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 245
    .local v0, "header":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<+Ljava/lang/String;+Ljava/util/Collection<Ljava/lang/String;>;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Collection;

    invoke-virtual {p0, v2, v3}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->replaceWith(Ljava/lang/String;Ljava/util/Collection;)Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    goto :goto_0

    .line 248
    .end local v0    # "header":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<+Ljava/lang/String;+Ljava/util/Collection<Ljava/lang/String;>;>;"
    .end local v1    # "i$":Ljava/util/Iterator;
    :cond_0
    return-object p0
.end method

.method public replaceWith(Ljava/lang/String;Ljava/util/Collection;)Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;
    .locals 4
    .param p1, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;"
        }
    .end annotation

    .prologue
    .line 198
    .local p2, "values":Ljava/util/Collection;, "Ljava/util/Collection<Ljava/lang/String;>;"
    if-eqz p1, :cond_0

    .line 199
    invoke-direct {p0, p2}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->fetchValues(Ljava/util/Collection;)Ljava/util/List;

    move-result-object v1

    .line 200
    .local v1, "nonNullValues":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    sget-object v3, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    invoke-virtual {p1, v3}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    .line 201
    .local v0, "lcKkey":Ljava/lang/String;
    iget-object v3, p0, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->keyLookup:Ljava/util/Map;

    invoke-interface {v3, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 203
    .local v2, "realKey":Ljava/lang/String;
    if-nez v1, :cond_1

    .line 204
    iget-object v3, p0, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->keyLookup:Ljava/util/Map;

    invoke-interface {v3, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 205
    if-eqz v2, :cond_0

    .line 206
    iget-object v3, p0, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->values:Ljava/util/Map;

    invoke-interface {v3, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 216
    .end local v0    # "lcKkey":Ljava/lang/String;
    .end local v1    # "nonNullValues":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v2    # "realKey":Ljava/lang/String;
    :cond_0
    :goto_0
    return-object p0

    .line 209
    .restart local v0    # "lcKkey":Ljava/lang/String;
    .restart local v1    # "nonNullValues":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v2    # "realKey":Ljava/lang/String;
    :cond_1
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 210
    iget-object v3, p0, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->keyLookup:Ljava/util/Map;

    invoke-interface {v3, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 211
    iget-object v3, p0, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->values:Ljava/util/Map;

    invoke-interface {v3, v2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 213
    :cond_2
    iget-object v3, p0, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->values:Ljava/util/Map;

    invoke-interface {v3, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method public varargs replaceWith(Ljava/lang/String;[Ljava/lang/String;)Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "values"    # [Ljava/lang/String;

    .prologue
    .line 187
    invoke-static {p2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->replaceWith(Ljava/lang/String;Ljava/util/Collection;)Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    move-result-object v0

    return-object v0
.end method

.method public size()I
    .locals 1

    .prologue
    .line 351
    iget-object v0, p0, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->values:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 7

    .prologue
    .line 459
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 461
    .local v4, "result":Ljava/lang/StringBuilder;
    iget-object v6, p0, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->values:Ljava/util/Map;

    invoke-interface {v6}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 462
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->length()I

    move-result v6

    if-lez v6, :cond_0

    .line 463
    const-string v6, "; "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 465
    :cond_0
    const-string v6, "\""

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 466
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 467
    const-string v6, "="

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 469
    const/4 v3, 0x0

    .line 471
    .local v3, "needsComma":Z
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 472
    .local v5, "value":Ljava/lang/String;
    if-eqz v3, :cond_1

    .line 473
    const-string v6, ", "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 477
    :goto_2
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 475
    :cond_1
    const/4 v3, 0x1

    goto :goto_2

    .line 479
    .end local v5    # "value":Ljava/lang/String;
    :cond_2
    const-string v6, "\""

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 481
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    .end local v2    # "i$":Ljava/util/Iterator;
    .end local v3    # "needsComma":Z
    :cond_3
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    return-object v6
.end method

.method public values()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .prologue
    .line 425
    iget-object v0, p0, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->values:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method
