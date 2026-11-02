.class public final Lorg/jboss/netty/handler/ssl/util/InsecureTrustManagerFactory;
.super Lorg/jboss/netty/handler/ssl/util/SimpleTrustManagerFactory;
.source "InsecureTrustManagerFactory.java"


# static fields
.field public static final INSTANCE:Ljavax/net/ssl/TrustManagerFactory;

.field private static final logger:Lorg/jboss/netty/logging/InternalLogger;

.field private static final tm:Ljavax/net/ssl/TrustManager;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 40
    const-class v0, Lorg/jboss/netty/handler/ssl/util/InsecureTrustManagerFactory;

    invoke-static {v0}, Lorg/jboss/netty/logging/InternalLoggerFactory;->getInstance(Ljava/lang/Class;)Lorg/jboss/netty/logging/InternalLogger;

    move-result-object v0

    sput-object v0, Lorg/jboss/netty/handler/ssl/util/InsecureTrustManagerFactory;->logger:Lorg/jboss/netty/logging/InternalLogger;

    .line 42
    new-instance v0, Lorg/jboss/netty/handler/ssl/util/InsecureTrustManagerFactory;

    invoke-direct {v0}, Lorg/jboss/netty/handler/ssl/util/InsecureTrustManagerFactory;-><init>()V

    sput-object v0, Lorg/jboss/netty/handler/ssl/util/InsecureTrustManagerFactory;->INSTANCE:Ljavax/net/ssl/TrustManagerFactory;

    .line 44
    new-instance v0, Lorg/jboss/netty/handler/ssl/util/InsecureTrustManagerFactory$1;

    invoke-direct {v0}, Lorg/jboss/netty/handler/ssl/util/InsecureTrustManagerFactory$1;-><init>()V

    sput-object v0, Lorg/jboss/netty/handler/ssl/util/InsecureTrustManagerFactory;->tm:Ljavax/net/ssl/TrustManager;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 58
    invoke-direct {p0}, Lorg/jboss/netty/handler/ssl/util/SimpleTrustManagerFactory;-><init>()V

    return-void
.end method

.method static synthetic access$000()Lorg/jboss/netty/logging/InternalLogger;
    .locals 1

    .prologue
    .line 38
    sget-object v0, Lorg/jboss/netty/handler/ssl/util/InsecureTrustManagerFactory;->logger:Lorg/jboss/netty/logging/InternalLogger;

    return-object v0
.end method


# virtual methods
.method protected engineGetTrustManagers()[Ljavax/net/ssl/TrustManager;
    .locals 3

    .prologue
    .line 68
    const/4 v0, 0x1

    new-array v0, v0, [Ljavax/net/ssl/TrustManager;

    const/4 v1, 0x0

    sget-object v2, Lorg/jboss/netty/handler/ssl/util/InsecureTrustManagerFactory;->tm:Ljavax/net/ssl/TrustManager;

    aput-object v2, v0, v1

    return-object v0
.end method

.method protected engineInit(Ljava/security/KeyStore;)V
    .locals 0
    .param p1, "keyStore"    # Ljava/security/KeyStore;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 61
    return-void
.end method

.method protected engineInit(Ljavax/net/ssl/ManagerFactoryParameters;)V
    .locals 0
    .param p1, "managerFactoryParameters"    # Ljavax/net/ssl/ManagerFactoryParameters;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 64
    return-void
.end method
