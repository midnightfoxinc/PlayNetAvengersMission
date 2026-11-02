.class public abstract Lcom/ning/http/client/RequestBuilderBase;
.super Ljava/lang/Object;
.source "RequestBuilderBase.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ning/http/client/RequestBuilderBase$RequestImpl;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lcom/ning/http/client/RequestBuilderBase",
        "<TT;>;>",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field private static final DEFAULT_REQUEST_URL:Lcom/ning/http/client/uri/Uri;

.field private static final logger:Lorg/slf4j/Logger;


# instance fields
.field private final derived:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<TT;>;"
        }
    .end annotation
.end field

.field protected queryComputer:Lcom/ning/http/util/QueryComputer;

.field protected queryParams:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/ning/http/client/Param;",
            ">;"
        }
    .end annotation
.end field

.field protected final request:Lcom/ning/http/client/RequestBuilderBase$RequestImpl;

.field protected signatureCalculator:Lcom/ning/http/client/SignatureCalculator;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 44
    const-class v0, Lcom/ning/http/client/RequestBuilderBase;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    sput-object v0, Lcom/ning/http/client/RequestBuilderBase;->logger:Lorg/slf4j/Logger;

    .line 46
    const-string v0, "http://localhost"

    invoke-static {v0}, Lcom/ning/http/client/uri/Uri;->create(Ljava/lang/String;)Lcom/ning/http/client/uri/Uri;

    move-result-object v0

    sput-object v0, Lcom/ning/http/client/RequestBuilderBase;->DEFAULT_REQUEST_URL:Lcom/ning/http/client/uri/Uri;

    return-void
.end method

.method protected constructor <init>(Ljava/lang/Class;Lcom/ning/http/client/Request;)V
    .locals 1
    .param p2, "prototype"    # Lcom/ning/http/client/Request;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<TT;>;",
            "Lcom/ning/http/client/Request;",
            ")V"
        }
    .end annotation

    .prologue
    .line 266
    .local p0, "this":Lcom/ning/http/client/RequestBuilderBase;, "Lcom/ning/http/client/RequestBuilderBase<TT;>;"
    .local p1, "derived":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    sget-object v0, Lcom/ning/http/util/QueryComputer;->URL_ENCODING_ENABLED_QUERY_COMPUTER:Lcom/ning/http/util/QueryComputer;

    invoke-direct {p0, p1, p2, v0}, Lcom/ning/http/client/RequestBuilderBase;-><init>(Ljava/lang/Class;Lcom/ning/http/client/Request;Lcom/ning/http/util/QueryComputer;)V

    .line 267
    return-void
.end method

.method protected constructor <init>(Ljava/lang/Class;Lcom/ning/http/client/Request;Lcom/ning/http/util/QueryComputer;)V
    .locals 1
    .param p2, "prototype"    # Lcom/ning/http/client/Request;
    .param p3, "queryComputer"    # Lcom/ning/http/util/QueryComputer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<TT;>;",
            "Lcom/ning/http/client/Request;",
            "Lcom/ning/http/util/QueryComputer;",
            ")V"
        }
    .end annotation

    .prologue
    .line 269
    .local p0, "this":Lcom/ning/http/client/RequestBuilderBase;, "Lcom/ning/http/client/RequestBuilderBase<TT;>;"
    .local p1, "derived":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 270
    iput-object p1, p0, Lcom/ning/http/client/RequestBuilderBase;->derived:Ljava/lang/Class;

    .line 271
    new-instance v0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;

    invoke-direct {v0, p2}, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;-><init>(Lcom/ning/http/client/Request;)V

    iput-object v0, p0, Lcom/ning/http/client/RequestBuilderBase;->request:Lcom/ning/http/client/RequestBuilderBase$RequestImpl;

    .line 272
    iput-object p3, p0, Lcom/ning/http/client/RequestBuilderBase;->queryComputer:Lcom/ning/http/util/QueryComputer;

    .line 273
    return-void
.end method

.method protected constructor <init>(Ljava/lang/Class;Ljava/lang/String;Lcom/ning/http/util/QueryComputer;)V
    .locals 1
    .param p2, "method"    # Ljava/lang/String;
    .param p3, "queryComputer"    # Lcom/ning/http/util/QueryComputer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<TT;>;",
            "Ljava/lang/String;",
            "Lcom/ning/http/util/QueryComputer;",
            ")V"
        }
    .end annotation

    .prologue
    .line 258
    .local p0, "this":Lcom/ning/http/client/RequestBuilderBase;, "Lcom/ning/http/client/RequestBuilderBase<TT;>;"
    .local p1, "derived":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 259
    iput-object p1, p0, Lcom/ning/http/client/RequestBuilderBase;->derived:Ljava/lang/Class;

    .line 260
    new-instance v0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;

    invoke-direct {v0}, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;-><init>()V

    iput-object v0, p0, Lcom/ning/http/client/RequestBuilderBase;->request:Lcom/ning/http/client/RequestBuilderBase$RequestImpl;

    .line 261
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase;->request:Lcom/ning/http/client/RequestBuilderBase$RequestImpl;

    invoke-static {v0, p2}, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->access$002(Lcom/ning/http/client/RequestBuilderBase$RequestImpl;Ljava/lang/String;)Ljava/lang/String;

    .line 262
    iput-object p3, p0, Lcom/ning/http/client/RequestBuilderBase;->queryComputer:Lcom/ning/http/util/QueryComputer;

    .line 263
    return-void
.end method

.method protected constructor <init>(Ljava/lang/Class;Ljava/lang/String;Z)V
    .locals 1
    .param p2, "method"    # Ljava/lang/String;
    .param p3, "disableUrlEncoding"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<TT;>;",
            "Ljava/lang/String;",
            "Z)V"
        }
    .end annotation

    .prologue
    .line 255
    .local p0, "this":Lcom/ning/http/client/RequestBuilderBase;, "Lcom/ning/http/client/RequestBuilderBase<TT;>;"
    .local p1, "derived":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-static {p3}, Lcom/ning/http/util/QueryComputer;->queryComputer(Z)Lcom/ning/http/util/QueryComputer;

    move-result-object v0

    invoke-direct {p0, p1, p2, v0}, Lcom/ning/http/client/RequestBuilderBase;-><init>(Ljava/lang/Class;Ljava/lang/String;Lcom/ning/http/util/QueryComputer;)V

    .line 256
    return-void
.end method

