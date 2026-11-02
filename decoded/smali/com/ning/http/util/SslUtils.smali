.class public Lcom/ning/http/util/SslUtils;
.super Ljava/lang/Object;
.source "SslUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/ning/http/util/SslUtils$SingletonHolder;,
        Lcom/ning/http/util/SslUtils$LooseTrustManager;
    }
.end annotation


# instance fields
.field private looseTrustManagerSSLContext:Ljavax/net/ssl/SSLContext;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    invoke-direct {p0}, Lcom/ning/http/util/SslUtils;->looseTrustManagerSSLContext()Ljavax/net/ssl/SSLContext;

    move-result-object v0

    iput-object v0, p0, Lcom/ning/http/util/SslUtils;->looseTrustManagerSSLContext:Ljavax/net/ssl/SSLContext;

    .line 56
    return-void
.end method

.method public static getInstance()Lcom/ning/http/util/SslUtils;
    .locals 1

    .prologue
    .line 61
    sget-object v0, Lcom/ning/http/util/SslUtils$SingletonHolder;->instance:Lcom/ning/http/util/SslUtils;

    return-object v0
.end method

.method private looseTrustManagerSSLContext()Ljavax/net/ssl/SSLContext;
    .locals 6

    .prologue
    .line 46
    :try_start_0
    const-string v2, "TLS"

    invoke-static {v2}, Ljavax/net/ssl/SSLContext;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/SSLContext;

    move-result-object v1

    .line 47
    .local v1, "sslContext":Ljavax/net/ssl/SSLContext;
    const/4 v2, 0x0

    const/4 v3, 0x1

    new-array v3, v3, [Ljavax/net/ssl/TrustManager;

    const/4 v4, 0x0

    new-instance v5, Lcom/ning/http/util/SslUtils$LooseTrustManager;

    invoke-direct {v5}, Lcom/ning/http/util/SslUtils$LooseTrustManager;-><init>()V

    aput-object v5, v3, v4

    new-instance v4, Ljava/security/SecureRandom;

    invoke-direct {v4}, Ljava/security/SecureRandom;-><init>()V

    invoke-virtual {v1, v2, v3, v4}, Ljavax/net/ssl/SSLContext;->init([Ljavax/net/ssl/KeyManager;[Ljavax/net/ssl/TrustManager;Ljava/security/SecureRandom;)V
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/security/KeyManagementException; {:try_start_0 .. :try_end_0} :catch_1

    .line 48
    return-object v1

    .line 49
    .end local v1    # "sslContext":Ljavax/net/ssl/SSLContext;
    :catch_0
    move-exception v0

    .line 50
    .local v0, "e":Ljava/security/NoSuchAlgorithmException;
    new-instance v2, Ljava/lang/ExceptionInInitializerError;

    invoke-direct {v2, v0}, Ljava/lang/ExceptionInInitializerError;-><init>(Ljava/lang/Throwable;)V

    throw v2

    .line 51
    .end local v0    # "e":Ljava/security/NoSuchAlgorithmException;
    :catch_1
    move-exception v0

    .line 52
    .local v0, "e":Ljava/security/KeyManagementException;
    new-instance v2, Ljava/lang/ExceptionInInitializerError;

    invoke-direct {v2, v0}, Ljava/lang/ExceptionInInitializerError;-><init>(Ljava/lang/Throwable;)V

    throw v2
.end method


# virtual methods
.method public getSSLContext(Z)Ljavax/net/ssl/SSLContext;
    .locals 1
    .param p1, "acceptAnyCertificate"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .prologue
    .line 65
    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/ning/http/util/SslUtils;->looseTrustManagerSSLContext:Ljavax/net/ssl/SSLContext;

    :goto_0
    return-object v0

    :cond_0
    invoke-static {}, Ljavax/net/ssl/SSLContext;->getDefault()Ljavax/net/ssl/SSLContext;

    move-result-object v0

    goto :goto_0
.end method
