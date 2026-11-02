.class public Lcom/ning/http/client/providers/jdk/ResponseHeaders;
.super Lcom/ning/http/client/HttpResponseHeaders;
.source "ResponseHeaders.java"


# instance fields
.field private final headers:Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;


# direct methods
.method public constructor <init>(Lcom/ning/http/client/uri/Uri;Ljava/net/HttpURLConnection;Lcom/ning/http/client/AsyncHttpProvider;)V
    .locals 1
    .param p1, "uri"    # Lcom/ning/http/client/uri/Uri;
    .param p2, "urlConnection"    # Ljava/net/HttpURLConnection;
    .param p3, "provider"    # Lcom/ning/http/client/AsyncHttpProvider;

    .prologue
    .line 31
    invoke-direct {p0}, Lcom/ning/http/client/HttpResponseHeaders;-><init>()V

    .line 32
    invoke-direct {p0, p2}, Lcom/ning/http/client/providers/jdk/ResponseHeaders;->computerHeaders(Ljava/net/HttpURLConnection;)Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    move-result-object v0

    iput-object v0, p0, Lcom/ning/http/client/providers/jdk/ResponseHeaders;->headers:Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    .line 33
    return-void
.end method

.method private computerHeaders(Ljava/net/HttpURLConnection;)Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;
    .locals 6
    .param p1, "urlConnection"    # Ljava/net/HttpURLConnection;

    .prologue
    .line 36
    new-instance v1, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    invoke-direct {v1}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;-><init>()V

    .line 38
    .local v1, "h":Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getHeaderFields()Ljava/util/Map;

    move-result-object v3

    .line 40
    .local v3, "uh":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    invoke-interface {v3}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 41
    .local v0, "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_0

    .line 42
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Collection;

    invoke-virtual {v1, v4, v5}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->add(Ljava/lang/String;Ljava/util/Collection;)Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    goto :goto_0

    .line 45
    .end local v0    # "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    :cond_1
    return-object v1
.end method


# virtual methods
.method public getHeaders()Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;
    .locals 1

    .prologue
    .line 55
    iget-object v0, p0, Lcom/ning/http/client/providers/jdk/ResponseHeaders;->headers:Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    return-object v0
.end method
