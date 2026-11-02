.class public Lcom/ning/http/client/simple/HeaderMap;
.super Ljava/lang/Object;
.source "HeaderMap.java"

# interfaces
.implements Ljava/util/Map;


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
        ">;>;"
    }
.end annotation


# instance fields
.field private headers:Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;


# direct methods
.method public constructor <init>(Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;)V
    .locals 0
    .param p1, "headers"    # Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    iput-object p1, p0, Lcom/ning/http/client/simple/HeaderMap;->headers:Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    .line 35
    return-void
.end method


# virtual methods
.method public clear()V
    .locals 2

    .prologue
    .line 105
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Only read access is supported."

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public containsKey(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "key"    # Ljava/lang/Object;

    .prologue
    .line 54
    iget-object v0, p0, Lcom/ning/http/client/simple/HeaderMap;->headers:Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    invoke-virtual {v0, p1}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public containsValue(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .line 58
    iget-object v0, p0, Lcom/ning/http/client/simple/HeaderMap;->headers:Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    invoke-virtual {v0, p1}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->containsValue(Ljava/lang/Object;)Z

    move-result v0

    return v0
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
    .line 42
    iget-object v0, p0, Lcom/ning/http/client/simple/HeaderMap;->headers:Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    invoke-virtual {v0}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic get(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 29
    invoke-virtual {p0, p1}, Lcom/ning/http/client/simple/HeaderMap;->get(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public get(Ljava/lang/Object;)Ljava/util/List;
    .locals 1
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
    .line 76
    iget-object v0, p0, Lcom/ning/http/client/simple/HeaderMap;->headers:Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    invoke-virtual {v0, p1}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->get(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getFirstValue(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 65
    iget-object v0, p0, Lcom/ning/http/client/simple/HeaderMap;->headers:Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    invoke-virtual {v0, p1}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->getFirstValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getJoinedValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "delimiter"    # Ljava/lang/String;

    .prologue
    .line 72
    iget-object v0, p0, Lcom/ning/http/client/simple/HeaderMap;->headers:Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    invoke-virtual {v0, p1, p2}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->getJoinedValue(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public isEmpty()Z
    .locals 1

    .prologue
    .line 50
    iget-object v0, p0, Lcom/ning/http/client/simple/HeaderMap;->headers:Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    invoke-virtual {v0}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->isEmpty()Z

    move-result v0

    return v0
.end method

.method public keySet()Ljava/util/Set;
    .locals 1
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
    .line 38
    iget-object v0, p0, Lcom/ning/http/client/simple/HeaderMap;->headers:Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    invoke-virtual {v0}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->keySet()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # Ljava/lang/Object;

    .prologue
    .line 29
    check-cast p1, Ljava/lang/String;

    .end local p1    # "x0":Ljava/lang/Object;
    check-cast p2, Ljava/util/List;

    .end local p2    # "x1":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lcom/ning/http/client/simple/HeaderMap;->put(Ljava/lang/String;Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public put(Ljava/lang/String;Ljava/util/List;)Ljava/util/List;
    .locals 2
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
    .line 83
    .local p2, "value":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Only read access is supported."

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public putAll(Ljava/util/Map;)V
    .locals 2
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
    .line 97
    .local p1, "t":Ljava/util/Map;, "Ljava/util/Map<+Ljava/lang/String;+Ljava/util/List<Ljava/lang/String;>;>;"
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Only read access is supported."

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public bridge synthetic remove(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 29
    invoke-virtual {p0, p1}, Lcom/ning/http/client/simple/HeaderMap;->remove(Ljava/lang/Object;)Ljava/util/List;

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
    .line 90
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Only read access is supported."

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public size()I
    .locals 1

    .prologue
    .line 46
    iget-object v0, p0, Lcom/ning/http/client/simple/HeaderMap;->headers:Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    invoke-virtual {v0}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->size()I

    move-result v0

    return v0
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
    .line 112
    iget-object v0, p0, Lcom/ning/http/client/simple/HeaderMap;->headers:Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    invoke-virtual {v0}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->values()Ljava/util/Collection;

    move-result-object v0

    return-object v0
.end method
