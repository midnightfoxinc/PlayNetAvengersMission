.class final enum Lcom/ning/http/util/QueryComputer$1;
.super Lcom/ning/http/util/QueryComputer;
.source "QueryComputer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ning/http/util/QueryComputer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4008
    name = null
.end annotation


# direct methods
.method constructor <init>(Ljava/lang/String;I)V
    .locals 1

    .prologue
    .line 24
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/ning/http/util/QueryComputer;-><init>(Ljava/lang/String;ILcom/ning/http/util/QueryComputer$1;)V

    return-void
.end method

.method private final encodeAndAppendQueryParams(Ljava/lang/StringBuilder;Ljava/util/List;)V
    .locals 4
    .param p1, "sb"    # Ljava/lang/StringBuilder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/StringBuilder;",
            "Ljava/util/List",
            "<",
            "Lcom/ning/http/client/Param;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 27
    .local p2, "queryParams":Ljava/util/List;, "Ljava/util/List<Lcom/ning/http/client/Param;>;"
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/ning/http/client/Param;

    .line 28
    .local v1, "param":Lcom/ning/http/client/Param;
    invoke-virtual {v1}, Lcom/ning/http/client/Param;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1}, Lcom/ning/http/client/Param;->getValue()Ljava/lang/String;

    move-result-object v3

    invoke-static {p1, v2, v3}, Lcom/ning/http/util/AsyncHttpProviderUtils;->encodeAndAppendQueryParam(Ljava/lang/StringBuilder;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 29
    .end local v1    # "param":Lcom/ning/http/client/Param;
    :cond_0
    return-void
.end method


# virtual methods
.method protected final withQueryWithParams(Ljava/lang/String;Ljava/util/List;)Ljava/lang/String;
    .locals 2
    .param p1, "query"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lcom/ning/http/client/Param;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 33
    .local p2, "queryParams":Ljava/util/List;, "Ljava/util/List<Lcom/ning/http/client/Param;>;"
    invoke-static {}, Lcom/ning/http/util/StringUtils;->stringBuilder()Ljava/lang/StringBuilder;

    move-result-object v0

    .line 34
    .local v0, "sb":Ljava/lang/StringBuilder;
    invoke-static {v0, p1}, Lcom/ning/http/util/UTF8UrlEncoder;->encodeAndAppendQuery(Ljava/lang/StringBuilder;Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    const/16 v1, 0x26

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 36
    invoke-direct {p0, v0, p2}, Lcom/ning/http/util/QueryComputer$1;->encodeAndAppendQueryParams(Ljava/lang/StringBuilder;Ljava/util/List;)V

    .line 37
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 38
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method protected final withQueryWithoutParams(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "query"    # Ljava/lang/String;

    .prologue
    .line 43
    invoke-static {}, Lcom/ning/http/util/StringUtils;->stringBuilder()Ljava/lang/StringBuilder;

    move-result-object v0

    .line 44
    .local v0, "sb":Ljava/lang/StringBuilder;
    invoke-static {v0, p1}, Lcom/ning/http/util/UTF8UrlEncoder;->encodeAndAppendQuery(Ljava/lang/StringBuilder;Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method protected final withoutQueryWithParams(Ljava/util/List;)Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/ning/http/client/Param;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 50
    .local p1, "queryParams":Ljava/util/List;, "Ljava/util/List<Lcom/ning/http/client/Param;>;"
    invoke-static {}, Lcom/ning/http/util/StringUtils;->stringBuilder()Ljava/lang/StringBuilder;

    move-result-object v0

    .line 51
    .local v0, "sb":Ljava/lang/StringBuilder;
    invoke-direct {p0, v0, p1}, Lcom/ning/http/util/QueryComputer$1;->encodeAndAppendQueryParams(Ljava/lang/StringBuilder;Ljava/util/List;)V

    .line 52
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->setLength(I)V

    .line 53
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method