.method private computeFinalUri()V
    .locals 4

    .prologue
    .line 594
    .local p0, "this":Lcom/ning/http/client/RequestBuilderBase;, "Lcom/ning/http/client/RequestBuilderBase<TT;>;"
    iget-object v1, p0, Lcom/ning/http/client/RequestBuilderBase;->request:Lcom/ning/http/client/RequestBuilderBase$RequestImpl;

    invoke-static {v1}, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->access$100(Lcom/ning/http/client/RequestBuilderBase$RequestImpl;)Lcom/ning/http/client/uri/Uri;

    move-result-object v1

    if-nez v1, :cond_0

    .line 595
    sget-object v1, Lcom/ning/http/client/RequestBuilderBase;->logger:Lorg/slf4j/Logger;

    const-string v2, "setUrl hasn\'t been invoked. Using {}"

    sget-object v3, Lcom/ning/http/client/RequestBuilderBase;->DEFAULT_REQUEST_URL:Lcom/ning/http/client/uri/Uri;

    invoke-interface {v1, v2, v3}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;Ljava/lang/Object;)V

    .line 596
    iget-object v1, p0, Lcom/ning/http/client/RequestBuilderBase;->request:Lcom/ning/http/client/RequestBuilderBase$RequestImpl;

    sget-object v2, Lcom/ning/http/client/RequestBuilderBase;->DEFAULT_REQUEST_URL:Lcom/ning/http/client/uri/Uri;

    invoke-static {v1, v2}, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->access$102(Lcom/ning/http/client/RequestBuilderBase$RequestImpl;Lcom/ning/http/client/uri/Uri;)Lcom/ning/http/client/uri/Uri;

    .line 599
    :cond_0
    iget-object v1, p0, Lcom/ning/http/client/RequestBuilderBase;->request:Lcom/ning/http/client/RequestBuilderBase$RequestImpl;

    invoke-static {v1}, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->access$100(Lcom/ning/http/client/RequestBuilderBase$RequestImpl;)Lcom/ning/http/client/uri/Uri;

    move-result-object v1

    invoke-static {v1}, Lcom/ning/http/util/AsyncHttpProviderUtils;->validateSupportedScheme(Lcom/ning/http/client/uri/Uri;)V

    .line 601
    iget-object v1, p0, Lcom/ning/http/client/RequestBuilderBase;->queryComputer:Lcom/ning/http/util/QueryComputer;

    iget-object v2, p0, Lcom/ning/http/client/RequestBuilderBase;->request:Lcom/ning/http/client/RequestBuilderBase$RequestImpl;

    invoke-static {v2}, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->access$100(Lcom/ning/http/client/RequestBuilderBase$RequestImpl;)Lcom/ning/http/client/uri/Uri;

    move-result-object v2

    invoke-virtual {v2}, Lcom/ning/http/client/uri/Uri;->getQuery()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/ning/http/client/RequestBuilderBase;->queryParams:Ljava/util/List;

    invoke-virtual {v1, v2, v3}, Lcom/ning/http/util/QueryComputer;->computeFullQueryString(Ljava/lang/String;Ljava/util/List;)Ljava/lang/String;

    move-result-object v0

    .line 602
    .local v0, "newQuery":Ljava/lang/String;
    iget-object v1, p0, Lcom/ning/http/client/RequestBuilderBase;->request:Lcom/ning/http/client/RequestBuilderBase$RequestImpl;

    iget-object v2, p0, Lcom/ning/http/client/RequestBuilderBase;->request:Lcom/ning/http/client/RequestBuilderBase$RequestImpl;

    invoke-static {v2}, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->access$100(Lcom/ning/http/client/RequestBuilderBase$RequestImpl;)Lcom/ning/http/client/uri/Uri;

    move-result-object v2

    invoke-virtual {v2, v0}, Lcom/ning/http/client/uri/Uri;->withNewQuery(Ljava/lang/String;)Lcom/ning/http/client/uri/Uri;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->access$102(Lcom/ning/http/client/RequestBuilderBase$RequestImpl;Lcom/ning/http/client/uri/Uri;)Lcom/ning/http/client/uri/Uri;

    .line 603
    return-void
.end method

.method private computeRequestCharset()V
    .locals 4

    .prologue
    .line 560
    .local p0, "this":Lcom/ning/http/client/RequestBuilderBase;, "Lcom/ning/http/client/RequestBuilderBase<TT;>;"
    iget-object v2, p0, Lcom/ning/http/client/RequestBuilderBase;->request:Lcom/ning/http/client/RequestBuilderBase$RequestImpl;

    iget-object v2, v2, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->charset:Ljava/lang/String;

    if-nez v2, :cond_0

    .line 562
    :try_start_0
    iget-object v2, p0, Lcom/ning/http/client/RequestBuilderBase;->request:Lcom/ning/http/client/RequestBuilderBase$RequestImpl;

    invoke-static {v2}, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->access$500(Lcom/ning/http/client/RequestBuilderBase$RequestImpl;)Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    move-result-object v2

    const-string v3, "Content-Type"

    invoke-virtual {v2, v3}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->getFirstValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 563
    .local v1, "contentType":Ljava/lang/String;
    if-eqz v1, :cond_0

    .line 564
    invoke-static {v1}, Lcom/ning/http/util/AsyncHttpProviderUtils;->parseCharset(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 565
    .local v0, "charset":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 568
    iget-object v2, p0, Lcom/ning/http/client/RequestBuilderBase;->request:Lcom/ning/http/client/RequestBuilderBase$RequestImpl;

    iput-object v0, v2, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->charset:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 575
    .end local v0    # "charset":Ljava/lang/String;
    .end local v1    # "contentType":Ljava/lang/String;
    :cond_0
    :goto_0
    return-void

    .line 571
    :catch_0
    move-exception v2

    goto :goto_0
.end method

.method private computeRequestLength()V
    .locals 6

    .prologue
    .line 578
    .local p0, "this":Lcom/ning/http/client/RequestBuilderBase;, "Lcom/ning/http/client/RequestBuilderBase<TT;>;"
    iget-object v1, p0, Lcom/ning/http/client/RequestBuilderBase;->request:Lcom/ning/http/client/RequestBuilderBase$RequestImpl;

    invoke-static {v1}, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->access$600(Lcom/ning/http/client/RequestBuilderBase$RequestImpl;)J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v1, v2, v4

    if-gez v1, :cond_0

    iget-object v1, p0, Lcom/ning/http/client/RequestBuilderBase;->request:Lcom/ning/http/client/RequestBuilderBase$RequestImpl;

    invoke-static {v1}, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->access$1200(Lcom/ning/http/client/RequestBuilderBase$RequestImpl;)Ljava/io/InputStream;

    move-result-object v1

    if-nez v1, :cond_0

    .line 580
    iget-object v1, p0, Lcom/ning/http/client/RequestBuilderBase;->request:Lcom/ning/http/client/RequestBuilderBase$RequestImpl;

    invoke-static {v1}, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->access$500(Lcom/ning/http/client/RequestBuilderBase$RequestImpl;)Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    move-result-object v1

    const-string v2, "Content-Length"

    invoke-virtual {v1, v2}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->getFirstValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 582
    .local v0, "contentLength":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 584
    :try_start_0
    iget-object v1, p0, Lcom/ning/http/client/RequestBuilderBase;->request:Lcom/ning/http/client/RequestBuilderBase$RequestImpl;

    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v2

    invoke-static {v1, v2, v3}, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->access$602(Lcom/ning/http/client/RequestBuilderBase$RequestImpl;J)J
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 590
    .end local v0    # "contentLength":Ljava/lang/String;
    :cond_0
    :goto_0
    return-void

    .line 585
    .restart local v0    # "contentLength":Ljava/lang/String;
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method private executeSignatureCalculator()V
    .locals 4

    .prologue
    .line 551
    .local p0, "this":Lcom/ning/http/client/RequestBuilderBase;, "Lcom/ning/http/client/RequestBuilderBase<TT;>;"
    iget-object v2, p0, Lcom/ning/http/client/RequestBuilderBase;->signatureCalculator:Lcom/ning/http/client/SignatureCalculator;

    if-eqz v2, :cond_0

    .line 552
    new-instance v2, Lcom/ning/http/client/RequestBuilder;

    iget-object v3, p0, Lcom/ning/http/client/RequestBuilderBase;->request:Lcom/ning/http/client/RequestBuilderBase$RequestImpl;

    invoke-direct {v2, v3}, Lcom/ning/http/client/RequestBuilder;-><init>(Lcom/ning/http/client/Request;)V

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lcom/ning/http/client/RequestBuilder;->setSignatureCalculator(Lcom/ning/http/client/SignatureCalculator;)Lcom/ning/http/client/RequestBuilderBase;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/RequestBuilder;

    .line 553
    .local v0, "rb":Lcom/ning/http/client/RequestBuilder;
    iget-object v2, p0, Lcom/ning/http/client/RequestBuilderBase;->queryParams:Ljava/util/List;

    iput-object v2, v0, Lcom/ning/http/client/RequestBuilder;->queryParams:Ljava/util/List;

    .line 554
    invoke-virtual {v0}, Lcom/ning/http/client/RequestBuilder;->build()Lcom/ning/http/client/Request;

    move-result-object v1

    .line 555
    .local v1, "unsignedRequest":Lcom/ning/http/client/Request;
    iget-object v2, p0, Lcom/ning/http/client/RequestBuilderBase;->signatureCalculator:Lcom/ning/http/client/SignatureCalculator;

    invoke-interface {v2, v1, p0}, Lcom/ning/http/client/SignatureCalculator;->calculateAndAddSignature(Lcom/ning/http/client/Request;Lcom/ning/http/client/RequestBuilderBase;)V

    .line 557
    .end local v0    # "rb":Lcom/ning/http/client/RequestBuilder;
    .end local v1    # "unsignedRequest":Lcom/ning/http/client/Request;
    :cond_0
    return-void
.end method

.method private lazyInitCookies()V
    .locals 3

    .prologue
    .line 330
    .local p0, "this":Lcom/ning/http/client/RequestBuilderBase;, "Lcom/ning/http/client/RequestBuilderBase<TT;>;"
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase;->request:Lcom/ning/http/client/RequestBuilderBase$RequestImpl;

    invoke-static {v0}, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->access$700(Lcom/ning/http/client/RequestBuilderBase$RequestImpl;)Ljava/util/ArrayList;

    move-result-object v0

    if-nez v0, :cond_0

    .line 331
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase;->request:Lcom/ning/http/client/RequestBuilderBase$RequestImpl;

    new-instance v1, Ljava/util/ArrayList;

    const/4 v2, 0x3

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    invoke-static {v0, v1}, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->access$702(Lcom/ning/http/client/RequestBuilderBase$RequestImpl;Ljava/util/ArrayList;)Ljava/util/ArrayList;

    .line 332
    :cond_0
    return-void
.end method

.method private map2ParamList(Ljava/util/Map;)Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;>;)",
            "Ljava/util/List",
            "<",
            "Lcom/ning/http/client/Param;",
            ">;"
        }
    .end annotation

    .prologue
    .line 450
    .local p0, "this":Lcom/ning/http/client/RequestBuilderBase;, "Lcom/ning/http/client/RequestBuilderBase<TT;>;"
    .local p1, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    if-nez p1, :cond_1

    .line 451
    const/4 v4, 0x0

    .line 459
    :cond_0
    return-object v4

    .line 453
    :cond_1
    new-instance v4, Ljava/util/ArrayList;

    invoke-interface {p1}, Ljava/util/Map;->size()I

    move-result v6

    invoke-direct {v4, v6}, Ljava/util/ArrayList;-><init>(I)V

    .line 454
    .local v4, "params":Ljava/util/List;, "Ljava/util/List<Lcom/ning/http/client/Param;>;"
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 455
    .local v0, "entries":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 456
    .local v3, "name":Ljava/lang/String;
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 457
    .local v5, "value":Ljava/lang/String;
    new-instance v6, Lcom/ning/http/client/Param;

    invoke-direct {v6, v3, v5}, Lcom/ning/http/client/Param;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v4, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method


