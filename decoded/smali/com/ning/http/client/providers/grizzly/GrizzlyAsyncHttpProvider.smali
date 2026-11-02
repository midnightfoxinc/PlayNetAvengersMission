.class public Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;
.super Ljava/lang/Object;
.source "GrizzlyAsyncHttpProvider.java"

# interfaces
.implements Lcom/ning/http/client/AsyncHttpProvider;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$5;,
        Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AHCWebSocketListenerAdapter;,
        Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$GrizzlyWebSocketAdapter;,
        Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$SwitchingSSLFilter;,
        Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$BodyGeneratorBodyHandler;,
        Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$FileBodyHandler;,
        Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$PartsBodyHandler;,
        Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$StreamDataBodyHandler;,
        Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$ParamsBodyHandler;,
        Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$StringBodyHandler;,
        Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$ByteArrayBodyHandler;,
        Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$ExpectHandler;,
        Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$BodyHandlerFactory;,
        Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$BodyHandler;,
        Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$ClientEncodingFilter;,
        Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientEventFilter;,
        Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientFilter;,
        Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$GracefulCloseEvent;,
        Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$ContinueEvent;
    }
.end annotation


# static fields
.field private static final LOGGER:Lorg/slf4j/Logger;

.field private static final SEND_FILE_SUPPORT:Z

.field private static maximumPooledConnectionExceededReason:Ljava/io/IOException;

.field private static final ntlmEngine:Lcom/ning/http/client/ntlm/NTLMEngine;


# instance fields
.field private final bodyHandlerFactory:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$BodyHandlerFactory;

.field private final clientConfig:Lcom/ning/http/client/AsyncHttpClientConfig;

.field private final clientTransport:Lorg/glassfish/grizzly/nio/transport/TCPNIOTransport;

.field private final connectionManager:Lcom/ning/http/client/providers/grizzly/ConnectionManager;

.field private final providerConfig:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig;

.field resolver:Lorg/glassfish/grizzly/utils/DelayedExecutor$Resolver;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/glassfish/grizzly/utils/DelayedExecutor$Resolver",
            "<",
            "Lorg/glassfish/grizzly/Connection;",
            ">;"
        }
    .end annotation
.end field

.field private timeoutExecutor:Lorg/glassfish/grizzly/utils/DelayedExecutor;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 151
    const-class v0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;

    invoke-static {v0}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/Class;)Lorg/slf4j/Logger;

    move-result-object v0

    sput-object v0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->LOGGER:Lorg/slf4j/Logger;

    .line 154
    const/4 v0, 0x0

    sput-boolean v0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->SEND_FILE_SUPPORT:Z

    .line 156
    new-instance v0, Lcom/ning/http/client/ntlm/NTLMEngine;

    invoke-direct {v0}, Lcom/ning/http/client/ntlm/NTLMEngine;-><init>()V

    sput-object v0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->ntlmEngine:Lcom/ning/http/client/ntlm/NTLMEngine;

    return-void
.end method

.method public constructor <init>(Lcom/ning/http/client/AsyncHttpClientConfig;)V
    .locals 5
    .param p1, "clientConfig"    # Lcom/ning/http/client/AsyncHttpClientConfig;

    .prologue
    .line 174
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 159
    new-instance v2, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$BodyHandlerFactory;

    const/4 v3, 0x0

    invoke-direct {v2, p0, v3}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$BodyHandlerFactory;-><init>(Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$1;)V

    iput-object v2, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->bodyHandlerFactory:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$BodyHandlerFactory;

    .line 176
    iput-object p1, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->clientConfig:Lcom/ning/http/client/AsyncHttpClientConfig;

    .line 177
    invoke-virtual {p1}, Lcom/ning/http/client/AsyncHttpClientConfig;->getAsyncHttpProviderConfig()Lcom/ning/http/client/AsyncHttpProviderConfig;

    move-result-object v2

    instance-of v2, v2, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig;

    if-eqz v2, :cond_0

    invoke-virtual {p1}, Lcom/ning/http/client/AsyncHttpClientConfig;->getAsyncHttpProviderConfig()Lcom/ning/http/client/AsyncHttpProviderConfig;

    move-result-object v2

    check-cast v2, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig;

    :goto_0
    iput-object v2, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->providerConfig:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig;

    .line 181
    invoke-static {}, Lorg/glassfish/grizzly/nio/transport/TCPNIOTransportBuilder;->newInstance()Lorg/glassfish/grizzly/nio/transport/TCPNIOTransportBuilder;

    move-result-object v0

    .line 182
    .local v0, "builder":Lorg/glassfish/grizzly/nio/transport/TCPNIOTransportBuilder;
    invoke-virtual {v0}, Lorg/glassfish/grizzly/nio/transport/TCPNIOTransportBuilder;->build()Lorg/glassfish/grizzly/nio/transport/TCPNIOTransport;

    move-result-object v2

    iput-object v2, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->clientTransport:Lorg/glassfish/grizzly/nio/transport/TCPNIOTransport;

    .line 183
    invoke-virtual {p0, p1}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->initializeTransport(Lcom/ning/http/client/AsyncHttpClientConfig;)V

    .line 184
    new-instance v2, Lcom/ning/http/client/providers/grizzly/ConnectionManager;

    iget-object v3, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->clientTransport:Lorg/glassfish/grizzly/nio/transport/TCPNIOTransport;

    iget-object v4, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->providerConfig:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig;

    invoke-direct {v2, p0, v3, v4}, Lcom/ning/http/client/providers/grizzly/ConnectionManager;-><init>(Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;Lorg/glassfish/grizzly/nio/transport/TCPNIOTransport;Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig;)V

    iput-object v2, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->connectionManager:Lcom/ning/http/client/providers/grizzly/ConnectionManager;

    .line 186
    :try_start_0
    iget-object v2, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->clientTransport:Lorg/glassfish/grizzly/nio/transport/TCPNIOTransport;

    invoke-virtual {v2}, Lorg/glassfish/grizzly/nio/transport/TCPNIOTransport;->start()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 191
    return-void

    .line 177
    .end local v0    # "builder":Lorg/glassfish/grizzly/nio/transport/TCPNIOTransportBuilder;
    :cond_0
    new-instance v2, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig;

    invoke-direct {v2}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig;-><init>()V

    goto :goto_0

    .line 187
    .restart local v0    # "builder":Lorg/glassfish/grizzly/nio/transport/TCPNIOTransportBuilder;
    :catch_0
    move-exception v1

    .line 188
    .local v1, "ioe":Ljava/io/IOException;
    new-instance v2, Ljava/lang/RuntimeException;

    invoke-direct {v2, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method

.method private abort(Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;Ljava/lang/Throwable;)V
    .locals 2
    .param p2, "t"    # Ljava/lang/Throwable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture",
            "<*>;",
            "Ljava/lang/Throwable;",
            ")V"
        }
    .end annotation

    .prologue
    .line 260
    .local p1, "future":Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;, "Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture<*>;"
    invoke-virtual {p1}, Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;->isDone()Z

    move-result v0

    if-nez v0, :cond_0

    .line 261
    sget-object v0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->LOGGER:Lorg/slf4j/Logger;

    const-string v1, "Aborting Future {}\n"

    invoke-interface {v0, v1, p1}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;Ljava/lang/Object;)V

    .line 262
    sget-object v0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->LOGGER:Lorg/slf4j/Logger;

    invoke-virtual {p2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p2}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 263
    invoke-virtual {p1, p2}, Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;->abort(Ljava/lang/Throwable;)V

    .line 265
    :cond_0
    return-void
