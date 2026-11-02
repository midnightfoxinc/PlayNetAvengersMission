.class public abstract Lorg/jboss/netty/handler/ssl/util/SimpleTrustManagerFactory;
.super Ljavax/net/ssl/TrustManagerFactory;
.source "SimpleTrustManagerFactory.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/jboss/netty/handler/ssl/util/SimpleTrustManagerFactory$SimpleTrustManagerFactorySpi;
    }
.end annotation


# static fields
.field private static final CURRENT_SPI:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal",
            "<",
            "Lorg/jboss/netty/handler/ssl/util/SimpleTrustManagerFactory$SimpleTrustManagerFactorySpi;",
            ">;"
        }
    .end annotation
.end field

.field private static final PROVIDER:Ljava/security/Provider;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    .line 33
    new-instance v0, Lorg/jboss/netty/handler/ssl/util/SimpleTrustManagerFactory$1;

    const-string v1, ""

    const-wide/16 v2, 0x0

    const-string v4, ""

    invoke-direct {v0, v1, v2, v3, v4}, Lorg/jboss/netty/handler/ssl/util/SimpleTrustManagerFactory$1;-><init>(Ljava/lang/String;DLjava/lang/String;)V

    sput-object v0, Lorg/jboss/netty/handler/ssl/util/SimpleTrustManagerFactory;->PROVIDER:Ljava/security/Provider;

    .line 45
    new-instance v0, Lorg/jboss/netty/handler/ssl/util/SimpleTrustManagerFactory$2;

    invoke-direct {v0}, Lorg/jboss/netty/handler/ssl/util/SimpleTrustManagerFactory$2;-><init>()V

    sput-object v0, Lorg/jboss/netty/handler/ssl/util/SimpleTrustManagerFactory;->CURRENT_SPI:Ljava/lang/ThreadLocal;

    return-void
.end method

.method protected constructor <init>()V
    .locals 1

    .prologue
    .line 57
    const-string v0, ""

    invoke-direct {p0, v0}, Lorg/jboss/netty/handler/ssl/util/SimpleTrustManagerFactory;-><init>(Ljava/lang/String;)V

    .line 58
    return-void
.end method

.method protected constructor <init>(Ljava/lang/String;)V
    .locals 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 66
    sget-object v0, Lorg/jboss/netty/handler/ssl/util/SimpleTrustManagerFactory;->CURRENT_SPI:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljavax/net/ssl/TrustManagerFactorySpi;

    sget-object v1, Lorg/jboss/netty/handler/ssl/util/SimpleTrustManagerFactory;->PROVIDER:Ljava/security/Provider;

    invoke-direct {p0, v0, v1, p1}, Ljavax/net/ssl/TrustManagerFactory;-><init>(Ljavax/net/ssl/TrustManagerFactorySpi;Ljava/security/Provider;Ljava/lang/String;)V

    .line 67
    sget-object v0, Lorg/jboss/netty/handler/ssl/util/SimpleTrustManagerFactory;->CURRENT_SPI:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/jboss/netty/handler/ssl/util/SimpleTrustManagerFactory$SimpleTrustManagerFactorySpi;

    invoke-virtual {v0, p0}, Lorg/jboss/netty/handler/ssl/util/SimpleTrustManagerFactory$SimpleTrustManagerFactorySpi;->init(Lorg/jboss/netty/handler/ssl/util/SimpleTrustManagerFactory;)V

    .line 68
    sget-object v0, Lorg/jboss/netty/handler/ssl/util/SimpleTrustManagerFactory;->CURRENT_SPI:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->remove()V

    .line 70
    if-nez p1, :cond_0

    .line 71
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "name"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 73
    :cond_0
    return-void
.end method


# virtual methods
.method protected abstract engineGetTrustManagers()[Ljavax/net/ssl/TrustManager;
.end method

.method protected abstract engineInit(Ljava/security/KeyStore;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method

.method protected abstract engineInit(Ljavax/net/ssl/ManagerFactoryParameters;)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method
