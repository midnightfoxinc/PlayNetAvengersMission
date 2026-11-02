.class Lcom/ning/http/client/providers/grizzly/HostnameVerifierListener$HostnameVerifierTask;
.super Ljava/lang/Object;
.source "HostnameVerifierListener.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ning/http/client/providers/grizzly/HostnameVerifierListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "HostnameVerifierTask"
.end annotation


# instance fields
.field private final connection:Lorg/glassfish/grizzly/Connection;

.field private final delegate:Lorg/glassfish/grizzly/CompletionHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lorg/glassfish/grizzly/CompletionHandler",
            "<",
            "Lorg/glassfish/grizzly/Connection;",
            ">;"
        }
    .end annotation
.end field

.field private final host:Ljava/lang/String;

.field private final verifier:Ljavax/net/ssl/HostnameVerifier;


# direct methods
.method public constructor <init>(Ljavax/net/ssl/HostnameVerifier;Lorg/glassfish/grizzly/Connection;Ljava/lang/String;Lorg/glassfish/grizzly/CompletionHandler;)V
    .locals 0
    .param p1, "verifier"    # Ljavax/net/ssl/HostnameVerifier;
    .param p2, "connection"    # Lorg/glassfish/grizzly/Connection;
    .param p3, "host"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljavax/net/ssl/HostnameVerifier;",
            "Lorg/glassfish/grizzly/Connection;",
            "Ljava/lang/String;",
            "Lorg/glassfish/grizzly/CompletionHandler",
            "<",
            "Lorg/glassfish/grizzly/Connection;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 112
    .local p4, "delegate":Lorg/glassfish/grizzly/CompletionHandler;, "Lorg/glassfish/grizzly/CompletionHandler<Lorg/glassfish/grizzly/Connection;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 113
    iput-object p1, p0, Lcom/ning/http/client/providers/grizzly/HostnameVerifierListener$HostnameVerifierTask;->verifier:Ljavax/net/ssl/HostnameVerifier;

    .line 114
    iput-object p2, p0, Lcom/ning/http/client/providers/grizzly/HostnameVerifierListener$HostnameVerifierTask;->connection:Lorg/glassfish/grizzly/Connection;

    .line 115
    iput-object p3, p0, Lcom/ning/http/client/providers/grizzly/HostnameVerifierListener$HostnameVerifierTask;->host:Ljava/lang/String;

    .line 116
    iput-object p4, p0, Lcom/ning/http/client/providers/grizzly/HostnameVerifierListener$HostnameVerifierTask;->delegate:Lorg/glassfish/grizzly/CompletionHandler;

    .line 117
    return-void
.end method


# virtual methods
.method public verify()V
    .locals 7

    .prologue
    .line 120
    iget-object v2, p0, Lcom/ning/http/client/providers/grizzly/HostnameVerifierListener$HostnameVerifierTask;->connection:Lorg/glassfish/grizzly/Connection;

    invoke-static {v2}, Lorg/glassfish/grizzly/ssl/SSLUtils;->getSSLEngine(Lorg/glassfish/grizzly/Connection;)Ljavax/net/ssl/SSLEngine;

    move-result-object v2

    invoke-virtual {v2}, Ljavax/net/ssl/SSLEngine;->getSession()Ljavax/net/ssl/SSLSession;

    move-result-object v1

    .line 121
    .local v1, "session":Ljavax/net/ssl/SSLSession;
    invoke-static {}, Lcom/ning/http/client/providers/grizzly/HostnameVerifierListener;->access$100()Lorg/slf4j/Logger;

    move-result-object v2

    invoke-interface {v2}, Lorg/slf4j/Logger;->isDebugEnabled()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 122
    invoke-static {}, Lcom/ning/http/client/providers/grizzly/HostnameVerifierListener;->access$100()Lorg/slf4j/Logger;

    move-result-object v2

    const-string v3, "SSL Handshake onComplete: session = {}, id = {}, isValid = {}, host = {}"

    const/4 v4, 0x4

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x1

    invoke-interface {v1}, Ljavax/net/ssl/SSLSession;->getId()[B

    move-result-object v6

    invoke-static {v6}, Lcom/ning/http/util/Base64;->encode([B)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x2

    invoke-interface {v1}, Ljavax/net/ssl/SSLSession;->isValid()Z

    move-result v6

    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v6

    aput-object v6, v4, v5

    const/4 v5, 0x3

    iget-object v6, p0, Lcom/ning/http/client/providers/grizzly/HostnameVerifierListener$HostnameVerifierTask;->host:Ljava/lang/String;

    aput-object v6, v4, v5

    invoke-interface {v2, v3, v4}, Lorg/slf4j/Logger;->debug(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 126
    :cond_0
    iget-object v2, p0, Lcom/ning/http/client/providers/grizzly/HostnameVerifierListener$HostnameVerifierTask;->verifier:Ljavax/net/ssl/HostnameVerifier;

    iget-object v3, p0, Lcom/ning/http/client/providers/grizzly/HostnameVerifierListener$HostnameVerifierTask;->host:Ljava/lang/String;

    invoke-interface {v2, v3, v1}, Ljavax/net/ssl/HostnameVerifier;->verify(Ljava/lang/String;Ljavax/net/ssl/SSLSession;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 127
    iget-object v2, p0, Lcom/ning/http/client/providers/grizzly/HostnameVerifierListener$HostnameVerifierTask;->connection:Lorg/glassfish/grizzly/Connection;

    invoke-interface {v2}, Lorg/glassfish/grizzly/Connection;->terminateSilently()V

    .line 128
    new-instance v0, Ljava/net/ConnectException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Host name verification failed for host "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/ning/http/client/providers/grizzly/HostnameVerifierListener$HostnameVerifierTask;->host:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/net/ConnectException;-><init>(Ljava/lang/String;)V

    .line 129
    .local v0, "e":Ljava/io/IOException;
    iget-object v2, p0, Lcom/ning/http/client/providers/grizzly/HostnameVerifierListener$HostnameVerifierTask;->delegate:Lorg/glassfish/grizzly/CompletionHandler;

    invoke-interface {v2, v0}, Lorg/glassfish/grizzly/CompletionHandler;->failed(Ljava/lang/Throwable;)V

    .line 131
    .end local v0    # "e":Ljava/io/IOException;
    :cond_1
    return-void
.end method