.end method

.method static synthetic access$100()Lorg/slf4j/Logger;
    .locals 1

    .prologue
    .line 149
    sget-object v0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->LOGGER:Lorg/slf4j/Logger;

    return-object v0
.end method

.method static synthetic access$1900()Z
    .locals 1

    .prologue
    .line 149
    sget-boolean v0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->SEND_FILE_SUPPORT:Z

    return v0
.end method

.method static synthetic access$400(Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;)Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$BodyHandlerFactory;
    .locals 1
    .param p0, "x0"    # Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;

    .prologue
    .line 149
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->bodyHandlerFactory:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$BodyHandlerFactory;

    return-object v0
.end method

.method static synthetic access$600()Lcom/ning/http/client/ntlm/NTLMEngine;
    .locals 1

    .prologue
    .line 149
    sget-object v0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->ntlmEngine:Lcom/ning/http/client/ntlm/NTLMEngine;

    return-object v0
.end method

.method static synthetic access$700(Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;)Lcom/ning/http/client/AsyncHttpClientConfig;
    .locals 1
    .param p0, "x0"    # Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;

    .prologue
    .line 149
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->clientConfig:Lcom/ning/http/client/AsyncHttpClientConfig;

    return-object v0
.end method

.method static synthetic access$800(Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;)Lcom/ning/http/client/providers/grizzly/ConnectionManager;
    .locals 1
    .param p0, "x0"    # Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;

    .prologue
    .line 149
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->connectionManager:Lcom/ning/http/client/providers/grizzly/ConnectionManager;

    return-object v0
.end method

.method static synthetic access$900()Ljava/io/IOException;
    .locals 1

    .prologue
    .line 149
    sget-object v0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->maximumPooledConnectionExceededReason:Ljava/io/IOException;

    return-object v0
.end method

.method static synthetic access$902(Ljava/io/IOException;)Ljava/io/IOException;
    .locals 0
    .param p0, "x0"    # Ljava/io/IOException;

    .prologue
    .line 149
    sput-object p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->maximumPooledConnectionExceededReason:Ljava/io/IOException;

    return-object p0
.end method

.method private static configSendFileSupport()Z
    .locals 2

    .prologue
    .line 462
    const-string v0, "os.name"

    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "linux"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->linuxSendFileSupported()Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    const-string v0, "os.name"

    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "HP-UX"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private createWriteCompletionHandler(Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;)Lorg/glassfish/grizzly/CompletionHandler;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture",
            "<TT;>;)",
            "Lorg/glassfish/grizzly/CompletionHandler",
            "<",
            "Lorg/glassfish/grizzly/WriteResult;",
            ">;"
        }
    .end annotation

    .prologue
    .line 494
    .local p1, "future":Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;, "Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture<TT;>;"
    new-instance v0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$4;

    invoke-direct {v0, p0, p1}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$4;-><init>(Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;)V

    return-object v0
.end method

.method private doDefaultTransportConfig()V
    .locals 3

    .prologue
    .line 483
    iget-object v1, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->clientConfig:Lcom/ning/http/client/AsyncHttpClientConfig;

    invoke-virtual {v1}, Lcom/ning/http/client/AsyncHttpClientConfig;->executorService()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    .line 484
    .local v0, "service":Ljava/util/concurrent/ExecutorService;
    if-eqz v0, :cond_0

    .line 485
    iget-object v1, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->clientTransport:Lorg/glassfish/grizzly/nio/transport/TCPNIOTransport;

    invoke-static {}, Lorg/glassfish/grizzly/strategies/WorkerThreadIOStrategy;->getInstance()Lorg/glassfish/grizzly/strategies/WorkerThreadIOStrategy;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/glassfish/grizzly/nio/transport/TCPNIOTransport;->setIOStrategy(Lorg/glassfish/grizzly/IOStrategy;)V

    .line 486
    iget-object v1, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->clientTransport:Lorg/glassfish/grizzly/nio/transport/TCPNIOTransport;

    invoke-virtual {v1, v0}, Lorg/glassfish/grizzly/nio/transport/TCPNIOTransport;->setWorkerThreadPool(Ljava/util/concurrent/ExecutorService;)V

    .line 490
    :goto_0
    return-void

    .line 488
    :cond_0
    iget-object v1, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->clientTransport:Lorg/glassfish/grizzly/nio/transport/TCPNIOTransport;

    invoke-static {}, Lorg/glassfish/grizzly/strategies/SameThreadIOStrategy;->getInstance()Lorg/glassfish/grizzly/strategies/SameThreadIOStrategy;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/glassfish/grizzly/nio/transport/TCPNIOTransport;->setIOStrategy(Lorg/glassfish/grizzly/IOStrategy;)V

    goto :goto_0
.end method

