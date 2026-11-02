.class public Lcom/ning/http/client/SSLEngineFactory$DefaultSSLEngineFactory;
.super Ljava/lang/Object;
.source "SSLEngineFactory.java"

# interfaces
.implements Lcom/ning/http/client/SSLEngineFactory;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ning/http/client/SSLEngineFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "DefaultSSLEngineFactory"
.end annotation


# instance fields
.field private final config:Lcom/ning/http/client/AsyncHttpClientConfig;


# direct methods
.method public constructor <init>(Lcom/ning/http/client/AsyncHttpClientConfig;)V
    .locals 0
    .param p1, "config"    # Lcom/ning/http/client/AsyncHttpClientConfig;

    .prologue
    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    iput-object p1, p0, Lcom/ning/http/client/SSLEngineFactory$DefaultSSLEngineFactory;->config:Lcom/ning/http/client/AsyncHttpClientConfig;

    .line 43
    return-void
.end method


# virtual methods
.method public newSSLEngine(Ljava/lang/String;I)Ljavax/net/ssl/SSLEngine;
    .locals 5
    .param p1, "peerHost"    # Ljava/lang/String;
    .param p2, "peerPort"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .prologue
    .line 47
    iget-object v3, p0, Lcom/ning/http/client/SSLEngineFactory$DefaultSSLEngineFactory;->config:Lcom/ning/http/client/AsyncHttpClientConfig;

    invoke-virtual {v3}, Lcom/ning/http/client/AsyncHttpClientConfig;->getSSLContext()Ljavax/net/ssl/SSLContext;

    move-result-object v1

    .line 49
    .local v1, "sslContext":Ljavax/net/ssl/SSLContext;
    if-nez v1, :cond_0

    .line 50
    invoke-static {}, Lcom/ning/http/util/SslUtils;->getInstance()Lcom/ning/http/util/SslUtils;

    move-result-object v3

    iget-object v4, p0, Lcom/ning/http/client/SSLEngineFactory$DefaultSSLEngineFactory;->config:Lcom/ning/http/client/AsyncHttpClientConfig;

    invoke-virtual {v4}, Lcom/ning/http/client/AsyncHttpClientConfig;->isAcceptAnyCertificate()Z

    move-result v4

    invoke-virtual {v3, v4}, Lcom/ning/http/util/SslUtils;->getSSLContext(Z)Ljavax/net/ssl/SSLContext;

    move-result-object v1

    .line 52
    :cond_0
    invoke-virtual {v1, p1, p2}, Ljavax/net/ssl/SSLContext;->createSSLEngine(Ljava/lang/String;I)Ljavax/net/ssl/SSLEngine;

    move-result-object v2

    .line 53
    .local v2, "sslEngine":Ljavax/net/ssl/SSLEngine;
    iget-object v3, p0, Lcom/ning/http/client/SSLEngineFactory$DefaultSSLEngineFactory;->config:Lcom/ning/http/client/AsyncHttpClientConfig;

    invoke-virtual {v3}, Lcom/ning/http/client/AsyncHttpClientConfig;->isAcceptAnyCertificate()Z

    move-result v3

    if-nez v3, :cond_1

    .line 54
    invoke-virtual {v2}, Ljavax/net/ssl/SSLEngine;->getSSLParameters()Ljavax/net/ssl/SSLParameters;

    move-result-object v0

    .line 55
    .local v0, "params":Ljavax/net/ssl/SSLParameters;
    const-string v3, "HTTPS"

    invoke-virtual {v0, v3}, Ljavax/net/ssl/SSLParameters;->setEndpointIdentificationAlgorithm(Ljava/lang/String;)V

    .line 56
    invoke-virtual {v2, v0}, Ljavax/net/ssl/SSLEngine;->setSSLParameters(Ljavax/net/ssl/SSLParameters;)V

    .line 58
    .end local v0    # "params":Ljavax/net/ssl/SSLParameters;
    :cond_1
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Ljavax/net/ssl/SSLEngine;->setUseClientMode(Z)V

    .line 60
    iget-object v3, p0, Lcom/ning/http/client/SSLEngineFactory$DefaultSSLEngineFactory;->config:Lcom/ning/http/client/AsyncHttpClientConfig;

    invoke-virtual {v3}, Lcom/ning/http/client/AsyncHttpClientConfig;->getEnabledProtocols()[Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_2

    .line 61
    iget-object v3, p0, Lcom/ning/http/client/SSLEngineFactory$DefaultSSLEngineFactory;->config:Lcom/ning/http/client/AsyncHttpClientConfig;

    invoke-virtual {v3}, Lcom/ning/http/client/AsyncHttpClientConfig;->getEnabledProtocols()[Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljavax/net/ssl/SSLEngine;->setEnabledProtocols([Ljava/lang/String;)V

    .line 63
    :cond_2
    iget-object v3, p0, Lcom/ning/http/client/SSLEngineFactory$DefaultSSLEngineFactory;->config:Lcom/ning/http/client/AsyncHttpClientConfig;

    invoke-virtual {v3}, Lcom/ning/http/client/AsyncHttpClientConfig;->getEnabledCipherSuites()[Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_3

    .line 64
    iget-object v3, p0, Lcom/ning/http/client/SSLEngineFactory$DefaultSSLEngineFactory;->config:Lcom/ning/http/client/AsyncHttpClientConfig;

    invoke-virtual {v3}, Lcom/ning/http/client/AsyncHttpClientConfig;->getEnabledCipherSuites()[Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljavax/net/ssl/SSLEngine;->setEnabledCipherSuites([Ljava/lang/String;)V

    .line 66
    :cond_3
    return-object v2
.end method