# virtual methods
.method public addBodyPart(Lcom/ning/http/client/multipart/Part;)Lcom/ning/http/client/RequestBuilderBase;
    .locals 2
    .param p1, "part"    # Lcom/ning/http/client/multipart/Part;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ning/http/client/multipart/Part;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 494
    .local p0, "this":Lcom/ning/http/client/RequestBuilderBase;, "Lcom/ning/http/client/RequestBuilderBase<TT;>;"
    invoke-virtual {p0}, Lcom/ning/http/client/RequestBuilderBase;->resetFormParams()V

    .line 495
    invoke-virtual {p0}, Lcom/ning/http/client/RequestBuilderBase;->resetNonMultipartData()V

    .line 496
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase;->request:Lcom/ning/http/client/RequestBuilderBase$RequestImpl;

    invoke-static {v0}, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->access$1400(Lcom/ning/http/client/RequestBuilderBase$RequestImpl;)Ljava/util/List;

    move-result-object v0

    if-nez v0, :cond_0

    .line 497
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase;->request:Lcom/ning/http/client/RequestBuilderBase$RequestImpl;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-static {v0, v1}, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->access$1402(Lcom/ning/http/client/RequestBuilderBase$RequestImpl;Ljava/util/List;)Ljava/util/List;

    .line 498
    :cond_0
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase;->request:Lcom/ning/http/client/RequestBuilderBase$RequestImpl;

    invoke-static {v0}, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->access$1400(Lcom/ning/http/client/RequestBuilderBase$RequestImpl;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 499
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase;->derived:Ljava/lang/Class;

    invoke-virtual {v0, p0}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/RequestBuilderBase;

    return-object v0
.end method

.method public addCookie(Lcom/ning/http/client/cookie/Cookie;)Lcom/ning/http/client/RequestBuilderBase;
    .locals 1
    .param p1, "cookie"    # Lcom/ning/http/client/cookie/Cookie;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ning/http/client/cookie/Cookie;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 340
    .local p0, "this":Lcom/ning/http/client/RequestBuilderBase;, "Lcom/ning/http/client/RequestBuilderBase<TT;>;"
    invoke-direct {p0}, Lcom/ning/http/client/RequestBuilderBase;->lazyInitCookies()V

    .line 341
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase;->request:Lcom/ning/http/client/RequestBuilderBase$RequestImpl;

    invoke-static {v0}, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->access$700(Lcom/ning/http/client/RequestBuilderBase$RequestImpl;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 342
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase;->derived:Ljava/lang/Class;

    invoke-virtual {v0, p0}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/RequestBuilderBase;

    return-object v0
.end method

.method public addFormParam(Ljava/lang/String;Ljava/lang/String;)Lcom/ning/http/client/RequestBuilderBase;
    .locals 3
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 475
    .local p0, "this":Lcom/ning/http/client/RequestBuilderBase;, "Lcom/ning/http/client/RequestBuilderBase<TT;>;"
    invoke-virtual {p0}, Lcom/ning/http/client/RequestBuilderBase;->resetNonMultipartData()V

    .line 476
    invoke-virtual {p0}, Lcom/ning/http/client/RequestBuilderBase;->resetMultipartData()V

    .line 477
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase;->request:Lcom/ning/http/client/RequestBuilderBase$RequestImpl;

    invoke-static {v0}, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->access$800(Lcom/ning/http/client/RequestBuilderBase$RequestImpl;)Ljava/util/List;

    move-result-object v0

    if-nez v0, :cond_0

    .line 478
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase;->request:Lcom/ning/http/client/RequestBuilderBase$RequestImpl;

    new-instance v1, Ljava/util/ArrayList;

    const/4 v2, 0x1

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    invoke-static {v0, v1}, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->access$802(Lcom/ning/http/client/RequestBuilderBase$RequestImpl;Ljava/util/List;)Ljava/util/List;

    .line 479
    :cond_0
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase;->request:Lcom/ning/http/client/RequestBuilderBase$RequestImpl;

    invoke-static {v0}, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->access$800(Lcom/ning/http/client/RequestBuilderBase$RequestImpl;)Ljava/util/List;

    move-result-object v0

    new-instance v1, Lcom/ning/http/client/Param;

    invoke-direct {v1, p1, p2}, Lcom/ning/http/client/Param;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 480
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase;->derived:Ljava/lang/Class;

    invoke-virtual {v0, p0}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/RequestBuilderBase;

    return-object v0
.end method

.method public addHeader(Ljava/lang/String;Ljava/lang/String;)Lcom/ning/http/client/RequestBuilderBase;
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 305
    .local p0, "this":Lcom/ning/http/client/RequestBuilderBase;, "Lcom/ning/http/client/RequestBuilderBase<TT;>;"
    if-nez p2, :cond_0

    .line 306
    sget-object v0, Lcom/ning/http/client/RequestBuilderBase;->logger:Lorg/slf4j/Logger;

    const-string v1, "Value was null, set to \"\""

    invoke-interface {v0, v1}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;)V

    .line 307
    const-string p2, ""

    .line 310
    :cond_0
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase;->request:Lcom/ning/http/client/RequestBuilderBase$RequestImpl;

    invoke-static {v0}, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->access$500(Lcom/ning/http/client/RequestBuilderBase$RequestImpl;)Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->add(Ljava/lang/String;Ljava/lang/String;)Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    .line 311
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase;->derived:Ljava/lang/Class;

    invoke-virtual {v0, p0}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/RequestBuilderBase;

    return-object v0
.end method

.method public addOrReplaceCookie(Lcom/ning/http/client/cookie/Cookie;)Lcom/ning/http/client/RequestBuilderBase;
    .locals 6
    .param p1, "cookie"    # Lcom/ning/http/client/cookie/Cookie;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ning/http/client/cookie/Cookie;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 346
    .local p0, "this":Lcom/ning/http/client/RequestBuilderBase;, "Lcom/ning/http/client/RequestBuilderBase<TT;>;"
    invoke-virtual {p1}, Lcom/ning/http/client/cookie/Cookie;->getName()Ljava/lang/String;

    move-result-object v1

    .line 347
    .local v1, "cookieKey":Ljava/lang/String;
    const/4 v4, 0x0

    .line 348
    .local v4, "replace":Z
    const/4 v3, 0x0

    .line 349
    .local v3, "index":I
    invoke-direct {p0}, Lcom/ning/http/client/RequestBuilderBase;->lazyInitCookies()V

    .line 350
    iget-object v5, p0, Lcom/ning/http/client/RequestBuilderBase;->request:Lcom/ning/http/client/RequestBuilderBase$RequestImpl;

    invoke-static {v5}, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->access$700(Lcom/ning/http/client/RequestBuilderBase$RequestImpl;)Ljava/util/ArrayList;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/cookie/Cookie;

    .line 351
    .local v0, "c":Lcom/ning/http/client/cookie/Cookie;
    invoke-virtual {v0}, Lcom/ning/http/client/cookie/Cookie;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 352
    const/4 v4, 0x1

    .line 358
    .end local v0    # "c":Lcom/ning/http/client/cookie/Cookie;
    :cond_0
    if-eqz v4, :cond_2

    .line 359
    iget-object v5, p0, Lcom/ning/http/client/RequestBuilderBase;->request:Lcom/ning/http/client/RequestBuilderBase$RequestImpl;

    invoke-static {v5}, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->access$700(Lcom/ning/http/client/RequestBuilderBase$RequestImpl;)Ljava/util/ArrayList;

    move-result-object v5

    invoke-virtual {v5, v3, p1}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 362
    :goto_1
    iget-object v5, p0, Lcom/ning/http/client/RequestBuilderBase;->derived:Ljava/lang/Class;

    invoke-virtual {v5, p0}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/ning/http/client/RequestBuilderBase;

    return-object v5

    .line 356
    .restart local v0    # "c":Lcom/ning/http/client/cookie/Cookie;
    :cond_1
    add-int/lit8 v3, v3, 0x1

    .line 357
    goto :goto_0

    .line 361
    .end local v0    # "c":Lcom/ning/http/client/cookie/Cookie;
    :cond_2
    iget-object v5, p0, Lcom/ning/http/client/RequestBuilderBase;->request:Lcom/ning/http/client/RequestBuilderBase$RequestImpl;

    invoke-static {v5}, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->access$700(Lcom/ning/http/client/RequestBuilderBase$RequestImpl;)Ljava/util/ArrayList;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1
.end method

.method public addQueryParam(Ljava/lang/String;Ljava/lang/String;)Lcom/ning/http/client/RequestBuilderBase;
    .locals 2
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 435
    .local p0, "this":Lcom/ning/http/client/RequestBuilderBase;, "Lcom/ning/http/client/RequestBuilderBase<TT;>;"
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase;->queryParams:Ljava/util/List;

    if-nez v0, :cond_0

    .line 436
    new-instance v0, Ljava/util/ArrayList;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lcom/ning/http/client/RequestBuilderBase;->queryParams:Ljava/util/List;

    .line 437
    :cond_0
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase;->queryParams:Ljava/util/List;

    new-instance v1, Lcom/ning/http/client/Param;

    invoke-direct {v1, p1, p2}, Lcom/ning/http/client/Param;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 438
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase;->derived:Ljava/lang/Class;

    invoke-virtual {v0, p0}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/RequestBuilderBase;

    return-object v0
.end method

.method public addQueryParams(Ljava/util/List;)Lcom/ning/http/client/RequestBuilderBase;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/ning/http/client/Param;",
            ">;)TT;"
        }
    .end annotation

    .prologue
    .line 442
    .local p0, "this":Lcom/ning/http/client/RequestBuilderBase;, "Lcom/ning/http/client/RequestBuilderBase<TT;>;"
    .local p1, "params":Ljava/util/List;, "Ljava/util/List<Lcom/ning/http/client/Param;>;"
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase;->queryParams:Ljava/util/List;

    if-nez v0, :cond_0

    .line 443
    iput-object p1, p0, Lcom/ning/http/client/RequestBuilderBase;->queryParams:Ljava/util/List;

    .line 446
    :goto_0
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase;->derived:Ljava/lang/Class;

    invoke-virtual {v0, p0}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/RequestBuilderBase;

    return-object v0

    .line 445
    :cond_0
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase;->queryParams:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    goto :goto_0
.end method

