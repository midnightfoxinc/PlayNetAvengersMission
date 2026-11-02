.class public Lcom/disneymobile/mocha/NSURLRequest;
.super Ljava/lang/Object;
.source "NSURLRequest.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/disneymobile/mocha/NSURLRequest$CachePolicy;
    }
.end annotation


# instance fields
.field protected body:Ljava/lang/CharSequence;

.field protected cachePolicy:Lcom/disneymobile/mocha/NSURLRequest$CachePolicy;

.field headerFields:Ljava/util/Map;
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

.field protected httpMethod:Ljava/lang/String;

.field protected timeoutS:F

.field protected url:Lcom/disneymobile/mocha/NSURL;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    invoke-direct {p0}, Lcom/disneymobile/mocha/NSURLRequest;->init()V

    .line 32
    return-void
.end method

.method private init()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 93
    iput-object v1, p0, Lcom/disneymobile/mocha/NSURLRequest;->url:Lcom/disneymobile/mocha/NSURL;

    .line 94
    sget-object v0, Lcom/disneymobile/mocha/NSURLRequest$CachePolicy;->NSURLRequestUseProtocolCachePolicy:Lcom/disneymobile/mocha/NSURLRequest$CachePolicy;

    iput-object v0, p0, Lcom/disneymobile/mocha/NSURLRequest;->cachePolicy:Lcom/disneymobile/mocha/NSURLRequest$CachePolicy;

    .line 95
    const/high16 v0, 0x42700000    # 60.0f

    iput v0, p0, Lcom/disneymobile/mocha/NSURLRequest;->timeoutS:F

    .line 96
    const-string v0, "GET"

    iput-object v0, p0, Lcom/disneymobile/mocha/NSURLRequest;->httpMethod:Ljava/lang/String;

    .line 97
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/disneymobile/mocha/NSURLRequest;->headerFields:Ljava/util/Map;

    .line 98
    iput-object v1, p0, Lcom/disneymobile/mocha/NSURLRequest;->body:Ljava/lang/CharSequence;

    .line 99
    return-void
.end method

.method public static requestWithURL(Lcom/disneymobile/mocha/NSURL;)Lcom/disneymobile/mocha/NSURLRequest;
    .locals 1
    .param p0, "url"    # Lcom/disneymobile/mocha/NSURL;

    .prologue
    .line 23
    new-instance v0, Lcom/disneymobile/mocha/NSURLRequest;

    invoke-direct {v0}, Lcom/disneymobile/mocha/NSURLRequest;-><init>()V

    invoke-virtual {v0, p0}, Lcom/disneymobile/mocha/NSURLRequest;->initWithURL(Lcom/disneymobile/mocha/NSURL;)Lcom/disneymobile/mocha/NSURLRequest;

    move-result-object v0

    return-object v0
.end method

.method public static requestWithURLCachePolicyAndTimeoutInterval(Lcom/disneymobile/mocha/NSURL;Lcom/disneymobile/mocha/NSURLRequest$CachePolicy;F)Lcom/disneymobile/mocha/NSURLRequest;
    .locals 1
    .param p0, "url"    # Lcom/disneymobile/mocha/NSURL;
    .param p1, "cachePolicy"    # Lcom/disneymobile/mocha/NSURLRequest$CachePolicy;
    .param p2, "timeoutInterval"    # F

    .prologue
    .line 27
    new-instance v0, Lcom/disneymobile/mocha/NSURLRequest;

    invoke-direct {v0}, Lcom/disneymobile/mocha/NSURLRequest;-><init>()V

    invoke-virtual {v0, p0, p1, p2}, Lcom/disneymobile/mocha/NSURLRequest;->initWithURLCachePolicyAndTimeoutInterval(Lcom/disneymobile/mocha/NSURL;Lcom/disneymobile/mocha/NSURLRequest$CachePolicy;F)Lcom/disneymobile/mocha/NSURLRequest;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public HTTPBody()Ljava/lang/CharSequence;
    .locals 1

    .prologue
    .line 77
    iget-object v0, p0, Lcom/disneymobile/mocha/NSURLRequest;->body:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public HTTPMethod()Ljava/lang/String;
    .locals 1

    .prologue
    .line 72
    iget-object v0, p0, Lcom/disneymobile/mocha/NSURLRequest;->httpMethod:Ljava/lang/String;

    return-object v0