.method private static linuxSendFileSupported()Z
    .locals 6

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 469
    const-string v5, "java.version"

    invoke-static {v5}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 470
    .local v2, "version":Ljava/lang/String;
    const-string v5, "1.6"

    invoke-virtual {v2, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 471
    const/16 v5, 0x5f

    invoke-virtual {v2, v5}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 472
    .local v0, "idx":I
    const/4 v5, -0x1

    if-ne v0, v5, :cond_1

    .line 478
    .end local v0    # "idx":I
    :cond_0
    :goto_0
    return v4

    .line 475
    .restart local v0    # "idx":I
    :cond_1
    add-int/lit8 v5, v0, 0x1

    invoke-virtual {v2, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    .line 476
    .local v1, "patchRev":I
    const/16 v5, 0x12

    if-lt v1, v5, :cond_2

    :goto_1
    move v4, v3

    goto :goto_0

    :cond_2
    move v3, v4

    goto :goto_1

    .line 478
    .end local v0    # "idx":I
    .end local v1    # "patchRev":I
    :cond_3
    const-string v5, "1.7"

    invoke-virtual {v2, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_4

    const-string v5, "1.8"

    invoke-virtual {v2, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    :cond_4
    move v4, v3

    goto :goto_0
.end method

.method public static main([Ljava/lang/String;)V
    .locals 12
    .param p0, "args"    # [Ljava/lang/String;

    .prologue
    .line 2503
    new-instance v3, Ljava/security/SecureRandom;

    invoke-direct {v3}, Ljava/security/SecureRandom;-><init>()V

    .line 2504
    .local v3, "secureRandom":Ljava/security/SecureRandom;
    const/4 v4, 0x0

    .line 2506
    .local v4, "sslContext":Ljavax/net/ssl/SSLContext;
    :try_start_0
    const-string v5, "TLS"

    invoke-static {v5}, Ljavax/net/ssl/SSLContext;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/SSLContext;

    move-result-object v4

    .line 2507
    const/4 v5, 0x0

    const/4 v8, 0x0

    invoke-virtual {v4, v5, v8, v3}, Ljavax/net/ssl/SSLContext;->init([Ljavax/net/ssl/KeyManager;[Ljavax/net/ssl/TrustManager;Ljava/security/SecureRandom;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2511
    :goto_0
    new-instance v5, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;

    invoke-direct {v5}, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;-><init>()V

    const/16 v8, 0x1388

    invoke-virtual {v5, v8}, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->setConnectTimeout(I)Lcom/ning/http/client/AsyncHttpClientConfig$Builder;

    move-result-object v5

    invoke-virtual {v5, v4}, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->setSSLContext(Ljavax/net/ssl/SSLContext;)Lcom/ning/http/client/AsyncHttpClientConfig$Builder;

    move-result-object v5

    invoke-virtual {v5}, Lcom/ning/http/client/AsyncHttpClientConfig$Builder;->build()Lcom/ning/http/client/AsyncHttpClientConfig;

    move-result-object v1

    .line 2514
    .local v1, "config":Lcom/ning/http/client/AsyncHttpClientConfig;
    new-instance v0, Lcom/ning/http/client/AsyncHttpClient;

    new-instance v5, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;

    invoke-direct {v5, v1}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;-><init>(Lcom/ning/http/client/AsyncHttpClientConfig;)V

    invoke-direct {v0, v5, v1}, Lcom/ning/http/client/AsyncHttpClient;-><init>(Lcom/ning/http/client/AsyncHttpProvider;Lcom/ning/http/client/AsyncHttpClientConfig;)V

    .line 2515
    .local v0, "client":Lcom/ning/http/client/AsyncHttpClient;
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    .line 2517
    .local v6, "start":J
    :try_start_1
    const-string v5, "http://www.google.com"

    invoke-virtual {v0, v5}, Lcom/ning/http/client/AsyncHttpClient;->prepareGet(Ljava/lang/String;)Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;

    move-result-object v5

    invoke-virtual {v5}, Lcom/ning/http/client/AsyncHttpClient$BoundRequestBuilder;->build()Lcom/ning/http/client/Request;

    move-result-object v5

    invoke-virtual {v0, v5}, Lcom/ning/http/client/AsyncHttpClient;->executeRequest(Lcom/ning/http/client/Request;)Lcom/ning/http/client/ListenableFuture;

    move-result-object v5

    invoke-interface {v5}, Lcom/ning/http/client/ListenableFuture;->get()Ljava/lang/Object;
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_1 .. :try_end_1} :catch_2

    .line 2523
    :goto_1
    sget-object v5, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->LOGGER:Lorg/slf4j/Logger;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "COMPLETE: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v10

    sub-long/2addr v10, v6

    invoke-virtual {v8, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "ms"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v5, v8}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;)V

    .line 2524
    return-void

    .line 2508
    .end local v0    # "client":Lcom/ning/http/client/AsyncHttpClient;
    .end local v1    # "config":Lcom/ning/http/client/AsyncHttpClientConfig;
    .end local v6    # "start":J
    :catch_0
    move-exception v2

    .line 2509
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 2518
    .end local v2    # "e":Ljava/lang/Exception;
    .restart local v0    # "client":Lcom/ning/http/client/AsyncHttpClient;
    .restart local v1    # "config":Lcom/ning/http/client/AsyncHttpClientConfig;
    .restart local v6    # "start":J
    :catch_1
    move-exception v2

    .line 2519
    .local v2, "e":Ljava/lang/InterruptedException;
    invoke-virtual {v2}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_1

    .line 2520
    .end local v2    # "e":Ljava/lang/InterruptedException;
    :catch_2
    move-exception v2

    .line 2521
    .local v2, "e":Ljava/util/concurrent/ExecutionException;
    invoke-virtual {v2}, Ljava/util/concurrent/ExecutionException;->printStackTrace()V

    goto :goto_1
.end method


# virtual methods
.method public close()V
    .locals 2

    .prologue
    .line 272
    :try_start_0
    iget-object v1, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->connectionManager:Lcom/ning/http/client/providers/grizzly/ConnectionManager;

    invoke-virtual {v1}, Lcom/ning/http/client/providers/grizzly/ConnectionManager;->destroy()V

    .line 273
    iget-object v1, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->clientTransport:Lorg/glassfish/grizzly/nio/transport/TCPNIOTransport;

    invoke-virtual {v1}, Lorg/glassfish/grizzly/nio/transport/TCPNIOTransport;->shutdownNow()V

    .line 274
    iget-object v1, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->clientConfig:Lcom/ning/http/client/AsyncHttpClientConfig;

    invoke-virtual {v1}, Lcom/ning/http/client/AsyncHttpClientConfig;->executorService()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    .line 275
    .local v0, "service":Ljava/util/concurrent/ExecutorService;
    if-eqz v0, :cond_0

    .line 276
    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    .line 278
    :cond_0
    iget-object v1, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->timeoutExecutor:Lorg/glassfish/grizzly/utils/DelayedExecutor;

    if-eqz v1, :cond_1

    .line 279
    iget-object v1, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->timeoutExecutor:Lorg/glassfish/grizzly/utils/DelayedExecutor;

    invoke-virtual {v1}, Lorg/glassfish/grizzly/utils/DelayedExecutor;->stop()V

    .line 280
    iget-object v1, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->timeoutExecutor:Lorg/glassfish/grizzly/utils/DelayedExecutor;

    invoke-virtual {v1}, Lorg/glassfish/grizzly/utils/DelayedExecutor;->getThreadPool()Ljava/util/concurrent/ExecutorService;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/concurrent/ExecutorService;->shutdownNow()Ljava/util/List;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 284
    .end local v0    # "service":Ljava/util/concurrent/ExecutorService;
    :cond_1
    :goto_0
    return-void

    .line 282
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public execute(Lcom/ning/http/client/Request;Lcom/ning/http/client/AsyncHandler;)Lcom/ning/http/client/ListenableFuture;
    .locals 8
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
    .line 203
    .local p2, "handler":Lcom/ning/http/client/AsyncHandler;, "Lcom/ning/http/client/AsyncHandler<TT;>;"
    iget-object v6, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->clientTransport:Lorg/glassfish/grizzly/nio/transport/TCPNIOTransport;

    invoke-virtual {v6}, Lorg/glassfish/grizzly/nio/transport/TCPNIOTransport;->isStopped()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 204
    new-instance v1, Ljava/io/IOException;

    const-string v6, "AsyncHttpClient has been closed."

    invoke-direct {v1, v6}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 205
    .local v1, "e":Ljava/io/IOException;
    invoke-interface {p2, v1}, Lcom/ning/http/client/AsyncHandler;->onThrowable(Ljava/lang/Throwable;)V

    .line 206
    new-instance v2, Lcom/ning/http/client/ListenableFuture$CompletedFailure;

    invoke-direct {v2, v1}, Lcom/ning/http/client/ListenableFuture$CompletedFailure;-><init>(Ljava/lang/Throwable;)V

    .line 256
    .end local v1    # "e":Ljava/io/IOException;
    :goto_0
    return-object v2

    .line 208
    :cond_0
    iget-object v6, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->clientConfig:Lcom/ning/http/client/AsyncHttpClientConfig;

    invoke-static {v6, p1}, Lcom/ning/http/util/ProxyUtils;->getProxyServer(Lcom/ning/http/client/AsyncHttpClientConfig;Lcom/ning/http/client/Request;)Lcom/ning/http/client/ProxyServer;

    move-result-object v4

    .line 209
    .local v4, "proxy":Lcom/ning/http/client/ProxyServer;
    new-instance v2, Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;

    invoke-direct {v2, p0, p1, p2, v4}, Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;-><init>(Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;Lcom/ning/http/client/Request;Lcom/ning/http/client/AsyncHandler;Lcom/ning/http/client/ProxyServer;)V

    .line 210
    .local v2, "future":Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;, "Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture<TT;>;"
    new-instance v0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$1;

    invoke-direct {v0, p0, v2, p1, p2}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$1;-><init>(Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;Lcom/ning/http/client/Request;Lcom/ning/http/client/AsyncHandler;)V

    .line 244
    .local v0, "connectHandler":Lorg/glassfish/grizzly/CompletionHandler;, "Lorg/glassfish/grizzly/CompletionHandler<Lorg/glassfish/grizzly/Connection;>;"
    :try_start_0
    iget-object v6, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->connectionManager:Lcom/ning/http/client/providers/grizzly/ConnectionManager;

    invoke-virtual {v6, p1, v2, v0}, Lcom/ning/http/client/providers/grizzly/ConnectionManager;->doAsyncTrackedConnection(Lcom/ning/http/client/Request;Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;Lorg/glassfish/grizzly/CompletionHandler;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    goto :goto_0

    .line 245
    :catch_0
    move-exception v3

    .line 246
    .local v3, "ioe":Ljava/io/IOException;
    invoke-direct {p0, v2, v3}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->abort(Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 247
    .end local v3    # "ioe":Ljava/io/IOException;
    :catch_1
    move-exception v5

    .line 248
    .local v5, "re":Ljava/lang/RuntimeException;
    invoke-direct {p0, v2, v5}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->abort(Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 249
    .end local v5    # "re":Ljava/lang/RuntimeException;
    :catch_2
    move-exception v1

    .line 250
    .local v1, "e":Ljava/lang/Exception;
    sget-object v6, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->LOGGER:Lorg/slf4j/Logger;

    invoke-interface {v6}, Lorg/slf4j/Logger;->isWarnEnabled()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 251
    sget-object v6, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->LOGGER:Lorg/slf4j/Logger;

    invoke-virtual {v1}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-interface {v6, v7, v1}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 253
    :cond_1
    invoke-direct {p0, v2, v1}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->abort(Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method protected execute(Lorg/glassfish/grizzly/Connection;Lcom/ning/http/client/Request;Lcom/ning/http/client/AsyncHandler;Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;Z)Lcom/ning/http/client/ListenableFuture;
    .locals 3
    .param p1, "c"    # Lorg/glassfish/grizzly/Connection;
    .param p2, "request"    # Lcom/ning/http/client/Request;
    .param p5, "forceTxContextExist"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lorg/glassfish/grizzly/Connection;",
            "Lcom/ning/http/client/Request;",
            "Lcom/ning/http/client/AsyncHandler",
            "<TT;>;",
            "Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture",
            "<TT;>;Z)",
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
    .line 298
    .local p3, "handler":Lcom/ning/http/client/AsyncHandler;, "Lcom/ning/http/client/AsyncHandler<TT;>;"
    .local p4, "future":Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;, "Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture<TT;>;"
    if-eqz p5, :cond_0

    :try_start_0
    invoke-static {p1}, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->currentTransaction(Lorg/glassfish/grizzly/Connection;)Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;

    move-result-object v1

    if-nez v1, :cond_0

    .line 299
    invoke-static {p1, p0, p4, p2, p3}, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->startTransaction(Lorg/glassfish/grizzly/Connection;Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;Lcom/ning/http/client/Request;Lcom/ning/http/client/AsyncHandler;)Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;

    .line 303
    :cond_0
    invoke-direct {p0, p4}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->createWriteCompletionHandler(Lcom/ning/http/client/providers/grizzly/GrizzlyResponseFuture;)Lorg/glassfish/grizzly/CompletionHandler;

    move-result-object v1

    invoke-interface {p1, p2, v1}, Lorg/glassfish/grizzly/Connection;->write(Ljava/lang/Object;Lorg/glassfish/grizzly/CompletionHandler;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 315
    :cond_1
    :goto_0
    return-object p4

    .line 304
    :catch_0
    move-exception v0

    .line 305
    .local v0, "e":Ljava/lang/Exception;
    instance-of v1, v0, Ljava/lang/RuntimeException;

    if-eqz v1, :cond_2

    .line 306
    check-cast v0, Ljava/lang/RuntimeException;

    .end local v0    # "e":Ljava/lang/Exception;
    throw v0

    .line 307
    .restart local v0    # "e":Ljava/lang/Exception;
    :cond_2
    instance-of v1, v0, Ljava/io/IOException;

    if-eqz v1, :cond_3

    .line 308
    check-cast v0, Ljava/io/IOException;

    .end local v0    # "e":Ljava/lang/Exception;
    throw v0

    .line 310
    .restart local v0    # "e":Ljava/lang/Exception;
    :cond_3
    sget-object v1, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->LOGGER:Lorg/slf4j/Logger;

    invoke-interface {v1}, Lorg/slf4j/Logger;->isWarnEnabled()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 311
    sget-object v1, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->LOGGER:Lorg/slf4j/Logger;

    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2, v0}, Lorg/slf4j/Logger;->warn(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method getClientConfig()Lcom/ning/http/client/AsyncHttpClientConfig;
    .locals 1

    .prologue
    .line 194
    iget-object v0, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->clientConfig:Lcom/ning/http/client/AsyncHttpClientConfig;

    return-object v0
.end method

.method protected initializeTransport(Lcom/ning/http/client/AsyncHttpClientConfig;)V
    .locals 28
    .param p1, "clientConfig"    # Lcom/ning/http/client/AsyncHttpClientConfig;

    .prologue
    .line 321
    invoke-static {}, Lorg/glassfish/grizzly/filterchain/FilterChainBuilder;->stateless()Lorg/glassfish/grizzly/filterchain/FilterChainBuilder;

    move-result-object v15

    .line 322
    .local v15, "fcb":Lorg/glassfish/grizzly/filterchain/FilterChainBuilder;
    new-instance v23, Lorg/glassfish/grizzly/filterchain/TransportFilter;

    invoke-direct/range {v23 .. v23}, Lorg/glassfish/grizzly/filterchain/TransportFilter;-><init>()V

    move-object/from16 v0, v23

    invoke-virtual {v15, v0}, Lorg/glassfish/grizzly/filterchain/FilterChainBuilder;->add(Lorg/glassfish/grizzly/filterchain/Filter;)Lorg/glassfish/grizzly/filterchain/FilterChainBuilder;

    .line 324
    invoke-virtual/range {p1 .. p1}, Lcom/ning/http/client/AsyncHttpClientConfig;->getRequestTimeout()I

    move-result v20

    .line 325
    .local v20, "timeout":I
    if-lez v20, :cond_1

    .line 326
    const/16 v10, 0x1f4

    .line 327
    .local v10, "delay":I
    move/from16 v0, v20

    if-ge v0, v10, :cond_0

    .line 328
    add-int/lit8 v10, v20, -0xa

    .line 330
    :cond_0
    int-to-long v0, v10

    move-wide/from16 v24, v0

    sget-object v23, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    move-wide/from16 v0, v24

    move-object/from16 v2, v23

    invoke-static {v0, v1, v2}, Lorg/glassfish/grizzly/utils/IdleTimeoutFilter;->createDefaultIdleDelayedExecutor(JLjava/util/concurrent/TimeUnit;)Lorg/glassfish/grizzly/utils/DelayedExecutor;

    move-result-object v23

    move-object/from16 v0, v23

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->timeoutExecutor:Lorg/glassfish/grizzly/utils/DelayedExecutor;

    .line 331
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->timeoutExecutor:Lorg/glassfish/grizzly/utils/DelayedExecutor;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lorg/glassfish/grizzly/utils/DelayedExecutor;->start()V

    .line 332
    new-instance v22, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$2;

    move-object/from16 v0, v22

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move/from16 v3, v20

    invoke-direct {v0, v1, v2, v3}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$2;-><init>(Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;Lcom/ning/http/client/AsyncHttpClientConfig;I)V

    .line 350
    .local v22, "timeoutResolver":Lorg/glassfish/grizzly/utils/IdleTimeoutFilter$TimeoutResolver;
    new-instance v21, Lorg/glassfish/grizzly/utils/IdleTimeoutFilter;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->timeoutExecutor:Lorg/glassfish/grizzly/utils/DelayedExecutor;

    move-object/from16 v23, v0

    new-instance v24, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$3;

    move-object/from16 v0, v24

    move-object/from16 v1, p0

    invoke-direct {v0, v1}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$3;-><init>(Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;)V

    move-object/from16 v0, v21

    move-object/from16 v1, v23

    move-object/from16 v2, v22

    move-object/from16 v3, v24

    invoke-direct {v0, v1, v2, v3}, Lorg/glassfish/grizzly/utils/IdleTimeoutFilter;-><init>(Lorg/glassfish/grizzly/utils/DelayedExecutor;Lorg/glassfish/grizzly/utils/IdleTimeoutFilter$TimeoutResolver;Lorg/glassfish/grizzly/utils/IdleTimeoutFilter$TimeoutHandler;)V

    .line 357
    .local v21, "timeoutFilter":Lorg/glassfish/grizzly/utils/IdleTimeoutFilter;
    move-object/from16 v0, v21

    invoke-virtual {v15, v0}, Lorg/glassfish/grizzly/filterchain/FilterChainBuilder;->add(Lorg/glassfish/grizzly/filterchain/Filter;)Lorg/glassfish/grizzly/filterchain/FilterChainBuilder;

    .line 358
    invoke-virtual/range {v21 .. v21}, Lorg/glassfish/grizzly/utils/IdleTimeoutFilter;->getResolver()Lorg/glassfish/grizzly/utils/DelayedExecutor$Resolver;

    move-result-object v23

    move-object/from16 v0, v23

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->resolver:Lorg/glassfish/grizzly/utils/DelayedExecutor$Resolver;

    .line 361
    .end local v10    # "delay":I
    .end local v21    # "timeoutFilter":Lorg/glassfish/grizzly/utils/IdleTimeoutFilter;
    .end local v22    # "timeoutResolver":Lorg/glassfish/grizzly/utils/IdleTimeoutFilter$TimeoutResolver;
    :cond_1
    invoke-virtual/range {p1 .. p1}, Lcom/ning/http/client/AsyncHttpClientConfig;->getSSLContext()Ljavax/net/ssl/SSLContext;

    move-result-object v7

    .line 362
    .local v7, "context":Ljavax/net/ssl/SSLContext;
    if-eqz v7, :cond_4

    const/4 v9, 0x1

    .line 363
    .local v9, "defaultSecState":Z
    :goto_0
    if-nez v7, :cond_2

    .line 365
    :try_start_0
    invoke-static {}, Lcom/ning/http/util/SslUtils;->getInstance()Lcom/ning/http/util/SslUtils;

    move-result-object v23

    invoke-virtual/range {p1 .. p1}, Lcom/ning/http/client/AsyncHttpClientConfig;->isAcceptAnyCertificate()Z

    move-result v24

    invoke-virtual/range {v23 .. v24}, Lcom/ning/http/util/SslUtils;->getSSLContext(Z)Ljavax/net/ssl/SSLContext;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v7

    .line 370
    :cond_2
    new-instance v6, Lorg/glassfish/grizzly/ssl/SSLEngineConfigurator;

    const/16 v23, 0x1

    const/16 v24, 0x0

    const/16 v25, 0x0

    move/from16 v0, v23

    move/from16 v1, v24

    move/from16 v2, v25

    invoke-direct {v6, v7, v0, v1, v2}, Lorg/glassfish/grizzly/ssl/SSLEngineConfigurator;-><init>(Ljavax/net/ssl/SSLContext;ZZZ)V

    .line 375
    .local v6, "configurator":Lorg/glassfish/grizzly/ssl/SSLEngineConfigurator;
    new-instance v19, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$SwitchingSSLFilter;

    move-object/from16 v0, v19

    invoke-direct {v0, v6, v9}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$SwitchingSSLFilter;-><init>(Lorg/glassfish/grizzly/ssl/SSLEngineConfigurator;Z)V

    .line 377
    .local v19, "sslFilter":Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$SwitchingSSLFilter;
    invoke-virtual/range {p1 .. p1}, Lcom/ning/http/client/AsyncHttpClientConfig;->getHostnameVerifier()Ljavax/net/ssl/HostnameVerifier;

    move-result-object v23

    if-eqz v23, :cond_3

    .line 378
    new-instance v23, Lcom/ning/http/client/providers/grizzly/HostnameVerifierListener;

    invoke-direct/range {v23 .. v23}, Lcom/ning/http/client/providers/grizzly/HostnameVerifierListener;-><init>()V

    move-object/from16 v0, v19

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$SwitchingSSLFilter;->addHandshakeListener(Lorg/glassfish/grizzly/ssl/SSLBaseFilter$HandshakeListener;)V

    .line 380
    :cond_3
    move-object/from16 v0, v19

    invoke-virtual {v15, v0}, Lorg/glassfish/grizzly/filterchain/FilterChainBuilder;->add(Lorg/glassfish/grizzly/filterchain/Filter;)Lorg/glassfish/grizzly/filterchain/FilterChainBuilder;

    .line 382
    new-instance v14, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientEventFilter;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->providerConfig:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig;

    move-object/from16 v23, v0

    sget-object v24, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig$Property;->MAX_HTTP_PACKET_HEADER_SIZE:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig$Property;

    invoke-virtual/range {v23 .. v24}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig;->getProperty(Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig$Property;)Ljava/lang/Object;

    move-result-object v23

    check-cast v23, Ljava/lang/Integer;

    invoke-virtual/range {v23 .. v23}, Ljava/lang/Integer;->intValue()I

    move-result v23

    move-object/from16 v0, p0

    move/from16 v1, v23

    invoke-direct {v14, v0, v1}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientEventFilter;-><init>(Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;I)V

    .line 384
    .local v14, "eventFilter":Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientEventFilter;
    new-instance v5, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientFilter;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v5, v0, v1}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientFilter;-><init>(Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;Lcom/ning/http/client/AsyncHttpClientConfig;)V

    .line 386
    .local v5, "clientFilter":Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientFilter;
    invoke-virtual {v14}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientEventFilter;->getContentEncodings()[Lorg/glassfish/grizzly/http/ContentEncoding;

    move-result-object v13

    .line 387
    .local v13, "encodings":[Lorg/glassfish/grizzly/http/ContentEncoding;
    array-length v0, v13

    move/from16 v23, v0

    if-lez v23, :cond_5

    .line 388
    move-object v4, v13

    .local v4, "arr$":[Lorg/glassfish/grizzly/http/ContentEncoding;
    array-length v0, v4

    move/from16 v18, v0

    .local v18, "len$":I
    const/16 v16, 0x0

    .local v16, "i$":I
    :goto_1
    move/from16 v0, v16

    move/from16 v1, v18

    if-ge v0, v1, :cond_5

    aget-object v12, v4, v16

    .line 389
    .local v12, "encoding":Lorg/glassfish/grizzly/http/ContentEncoding;
    invoke-virtual {v14, v12}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientEventFilter;->removeContentEncoding(Lorg/glassfish/grizzly/http/ContentEncoding;)Z

    .line 388
    add-int/lit8 v16, v16, 0x1

    goto :goto_1

    .line 362
    .end local v4    # "arr$":[Lorg/glassfish/grizzly/http/ContentEncoding;
    .end local v5    # "clientFilter":Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientFilter;
    .end local v6    # "configurator":Lorg/glassfish/grizzly/ssl/SSLEngineConfigurator;
    .end local v9    # "defaultSecState":Z
    .end local v12    # "encoding":Lorg/glassfish/grizzly/http/ContentEncoding;
    .end local v13    # "encodings":[Lorg/glassfish/grizzly/http/ContentEncoding;
    .end local v14    # "eventFilter":Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientEventFilter;
    .end local v16    # "i$":I
    .end local v18    # "len$":I
    .end local v19    # "sslFilter":Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$SwitchingSSLFilter;
    :cond_4
    const/4 v9, 0x0

    goto :goto_0

    .line 366
    .restart local v9    # "defaultSecState":Z
    :catch_0
    move-exception v11

    .line 367
    .local v11, "e":Ljava/lang/Exception;
    new-instance v23, Ljava/lang/IllegalStateException;

    move-object/from16 v0, v23

    invoke-direct {v0, v11}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v23

    .line 393
    .end local v11    # "e":Ljava/lang/Exception;
    .restart local v5    # "clientFilter":Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientFilter;
    .restart local v6    # "configurator":Lorg/glassfish/grizzly/ssl/SSLEngineConfigurator;
    .restart local v13    # "encodings":[Lorg/glassfish/grizzly/http/ContentEncoding;
    .restart local v14    # "eventFilter":Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientEventFilter;
    .restart local v19    # "sslFilter":Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$SwitchingSSLFilter;
    :cond_5
    new-instance v23, Lorg/glassfish/grizzly/http/GZipContentEncoding;

    const/16 v24, 0x200

    const/16 v25, 0x200

    new-instance v26, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$ClientEncodingFilter;

    const/16 v27, 0x0

    invoke-direct/range {v26 .. v27}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$ClientEncodingFilter;-><init>(Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$1;)V

    invoke-direct/range {v23 .. v26}, Lorg/glassfish/grizzly/http/GZipContentEncoding;-><init>(IILorg/glassfish/grizzly/http/EncodingFilter;)V

    move-object/from16 v0, v23

    invoke-virtual {v14, v0}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$AsyncHttpClientEventFilter;->addContentEncoding(Lorg/glassfish/grizzly/http/ContentEncoding;)V

    .line 398
    invoke-virtual {v15, v14}, Lorg/glassfish/grizzly/filterchain/FilterChainBuilder;->add(Lorg/glassfish/grizzly/filterchain/Filter;)Lorg/glassfish/grizzly/filterchain/FilterChainBuilder;

    .line 399
    invoke-virtual {v15, v5}, Lorg/glassfish/grizzly/filterchain/FilterChainBuilder;->add(Lorg/glassfish/grizzly/filterchain/Filter;)Lorg/glassfish/grizzly/filterchain/FilterChainBuilder;

    .line 400
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->clientTransport:Lorg/glassfish/grizzly/nio/transport/TCPNIOTransport;

    move-object/from16 v23, v0

    invoke-virtual/range {v23 .. v23}, Lorg/glassfish/grizzly/nio/transport/TCPNIOTransport;->getAsyncQueueIO()Lorg/glassfish/grizzly/asyncqueue/AsyncQueueIO;

    move-result-object v23

    invoke-interface/range {v23 .. v23}, Lorg/glassfish/grizzly/asyncqueue/AsyncQueueIO;->getWriter()Lorg/glassfish/grizzly/asyncqueue/AsyncQueueWriter;

    move-result-object v23

    const/16 v24, -0x2

    invoke-interface/range {v23 .. v24}, Lorg/glassfish/grizzly/asyncqueue/AsyncQueueWriter;->setMaxPendingBytesPerConnection(I)V

    .line 403
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->clientTransport:Lorg/glassfish/grizzly/nio/transport/TCPNIOTransport;

    move-object/from16 v23, v0

    new-instance v24, Lorg/glassfish/grizzly/nio/RoundRobinConnectionDistributor;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->clientTransport:Lorg/glassfish/grizzly/nio/transport/TCPNIOTransport;

    move-object/from16 v25, v0

    const/16 v26, 0x0

    const/16 v27, 0x0

    invoke-direct/range {v24 .. v27}, Lorg/glassfish/grizzly/nio/RoundRobinConnectionDistributor;-><init>(Lorg/glassfish/grizzly/nio/NIOTransport;ZZ)V

    invoke-virtual/range {v23 .. v24}, Lorg/glassfish/grizzly/nio/transport/TCPNIOTransport;->setNIOChannelDistributor(Lorg/glassfish/grizzly/nio/NIOChannelDistributor;)V

    .line 406
    invoke-virtual/range {p1 .. p1}, Lcom/ning/http/client/AsyncHttpClientConfig;->getIoThreadMultiplier()I

    move-result v23

    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/Runtime;->availableProcessors()I

    move-result v24

    mul-int v17, v23, v24

    .line 410
    .local v17, "kernelThreadsCount":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->clientTransport:Lorg/glassfish/grizzly/nio/transport/TCPNIOTransport;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lorg/glassfish/grizzly/nio/transport/TCPNIOTransport;->setSelectorRunnersCount(I)V

    .line 411
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->clientTransport:Lorg/glassfish/grizzly/nio/transport/TCPNIOTransport;

    move-object/from16 v23, v0

    invoke-static {}, Lorg/glassfish/grizzly/threadpool/ThreadPoolConfig;->defaultConfig()Lorg/glassfish/grizzly/threadpool/ThreadPoolConfig;

    move-result-object v24

    move-object/from16 v0, v24

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lorg/glassfish/grizzly/threadpool/ThreadPoolConfig;->setCorePoolSize(I)Lorg/glassfish/grizzly/threadpool/ThreadPoolConfig;

    move-result-object v24

    move-object/from16 v0, v24

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lorg/glassfish/grizzly/threadpool/ThreadPoolConfig;->setMaxPoolSize(I)Lorg/glassfish/grizzly/threadpool/ThreadPoolConfig;

    move-result-object v24

    const-string v25, "grizzly-ahc-kernel"

    invoke-virtual/range {v24 .. v25}, Lorg/glassfish/grizzly/threadpool/ThreadPoolConfig;->setPoolName(Ljava/lang/String;)Lorg/glassfish/grizzly/threadpool/ThreadPoolConfig;

    move-result-object v24

    invoke-virtual/range {v23 .. v24}, Lorg/glassfish/grizzly/nio/transport/TCPNIOTransport;->setKernelThreadPoolConfig(Lorg/glassfish/grizzly/threadpool/ThreadPoolConfig;)V

    .line 420
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->providerConfig:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig;

    move-object/from16 v23, v0

    sget-object v24, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig$Property;->TRANSPORT_CUSTOMIZER:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig$Property;

    invoke-virtual/range {v23 .. v24}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig;->getProperty(Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProviderConfig$Property;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/ning/http/client/providers/grizzly/TransportCustomizer;

    .line 422
    .local v8, "customizer":Lcom/ning/http/client/providers/grizzly/TransportCustomizer;
    if-eqz v8, :cond_6

    .line 423
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->clientTransport:Lorg/glassfish/grizzly/nio/transport/TCPNIOTransport;

    move-object/from16 v23, v0

    move-object/from16 v0, v23

    invoke-interface {v8, v0, v15}, Lcom/ning/http/client/providers/grizzly/TransportCustomizer;->customize(Lorg/glassfish/grizzly/nio/transport/TCPNIOTransport;Lorg/glassfish/grizzly/filterchain/FilterChainBuilder;)V

    .line 427
    :goto_2
    new-instance v23, Lorg/glassfish/grizzly/websockets/WebSocketFilter;

    invoke-direct/range {v23 .. v23}, Lorg/glassfish/grizzly/websockets/WebSocketFilter;-><init>()V

    move-object/from16 v0, v23

    invoke-virtual {v15, v0}, Lorg/glassfish/grizzly/filterchain/FilterChainBuilder;->add(Lorg/glassfish/grizzly/filterchain/Filter;)Lorg/glassfish/grizzly/filterchain/FilterChainBuilder;

    .line 429
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->clientTransport:Lorg/glassfish/grizzly/nio/transport/TCPNIOTransport;

    move-object/from16 v23, v0

    invoke-virtual {v15}, Lorg/glassfish/grizzly/filterchain/FilterChainBuilder;->build()Lorg/glassfish/grizzly/filterchain/FilterChain;

    move-result-object v24

    invoke-virtual/range {v23 .. v24}, Lorg/glassfish/grizzly/nio/transport/TCPNIOTransport;->setProcessor(Lorg/glassfish/grizzly/Processor;)V

    .line 431
    return-void

    .line 425
    :cond_6
    invoke-direct/range {p0 .. p0}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->doDefaultTransportConfig()V

    goto :goto_2
.end method

.method sendRequest(Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;Lorg/glassfish/grizzly/filterchain/FilterChainContext;Lorg/glassfish/grizzly/http/HttpRequestPacket;Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$BodyHandler;)Z
    .locals 7
    .param p1, "httpCtx"    # Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;
    .param p2, "ctx"    # Lorg/glassfish/grizzly/filterchain/FilterChainContext;
    .param p3, "requestPacket"    # Lorg/glassfish/grizzly/http/HttpRequestPacket;
    .param p4, "bodyHandler"    # Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$BodyHandler;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 529
    iget-object v3, p1, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->request:Lcom/ning/http/client/Request;

    .line 530
    .local v3, "request":Lcom/ning/http/client/Request;
    iget-object v0, p1, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->handler:Lcom/ning/http/client/AsyncHandler;

    .line 531
    .local v0, "h":Lcom/ning/http/client/AsyncHandler;
    instance-of v4, v0, Lcom/ning/http/client/listener/TransferCompletionHandler;

    if-eqz v4, :cond_0

    .line 532
    new-instance v2, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    invoke-interface {v3}, Lcom/ning/http/client/Request;->getHeaders()Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;

    move-result-object v4

    invoke-direct {v2, v4}, Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;-><init>(Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;)V

    .line 534
    .local v2, "map":Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;
    const-class v4, Lcom/ning/http/client/listener/TransferCompletionHandler;

    invoke-virtual {v4, v0}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/ning/http/client/listener/TransferCompletionHandler;

    invoke-virtual {v4, v2}, Lcom/ning/http/client/listener/TransferCompletionHandler;->headers(Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;)V

    .line 537
    .end local v2    # "map":Lcom/ning/http/client/FluentCaseInsensitiveStringsMap;
    :cond_0
    invoke-virtual {p2}, Lorg/glassfish/grizzly/filterchain/FilterChainContext;->getConnection()Lorg/glassfish/grizzly/Connection;

    move-result-object v4

    invoke-virtual {p3, v4}, Lorg/glassfish/grizzly/http/HttpRequestPacket;->setConnection(Lorg/glassfish/grizzly/Connection;)V

    .line 539
    const/4 v1, 0x1

    .line 541
    .local v1, "isWriteComplete":Z
    if-eqz p4, :cond_2

    .line 542
    iput-object p4, p1, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->bodyHandler:Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$BodyHandler;

    .line 543
    sget-object v4, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->LOGGER:Lorg/slf4j/Logger;

    invoke-interface {v4}, Lorg/slf4j/Logger;->isDebugEnabled()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 544
    sget-object v4, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->LOGGER:Lorg/slf4j/Logger;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "REQUEST: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p3}, Lorg/glassfish/grizzly/http/HttpRequestPacket;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;)V

    .line 546
    :cond_1
    invoke-virtual {p4, p2, v3, p3}, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider$BodyHandler;->doHandle(Lorg/glassfish/grizzly/filterchain/FilterChainContext;Lcom/ning/http/client/Request;Lorg/glassfish/grizzly/http/HttpRequestPacket;)Z

    move-result v1

    .line 555
    :goto_0
    return v1

    .line 548
    :cond_2
    sget-object v4, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->LOGGER:Lorg/slf4j/Logger;

    invoke-interface {v4}, Lorg/slf4j/Logger;->isDebugEnabled()Z

    move-result v4

    if-eqz v4, :cond_3

    .line 549
    sget-object v4, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->LOGGER:Lorg/slf4j/Logger;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "REQUEST: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p3}, Lorg/glassfish/grizzly/http/HttpRequestPacket;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;)V

    .line 551
    :cond_3
    invoke-virtual {p2}, Lorg/glassfish/grizzly/filterchain/FilterChainContext;->getTransportContext()Lorg/glassfish/grizzly/filterchain/FilterChainContext$TransportContext;

    move-result-object v4

    invoke-virtual {v4}, Lorg/glassfish/grizzly/filterchain/FilterChainContext$TransportContext;->getCompletionHandler()Lorg/glassfish/grizzly/CompletionHandler;

    move-result-object v4

    invoke-virtual {p2, p3, v4}, Lorg/glassfish/grizzly/filterchain/FilterChainContext;->write(Ljava/lang/Object;Lorg/glassfish/grizzly/CompletionHandler;)V

    goto :goto_0
.end method

.method timeout(Lorg/glassfish/grizzly/Connection;)V
    .locals 3
    .param p1, "c"    # Lorg/glassfish/grizzly/Connection;

    .prologue
    .line 517
    invoke-static {p1}, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->cleanupTransaction(Lorg/glassfish/grizzly/Connection;)Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;

    move-result-object v0

    .line 518
    .local v0, "context":Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;
    new-instance v1, Ljava/util/concurrent/TimeoutException;

    const-string v2, "Timeout exceeded"

    invoke-direct {v1, v2}, Ljava/util/concurrent/TimeoutException;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/ning/http/client/providers/grizzly/HttpTransactionContext;->abort(Ljava/lang/Throwable;)V

    .line 520
    return-void
.end method

.method touchConnection(Lorg/glassfish/grizzly/Connection;Lcom/ning/http/client/Request;)V
    .locals 10
    .param p1, "c"    # Lorg/glassfish/grizzly/Connection;
    .param p2, "request"    # Lcom/ning/http/client/Request;

    .prologue
    const-wide/16 v8, 0x0

    .line 439
    invoke-interface {p2}, Lcom/ning/http/client/Request;->getRequestTimeout()I

    move-result v6

    int-to-long v2, v6

    .line 440
    .local v2, "perRequestTimeout":J
    cmp-long v6, v2, v8

    if-lez v6, :cond_1

    .line 441
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    add-long v0, v6, v2

    .line 442
    .local v0, "newTimeout":J
    iget-object v6, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->resolver:Lorg/glassfish/grizzly/utils/DelayedExecutor$Resolver;

    if-eqz v6, :cond_0

    .line 443
    iget-object v6, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->resolver:Lorg/glassfish/grizzly/utils/DelayedExecutor$Resolver;

    invoke-interface {v6, p1, v0, v1}, Lorg/glassfish/grizzly/utils/DelayedExecutor$Resolver;->setTimeoutMillis(Ljava/lang/Object;J)V

    .line 454
    .end local v0    # "newTimeout":J
    :cond_0
    :goto_0
    return-void

    .line 446
    :cond_1
    iget-object v6, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->clientConfig:Lcom/ning/http/client/AsyncHttpClientConfig;

    invoke-virtual {v6}, Lcom/ning/http/client/AsyncHttpClientConfig;->getRequestTimeout()I

    move-result v6

    int-to-long v4, v6

    .line 447
    .local v4, "timeout":J
    cmp-long v6, v4, v8

    if-lez v6, :cond_0

    .line 448
    iget-object v6, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->resolver:Lorg/glassfish/grizzly/utils/DelayedExecutor$Resolver;

    if-eqz v6, :cond_0

    .line 449
    iget-object v6, p0, Lcom/ning/http/client/providers/grizzly/GrizzlyAsyncHttpProvider;->resolver:Lorg/glassfish/grizzly/utils/DelayedExecutor$Resolver;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v8

    add-long/2addr v8, v4

    invoke-interface {v6, p1, v8, v9}, Lorg/glassfish/grizzly/utils/DelayedExecutor$Resolver;->setTimeoutMillis(Ljava/lang/Object;J)V

    goto :goto_0
.end method