.method public build()Lcom/ning/http/client/Request;
    .locals 1

    .prologue
    .line 606
    .local p0, "this":Lcom/ning/http/client/RequestBuilderBase;, "Lcom/ning/http/client/RequestBuilderBase<TT;>;"
    invoke-direct {p0}, Lcom/ning/http/client/RequestBuilderBase;->executeSignatureCalculator()V

    .line 607
    invoke-direct {p0}, Lcom/ning/http/client/RequestBuilderBase;->computeFinalUri()V

    .line 608
    invoke-direct {p0}, Lcom/ning/http/client/RequestBuilderBase;->computeRequestCharset()V

    .line 609
    invoke-direct {p0}, Lcom/ning/http/client/RequestBuilderBase;->computeRequestLength()V

    .line 610
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase;->request:Lcom/ning/http/client/RequestBuilderBase$RequestImpl;

    return-object v0
.end method

.method public resetCookies()V
    .locals 1

    .prologue
    .line 366
    .local p0, "this":Lcom/ning/http/client/RequestBuilderBase;, "Lcom/ning/http/client/RequestBuilderBase<TT;>;"
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase;->request:Lcom/ning/http/client/RequestBuilderBase$RequestImpl;

    invoke-static {v0}, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->access$700(Lcom/ning/http/client/RequestBuilderBase$RequestImpl;)Ljava/util/ArrayList;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 367
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase;->request:Lcom/ning/http/client/RequestBuilderBase$RequestImpl;

    invoke-static {v0}, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->access$700(Lcom/ning/http/client/RequestBuilderBase$RequestImpl;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 368
    :cond_0
    return-void
.end method

.method public resetFormParams()V
    .locals 2

    .prologue
    .line 376
    .local p0, "this":Lcom/ning/http/client/RequestBuilderBase;, "Lcom/ning/http/client/RequestBuilderBase<TT;>;"
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase;->request:Lcom/ning/http/client/RequestBuilderBase$RequestImpl;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->access$802(Lcom/ning/http/client/RequestBuilderBase$RequestImpl;Ljava/util/List;)Ljava/util/List;

    .line 377
    return-void
.end method

.method public resetMultipartData()V
    .locals 2

    .prologue
    .line 389
    .local p0, "this":Lcom/ning/http/client/RequestBuilderBase;, "Lcom/ning/http/client/RequestBuilderBase<TT;>;"
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase;->request:Lcom/ning/http/client/RequestBuilderBase$RequestImpl;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->access$1402(Lcom/ning/http/client/RequestBuilderBase$RequestImpl;Ljava/util/List;)Ljava/util/List;

    .line 390
    return-void
.end method

.method public resetNonMultipartData()V
    .locals 4

    .prologue
    .local p0, "this":Lcom/ning/http/client/RequestBuilderBase;, "Lcom/ning/http/client/RequestBuilderBase<TT;>;"
    const/4 v1, 0x0

    .line 380
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase;->request:Lcom/ning/http/client/RequestBuilderBase$RequestImpl;

    invoke-static {v0, v1}, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->access$902(Lcom/ning/http/client/RequestBuilderBase$RequestImpl;[B)[B

    .line 381
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase;->request:Lcom/ning/http/client/RequestBuilderBase$RequestImpl;

    invoke-static {v0, v1}, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->access$1002(Lcom/ning/http/client/RequestBuilderBase$RequestImpl;Ljava/util/List;)Ljava/util/List;

    .line 382
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase;->request:Lcom/ning/http/client/RequestBuilderBase$RequestImpl;

    invoke-static {v0, v1}, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->access$1102(Lcom/ning/http/client/RequestBuilderBase$RequestImpl;Ljava/lang/String;)Ljava/lang/String;

    .line 383
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase;->request:Lcom/ning/http/client/RequestBuilderBase$RequestImpl;

    invoke-static {v0, v1}, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->access$1202(Lcom/ning/http/client/RequestBuilderBase$RequestImpl;Ljava/io/InputStream;)Ljava/io/InputStream;

    .line 384
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase;->request:Lcom/ning/http/client/RequestBuilderBase$RequestImpl;

    invoke-static {v0, v1}, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->access$1302(Lcom/ning/http/client/RequestBuilderBase$RequestImpl;Lcom/ning/http/client/BodyGenerator;)Lcom/ning/http/client/BodyGenerator;

    .line 385
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase;->request:Lcom/ning/http/client/RequestBuilderBase$RequestImpl;

    const-wide/16 v2, -0x1

    invoke-static {v0, v2, v3}, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->access$602(Lcom/ning/http/client/RequestBuilderBase$RequestImpl;J)J

    .line 386
    return-void
.end method

.method public resetQuery()V
    .locals 3

    .prologue
    .local p0, "this":Lcom/ning/http/client/RequestBuilderBase;, "Lcom/ning/http/client/RequestBuilderBase<TT;>;"
    const/4 v2, 0x0

    .line 371
    iput-object v2, p0, Lcom/ning/http/client/RequestBuilderBase;->queryParams:Ljava/util/List;

    .line 372
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase;->request:Lcom/ning/http/client/RequestBuilderBase$RequestImpl;

    iget-object v1, p0, Lcom/ning/http/client/RequestBuilderBase;->request:Lcom/ning/http/client/RequestBuilderBase$RequestImpl;

    invoke-static {v1}, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->access$100(Lcom/ning/http/client/RequestBuilderBase$RequestImpl;)Lcom/ning/http/client/uri/Uri;

    move-result-object v1

    invoke-virtual {v1, v2}, Lcom/ning/http/client/uri/Uri;->withNewQuery(Ljava/lang/String;)Lcom/ning/http/client/uri/Uri;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->access$102(Lcom/ning/http/client/RequestBuilderBase$RequestImpl;Lcom/ning/http/client/uri/Uri;)Lcom/ning/http/client/uri/Uri;

    .line 373
    return-void
.end method

.method public setBody(Lcom/ning/http/client/BodyGenerator;)Lcom/ning/http/client/RequestBuilderBase;
    .locals 1
    .param p1, "bodyGenerator"    # Lcom/ning/http/client/BodyGenerator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ning/http/client/BodyGenerator;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 430
    .local p0, "this":Lcom/ning/http/client/RequestBuilderBase;, "Lcom/ning/http/client/RequestBuilderBase<TT;>;"
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase;->request:Lcom/ning/http/client/RequestBuilderBase$RequestImpl;

    invoke-static {v0, p1}, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->access$1302(Lcom/ning/http/client/RequestBuilderBase$RequestImpl;Lcom/ning/http/client/BodyGenerator;)Lcom/ning/http/client/BodyGenerator;

    .line 431
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase;->derived:Ljava/lang/Class;

    invoke-virtual {v0, p0}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/RequestBuilderBase;

    return-object v0
.end method

.method public setBody(Ljava/io/File;)Lcom/ning/http/client/RequestBuilderBase;
    .locals 1
    .param p1, "file"    # Ljava/io/File;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/File;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 393
    .local p0, "this":Lcom/ning/http/client/RequestBuilderBase;, "Lcom/ning/http/client/RequestBuilderBase<TT;>;"
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase;->request:Lcom/ning/http/client/RequestBuilderBase$RequestImpl;

    invoke-static {v0, p1}, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->access$1502(Lcom/ning/http/client/RequestBuilderBase$RequestImpl;Ljava/io/File;)Ljava/io/File;

    .line 394
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase;->derived:Ljava/lang/Class;

    invoke-virtual {v0, p0}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/RequestBuilderBase;

    return-object v0
.end method

.method public setBody(Ljava/io/InputStream;)Lcom/ning/http/client/RequestBuilderBase;
    .locals 1
    .param p1, "stream"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/io/InputStream;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 422
    .local p0, "this":Lcom/ning/http/client/RequestBuilderBase;, "Lcom/ning/http/client/RequestBuilderBase<TT;>;"
    invoke-virtual {p0}, Lcom/ning/http/client/RequestBuilderBase;->resetFormParams()V

    .line 423
    invoke-virtual {p0}, Lcom/ning/http/client/RequestBuilderBase;->resetNonMultipartData()V

    .line 424
    invoke-virtual {p0}, Lcom/ning/http/client/RequestBuilderBase;->resetMultipartData()V

    .line 425
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase;->request:Lcom/ning/http/client/RequestBuilderBase$RequestImpl;

    invoke-static {v0, p1}, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->access$1202(Lcom/ning/http/client/RequestBuilderBase$RequestImpl;Ljava/io/InputStream;)Ljava/io/InputStream;

    .line 426
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase;->derived:Ljava/lang/Class;

    invoke-virtual {v0, p0}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/RequestBuilderBase;

    return-object v0
.end method

.method public setBody(Ljava/lang/String;)Lcom/ning/http/client/RequestBuilderBase;
    .locals 1
    .param p1, "data"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 414
    .local p0, "this":Lcom/ning/http/client/RequestBuilderBase;, "Lcom/ning/http/client/RequestBuilderBase<TT;>;"
    invoke-virtual {p0}, Lcom/ning/http/client/RequestBuilderBase;->resetFormParams()V

    .line 415
    invoke-virtual {p0}, Lcom/ning/http/client/RequestBuilderBase;->resetNonMultipartData()V

    .line 416
    invoke-virtual {p0}, Lcom/ning/http/client/RequestBuilderBase;->resetMultipartData()V

    .line 417
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase;->request:Lcom/ning/http/client/RequestBuilderBase$RequestImpl;

    invoke-static {v0, p1}, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->access$1102(Lcom/ning/http/client/RequestBuilderBase$RequestImpl;Ljava/lang/String;)Ljava/lang/String;

    .line 418
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase;->derived:Ljava/lang/Class;

    invoke-virtual {v0, p0}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/RequestBuilderBase;

    return-object v0
.end method

.method public setBody(Ljava/util/List;)Lcom/ning/http/client/RequestBuilderBase;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<[B>;)TT;"
        }
    .end annotation

    .prologue
    .line 406
    .local p0, "this":Lcom/ning/http/client/RequestBuilderBase;, "Lcom/ning/http/client/RequestBuilderBase<TT;>;"
    .local p1, "data":Ljava/util/List;, "Ljava/util/List<[B>;"
    invoke-virtual {p0}, Lcom/ning/http/client/RequestBuilderBase;->resetFormParams()V

    .line 407
    invoke-virtual {p0}, Lcom/ning/http/client/RequestBuilderBase;->resetNonMultipartData()V

    .line 408
    invoke-virtual {p0}, Lcom/ning/http/client/RequestBuilderBase;->resetMultipartData()V

    .line 409
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase;->request:Lcom/ning/http/client/RequestBuilderBase$RequestImpl;

    invoke-static {v0, p1}, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->access$1002(Lcom/ning/http/client/RequestBuilderBase$RequestImpl;Ljava/util/List;)Ljava/util/List;

    .line 410
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase;->derived:Ljava/lang/Class;

    invoke-virtual {v0, p0}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/RequestBuilderBase;

    return-object v0
.end method

.method public setBody([B)Lcom/ning/http/client/RequestBuilderBase;
    .locals 1
    .param p1, "data"    # [B
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([B)TT;"
        }
    .end annotation

    .prologue
    .line 398
    .local p0, "this":Lcom/ning/http/client/RequestBuilderBase;, "Lcom/ning/http/client/RequestBuilderBase<TT;>;"
    invoke-virtual {p0}, Lcom/ning/http/client/RequestBuilderBase;->resetFormParams()V

    .line 399
    invoke-virtual {p0}, Lcom/ning/http/client/RequestBuilderBase;->resetNonMultipartData()V

    .line 400
    invoke-virtual {p0}, Lcom/ning/http/client/RequestBuilderBase;->resetMultipartData()V

    .line 401
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase;->request:Lcom/ning/http/client/RequestBuilderBase$RequestImpl;

    invoke-static {v0, p1}, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->access$902(Lcom/ning/http/client/RequestBuilderBase$RequestImpl;[B)[B

    .line 402
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase;->derived:Ljava/lang/Class;

    invoke-virtual {v0, p0}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/RequestBuilderBase;

    return-object v0
.end method

.method public setBodyEncoding(Ljava/lang/String;)Lcom/ning/http/client/RequestBuilderBase;
    .locals 1
    .param p1, "charset"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 533
    .local p0, "this":Lcom/ning/http/client/RequestBuilderBase;, "Lcom/ning/http/client/RequestBuilderBase<TT;>;"
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase;->request:Lcom/ning/http/client/RequestBuilderBase$RequestImpl;

    iput-object p1, v0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->charset:Ljava/lang/String;

    .line 534
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase;->derived:Ljava/lang/Class;

    invoke-virtual {v0, p0}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/RequestBuilderBase;

    return-object v0
.end method

.method public setConnectionPoolKeyStrategy(Lcom/ning/http/client/ConnectionPoolPartitioning;)Lcom/ning/http/client/RequestBuilderBase;
    .locals 1
    .param p1, "connectionPoolKeyStrategy"    # Lcom/ning/http/client/ConnectionPoolPartitioning;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ning/http/client/ConnectionPoolPartitioning;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 538
    .local p0, "this":Lcom/ning/http/client/RequestBuilderBase;, "Lcom/ning/http/client/RequestBuilderBase<TT;>;"
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase;->request:Lcom/ning/http/client/RequestBuilderBase$RequestImpl;

    invoke-static {v0, p1}, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->access$2002(Lcom/ning/http/client/RequestBuilderBase$RequestImpl;Lcom/ning/http/client/ConnectionPoolPartitioning;)Lcom/ning/http/client/ConnectionPoolPartitioning;

    .line 539
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase;->derived:Ljava/lang/Class;

    invoke-virtual {v0, p0}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/RequestBuilderBase;

    return-object v0
.end method

.method public setContentLength(I)Lcom/ning/http/client/RequestBuilderBase;
    .locals 4
    .param p1, "length"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .prologue
    .line 325
    .local p0, "this":Lcom/ning/http/client/RequestBuilderBase;, "Lcom/ning/http/client/RequestBuilderBase<TT;>;"
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase;->request:Lcom/ning/http/client/RequestBuilderBase$RequestImpl;

    int-to-long v2, p1

    invoke-static {v0, v2, v3}, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->access$602(Lcom/ning/http/client/RequestBuilderBase$RequestImpl;J)J

    .line 326
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase;->derived:Ljava/lang/Class;

    invoke-virtual {v0, p0}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/RequestBuilderBase;

    return-object v0
.end method

.method public setCookies(Ljava/util/Collection;)Lcom/ning/http/client/RequestBuilderBase;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection",
            "<",
            "Lcom/ning/http/client/cookie/Cookie;",
            ">;)TT;"
        }
    .end annotation

    .prologue
    .line 335
    .local p0, "this":Lcom/ning/http/client/RequestBuilderBase;, "Lcom/ning/http/client/RequestBuilderBase<TT;>;"
    .local p1, "cookies":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/ning/http/client/cookie/Cookie;>;"
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase;->request:Lcom/ning/http/client/RequestBuilderBase$RequestImpl;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-static {v0, v1}, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->access$702(Lcom/ning/http/client/RequestBuilderBase$RequestImpl;Ljava/util/ArrayList;)Ljava/util/ArrayList;

    .line 336
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase;->derived:Ljava/lang/Class;

    invoke-virtual {v0, p0}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/RequestBuilderBase;

    return-object v0
.end method

.method public setFollowRedirects(Z)Lcom/ning/http/client/RequestBuilderBase;
    .locals 2
    .param p1, "followRedirects"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)TT;"
        }
    .end annotation

    .prologue
    .line 513
    .local p0, "this":Lcom/ning/http/client/RequestBuilderBase;, "Lcom/ning/http/client/RequestBuilderBase<TT;>;"
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase;->request:Lcom/ning/http/client/RequestBuilderBase$RequestImpl;

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->access$1702(Lcom/ning/http/client/RequestBuilderBase$RequestImpl;Ljava/lang/Boolean;)Ljava/lang/Boolean;

    .line 514
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase;->derived:Ljava/lang/Class;

    invoke-virtual {v0, p0}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/RequestBuilderBase;

    return-object v0
.end method

.method public setFormParams(Ljava/util/List;)Lcom/ning/http/client/RequestBuilderBase;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/ning/http/client/Param;",
            ">;)TT;"
        }
    .end annotation

    .prologue
    .line 487
    .local p0, "this":Lcom/ning/http/client/RequestBuilderBase;, "Lcom/ning/http/client/RequestBuilderBase<TT;>;"
    .local p1, "params":Ljava/util/List;, "Ljava/util/List<Lcom/ning/http/client/Param;>;"
    invoke-virtual {p0}, Lcom/ning/http/client/RequestBuilderBase;->resetNonMultipartData()V

    .line 488
    invoke-virtual {p0}, Lcom/ning/http/client/RequestBuilderBase;->resetMultipartData()V

    .line 489
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase;->request:Lcom/ning/http/client/RequestBuilderBase$RequestImpl;

    invoke-static {v0, p1}, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->access$802(Lcom/ning/http/client/RequestBuilderBase$RequestImpl;Ljava/util/List;)Ljava/util/List;

    .line 490
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase;->derived:Ljava/lang/Class;

    invoke-virtual {v0, p0}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/RequestBuilderBase;

    return-object v0
.end method

.method public setFormParams(Ljava/util/Map;)Lcom/ning/http/client/RequestBuilderBase;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;>;)TT;"
        }
    .end annotation

    .prologue
    .line 484
    .local p0, "this":Lcom/ning/http/client/RequestBuilderBase;, "Lcom/ning/http/client/RequestBuilderBase<TT;>;"
    .local p1, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    invoke-direct {p0, p1}, Lcom/ning/http/client/RequestBuilderBase;->map2ParamList(Ljava/util/Map;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/ning/http/client/RequestBuilderBase;->setFormParams(Ljava/util/List;)Lcom/ning/http/client/RequestBuilderBase;

    move-result-object v0

    return-object v0
.end method

.method public setHeader(Ljava/lang/String;Ljava/lang/String;)Lcom/ning/http/client/RequestBuilderBase;
    .locals 3
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 300
    .local p0, "this":Lcom/ning/http/client/RequestBuilderBase;, "Lcom/ning/http/client/RequestBuilderBase<TT;>;"
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase;->request:Lcom/ning/http/client/RequestBuilderBase$RequestImpl;

    invoke-static {v0}, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->access$500(Lcom/ning/http/client/RequestBuilderBase$RequestImpl;)Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    move-result-object v0

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    aput-object p2, v1, v2

    invoke-virtual {v0, p1, v1}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;->replaceWith(Ljava/lang/String;[Ljava/lang/String;)Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    .line 301
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase;->derived:Ljava/lang/Class;

    invoke-virtual {v0, p0}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/RequestBuilderBase;

    return-object v0
.end method

.method public setHeaders(Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;)Lcom/ning/http/client/RequestBuilderBase;
    .locals 2
    .param p1, "headers"    # Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 315
    .local p0, "this":Lcom/ning/http/client/RequestBuilderBase;, "Lcom/ning/http/client/RequestBuilderBase<TT;>;"
    iget-object v1, p0, Lcom/ning/http/client/RequestBuilderBase;->request:Lcom/ning/http/client/RequestBuilderBase$RequestImpl;

    if-nez p1, :cond_0

    new-instance v0, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    invoke-direct {v0}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;-><init>()V

    :goto_0
    invoke-static {v1, v0}, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->access$502(Lcom/ning/http/client/RequestBuilderBase$RequestImpl;Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;)Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    .line 316
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase;->derived:Ljava/lang/Class;

    invoke-virtual {v0, p0}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/RequestBuilderBase;

    return-object v0

    .line 315
    :cond_0
    new-instance v0, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    invoke-direct {v0, p1}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;-><init>(Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;)V

    goto :goto_0
.end method

.method public setHeaders(Ljava/util/Map;)Lcom/ning/http/client/RequestBuilderBase;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/String;",
            ">;>;)TT;"
        }
    .end annotation

    .prologue
    .line 320
    .local p0, "this":Lcom/ning/http/client/RequestBuilderBase;, "Lcom/ning/http/client/RequestBuilderBase<TT;>;"
    .local p1, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/Collection<Ljava/lang/String;>;>;"
    iget-object v1, p0, Lcom/ning/http/client/RequestBuilderBase;->request:Lcom/ning/http/client/RequestBuilderBase$RequestImpl;

    if-nez p1, :cond_0

    new-instance v0, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    invoke-direct {v0}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;-><init>()V

    :goto_0
    invoke-static {v1, v0}, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->access$502(Lcom/ning/http/client/RequestBuilderBase$RequestImpl;Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;)Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    .line 321
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase;->derived:Ljava/lang/Class;

    invoke-virtual {v0, p0}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/RequestBuilderBase;

    return-object v0

    .line 320
    :cond_0
    new-instance v0, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    invoke-direct {v0, p1}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;-><init>(Ljava/util/Map;)V

    goto :goto_0
.end method

.method public setInetAddress(Ljava/net/InetAddress;)Lcom/ning/http/client/RequestBuilderBase;
    .locals 1
    .param p1, "address"    # Ljava/net/InetAddress;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/net/InetAddress;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 285
    .local p0, "this":Lcom/ning/http/client/RequestBuilderBase;, "Lcom/ning/http/client/RequestBuilderBase<TT;>;"
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase;->request:Lcom/ning/http/client/RequestBuilderBase$RequestImpl;

    invoke-static {v0, p1}, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->access$202(Lcom/ning/http/client/RequestBuilderBase$RequestImpl;Ljava/net/InetAddress;)Ljava/net/InetAddress;

    .line 286
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase;->derived:Ljava/lang/Class;

    invoke-virtual {v0, p0}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/RequestBuilderBase;

    return-object v0
.end method

.method public setLocalInetAddress(Ljava/net/InetAddress;)Lcom/ning/http/client/RequestBuilderBase;
    .locals 1
    .param p1, "address"    # Ljava/net/InetAddress;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/net/InetAddress;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 290
    .local p0, "this":Lcom/ning/http/client/RequestBuilderBase;, "Lcom/ning/http/client/RequestBuilderBase<TT;>;"
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase;->request:Lcom/ning/http/client/RequestBuilderBase$RequestImpl;

    invoke-static {v0, p1}, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->access$302(Lcom/ning/http/client/RequestBuilderBase$RequestImpl;Ljava/net/InetAddress;)Ljava/net/InetAddress;

    .line 291
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase;->derived:Ljava/lang/Class;

    invoke-virtual {v0, p0}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/RequestBuilderBase;

    return-object v0
.end method

.method public setMethod(Ljava/lang/String;)Lcom/ning/http/client/RequestBuilderBase;
    .locals 1
    .param p1, "method"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 528
    .local p0, "this":Lcom/ning/http/client/RequestBuilderBase;, "Lcom/ning/http/client/RequestBuilderBase<TT;>;"
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase;->request:Lcom/ning/http/client/RequestBuilderBase$RequestImpl;

    invoke-static {v0, p1}, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->access$002(Lcom/ning/http/client/RequestBuilderBase$RequestImpl;Ljava/lang/String;)Ljava/lang/String;

    .line 529
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase;->derived:Ljava/lang/Class;

    invoke-virtual {v0, p0}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/RequestBuilderBase;

    return-object v0
.end method

.method public setProxyServer(Lcom/ning/http/client/ProxyServer;)Lcom/ning/http/client/RequestBuilderBase;
    .locals 1
    .param p1, "proxyServer"    # Lcom/ning/http/client/ProxyServer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ning/http/client/ProxyServer;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 503
    .local p0, "this":Lcom/ning/http/client/RequestBuilderBase;, "Lcom/ning/http/client/RequestBuilderBase<TT;>;"
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase;->request:Lcom/ning/http/client/RequestBuilderBase$RequestImpl;

    iput-object p1, v0, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->proxyServer:Lcom/ning/http/client/ProxyServer;

    .line 504
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase;->derived:Ljava/lang/Class;

    invoke-virtual {v0, p0}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/RequestBuilderBase;

    return-object v0
.end method

.method public setQueryParams(Ljava/util/List;)Lcom/ning/http/client/RequestBuilderBase;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/ning/http/client/Param;",
            ">;)TT;"
        }
    .end annotation

    .prologue
    .line 468
    .local p0, "this":Lcom/ning/http/client/RequestBuilderBase;, "Lcom/ning/http/client/RequestBuilderBase<TT;>;"
    .local p1, "params":Ljava/util/List;, "Ljava/util/List<Lcom/ning/http/client/Param;>;"
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase;->request:Lcom/ning/http/client/RequestBuilderBase$RequestImpl;

    invoke-static {v0}, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->access$100(Lcom/ning/http/client/RequestBuilderBase$RequestImpl;)Lcom/ning/http/client/uri/Uri;

    move-result-object v0

    invoke-virtual {v0}, Lcom/ning/http/client/uri/Uri;->getQuery()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/ning/http/util/MiscUtils;->isNonEmpty(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 469
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase;->request:Lcom/ning/http/client/RequestBuilderBase$RequestImpl;

    iget-object v1, p0, Lcom/ning/http/client/RequestBuilderBase;->request:Lcom/ning/http/client/RequestBuilderBase$RequestImpl;

    invoke-static {v1}, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->access$100(Lcom/ning/http/client/RequestBuilderBase$RequestImpl;)Lcom/ning/http/client/uri/Uri;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/ning/http/client/uri/Uri;->withNewQuery(Ljava/lang/String;)Lcom/ning/http/client/uri/Uri;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->access$102(Lcom/ning/http/client/RequestBuilderBase$RequestImpl;Lcom/ning/http/client/uri/Uri;)Lcom/ning/http/client/uri/Uri;

    .line 470
    :cond_0
    iput-object p1, p0, Lcom/ning/http/client/RequestBuilderBase;->queryParams:Ljava/util/List;

    .line 471
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase;->derived:Ljava/lang/Class;

    invoke-virtual {v0, p0}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/RequestBuilderBase;

    return-object v0
.end method

.method public setQueryParams(Ljava/util/Map;)Lcom/ning/http/client/RequestBuilderBase;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;>;)TT;"
        }
    .end annotation

    .prologue
    .line 463
    .local p0, "this":Lcom/ning/http/client/RequestBuilderBase;, "Lcom/ning/http/client/RequestBuilderBase<TT;>;"
    .local p1, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    invoke-direct {p0, p1}, Lcom/ning/http/client/RequestBuilderBase;->map2ParamList(Ljava/util/Map;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/ning/http/client/RequestBuilderBase;->setQueryParams(Ljava/util/List;)Lcom/ning/http/client/RequestBuilderBase;

    move-result-object v0

    return-object v0
.end method

.method public setRangeOffset(J)Lcom/ning/http/client/RequestBuilderBase;
    .locals 1
    .param p1, "rangeOffset"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)TT;"
        }
    .end annotation

    .prologue
    .line 523
    .local p0, "this":Lcom/ning/http/client/RequestBuilderBase;, "Lcom/ning/http/client/RequestBuilderBase<TT;>;"
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase;->request:Lcom/ning/http/client/RequestBuilderBase$RequestImpl;

    invoke-static {v0, p1, p2}, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->access$1902(Lcom/ning/http/client/RequestBuilderBase$RequestImpl;J)J

    .line 524
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase;->derived:Ljava/lang/Class;

    invoke-virtual {v0, p0}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/RequestBuilderBase;

    return-object v0
