.class public Lcom/disney/emagine/sdk/networking/EMTRestClient;
.super Ljava/lang/Object;
.source "EMTRestClient.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/disney/emagine/sdk/networking/EMTRestClient$restCallable;,
        Lcom/disney/emagine/sdk/networking/EMTRestClient$EMTRestTask;
    }
.end annotation


# static fields
.field private static final CONN_TIMEOUT:I = 0xa

.field private static final HTTPS_PORT_443:I = 0x1bb

.field private static final HTTPS_PROTOCOL:Ljava/lang/String; = "https"

.field private static final HTTP_PORT_80:I = 0x50

.field private static final HTTP_PROTOCOL:Ljava/lang/String; = "http"

.field private static final HTTP_PROTOCOL_EXPECT_CONTINUE:Ljava/lang/String; = "http.protocol.expect-continue"

.field private static final PROXY_DISNEY123:Ljava/lang/String; = "Disney123"

.field private static final PROXY_HOST:Ljava/lang/String; = "emagine.starwave.com"

.field private static final PROXY_PORT:I = 0x0

.field private static final PROXY_USER:Ljava/lang/String; = "user"

.field private static final SOCK_TIMEOUT:I = 0xa

.field public static final UseCellophane:Z = true

.field private static final executorService:Ljava/util/concurrent/ExecutorService;


# instance fields
.field private httpClient:Lorg/apache/http/client/HttpClient;

.field private mParent:Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

.field private final mTasks:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/disney/emagine/sdk/networking/EMTRestClient$EMTRestTask;",
            ">;"
        }
    .end annotation
.end field

.field private retryHandler:Lorg/apache/http/client/HttpRequestRetryHandler;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 80
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Lcom/disney/emagine/sdk/networking/EMTRestClient;->executorService:Ljava/util/concurrent/ExecutorService;

    return-void
.end method

.method public constructor <init>(Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;)V
    .locals 1
    .param p1, "parent"    # Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

    .prologue
    .line 106
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 100
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/disney/emagine/sdk/networking/EMTRestClient;->httpClient:Lorg/apache/http/client/HttpClient;

    .line 104
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/disney/emagine/sdk/networking/EMTRestClient;->mTasks:Ljava/util/List;

    .line 394
    new-instance v0, Lcom/disney/emagine/sdk/networking/EMTRestClient$1;

    invoke-direct {v0, p0}, Lcom/disney/emagine/sdk/networking/EMTRestClient$1;-><init>(Lcom/disney/emagine/sdk/networking/EMTRestClient;)V

    iput-object v0, p0, Lcom/disney/emagine/sdk/networking/EMTRestClient;->retryHandler:Lorg/apache/http/client/HttpRequestRetryHandler;

    .line 107
    iput-object p1, p0, Lcom/disney/emagine/sdk/networking/EMTRestClient;->mParent:Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

    .line 108
    return-void
.end method

.method static synthetic access$000(Lcom/disney/emagine/sdk/networking/EMTRestClient;)Lorg/apache/http/client/HttpClient;
    .locals 1
    .param p0, "x0"    # Lcom/disney/emagine/sdk/networking/EMTRestClient;

    .prologue
    .line 78
    iget-object v0, p0, Lcom/disney/emagine/sdk/networking/EMTRestClient;->httpClient:Lorg/apache/http/client/HttpClient;

    return-object v0
.end method

.method static synthetic access$100(Lcom/disney/emagine/sdk/networking/EMTRestClient;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lcom/disney/emagine/sdk/networking/EMTRestClient;

    .prologue
    .line 78
    iget-object v0, p0, Lcom/disney/emagine/sdk/networking/EMTRestClient;->mTasks:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$200(Lcom/disney/emagine/sdk/networking/EMTRestClient;)Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;
    .locals 1
    .param p0, "x0"    # Lcom/disney/emagine/sdk/networking/EMTRestClient;

    .prologue
    .line 78
    iget-object v0, p0, Lcom/disney/emagine/sdk/networking/EMTRestClient;->mParent:Lcom/disney/emagine/sdk/networking/EmagineNetworkClient;

    return-object v0
.end method

.method private static buildGETRequest(Ljava/lang/String;Ljava/util/Map;Ljava/util/ArrayList;)Lorg/apache/http/client/methods/HttpGet;
    .locals 4
    .param p0, "url"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Lorg/apache/http/NameValuePair;",
            ">;)",
            "Lorg/apache/http/client/methods/HttpGet;"
        }
    .end annotation

    .prologue
    .line 306
    .local p1, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .local p2, "headers":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/apache/http/NameValuePair;>;"
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {p1}, Lcom/disney/emagine/sdk/networking/EMTRestClient;->requestParamsString(Ljava/util/Map;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 307
    .local v1, "urlWithParams":Ljava/lang/String;
    new-instance v0, Lorg/apache/http/client/methods/HttpGet;

    invoke-direct {v0, v1}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    .line 310
    .local v0, "request":Lorg/apache/http/client/methods/HttpGet;
    invoke-static {v0, p2}, Lcom/disney/emagine/sdk/networking/EMTRestClient;->setHeaders(Lorg/apache/http/client/methods/HttpUriRequest;Ljava/util/ArrayList;)V

    .line 312
    return-object v0
.end method

.method private static buildPOSTRequest(Ljava/lang/String;Ljava/util/Map;Ljava/util/ArrayList;Ljava/lang/String;)Lorg/apache/http/client/methods/HttpPost;
    .locals 1
    .param p0, "url"    # Ljava/lang/String;
    .param p3, "jsonContent"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Lorg/apache/http/NameValuePair;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Lorg/apache/http/client/methods/HttpPost;"
        }
    .end annotation

    .prologue
    .line 317
    .local p1, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .local p2, "headers":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/apache/http/NameValuePair;>;"
    new-instance v0, Lorg/apache/http/client/methods/HttpPost;

    invoke-direct {v0, p0}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    .line 320
    .local v0, "request":Lorg/apache/http/client/methods/HttpPost;
    invoke-static {v0, p2}, Lcom/disney/emagine/sdk/networking/EMTRestClient;->setHeaders(Lorg/apache/http/client/methods/HttpUriRequest;Ljava/util/ArrayList;)V

    .line 323
    invoke-static {v0, p1, p3}, Lcom/disney/emagine/sdk/networking/EMTRestClient;->setBody(Lorg/apache/http/client/methods/HttpPost;Ljava/util/Map;Ljava/lang/String;)V

    .line 325
    return-object v0
