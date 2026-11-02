.class final Lorg/jboss/netty/handler/ssl/util/SimpleTrustManagerFactory$SimpleTrustManagerFactorySpi;
.super Ljavax/net/ssl/TrustManagerFactorySpi;
.source "SimpleTrustManagerFactory.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jboss/netty/handler/ssl/util/SimpleTrustManagerFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "SimpleTrustManagerFactorySpi"
.end annotation


# instance fields
.field private parent:Lorg/jboss/netty/handler/ssl/util/SimpleTrustManagerFactory;


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 96
    invoke-direct {p0}, Ljavax/net/ssl/TrustManagerFactorySpi;-><init>()V

    return-void
.end method


# virtual methods
.method protected engineGetTrustManagers()[Ljavax/net/ssl/TrustManager;
    .locals 1

    .prologue
    .line 129
    iget-object v0, p0, Lorg/jboss/netty/handler/ssl/util/SimpleTrustManagerFactory$SimpleTrustManagerFactorySpi;->parent:Lorg/jboss/netty/handler/ssl/util/SimpleTrustManagerFactory;

    invoke-virtual {v0}, Lorg/jboss/netty/handler/ssl/util/SimpleTrustManagerFactory;->engineGetTrustManagers()[Ljavax/net/ssl/TrustManager;

    move-result-object v0

    return-object v0
.end method

.method protected engineInit(Ljava/security/KeyStore;)V
    .locals 2
    .param p1, "keyStore"    # Ljava/security/KeyStore;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/KeyStoreException;
        }
    .end annotation

    .prologue
    .line 107
    :try_start_0
    iget-object v1, p0, Lorg/jboss/netty/handler/ssl/util/SimpleTrustManagerFactory$SimpleTrustManagerFactorySpi;->parent:Lorg/jboss/netty/handler/ssl/util/SimpleTrustManagerFactory;

    invoke-virtual {v1, p1}, Lorg/jboss/netty/handler/ssl/util/SimpleTrustManagerFactory;->engineInit(Ljava/security/KeyStore;)V
    :try_end_0
    .catch Ljava/security/KeyStoreException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 113
    return-void

    .line 108
    :catch_0
    move-exception v0

    .line 109
    .local v0, "e":Ljava/security/KeyStoreException;
    throw v0

    .line 110
    .end local v0    # "e":Ljava/security/KeyStoreException;
    :catch_1
    move-exception v0

    .line 111
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Ljava/security/KeyStoreException;

    invoke-direct {v1, v0}, Ljava/security/KeyStoreException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method protected engineInit(Ljavax/net/ssl/ManagerFactoryParameters;)V
    .locals 2
    .param p1, "managerFactoryParameters"    # Ljavax/net/ssl/ManagerFactoryParameters;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/InvalidAlgorithmParameterException;
        }
    .end annotation

    .prologue
    .line 119
    :try_start_0
    iget-object v1, p0, Lorg/jboss/netty/handler/ssl/util/SimpleTrustManagerFactory$SimpleTrustManagerFactorySpi;->parent:Lorg/jboss/netty/handler/ssl/util/SimpleTrustManagerFactory;

    invoke-virtual {v1, p1}, Lorg/jboss/netty/handler/ssl/util/SimpleTrustManagerFactory;->engineInit(Ljavax/net/ssl/ManagerFactoryParameters;)V
    :try_end_0
    .catch Ljava/security/InvalidAlgorithmParameterException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 125
    return-void

    .line 120
    :catch_0
    move-exception v0

    .line 121
    .local v0, "e":Ljava/security/InvalidAlgorithmParameterException;
    throw v0

    .line 122
    .end local v0    # "e":Ljava/security/InvalidAlgorithmParameterException;
    :catch_1
    move-exception v0

    .line 123
    .local v0, "e":Ljava/lang/Exception;
    new-instance v1, Ljava/security/InvalidAlgorithmParameterException;

    invoke-direct {v1, v0}, Ljava/security/InvalidAlgorithmParameterException;-><init>(Ljava/lang/Throwable;)V

    throw v1
.end method

.method init(Lorg/jboss/netty/handler/ssl/util/SimpleTrustManagerFactory;)V
    .locals 0
    .param p1, "parent"    # Lorg/jboss/netty/handler/ssl/util/SimpleTrustManagerFactory;

    .prologue
    .line 101
    iput-object p1, p0, Lorg/jboss/netty/handler/ssl/util/SimpleTrustManagerFactory$SimpleTrustManagerFactorySpi;->parent:Lorg/jboss/netty/handler/ssl/util/SimpleTrustManagerFactory;

    .line 102
    return-void
.end method
