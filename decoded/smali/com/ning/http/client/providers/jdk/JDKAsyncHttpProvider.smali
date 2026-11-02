.class public Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;
.super Ljava/lang/Object;
.source "JDKAsyncHttpProvider.java"

# interfaces
.implements Lcom/ning/http/client/AsyncHttpProvider;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$2;,
        Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;
    }
.end annotation


# static fields
.field private static final MAX_BUFFERED_BYTES:I = 0x2000

.field private static final NTLM_DOMAIN:Ljava/lang/String; = "http.auth.ntlm.domain"

.field private static final logger:Lorg/slf4j/Logger;


# instance fields
.field private bufferResponseInMemory:Z

.field private final config:Lcom/ning/http/client/AsyncHttpClientConfig;

.field private final isClose:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private jdkAuthenticator:Ljava/net/Authenticator;

.field private jdkNtlmDomain:Ljava/lang/String;

.field private final maxConnections:Ljava/util/concurrent/atomic/AtomicInteger;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 80
    const-class v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    sput-object v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->logger:Lorg/slf4j/Logger;

    return-void
.end method

.method public constructor <init>(Lcom/ning/http/client/AsyncHttpClientConfig;)V
    .locals 3
    .param p1, "config"    # Lcom/ning/http/client/AsyncHttpClientConfig;

    .prologue
    const/4 v2, 0x0

    .line 98
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 86
    new-instance v1, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v1, p0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->isClose:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 90
    new-instance v1, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    iput-object v1, p0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->maxConnections:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 96
    iput-boolean v2, p0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->bufferResponseInMemory:Z

    .line 100
    iput-object p1, p0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->config:Lcom/ning/http/client/AsyncHttpClientConfig;

    .line 101
    invoke-virtual {p1}, Lcom/ning/http/client/AsyncHttpClientConfig;->getAsyncHttpProviderConfig()Lcom/ning/http/client/AsyncHttpProviderConfig;

    move-result-object v0

    .line 102
    .local v0, "providerConfig":Lcom/ning/http/client/AsyncHttpProviderConfig;, "Lcom/ning/http/client/AsyncHttpProviderConfig<**>;"
    instance-of v1, v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProviderConfig;

    if-eqz v1, :cond_0

    .line 103
    const-class v1, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProviderConfig;

    invoke-virtual {v1, v0}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProviderConfig;

    invoke-direct {p0, v1}, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->configure(Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProviderConfig;)V

    .line 105
    :cond_0
    return-void
.end method

.method static synthetic access$000()Lorg/slf4j/Logger;
    .locals 1

    .prologue
    .line 79
    sget-object v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->logger:Lorg/slf4j/Logger;

    return-object v0
.end method

.method static synthetic access$100(Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;)Lcom/ning/http/client/AsyncHttpClientConfig;
    .locals 1
    .param p0, "x0"    # Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;

    .prologue
    .line 79
    iget-object v0, p0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->config:Lcom/ning/http/client/AsyncHttpClientConfig;

    return-object v0
.end method

.method static synthetic access$200(Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;Lcom/ning/http/client/Request;)Ljava/net/HttpURLConnection;
    .locals 1
    .param p0, "x0"    # Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;
    .param p1, "x1"    # Lcom/ning/http/client/Request;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/net/URISyntaxException;
        }
    .end annotation

    .prologue
    .line 79
    invoke-direct {p0, p1}, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->createUrlConnection(Lcom/ning/http/client/Request;)Ljava/net/HttpURLConnection;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$300(Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;Ljava/net/HttpURLConnection;)Ljava/io/InputStream;
    .locals 1
    .param p0, "x0"    # Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;
    .param p1, "x1"    # Ljava/net/HttpURLConnection;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 79
    invoke-direct {p0, p1}, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->getInputStream(Ljava/net/HttpURLConnection;)Ljava/io/InputStream;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$400(Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;)Z
    .locals 1
    .param p0, "x0"    # Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;

    .prologue
    .line 79
    iget-boolean v0, p0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->bufferResponseInMemory:Z

    return v0
.end method

.method static synthetic access$500(Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;)Ljava/util/concurrent/atomic/AtomicInteger;
    .locals 1
    .param p0, "x0"    # Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;

    .prologue
    .line 79
    iget-object v0, p0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->maxConnections:Ljava/util/concurrent/atomic/AtomicInteger;

    return-object v0