.end method

.method private static buildPUTRequest(Ljava/lang/String;Ljava/util/Map;Ljava/util/ArrayList;Ljava/lang/String;)Lorg/apache/http/client/methods/HttpPut;
    .locals 1
    .param p0, "url"    # Ljava/lang/String;
    .param p3, "jsonContent"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Lorg/apache/http/NameValuePair;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Lorg/apache/http/client/methods/HttpPut;"
        }
    .end annotation

    .prologue
    .line 330
    .local p1, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .local p2, "headers":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/apache/http/NameValuePair;>;"
    new-instance v0, Lorg/apache/http/client/methods/HttpPut;

    invoke-direct {v0, p0}, Lorg/apache/http/client/methods/HttpPut;-><init>(Ljava/lang/String;)V

    .line 333
    .local v0, "request":Lorg/apache/http/client/methods/HttpPut;
    invoke-static {v0, p2}, Lcom/disney/emagine/sdk/networking/EMTRestClient;->setHeaders(Lorg/apache/http/client/methods/HttpUriRequest;Ljava/util/ArrayList;)V

    .line 336
    invoke-static {v0, p1, p3}, Lcom/disney/emagine/sdk/networking/EMTRestClient;->setBody(Lorg/apache/http/client/methods/HttpPut;Ljava/util/Map;Ljava/lang/String;)V

    .line 338
    return-object v0
.end method

