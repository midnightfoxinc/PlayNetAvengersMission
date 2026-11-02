.class final Lorg/jboss/netty/handler/ssl/util/SimpleTrustManagerFactory$2;
.super Ljava/lang/ThreadLocal;
.source "SimpleTrustManagerFactory.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/jboss/netty/handler/ssl/util/SimpleTrustManagerFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/ThreadLocal",
        "<",
        "Lorg/jboss/netty/handler/ssl/util/SimpleTrustManagerFactory$SimpleTrustManagerFactorySpi;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 46
    invoke-direct {p0}, Ljava/lang/ThreadLocal;-><init>()V

    return-void
.end method


# virtual methods
.method protected bridge synthetic initialValue()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 46
    invoke-virtual {p0}, Lorg/jboss/netty/handler/ssl/util/SimpleTrustManagerFactory$2;->initialValue()Lorg/jboss/netty/handler/ssl/util/SimpleTrustManagerFactory$SimpleTrustManagerFactorySpi;

    move-result-object v0

    return-object v0
.end method

.method protected initialValue()Lorg/jboss/netty/handler/ssl/util/SimpleTrustManagerFactory$SimpleTrustManagerFactorySpi;
    .locals 1

    .prologue
    .line 49
    new-instance v0, Lorg/jboss/netty/handler/ssl/util/SimpleTrustManagerFactory$SimpleTrustManagerFactorySpi;

    invoke-direct {v0}, Lorg/jboss/netty/handler/ssl/util/SimpleTrustManagerFactory$SimpleTrustManagerFactorySpi;-><init>()V

    return-object v0
.end method