.end method

.method public URL()Lcom/disneymobile/mocha/NSURL;
    .locals 1

    .prologue
    .line 60
    iget-object v0, p0, Lcom/disneymobile/mocha/NSURLRequest;->url:Lcom/disneymobile/mocha/NSURL;

    return-object v0
.end method

.method public allHTTPHeaderFields()Ljava/util/HashMap;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .prologue
    .line 81
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 83
    .local v2, "info":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    iget-object v3, p0, Lcom/disneymobile/mocha/NSURLRequest;->headerFields:Ljava/util/Map;

    invoke-interface {v3}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 84
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 87
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_0
    return-object v2
.end method

.method public cachePolicy()Lcom/disneymobile/mocha/NSURLRequest$CachePolicy;
    .locals 1

    .prologue
    .line 64
    iget-object v0, p0, Lcom/disneymobile/mocha/NSURLRequest;->cachePolicy:Lcom/disneymobile/mocha/NSURLRequest$CachePolicy;

    return-object v0
.end method

.method public initWithURL(Lcom/disneymobile/mocha/NSURL;)Lcom/disneymobile/mocha/NSURLRequest;
    .locals 0
    .param p1, "url"    # Lcom/disneymobile/mocha/NSURL;

    .prologue
    .line 35
    if-nez p1, :cond_0

    .line 36
    const/4 p0, 0x0

    .line 43
    .end local p0    # "this":Lcom/disneymobile/mocha/NSURLRequest;
    :goto_0
    return-object p0

    .line 39
    .restart local p0    # "this":Lcom/disneymobile/mocha/NSURLRequest;
    :cond_0
    invoke-direct {p0}, Lcom/disneymobile/mocha/NSURLRequest;->init()V

    .line 41
    iput-object p1, p0, Lcom/disneymobile/mocha/NSURLRequest;->url:Lcom/disneymobile/mocha/NSURL;

    goto :goto_0
.end method

.method public initWithURLCachePolicyAndTimeoutInterval(Lcom/disneymobile/mocha/NSURL;Lcom/disneymobile/mocha/NSURLRequest$CachePolicy;F)Lcom/disneymobile/mocha/NSURLRequest;
    .locals 0
    .param p1, "url"    # Lcom/disneymobile/mocha/NSURL;
    .param p2, "cachePolicy"    # Lcom/disneymobile/mocha/NSURLRequest$CachePolicy;
    .param p3, "timeoutS"    # F

    .prologue
    .line 47
    if-nez p1, :cond_0

    .line 48
    const/4 p0, 0x0

    .line 56
    .end local p0    # "this":Lcom/disneymobile/mocha/NSURLRequest;
    :goto_0
    return-object p0

    .line 51
    .restart local p0    # "this":Lcom/disneymobile/mocha/NSURLRequest;
    :cond_0
    invoke-direct {p0}, Lcom/disneymobile/mocha/NSURLRequest;->init()V

    .line 53
    iput-object p1, p0, Lcom/disneymobile/mocha/NSURLRequest;->url:Lcom/disneymobile/mocha/NSURL;

    .line 54
    iput-object p2, p0, Lcom/disneymobile/mocha/NSURLRequest;->cachePolicy:Lcom/disneymobile/mocha/NSURLRequest$CachePolicy;

    .line 55
    iput p3, p0, Lcom/disneymobile/mocha/NSURLRequest;->timeoutS:F

    goto :goto_0
.end method

.method public timeoutInterval()F
    .locals 1

    .prologue
    .line 68
    iget v0, p0, Lcom/disneymobile/mocha/NSURLRequest;->timeoutS:F

    return v0
.end method