.method public static getContent(Lorg/apache/http/HttpResponse;)[B
    .locals 10
    .param p0, "response"    # Lorg/apache/http/HttpResponse;

    .prologue
    const/4 v9, 0x1

    const/4 v7, 0x0

    .line 153
    if-nez p0, :cond_1

    move-object v1, v7

    .line 208
    :cond_0
    :goto_0
    return-object v1

    .line 160
    :cond_1
    invoke-interface {p0}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v6

    .line 161
    .local v6, "entity":Lorg/apache/http/HttpEntity;
    const/4 v2, 0x0

    .line 162
    .local v2, "contentString":Ljava/lang/String;
    const/4 v1, 0x0

    .line 164
    .local v1, "content":[B
    if-nez v6, :cond_2

    move-object v1, v7

    .line 166
    goto :goto_0

    .line 169
    :cond_2
    if-eqz v6, :cond_5

    .line 173
    const/4 v8, 0x0

    :try_start_0
    invoke-static {v8}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    .line 174
    .local v0, "binaryType":Ljava/lang/Boolean;
    invoke-interface {v6}, Lorg/apache/http/HttpEntity;->getContentType()Lorg/apache/http/Header;

    move-result-object v3

    .line 175
    .local v3, "contentType":Lorg/apache/http/Header;
    if-eqz v3, :cond_4

    .line 177
    invoke-interface {v3}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v4

    .line 178
    .local v4, "contentTypeString":Ljava/lang/String;
    const-string v8, "octet-stream"

    invoke-virtual {v4, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_3

    const-string v8, "bin"

    invoke-virtual {v4, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v8

    if-nez v8, :cond_3

    const-string v8, "zip"

    invoke-virtual {v4, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_4

    .line 180
    :cond_3
    const/4 v8, 0x1

    invoke-static {v8}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    .line 184
    .end local v4    # "contentTypeString":Ljava/lang/String;
    :cond_4
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v8

    if-ne v8, v9, :cond_6

    .line 186
    invoke-static {v6}, Lorg/apache/http/util/EntityUtils;->toByteArray(Lorg/apache/http/HttpEntity;)[B

    move-result-object v1

    .line 203
    .end local v0    # "binaryType":Ljava/lang/Boolean;
    .end local v3    # "contentType":Lorg/apache/http/Header;
    :cond_5
    :goto_1
    if-nez v1, :cond_0

    move-object v1, v7

    .line 205
    goto :goto_0

    .line 189
    .restart local v0    # "binaryType":Ljava/lang/Boolean;
    .restart local v3    # "contentType":Lorg/apache/http/Header;
    :cond_6
    invoke-static {v6}, Lorg/apache/http/util/EntityUtils;->toString(Lorg/apache/http/HttpEntity;)Ljava/lang/String;

    move-result-object v2

    .line 190
    invoke-virtual {v2}, Ljava/lang/String;->getBytes()[B
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lorg/apache/http/ParseException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v1

    goto :goto_1

    .line 193
    .end local v0    # "binaryType":Ljava/lang/Boolean;
    .end local v3    # "contentType":Lorg/apache/http/Header;
    :catch_0
    move-exception v5

    .line 195
    .local v5, "e":Ljava/io/IOException;
    invoke-virtual {v5}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_1

    .line 197
    .end local v5    # "e":Ljava/io/IOException;
    :catch_1
    move-exception v5

    .line 199
    .local v5, "e":Lorg/apache/http/ParseException;
    invoke-virtual {v5}, Lorg/apache/http/ParseException;->printStackTrace()V

    goto :goto_1
.end method

.method public static getHttpClient()Lorg/apache/http/client/HttpClient;
    .locals 1

    .prologue
    .line 359
    new-instance v0, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v0}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    return-object v0
.end method

.method public static getNewHttpClient()Lorg/apache/http/client/HttpClient;
    .locals 10

    .prologue
    .line 366
    :try_start_0
    invoke-static {}, Ljava/security/KeyStore;->getDefaultType()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/security/KeyStore;->getInstance(Ljava/lang/String;)Ljava/security/KeyStore;

    move-result-object v5

    .line 368
    .local v5, "trustStore":Ljava/security/KeyStore;
    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual {v5, v6, v7}, Ljava/security/KeyStore;->load(Ljava/io/InputStream;[C)V

    .line 370
    new-instance v4, Lcom/disney/emagine/sdk/networking/EMTSSLSocketFactory;

    invoke-direct {v4, v5}, Lcom/disney/emagine/sdk/networking/EMTSSLSocketFactory;-><init>(Ljava/security/KeyStore;)V

    .line 372
    .local v4, "sf":Lorg/apache/http/conn/ssl/SSLSocketFactory;
    sget-object v6, Lorg/apache/http/conn/ssl/SSLSocketFactory;->STRICT_HOSTNAME_VERIFIER:Lorg/apache/http/conn/ssl/X509HostnameVerifier;

    invoke-virtual {v4, v6}, Lorg/apache/http/conn/ssl/SSLSocketFactory;->setHostnameVerifier(Lorg/apache/http/conn/ssl/X509HostnameVerifier;)V

    .line 374
    new-instance v2, Lorg/apache/http/params/BasicHttpParams;

    invoke-direct {v2}, Lorg/apache/http/params/BasicHttpParams;-><init>()V

    .line 376
    .local v2, "params":Lorg/apache/http/params/HttpParams;
    sget-object v6, Lorg/apache/http/HttpVersion;->HTTP_1_1:Lorg/apache/http/HttpVersion;

    invoke-static {v2, v6}, Lorg/apache/http/params/HttpProtocolParams;->setVersion(Lorg/apache/http/params/HttpParams;Lorg/apache/http/ProtocolVersion;)V

    .line 377
    const-string v6, "UTF-8"

    invoke-static {v2, v6}, Lorg/apache/http/params/HttpProtocolParams;->setContentCharset(Lorg/apache/http/params/HttpParams;Ljava/lang/String;)V

    .line 379
    new-instance v3, Lorg/apache/http/conn/scheme/SchemeRegistry;

    invoke-direct {v3}, Lorg/apache/http/conn/scheme/SchemeRegistry;-><init>()V

    .line 381
    .local v3, "registry":Lorg/apache/http/conn/scheme/SchemeRegistry;
    new-instance v6, Lorg/apache/http/conn/scheme/Scheme;

    const-string v7, "http"

    invoke-static {}, Lorg/apache/http/conn/scheme/PlainSocketFactory;->getSocketFactory()Lorg/apache/http/conn/scheme/PlainSocketFactory;

    move-result-object v8

    const/16 v9, 0x50

    invoke-direct {v6, v7, v8, v9}, Lorg/apache/http/conn/scheme/Scheme;-><init>(Ljava/lang/String;Lorg/apache/http/conn/scheme/SocketFactory;I)V

    invoke-virtual {v3, v6}, Lorg/apache/http/conn/scheme/SchemeRegistry;->register(Lorg/apache/http/conn/scheme/Scheme;)Lorg/apache/http/conn/scheme/Scheme;

    .line 382
    new-instance v6, Lorg/apache/http/conn/scheme/Scheme;

    const-string v7, "https"

    const/16 v8, 0x1bb

    invoke-direct {v6, v7, v4, v8}, Lorg/apache/http/conn/scheme/Scheme;-><init>(Ljava/lang/String;Lorg/apache/http/conn/scheme/SocketFactory;I)V

    invoke-virtual {v3, v6}, Lorg/apache/http/conn/scheme/SchemeRegistry;->register(Lorg/apache/http/conn/scheme/Scheme;)Lorg/apache/http/conn/scheme/Scheme;

    .line 384
    new-instance v0, Lorg/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager;

    invoke-direct {v0, v2, v3}, Lorg/apache/http/impl/conn/tsccm/ThreadSafeClientConnManager;-><init>(Lorg/apache/http/params/HttpParams;Lorg/apache/http/conn/scheme/SchemeRegistry;)V

    .line 386
    .local v0, "ccm":Lorg/apache/http/conn/ClientConnectionManager;
    new-instance v6, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v6, v0, v2}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>(Lorg/apache/http/conn/ClientConnectionManager;Lorg/apache/http/params/HttpParams;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 390
    .end local v0    # "ccm":Lorg/apache/http/conn/ClientConnectionManager;
    .end local v2    # "params":Lorg/apache/http/params/HttpParams;
    .end local v3    # "registry":Lorg/apache/http/conn/scheme/SchemeRegistry;
    .end local v4    # "sf":Lorg/apache/http/conn/ssl/SSLSocketFactory;
    :goto_0
    return-object v6

    .line 388
    :catch_0
    move-exception v1

    .line 390
    .local v1, "e":Ljava/lang/Exception;
    new-instance v6, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v6}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    goto :goto_0
.end method

.method private static requestParamsString(Ljava/util/Map;)Ljava/lang/String;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .prologue
    .line 112
    .local p0, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v0, ""

    .line 114
    .local v0, "combinedParams":Ljava/lang/String;
    if-eqz p0, :cond_0

    invoke-interface {p0}, Ljava/util/Map;->isEmpty()Z

    move-result v8

    if-eqz v8, :cond_1

    :cond_0
    move-object v1, v0

    .line 148
    .end local v0    # "combinedParams":Ljava/lang/String;
    .local v1, "combinedParams":Ljava/lang/String;
    :goto_0
    return-object v1

    .line 119
    .end local v1    # "combinedParams":Ljava/lang/String;
    .restart local v0    # "combinedParams":Ljava/lang/String;
    :cond_1
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "?"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 121
    invoke-interface {p0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v5

    .line 123
    .local v5, "keys":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_3

    .line 125
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 126
    .local v4, "key":Ljava/lang/String;
    invoke-interface {p0, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    .line 127
    .local v7, "value":Ljava/lang/String;
    const-string v6, ""

    .line 131
    .local v6, "paramString":Ljava/lang/String;
    :try_start_0
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "UTF-8"

    invoke-static {v7, v9}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 133
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v8

    const/4 v9, 0x1

    if-le v8, v9, :cond_2

    .line 135
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "&"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    .line 139
    :cond_2
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    goto :goto_1

    .line 142
    :catch_0
    move-exception v2

    .line 144
    .local v2, "e":Ljava/io/UnsupportedEncodingException;
    invoke-virtual {v2}, Ljava/io/UnsupportedEncodingException;->printStackTrace()V

    goto :goto_1

    .end local v2    # "e":Ljava/io/UnsupportedEncodingException;
    .end local v4    # "key":Ljava/lang/String;
    .end local v6    # "paramString":Ljava/lang/String;
    .end local v7    # "value":Ljava/lang/String;
    :cond_3
    move-object v1, v0

    .line 148
    .end local v0    # "combinedParams":Ljava/lang/String;
    .restart local v1    # "combinedParams":Ljava/lang/String;
    goto/16 :goto_0
.end method

.method private static setBody(Lorg/apache/http/client/methods/HttpPost;Ljava/util/Map;Ljava/lang/String;)V
    .locals 7
    .param p0, "request"    # Lorg/apache/http/client/methods/HttpPost;
    .param p2, "jsonContent"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/http/client/methods/HttpPost;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 229
    .local p1, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    if-nez p0, :cond_1

    .line 263
    :cond_0
    :goto_0
    return-void

    .line 234
    :cond_1
    if-eqz p1, :cond_3

    invoke-interface {p1}, Ljava/util/Map;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_3

    .line 236
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 238
    .local v2, "parameters":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/apache/http/NameValuePair;>;"
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 240
    .local v1, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v6, Lorg/apache/http/message/BasicNameValuePair;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-direct {v6, v3, v4}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 245
    .end local v1    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_2
    :try_start_0
    new-instance v3, Lorg/apache/http/client/entity/UrlEncodedFormEntity;

    const-string v4, "UTF-8"

    invoke-direct {v3, v2, v4}, Lorg/apache/http/client/entity/UrlEncodedFormEntity;-><init>(Ljava/util/List;Ljava/lang/String;)V

    invoke-virtual {p0, v3}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 247
    :catch_0
    move-exception v0

    .line 249
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    invoke-virtual {v0}, Ljava/io/UnsupportedEncodingException;->printStackTrace()V

    goto :goto_0

    .line 252
    .end local v0    # "e":Ljava/io/UnsupportedEncodingException;
    .end local v2    # "parameters":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/apache/http/NameValuePair;>;"
    :cond_3
    if-eqz p2, :cond_0

    .line 256
    :try_start_1
    new-instance v3, Lorg/apache/http/entity/StringEntity;

    new-instance v4, Ljava/lang/String;

    invoke-virtual {p2}, Ljava/lang/String;->getBytes()[B

    move-result-object v5

    const-string v6, "UTF-8"

    invoke-direct {v4, v5, v6}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    invoke-direct {v3, v4}, Lorg/apache/http/entity/StringEntity;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v3}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V
    :try_end_1
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 258
    :catch_1
    move-exception v0

    .line 260
    .restart local v0    # "e":Ljava/io/UnsupportedEncodingException;
    invoke-virtual {v0}, Ljava/io/UnsupportedEncodingException;->printStackTrace()V

    goto :goto_0
.end method

.method private static setBody(Lorg/apache/http/client/methods/HttpPut;Ljava/util/Map;Ljava/lang/String;)V
    .locals 7
    .param p0, "request"    # Lorg/apache/http/client/methods/HttpPut;
    .param p2, "jsonContent"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/http/client/methods/HttpPut;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 267
    .local p1, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    if-nez p0, :cond_1

    .line 301
    :cond_0
    :goto_0
    return-void

    .line 272
    :cond_1
    if-eqz p1, :cond_3

    invoke-interface {p1}, Ljava/util/Map;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_3

    .line 274
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 276
    .local v2, "parameters":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/apache/http/NameValuePair;>;"
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 278
    .local v1, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    new-instance v6, Lorg/apache/http/message/BasicNameValuePair;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-direct {v6, v3, v4}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 283
    .end local v1    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_2
    :try_start_0
    new-instance v3, Lorg/apache/http/client/entity/UrlEncodedFormEntity;

    const-string v4, "UTF-8"

    invoke-direct {v3, v2, v4}, Lorg/apache/http/client/entity/UrlEncodedFormEntity;-><init>(Ljava/util/List;Ljava/lang/String;)V

    invoke-virtual {p0, v3}, Lorg/apache/http/client/methods/HttpPut;->setEntity(Lorg/apache/http/HttpEntity;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 285
    :catch_0
    move-exception v0

    .line 287
    .local v0, "e":Ljava/io/UnsupportedEncodingException;
    invoke-virtual {v0}, Ljava/io/UnsupportedEncodingException;->printStackTrace()V

    goto :goto_0

    .line 290
    .end local v0    # "e":Ljava/io/UnsupportedEncodingException;
    .end local v2    # "parameters":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/apache/http/NameValuePair;>;"
    :cond_3
    if-eqz p2, :cond_0

    .line 294
    :try_start_1
    new-instance v3, Lorg/apache/http/entity/StringEntity;

    new-instance v4, Ljava/lang/String;

    invoke-virtual {p2}, Ljava/lang/String;->getBytes()[B

    move-result-object v5

    const-string v6, "UTF-8"

    invoke-direct {v4, v5, v6}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    invoke-direct {v3, v4}, Lorg/apache/http/entity/StringEntity;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v3}, Lorg/apache/http/client/methods/HttpPut;->setEntity(Lorg/apache/http/HttpEntity;)V
    :try_end_1
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    .line 296
    :catch_1
    move-exception v0

    .line 298
    .restart local v0    # "e":Ljava/io/UnsupportedEncodingException;
    invoke-virtual {v0}, Ljava/io/UnsupportedEncodingException;->printStackTrace()V

    goto :goto_0
.end method

.method private static setHeaders(Lorg/apache/http/client/methods/HttpUriRequest;Ljava/util/ArrayList;)V
    .locals 4
    .param p0, "request"    # Lorg/apache/http/client/methods/HttpUriRequest;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/apache/http/client/methods/HttpUriRequest;",
            "Ljava/util/ArrayList",
            "<",
            "Lorg/apache/http/NameValuePair;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 213
    .local p1, "headers":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/apache/http/NameValuePair;>;"
    if-nez p0, :cond_1

    .line 225
    :cond_0
    return-void

    .line 218
    :cond_1
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    .line 220
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/NameValuePair;

    .line 222
    .local v0, "nameValue":Lorg/apache/http/NameValuePair;
    invoke-interface {v0}, Lorg/apache/http/NameValuePair;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0}, Lorg/apache/http/NameValuePair;->getValue()Ljava/lang/String;

    move-result-object v3

    invoke-interface {p0, v2, v3}, Lorg/apache/http/client/methods/HttpUriRequest;->addHeader(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public static setProxyServer(Lorg/apache/http/client/HttpClient;)V
    .locals 6
    .param p0, "client"    # Lorg/apache/http/client/HttpClient;

    .prologue
    const/4 v5, 0x0

    .line 342
    const-string v3, "user"

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_1

    .line 344
    new-instance v0, Lorg/apache/http/auth/AuthScope;

    const-string v3, "emagine.starwave.com"

    invoke-direct {v0, v3, v5}, Lorg/apache/http/auth/AuthScope;-><init>(Ljava/lang/String;I)V

    .line 345
    .local v0, "auth":Lorg/apache/http/auth/AuthScope;
    new-instance v1, Lorg/apache/http/auth/UsernamePasswordCredentials;

    const-string v3, "user"

    const-string v4, "Disney123"

    invoke-direct {v1, v3, v4}, Lorg/apache/http/auth/UsernamePasswordCredentials;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 347
    .local v1, "creds":Lorg/apache/http/auth/Credentials;
    check-cast p0, Lorg/apache/http/impl/client/AbstractHttpClient;

    .end local p0    # "client":Lorg/apache/http/client/HttpClient;
    invoke-virtual {p0}, Lorg/apache/http/impl/client/AbstractHttpClient;->getCredentialsProvider()Lorg/apache/http/client/CredentialsProvider;

    move-result-object v3

    invoke-interface {v3, v0, v1}, Lorg/apache/http/client/CredentialsProvider;->setCredentials(Lorg/apache/http/auth/AuthScope;Lorg/apache/http/auth/Credentials;)V

    .line 355
    .end local v0    # "auth":Lorg/apache/http/auth/AuthScope;
    .end local v1    # "creds":Lorg/apache/http/auth/Credentials;
    .local v2, "proxy":Lorg/apache/http/HttpHost;
    .restart local p0    # "client":Lorg/apache/http/client/HttpClient;
    :cond_0
    :goto_0
    return-void

    .line 349
    .end local v2    # "proxy":Lorg/apache/http/HttpHost;
    :cond_1
    const-string v3, "emagine.starwave.com"

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_0

    .line 351
    new-instance v2, Lorg/apache/http/HttpHost;

    const-string v3, "emagine.starwave.com"

    const-string v4, "https"

    invoke-direct {v2, v3, v5, v4}, Lorg/apache/http/HttpHost;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 353
    .restart local v2    # "proxy":Lorg/apache/http/HttpHost;
    invoke-interface {p0}, Lorg/apache/http/client/HttpClient;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v3

    const-string v4, "http.route.default-proxy"

    invoke-interface {v3, v4, v2}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    goto :goto_0
.end method


# virtual methods
.method public cancel()V
    .locals 5

    .prologue
    .line 661
    invoke-static {}, Lcom/disney/emagine/sdk/EMTConsole;->sharedInstance()Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v1

    const-string v2, "EMTRestClient"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "canceling "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/disney/emagine/sdk/networking/EMTRestClient;->mTasks:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " EMTRestTask objects."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/disney/emagine/sdk/EMTConsole;->logd(Ljava/lang/String;Ljava/lang/String;)V

    .line 662
    iget-object v1, p0, Lcom/disney/emagine/sdk/networking/EMTRestClient;->mTasks:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/disney/emagine/sdk/networking/EMTRestClient$EMTRestTask;

    .line 663
    .local v0, "task":Lcom/disney/emagine/sdk/networking/EMTRestClient$EMTRestTask;
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Lcom/disney/emagine/sdk/networking/EMTRestClient$EMTRestTask;->cancel(Z)Z

    goto :goto_0

    .line 665
    .end local v0    # "task":Lcom/disney/emagine/sdk/networking/EMTRestClient$EMTRestTask;
    :cond_0
    sget-object v1, Lcom/disney/emagine/sdk/networking/EMTRestClient;->executorService:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v1}, Ljava/util/concurrent/ExecutorService;->shutdownNow()Ljava/util/List;

    .line 666
    return-void
.end method

.method public executeRequest(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;
    .locals 8
    .param p1, "request"    # Lorg/apache/http/client/methods/HttpUriRequest;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/16 v7, 0x2710

    .line 437
    invoke-static {}, Lcom/disney/emagine/sdk/networking/EMTRestClient;->getNewHttpClient()Lorg/apache/http/client/HttpClient;

    move-result-object v6

    iput-object v6, p0, Lcom/disney/emagine/sdk/networking/EMTRestClient;->httpClient:Lorg/apache/http/client/HttpClient;

    .line 439
    iget-object v6, p0, Lcom/disney/emagine/sdk/networking/EMTRestClient;->httpClient:Lorg/apache/http/client/HttpClient;

    invoke-interface {v6}, Lorg/apache/http/client/HttpClient;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v4

    .line 440
    .local v4, "params":Lorg/apache/http/params/HttpParams;
    const/4 v5, 0x0

    .line 441
    .local v5, "response":Lorg/apache/http/HttpResponse;
    const/4 v2, 0x0

    .line 443
    .local v2, "exception":Ljava/lang/Exception;
    iget-object v6, p0, Lcom/disney/emagine/sdk/networking/EMTRestClient;->httpClient:Lorg/apache/http/client/HttpClient;

    invoke-static {v6}, Lcom/disney/emagine/sdk/networking/EMTRestClient;->setProxyServer(Lorg/apache/http/client/HttpClient;)V

    .line 445
    invoke-static {v4, v7}, Lorg/apache/http/params/HttpConnectionParams;->setConnectionTimeout(Lorg/apache/http/params/HttpParams;I)V

    .line 446
    invoke-static {v4, v7}, Lorg/apache/http/params/HttpConnectionParams;->setSoTimeout(Lorg/apache/http/params/HttpParams;I)V

    .line 448
    const-string v6, "http.protocol.cookie-policy"

    const-string v7, "rfc2109"

    invoke-interface {v4, v6, v7}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 451
    new-instance v0, Lorg/apache/http/impl/client/BasicCookieStore;

    invoke-direct {v0}, Lorg/apache/http/impl/client/BasicCookieStore;-><init>()V

    .line 454
    .local v0, "cookieStore":Lorg/apache/http/client/CookieStore;
    new-instance v3, Lorg/apache/http/protocol/BasicHttpContext;

    invoke-direct {v3}, Lorg/apache/http/protocol/BasicHttpContext;-><init>()V

    .line 457
    .local v3, "localContext":Lorg/apache/http/protocol/HttpContext;
    const-string v6, "http.cookie-store"

    invoke-interface {v3, v6, v0}, Lorg/apache/http/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 459
    instance-of v6, p1, Lorg/apache/http/client/methods/HttpPost;

    if-eqz v6, :cond_0

    .line 462
    const-string v6, "http.protocol.expect-continue"

    const/4 v7, 0x0

    invoke-interface {v4, v6, v7}, Lorg/apache/http/params/HttpParams;->setBooleanParameter(Ljava/lang/String;Z)Lorg/apache/http/params/HttpParams;

    .line 465
    :cond_0
    iget-object v6, p0, Lcom/disney/emagine/sdk/networking/EMTRestClient;->httpClient:Lorg/apache/http/client/HttpClient;

    check-cast v6, Lorg/apache/http/impl/client/AbstractHttpClient;

    iget-object v7, p0, Lcom/disney/emagine/sdk/networking/EMTRestClient;->retryHandler:Lorg/apache/http/client/HttpRequestRetryHandler;

    invoke-virtual {v6, v7}, Lorg/apache/http/impl/client/AbstractHttpClient;->setHttpRequestRetryHandler(Lorg/apache/http/client/HttpRequestRetryHandler;)V

    .line 469
    :try_start_0
    iget-object v6, p0, Lcom/disney/emagine/sdk/networking/EMTRestClient;->httpClient:Lorg/apache/http/client/HttpClient;

    invoke-interface {v6, p1, v3}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v5

    .line 476
    :goto_0
    if-eqz v2, :cond_1

    .line 478
    throw v2

    .line 471
    :catch_0
    move-exception v1

    .line 473
    .local v1, "e":Ljava/lang/Exception;
    move-object v2, v1

    goto :goto_0

    .line 481
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_1
    return-object v5
.end method

.method public getAsync(Ljava/lang/String;Ljava/util/Map;Ljava/util/ArrayList;Lcom/disney/emagine/sdk/networking/EMTRestHandler;)V
    .locals 3
    .param p1, "url"    # Ljava/lang/String;
    .param p4, "handler"    # Lcom/disney/emagine/sdk/networking/EMTRestHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Lorg/apache/http/NameValuePair;",
            ">;",
            "Lcom/disney/emagine/sdk/networking/EMTRestHandler;",
            ")V"
        }
    .end annotation

    .prologue
    .line 615
    .local p2, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .local p3, "headers":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/apache/http/NameValuePair;>;"
    invoke-static {p1, p2, p3}, Lcom/disney/emagine/sdk/networking/EMTRestClient;->buildGETRequest(Ljava/lang/String;Ljava/util/Map;Ljava/util/ArrayList;)Lorg/apache/http/client/methods/HttpGet;

    move-result-object v0

    .line 617
    .local v0, "request":Lorg/apache/http/client/methods/HttpGet;
    new-instance v1, Lcom/disney/emagine/sdk/networking/EMTRestClient$EMTRestTask;

    invoke-direct {v1, p0, v0, p4}, Lcom/disney/emagine/sdk/networking/EMTRestClient$EMTRestTask;-><init>(Lcom/disney/emagine/sdk/networking/EMTRestClient;Lorg/apache/http/client/methods/HttpUriRequest;Lcom/disney/emagine/sdk/networking/EMTRestHandler;)V

    .line 618
    .local v1, "task":Lcom/disney/emagine/sdk/networking/EMTRestClient$EMTRestTask;
    iget-object v2, p0, Lcom/disney/emagine/sdk/networking/EMTRestClient;->mTasks:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 619
    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Void;

    invoke-virtual {v1, v2}, Lcom/disney/emagine/sdk/networking/EMTRestClient$EMTRestTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 620
    return-void
.end method

.method public getFuture(Ljava/lang/String;Ljava/util/Map;Ljava/util/ArrayList;Lcom/disney/emagine/sdk/networking/EMTRestHandler;)V
    .locals 3
    .param p1, "url"    # Ljava/lang/String;
    .param p4, "handler"    # Lcom/disney/emagine/sdk/networking/EMTRestHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Lorg/apache/http/NameValuePair;",
            ">;",
            "Lcom/disney/emagine/sdk/networking/EMTRestHandler;",
            ")V"
        }
    .end annotation

    .prologue
    .line 644
    .local p2, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .local p3, "headers":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/apache/http/NameValuePair;>;"
    invoke-static {p1, p2, p3}, Lcom/disney/emagine/sdk/networking/EMTRestClient;->buildGETRequest(Ljava/lang/String;Ljava/util/Map;Ljava/util/ArrayList;)Lorg/apache/http/client/methods/HttpGet;

    move-result-object v0

    .line 646
    .local v0, "request":Lorg/apache/http/client/methods/HttpGet;
    new-instance v1, Ljava/util/concurrent/FutureTask;

    new-instance v2, Lcom/disney/emagine/sdk/networking/EMTRestClient$restCallable;

    invoke-direct {v2, p0, v0, p4}, Lcom/disney/emagine/sdk/networking/EMTRestClient$restCallable;-><init>(Lcom/disney/emagine/sdk/networking/EMTRestClient;Lorg/apache/http/client/methods/HttpUriRequest;Lcom/disney/emagine/sdk/networking/EMTRestHandler;)V

    invoke-direct {v1, v2}, Ljava/util/concurrent/FutureTask;-><init>(Ljava/util/concurrent/Callable;)V

    .line 648
    .local v1, "task":Ljava/util/concurrent/FutureTask;, "Ljava/util/concurrent/FutureTask<Lorg/apache/http/HttpResponse;>;"
    sget-object v2, Lcom/disney/emagine/sdk/networking/EMTRestClient;->executorService:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v2, v1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    .line 649
    return-void
.end method

.method public getSync(Ljava/lang/String;Ljava/util/Map;Ljava/util/ArrayList;)Lorg/apache/http/HttpResponse;
    .locals 3
    .param p1, "url"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Lorg/apache/http/NameValuePair;",
            ">;)",
            "Lorg/apache/http/HttpResponse;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 587
    .local p2, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .local p3, "headers":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/apache/http/NameValuePair;>;"
    invoke-static {p1, p2, p3}, Lcom/disney/emagine/sdk/networking/EMTRestClient;->buildGETRequest(Ljava/lang/String;Ljava/util/Map;Ljava/util/ArrayList;)Lorg/apache/http/client/methods/HttpGet;

    move-result-object v0

    .line 588
    .local v0, "request":Lorg/apache/http/client/methods/HttpGet;
    invoke-virtual {p0, v0}, Lcom/disney/emagine/sdk/networking/EMTRestClient;->executeRequest(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v1

    .line 590
    .local v1, "response":Lorg/apache/http/HttpResponse;
    iget-object v2, p0, Lcom/disney/emagine/sdk/networking/EMTRestClient;->httpClient:Lorg/apache/http/client/HttpClient;

    if-eqz v2, :cond_0

    .line 592
    iget-object v2, p0, Lcom/disney/emagine/sdk/networking/EMTRestClient;->httpClient:Lorg/apache/http/client/HttpClient;

    invoke-interface {v2}, Lorg/apache/http/client/HttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v2

    invoke-interface {v2}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    .line 595
    :cond_0
    return-object v1
.end method

.method public postAsync(Ljava/lang/String;Ljava/util/Map;Ljava/util/ArrayList;Ljava/lang/String;Lcom/disney/emagine/sdk/networking/EMTRestHandler;)V
    .locals 3
    .param p1, "url"    # Ljava/lang/String;
    .param p4, "jsonContent"    # Ljava/lang/String;
    .param p5, "handler"    # Lcom/disney/emagine/sdk/networking/EMTRestHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Lorg/apache/http/NameValuePair;",
            ">;",
            "Ljava/lang/String;",
            "Lcom/disney/emagine/sdk/networking/EMTRestHandler;",
            ")V"
        }
    .end annotation

    .prologue
    .line 624
    .local p2, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .local p3, "headers":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/apache/http/NameValuePair;>;"
    invoke-static {p1, p2, p3, p4}, Lcom/disney/emagine/sdk/networking/EMTRestClient;->buildPOSTRequest(Ljava/lang/String;Ljava/util/Map;Ljava/util/ArrayList;Ljava/lang/String;)Lorg/apache/http/client/methods/HttpPost;

    move-result-object v0

    .line 626
    .local v0, "request":Lorg/apache/http/client/methods/HttpPost;
    new-instance v1, Lcom/disney/emagine/sdk/networking/EMTRestClient$EMTRestTask;

    invoke-direct {v1, p0, v0, p5}, Lcom/disney/emagine/sdk/networking/EMTRestClient$EMTRestTask;-><init>(Lcom/disney/emagine/sdk/networking/EMTRestClient;Lorg/apache/http/client/methods/HttpUriRequest;Lcom/disney/emagine/sdk/networking/EMTRestHandler;)V

    .line 627
    .local v1, "task":Lcom/disney/emagine/sdk/networking/EMTRestClient$EMTRestTask;
    iget-object v2, p0, Lcom/disney/emagine/sdk/networking/EMTRestClient;->mTasks:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 628
    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Void;

    invoke-virtual {v1, v2}, Lcom/disney/emagine/sdk/networking/EMTRestClient$EMTRestTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 629
    return-void
.end method

.method public postFuture(Ljava/lang/String;Ljava/util/Map;Ljava/util/ArrayList;Ljava/lang/String;Lcom/disney/emagine/sdk/networking/EMTRestHandler;)V
    .locals 3
    .param p1, "url"    # Ljava/lang/String;
    .param p4, "jsonContent"    # Ljava/lang/String;
    .param p5, "handler"    # Lcom/disney/emagine/sdk/networking/EMTRestHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Lorg/apache/http/NameValuePair;",
            ">;",
            "Ljava/lang/String;",
            "Lcom/disney/emagine/sdk/networking/EMTRestHandler;",
            ")V"
        }
    .end annotation

    .prologue
    .line 653
    .local p2, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .local p3, "headers":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/apache/http/NameValuePair;>;"
    invoke-static {p1, p2, p3, p4}, Lcom/disney/emagine/sdk/networking/EMTRestClient;->buildPOSTRequest(Ljava/lang/String;Ljava/util/Map;Ljava/util/ArrayList;Ljava/lang/String;)Lorg/apache/http/client/methods/HttpPost;

    move-result-object v0

    .line 655
    .local v0, "request":Lorg/apache/http/client/methods/HttpPost;
    new-instance v1, Ljava/util/concurrent/FutureTask;

    new-instance v2, Lcom/disney/emagine/sdk/networking/EMTRestClient$restCallable;

    invoke-direct {v2, p0, v0, p5}, Lcom/disney/emagine/sdk/networking/EMTRestClient$restCallable;-><init>(Lcom/disney/emagine/sdk/networking/EMTRestClient;Lorg/apache/http/client/methods/HttpUriRequest;Lcom/disney/emagine/sdk/networking/EMTRestHandler;)V

    invoke-direct {v1, v2}, Ljava/util/concurrent/FutureTask;-><init>(Ljava/util/concurrent/Callable;)V

    .line 657
    .local v1, "task":Ljava/util/concurrent/FutureTask;, "Ljava/util/concurrent/FutureTask<Lorg/apache/http/HttpResponse;>;"
    sget-object v2, Lcom/disney/emagine/sdk/networking/EMTRestClient;->executorService:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v2, v1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    .line 658
    return-void
.end method

.method public postSync(Ljava/lang/String;Ljava/util/Map;Ljava/util/ArrayList;Ljava/lang/String;)Lorg/apache/http/HttpResponse;
    .locals 3
    .param p1, "url"    # Ljava/lang/String;
    .param p4, "jsonContent"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Lorg/apache/http/NameValuePair;",
            ">;",
            "Ljava/lang/String;",
            ")",
            "Lorg/apache/http/HttpResponse;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 600
    .local p2, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .local p3, "headers":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/apache/http/NameValuePair;>;"
    invoke-static {p1, p2, p3, p4}, Lcom/disney/emagine/sdk/networking/EMTRestClient;->buildPOSTRequest(Ljava/lang/String;Ljava/util/Map;Ljava/util/ArrayList;Ljava/lang/String;)Lorg/apache/http/client/methods/HttpPost;

    move-result-object v0

    .line 601
    .local v0, "request":Lorg/apache/http/client/methods/HttpPost;
    invoke-virtual {p0, v0}, Lcom/disney/emagine/sdk/networking/EMTRestClient;->executeRequest(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v1

    .line 603
    .local v1, "response":Lorg/apache/http/HttpResponse;
    iget-object v2, p0, Lcom/disney/emagine/sdk/networking/EMTRestClient;->httpClient:Lorg/apache/http/client/HttpClient;

    if-eqz v2, :cond_0

    .line 605
    iget-object v2, p0, Lcom/disney/emagine/sdk/networking/EMTRestClient;->httpClient:Lorg/apache/http/client/HttpClient;

    invoke-interface {v2}, Lorg/apache/http/client/HttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v2

    invoke-interface {v2}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    .line 608
    :cond_0
    return-object v1
.end method

.method public putAsync(Ljava/lang/String;Ljava/util/Map;Ljava/util/ArrayList;Ljava/lang/String;Lcom/disney/emagine/sdk/networking/EMTRestHandler;)V
    .locals 3
    .param p1, "url"    # Ljava/lang/String;
    .param p4, "jsonContent"    # Ljava/lang/String;
    .param p5, "handler"    # Lcom/disney/emagine/sdk/networking/EMTRestHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/ArrayList",
            "<",
            "Lorg/apache/http/NameValuePair;",
            ">;",
            "Ljava/lang/String;",
            "Lcom/disney/emagine/sdk/networking/EMTRestHandler;",
            ")V"
        }
    .end annotation

    .prologue
    .line 633
    .local p2, "params":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .local p3, "headers":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lorg/apache/http/NameValuePair;>;"
    invoke-static {p1, p2, p3, p4}, Lcom/disney/emagine/sdk/networking/EMTRestClient;->buildPUTRequest(Ljava/lang/String;Ljava/util/Map;Ljava/util/ArrayList;Ljava/lang/String;)Lorg/apache/http/client/methods/HttpPut;

    move-result-object v0

    .line 635
    .local v0, "request":Lorg/apache/http/client/methods/HttpPut;
    new-instance v1, Lcom/disney/emagine/sdk/networking/EMTRestClient$EMTRestTask;

    invoke-direct {v1, p0, v0, p5}, Lcom/disney/emagine/sdk/networking/EMTRestClient$EMTRestTask;-><init>(Lcom/disney/emagine/sdk/networking/EMTRestClient;Lorg/apache/http/client/methods/HttpUriRequest;Lcom/disney/emagine/sdk/networking/EMTRestHandler;)V

    .line 636
    .local v1, "task":Lcom/disney/emagine/sdk/networking/EMTRestClient$EMTRestTask;
    iget-object v2, p0, Lcom/disney/emagine/sdk/networking/EMTRestClient;->mTasks:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 637
    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Void;

    invoke-virtual {v1, v2}, Lcom/disney/emagine/sdk/networking/EMTRestClient$EMTRestTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 638
    return-void
.end method