.end method

.method public setRealm(Lcom/ning/http/client/Realm;)Lcom/ning/http/client/RequestBuilderBase;
    .locals 1
    .param p1, "realm"    # Lcom/ning/http/client/Realm;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ning/http/client/Realm;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 508
    .local p0, "this":Lcom/ning/http/client/RequestBuilderBase;, "Lcom/ning/http/client/RequestBuilderBase<TT;>;"
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase;->request:Lcom/ning/http/client/RequestBuilderBase$RequestImpl;

    invoke-static {v0, p1}, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->access$1602(Lcom/ning/http/client/RequestBuilderBase$RequestImpl;Lcom/ning/http/client/Realm;)Lcom/ning/http/client/Realm;

    .line 509
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase;->derived:Ljava/lang/Class;

    invoke-virtual {v0, p0}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/RequestBuilderBase;

    return-object v0
.end method

.method public setRequestTimeout(I)Lcom/ning/http/client/RequestBuilderBase;
    .locals 1
    .param p1, "requestTimeout"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .prologue
    .line 518
    .local p0, "this":Lcom/ning/http/client/RequestBuilderBase;, "Lcom/ning/http/client/RequestBuilderBase<TT;>;"
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase;->request:Lcom/ning/http/client/RequestBuilderBase$RequestImpl;

    invoke-static {v0, p1}, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->access$1802(Lcom/ning/http/client/RequestBuilderBase$RequestImpl;I)I

    .line 519
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase;->derived:Ljava/lang/Class;

    invoke-virtual {v0, p0}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/RequestBuilderBase;

    return-object v0