.end method

.method static synthetic access$600(Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;

    .prologue
    .line 79
    iget-object v0, p0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->jdkNtlmDomain:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$602(Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;Ljava/lang/String;)Ljava/lang/String;
    .locals 0
    .param p0, "x0"    # Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 79
    iput-object p1, p0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->jdkNtlmDomain:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$700(Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;)Ljava/net/Authenticator;
    .locals 1
    .param p0, "x0"    # Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;

    .prologue
    .line 79
    iget-object v0, p0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->jdkAuthenticator:Ljava/net/Authenticator;

    return-object v0
.end method

.method private configure(Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProviderConfig;)V
    .locals 4
    .param p1, "config"    # Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProviderConfig;

    .prologue
    .line 108
    invoke-virtual {p1}, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProviderConfig;->propertiesSet()Ljava/util/Set;

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

    .line 109
    .local v0, "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-static {v2, v3}, Ljava/lang/System;->setProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    goto :goto_0

    .line 112
    .end local v0    # "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_0
    const-string v2, "bufferResponseInMemory"

    invoke-virtual {p1, v2}, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProviderConfig;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 113
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->bufferResponseInMemory:Z

    .line 115
    :cond_1
    return-void
.end method

.method private configureProxyAndAuth(Lcom/ning/http/client/ProxyServer;Lcom/ning/http/client/Realm;)Ljava/net/Proxy;
    .locals 10
    .param p1, "proxyServer"    # Lcom/ning/http/client/ProxyServer;
    .param p2, "realm"    # Lcom/ning/http/client/Realm;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/naming/AuthenticationException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    const/4 v4, 0x1

    .line 642
    const/4 v8, 0x0

    .line 643
    .local v8, "proxy":Ljava/net/Proxy;
    if-eqz p1, :cond_0

    .line 645
    invoke-virtual {p1}, Lcom/ning/http/client/ProxyServer;->getHost()Ljava/lang/String;

    move-result-object v1

    const-string v3, "http://"

    invoke-virtual {v1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-virtual {p1}, Lcom/ning/http/client/ProxyServer;->getHost()Ljava/lang/String;

    move-result-object v1

    const-string v3, "http://"

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual {v1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v9

    .line 648
    .local v9, "proxyHost":Ljava/lang/String;
    :goto_0
    new-instance v6, Ljava/net/InetSocketAddress;

    invoke-virtual {p1}, Lcom/ning/http/client/ProxyServer;->getPort()I

    move-result v1

    invoke-direct {v6, v9, v1}, Ljava/net/InetSocketAddress;-><init>(Ljava/lang/String;I)V

    .line 649
    .local v6, "addr":Ljava/net/SocketAddress;
    new-instance v8, Ljava/net/Proxy;

    .end local v8    # "proxy":Ljava/net/Proxy;
    sget-object v1, Ljava/net/Proxy$Type;->HTTP:Ljava/net/Proxy$Type;

    invoke-direct {v8, v1, v6}, Ljava/net/Proxy;-><init>(Ljava/net/Proxy$Type;Ljava/net/SocketAddress;)V

    .line 652
    .end local v6    # "addr":Ljava/net/SocketAddress;
    .end local v9    # "proxyHost":Ljava/lang/String;
    .restart local v8    # "proxy":Ljava/net/Proxy;
    :cond_0
    if-eqz p1, :cond_3

    invoke-virtual {p1}, Lcom/ning/http/client/ProxyServer;->getPrincipal()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_3

    move v2, v4

    .line 653
    .local v2, "hasProxy":Z
    :goto_1
    if-eqz p2, :cond_4

    invoke-virtual {p2}, Lcom/ning/http/client/Realm;->getPrincipal()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_4

    .line 654
    .local v4, "hasAuthentication":Z
    :goto_2
    if-nez v2, :cond_1

    if-eqz v4, :cond_5

    .line 656
    :cond_1
    const/4 v7, 0x0

    .line 658
    .local v7, "f":Ljava/lang/reflect/Field;
    :try_start_0
    const-class v0, Ljava/net/Authenticator;

    const-string v1, "theAuthenticator"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v7

    .line 660
    const/4 v0, 0x1

    invoke-virtual {v7, v0}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 661
    const-class v0, Ljava/net/Authenticator;

    invoke-virtual {v7, v0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/net/Authenticator;

    iput-object v0, p0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->jdkAuthenticator:Ljava/net/Authenticator;
    :try_end_0
    .catch Ljava/lang/NoSuchFieldException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0

    .line 667
    :goto_3
    new-instance v0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$1;

    move-object v1, p0

    move-object v3, p1

    move-object v5, p2

    invoke-direct/range {v0 .. v5}, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$1;-><init>(Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;ZLcom/ning/http/client/ProxyServer;ZLcom/ning/http/client/Realm;)V

    invoke-static {v0}, Ljava/net/Authenticator;->setDefault(Ljava/net/Authenticator;)V

    .line 688
    .end local v7    # "f":Ljava/lang/reflect/Field;
    :goto_4
    return-object v8

    .line 645
    .end local v2    # "hasProxy":Z
    .end local v4    # "hasAuthentication":Z
    :cond_2
    invoke-virtual {p1}, Lcom/ning/http/client/ProxyServer;->getHost()Ljava/lang/String;

    move-result-object v9

    goto :goto_0

    :cond_3
    move v2, v0

    .line 652
    goto :goto_1

    .restart local v2    # "hasProxy":Z
    :cond_4
    move v4, v0

    .line 653
    goto :goto_2

    .line 686
    .restart local v4    # "hasAuthentication":Z
    :cond_5
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/net/Authenticator;->setDefault(Ljava/net/Authenticator;)V

    goto :goto_4

    .line 663
    .restart local v7    # "f":Ljava/lang/reflect/Field;
    :catch_0
    move-exception v0

    goto :goto_3

    .line 662
    :catch_1
    move-exception v0

    goto :goto_3
.end method

.method private createUrlConnection(Lcom/ning/http/client/Request;)Ljava/net/HttpURLConnection;
    .locals 9
    .param p1, "request"    # Lcom/ning/http/client/Request;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/net/URISyntaxException;
        }
    .end annotation

    .prologue
    .line 170
    iget-object v7, p0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->config:Lcom/ning/http/client/AsyncHttpClientConfig;

    invoke-static {v7, p1}, Lcom/ning/http/util/ProxyUtils;->getProxyServer(Lcom/ning/http/client/AsyncHttpClientConfig;Lcom/ning/http/client/Request;)Lcom/ning/http/client/ProxyServer;

    move-result-object v2

    .line 171
    .local v2, "proxyServer":Lcom/ning/http/client/ProxyServer;
    invoke-interface {p1}, Lcom/ning/http/client/Request;->getRealm()Lcom/ning/http/client/Realm;

    move-result-object v7

    if-eqz v7, :cond_5

    invoke-interface {p1}, Lcom/ning/http/client/Request;->getRealm()Lcom/ning/http/client/Realm;

    move-result-object v3

    .line 172
    .local v3, "realm":Lcom/ning/http/client/Realm;
    :goto_0
    const/4 v1, 0x0

    .line 173
    .local v1, "proxy":Ljava/net/Proxy;
    if-nez v2, :cond_0

    if-eqz v3, :cond_1

    .line 175
    :cond_0
    :try_start_0
    invoke-direct {p0, v2, v3}, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->configureProxyAndAuth(Lcom/ning/http/client/ProxyServer;Lcom/ning/http/client/Realm;)Ljava/net/Proxy;
    :try_end_0
    .catch Ljavax/naming/AuthenticationException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 181
    :cond_1
    invoke-interface {p1}, Lcom/ning/http/client/Request;->getUri()Lcom/ning/http/client/uri/Uri;

    move-result-object v7

    invoke-virtual {v7}, Lcom/ning/http/client/uri/Uri;->toJavaNetURI()Ljava/net/URI;

    move-result-object v7

    invoke-virtual {v7}, Ljava/net/URI;->toURL()Ljava/net/URL;

    move-result-object v7

    if-nez v1, :cond_2

    sget-object v1, Ljava/net/Proxy;->NO_PROXY:Ljava/net/Proxy;

    .end local v1    # "proxy":Ljava/net/Proxy;
    :cond_2
    invoke-virtual {v7, v1}, Ljava/net/URL;->openConnection(Ljava/net/Proxy;)Ljava/net/URLConnection;

    move-result-object v6

    check-cast v6, Ljava/net/HttpURLConnection;

    .line 184
    .local v6, "urlConnection":Ljava/net/HttpURLConnection;
    invoke-interface {p1}, Lcom/ning/http/client/Request;->getUri()Lcom/ning/http/client/uri/Uri;

    move-result-object v7

    invoke-virtual {v7}, Lcom/ning/http/client/uri/Uri;->getScheme()Ljava/lang/String;

    move-result-object v7

    const-string v8, "https"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_4

    move-object v4, v6

    .line 185
    check-cast v4, Ljavax/net/ssl/HttpsURLConnection;

    .line 186
    .local v4, "secure":Ljavax/net/ssl/HttpsURLConnection;
    iget-object v7, p0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->config:Lcom/ning/http/client/AsyncHttpClientConfig;

    invoke-virtual {v7}, Lcom/ning/http/client/AsyncHttpClientConfig;->getSSLContext()Ljavax/net/ssl/SSLContext;

    move-result-object v5

    .line 187
    .local v5, "sslContext":Ljavax/net/ssl/SSLContext;
    if-nez v5, :cond_3

    .line 189
    :try_start_1
    invoke-static {}, Lcom/ning/http/util/SslUtils;->getInstance()Lcom/ning/http/util/SslUtils;

    move-result-object v7

    iget-object v8, p0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->config:Lcom/ning/http/client/AsyncHttpClientConfig;

    invoke-virtual {v8}, Lcom/ning/http/client/AsyncHttpClientConfig;->isAcceptAnyCertificate()Z

    move-result v8

    invoke-virtual {v7, v8}, Lcom/ning/http/util/SslUtils;->getSSLContext(Z)Ljavax/net/ssl/SSLContext;
    :try_end_1
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/security/GeneralSecurityException; {:try_start_1 .. :try_end_1} :catch_2

    move-result-object v5

    .line 196
    :cond_3
    invoke-virtual {v5}, Ljavax/net/ssl/SSLContext;->getSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljavax/net/ssl/HttpsURLConnection;->setSSLSocketFactory(Ljavax/net/ssl/SSLSocketFactory;)V

    .line 197
    iget-object v7, p0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->config:Lcom/ning/http/client/AsyncHttpClientConfig;

    invoke-virtual {v7}, Lcom/ning/http/client/AsyncHttpClientConfig;->getHostnameVerifier()Ljavax/net/ssl/HostnameVerifier;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljavax/net/ssl/HttpsURLConnection;->setHostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)V

    .line 199
    .end local v4    # "secure":Ljavax/net/ssl/HttpsURLConnection;
    .end local v5    # "sslContext":Ljavax/net/ssl/SSLContext;
    :cond_4
    return-object v6

    .line 171
    .end local v3    # "realm":Lcom/ning/http/client/Realm;
    .end local v6    # "urlConnection":Ljava/net/HttpURLConnection;
    :cond_5
    iget-object v7, p0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->config:Lcom/ning/http/client/AsyncHttpClientConfig;

    invoke-virtual {v7}, Lcom/ning/http/client/AsyncHttpClientConfig;->getRealm()Lcom/ning/http/client/Realm;

    move-result-object v3

    goto :goto_0

    .line 176
    .restart local v1    # "proxy":Ljava/net/Proxy;
    .restart local v3    # "realm":Lcom/ning/http/client/Realm;
    :catch_0
    move-exception v0

    .line 177
    .local v0, "e":Ljavax/naming/AuthenticationException;
    new-instance v7, Ljava/io/IOException;

    invoke-virtual {v0}, Ljavax/naming/AuthenticationException;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 190
    .end local v0    # "e":Ljavax/naming/AuthenticationException;
    .end local v1    # "proxy":Ljava/net/Proxy;
    .restart local v4    # "secure":Ljavax/net/ssl/HttpsURLConnection;
    .restart local v5    # "sslContext":Ljavax/net/ssl/SSLContext;
    .restart local v6    # "urlConnection":Ljava/net/HttpURLConnection;
    :catch_1
    move-exception v0

    .line 191
    .local v0, "e":Ljava/security/NoSuchAlgorithmException;
    new-instance v7, Ljava/io/IOException;

    invoke-virtual {v0}, Ljava/security/NoSuchAlgorithmException;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v7

    .line 192
    .end local v0    # "e":Ljava/security/NoSuchAlgorithmException;
    :catch_2
    move-exception v0

    .line 193
    .local v0, "e":Ljava/security/GeneralSecurityException;
    new-instance v7, Ljava/io/IOException;

    invoke-virtual {v0}, Ljava/security/GeneralSecurityException;->getMessage()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v7
.end method

.method private execute(Lcom/ning/http/client/Request;Lcom/ning/http/client/AsyncHandler;Lcom/ning/http/client/providers/jdk/JDKFuture;)Lcom/ning/http/client/ListenableFuture;
    .locals 15
    .param p1, "request"    # Lcom/ning/http/client/Request;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/ning/http/client/Request;",
            "Lcom/ning/http/client/AsyncHandler",
            "<TT;>;",
            "Lcom/ning/http/client/providers/jdk/JDKFuture",
            "<*>;)",
            "Lcom/ning/http/client/ListenableFuture",
            "<TT;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 127
    .local p2, "handler":Lcom/ning/http/client/AsyncHandler;, "Lcom/ning/http/client/AsyncHandler<TT;>;"
    .local p3, "future":Lcom/ning/http/client/providers/jdk/JDKFuture;, "Lcom/ning/http/client/providers/jdk/JDKFuture<*>;"
    iget-object v2, p0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->isClose:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 128
    new-instance v2, Ljava/io/IOException;

    const-string v3, "Closed"

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 131
    :cond_0
    iget-object v2, p0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->config:Lcom/ning/http/client/AsyncHttpClientConfig;

    invoke-virtual {v2}, Lcom/ning/http/client/AsyncHttpClientConfig;->getMaxConnections()I

    move-result v2

    const/4 v3, -0x1

    if-le v2, v3, :cond_1

    iget-object v2, p0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->maxConnections:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v2

    add-int/lit8 v2, v2, 0x1

    iget-object v3, p0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->config:Lcom/ning/http/client/AsyncHttpClientConfig;

    invoke-virtual {v3}, Lcom/ning/http/client/AsyncHttpClientConfig;->getMaxConnections()I

    move-result v3

    if-le v2, v3, :cond_1

    .line 132
    new-instance v2, Ljava/io/IOException;

    const-string v3, "Too many connections %s"

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    const/4 v6, 0x0

    iget-object v14, p0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->config:Lcom/ning/http/client/AsyncHttpClientConfig;

    invoke-virtual {v14}, Lcom/ning/http/client/AsyncHttpClientConfig;->getMaxConnections()I

    move-result v14

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v5, v6

    invoke-static {v3, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 135
    :cond_1
    iget-object v2, p0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->config:Lcom/ning/http/client/AsyncHttpClientConfig;

    move-object/from16 v0, p1

    invoke-static {v2, v0}, Lcom/ning/http/util/ProxyUtils;->getProxyServer(Lcom/ning/http/client/AsyncHttpClientConfig;Lcom/ning/http/client/Request;)Lcom/ning/http/client/ProxyServer;

    move-result-object v11

    .line 136
    .local v11, "proxyServer":Lcom/ning/http/client/ProxyServer;
    invoke-interface/range {p1 .. p1}, Lcom/ning/http/client/Request;->getRealm()Lcom/ning/http/client/Realm;

    move-result-object v2

    if-eqz v2, :cond_5

    invoke-interface/range {p1 .. p1}, Lcom/ning/http/client/Request;->getRealm()Lcom/ning/http/client/Realm;

    move-result-object v12

    .line 137
    .local v12, "realm":Lcom/ning/http/client/Realm;
    :goto_0
    const/4 v10, 0x0

    .line 138
    .local v10, "proxy":Ljava/net/Proxy;
    if-nez v11, :cond_2

    if-eqz v12, :cond_3

    .line 140
    :cond_2
    :try_start_0
    invoke-direct {p0, v11, v12}, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->configureProxyAndAuth(Lcom/ning/http/client/ProxyServer;Lcom/ning/http/client/Realm;)Ljava/net/Proxy;
    :try_end_0
    .catch Ljavax/naming/AuthenticationException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v10

    .line 148
    :cond_3
    :try_start_1
    invoke-direct/range {p0 .. p1}, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->createUrlConnection(Lcom/ning/http/client/Request;)Ljava/net/HttpURLConnection;
    :try_end_1
    .catch Ljava/net/URISyntaxException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v4

    .line 153
    .local v4, "urlConnection":Ljava/net/HttpURLConnection;
    iget-object v2, p0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->config:Lcom/ning/http/client/AsyncHttpClientConfig;

    move-object/from16 v0, p1

    invoke-static {v2, v0}, Lcom/ning/http/util/AsyncHttpProviderUtils;->requestTimeout(Lcom/ning/http/client/AsyncHttpClientConfig;Lcom/ning/http/client/Request;)I

    move-result v13

    .line 155
    .local v13, "requestTimeout":I
    const/4 v8, 0x0

    .line 156
    .local v8, "delegate":Lcom/ning/http/client/providers/jdk/JDKDelegateFuture;
    if-eqz p3, :cond_4

    .line 157
    new-instance v8, Lcom/ning/http/client/providers/jdk/JDKDelegateFuture;

    .end local v8    # "delegate":Lcom/ning/http/client/providers/jdk/JDKDelegateFuture;
    move-object/from16 v0, p2

    move-object/from16 v1, p3

    invoke-direct {v8, v0, v13, v1, v4}, Lcom/ning/http/client/providers/jdk/JDKDelegateFuture;-><init>(Lcom/ning/http/client/AsyncHandler;ILcom/ning/http/client/providers/jdk/JDKFuture;Ljava/net/HttpURLConnection;)V

    .line 160
    .restart local v8    # "delegate":Lcom/ning/http/client/providers/jdk/JDKDelegateFuture;
    :cond_4
    if-nez v8, :cond_6

    new-instance v7, Lcom/ning/http/client/providers/jdk/JDKFuture;

    move-object/from16 v0, p2

    invoke-direct {v7, v0, v13, v4}, Lcom/ning/http/client/providers/jdk/JDKFuture;-><init>(Lcom/ning/http/client/AsyncHandler;ILjava/net/HttpURLConnection;)V

    .line 161
    .local v7, "f":Lcom/ning/http/client/providers/jdk/JDKFuture;
    :goto_1
    invoke-virtual {v7}, Lcom/ning/http/client/providers/jdk/JDKFuture;->touch()V

    .line 163
    iget-object v2, p0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->config:Lcom/ning/http/client/AsyncHttpClientConfig;

    invoke-virtual {v2}, Lcom/ning/http/client/AsyncHttpClientConfig;->executorService()Ljava/util/concurrent/ExecutorService;

    move-result-object v14

    new-instance v2, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;

    move-object v3, p0

    move-object/from16 v5, p1

    move-object/from16 v6, p2

    invoke-direct/range {v2 .. v7}, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider$AsyncHttpUrlConnection;-><init>(Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;Ljava/net/HttpURLConnection;Lcom/ning/http/client/Request;Lcom/ning/http/client/AsyncHandler;Lcom/ning/http/client/providers/jdk/JDKFuture;)V

    invoke-interface {v14, v2}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/util/concurrent/Callable;)Ljava/util/concurrent/Future;

    move-result-object v2

    invoke-virtual {v7, v2}, Lcom/ning/http/client/providers/jdk/JDKFuture;->setInnerFuture(Ljava/util/concurrent/Future;)V

    .line 164
    iget-object v2, p0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->maxConnections:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 166
    return-object v7

    .line 136
    .end local v4    # "urlConnection":Ljava/net/HttpURLConnection;
    .end local v7    # "f":Lcom/ning/http/client/providers/jdk/JDKFuture;
    .end local v8    # "delegate":Lcom/ning/http/client/providers/jdk/JDKDelegateFuture;
    .end local v10    # "proxy":Ljava/net/Proxy;
    .end local v12    # "realm":Lcom/ning/http/client/Realm;
    .end local v13    # "requestTimeout":I
    :cond_5
    iget-object v2, p0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->config:Lcom/ning/http/client/AsyncHttpClientConfig;

    invoke-virtual {v2}, Lcom/ning/http/client/AsyncHttpClientConfig;->getRealm()Lcom/ning/http/client/Realm;

    move-result-object v12

    goto :goto_0

    .line 141
    .restart local v10    # "proxy":Ljava/net/Proxy;
    .restart local v12    # "realm":Lcom/ning/http/client/Realm;
    :catch_0
    move-exception v9

    .line 142
    .local v9, "e":Ljavax/naming/AuthenticationException;
    new-instance v2, Ljava/io/IOException;

    invoke-virtual {v9}, Ljavax/naming/AuthenticationException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 149
    .end local v9    # "e":Ljavax/naming/AuthenticationException;
    :catch_1
    move-exception v9

    .line 150
    .local v9, "e":Ljava/net/URISyntaxException;
    new-instance v2, Ljava/io/IOException;

    invoke-virtual {v9}, Ljava/net/URISyntaxException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v2

    .end local v9    # "e":Ljava/net/URISyntaxException;
    .restart local v4    # "urlConnection":Ljava/net/HttpURLConnection;
    .restart local v8    # "delegate":Lcom/ning/http/client/providers/jdk/JDKDelegateFuture;
    .restart local v13    # "requestTimeout":I
    :cond_6
    move-object v7, v8

    .line 160
    goto :goto_1
.end method

.method private getInputStream(Ljava/net/HttpURLConnection;)Ljava/io/InputStream;
    .locals 3
    .param p1, "urlConnection"    # Ljava/net/HttpURLConnection;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 692
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v1

    const/16 v2, 0x190

    if-ge v1, v2, :cond_1

    .line 693
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    .line 696
    :cond_0
    :goto_0
    return-object v0

    .line 695
    :cond_1
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getErrorStream()Ljava/io/InputStream;

    move-result-object v0

    .line 696
    .local v0, "ein":Ljava/io/InputStream;
    if-nez v0, :cond_0

    new-instance v0, Ljava/io/ByteArrayInputStream;

    .end local v0    # "ein":Ljava/io/InputStream;
    const/4 v1, 0x0

    new-array v1, v1, [B

    invoke-direct {v0, v1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    goto :goto_0
.end method


# virtual methods
.method public close()V
    .locals 2

    .prologue
    .line 203
    iget-object v0, p0, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->isClose:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 204
    return-void
.end method

.method public execute(Lcom/ning/http/client/Request;Lcom/ning/http/client/AsyncHandler;)Lcom/ning/http/client/ListenableFuture;
    .locals 2
    .param p1, "request"    # Lcom/ning/http/client/Request;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/ning/http/client/Request;",
            "Lcom/ning/http/client/AsyncHandler",
            "<TT;>;)",
            "Lcom/ning/http/client/ListenableFuture",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 119
    .local p2, "handler":Lcom/ning/http/client/AsyncHandler;, "Lcom/ning/http/client/AsyncHandler<TT;>;"
    const/4 v1, 0x0

    :try_start_0
    invoke-direct {p0, p1, p2, v1}, Lcom/ning/http/client/providers/jdk/JDKAsyncHttpProvider;->execute(Lcom/ning/http/client/Request;Lcom/ning/http/client/AsyncHandler;Lcom/ning/http/client/providers/jdk/JDKFuture;)Lcom/ning/http/client/ListenableFuture;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 122
    :goto_0
    return-object v1

    .line 120
    :catch_0
    move-exception v0

    .line 121
    .local v0, "e":Ljava/io/IOException;
    invoke-interface {p2, v0}, Lcom/ning/http/client/AsyncHandler;->onThrowable(Ljava/lang/Throwable;)V

    .line 122
    new-instance v1, Lcom/ning/http/client/ListenableFuture$CompletedFailure;

    invoke-direct {v1, v0}, Lcom/ning/http/client/ListenableFuture$CompletedFailure;-><init>(Ljava/lang/Throwable;)V

    goto :goto_0
.end method