.end method

.method public setSignatureCalculator(Lcom/ning/http/client/SignatureCalculator;)Lcom/ning/http/client/RequestBuilderBase;
    .locals 1
    .param p1, "signatureCalculator"    # Lcom/ning/http/client/SignatureCalculator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ning/http/client/SignatureCalculator;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 543
    .local p0, "this":Lcom/ning/http/client/RequestBuilderBase;, "Lcom/ning/http/client/RequestBuilderBase<TT;>;"
    iput-object p1, p0, Lcom/ning/http/client/RequestBuilderBase;->signatureCalculator:Lcom/ning/http/client/SignatureCalculator;

    .line 544
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase;->derived:Ljava/lang/Class;

    invoke-virtual {v0, p0}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/RequestBuilderBase;

    return-object v0
.end method

.method public setUri(Lcom/ning/http/client/uri/Uri;)Lcom/ning/http/client/RequestBuilderBase;
    .locals 1
    .param p1, "uri"    # Lcom/ning/http/client/uri/Uri;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ning/http/client/uri/Uri;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 280
    .local p0, "this":Lcom/ning/http/client/RequestBuilderBase;, "Lcom/ning/http/client/RequestBuilderBase<TT;>;"
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase;->request:Lcom/ning/http/client/RequestBuilderBase$RequestImpl;

    invoke-static {v0, p1}, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->access$102(Lcom/ning/http/client/RequestBuilderBase$RequestImpl;Lcom/ning/http/client/uri/Uri;)Lcom/ning/http/client/uri/Uri;

    .line 281
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase;->derived:Ljava/lang/Class;

    invoke-virtual {v0, p0}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/RequestBuilderBase;

    return-object v0
.end method

.method public setUrl(Ljava/lang/String;)Lcom/ning/http/client/RequestBuilderBase;
    .locals 1
    .param p1, "url"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 276
    .local p0, "this":Lcom/ning/http/client/RequestBuilderBase;, "Lcom/ning/http/client/RequestBuilderBase<TT;>;"
    invoke-static {p1}, Lcom/ning/http/client/uri/Uri;->create(Ljava/lang/String;)Lcom/ning/http/client/uri/Uri;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/ning/http/client/RequestBuilderBase;->setUri(Lcom/ning/http/client/uri/Uri;)Lcom/ning/http/client/RequestBuilderBase;

    move-result-object v0

    return-object v0
.end method

.method public setVirtualHost(Ljava/lang/String;)Lcom/ning/http/client/RequestBuilderBase;
    .locals 1
    .param p1, "virtualHost"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 295
    .local p0, "this":Lcom/ning/http/client/RequestBuilderBase;, "Lcom/ning/http/client/RequestBuilderBase<TT;>;"
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase;->request:Lcom/ning/http/client/RequestBuilderBase$RequestImpl;

    invoke-static {v0, p1}, Lcom/ning/http/client/RequestBuilderBase$RequestImpl;->access$402(Lcom/ning/http/client/RequestBuilderBase$RequestImpl;Ljava/lang/String;)Ljava/lang/String;

    .line 296
    iget-object v0, p0, Lcom/ning/http/client/RequestBuilderBase;->derived:Ljava/lang/Class;

    invoke-virtual {v0, p0}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/ning/http/client/RequestBuilderBase;

    return-object v0
.end method
