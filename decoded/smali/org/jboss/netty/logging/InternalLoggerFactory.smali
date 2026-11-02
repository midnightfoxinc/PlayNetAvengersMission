.class public abstract Lorg/jboss/netty/logging/InternalLoggerFactory;
.super Ljava/lang/Object;
.source "InternalLoggerFactory.java"


# static fields
.field private static volatile defaultFactory:Lorg/jboss/netty/logging/InternalLoggerFactory;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 36
    new-instance v0, Lorg/jboss/netty/logging/JdkLoggerFactory;

    invoke-direct {v0}, Lorg/jboss/netty/logging/JdkLoggerFactory;-><init>()V

    sput-object v0, Lorg/jboss/netty/logging/InternalLoggerFactory;->defaultFactory:Lorg/jboss/netty/logging/InternalLoggerFactory;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getDefaultFactory()Lorg/jboss/netty/logging/InternalLoggerFactory;
    .locals 1

    .prologue
    .line 43
    sget-object v0, Lorg/jboss/netty/logging/InternalLoggerFactory;->defaultFactory:Lorg/jboss/netty/logging/InternalLoggerFactory;

    return-object v0
.end method

.method public static getInstance(Ljava/lang/Class;)Lorg/jboss/netty/logging/InternalLogger;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class",
            "<*>;)",
            "Lorg/jboss/netty/logging/InternalLogger;"
        }
    .end annotation

    .prologue
    .line 60
    .local p0, "clazz":Ljava/lang/Class;, "Ljava/lang/Class<*>;"
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/jboss/netty/logging/InternalLoggerFactory;->getInstance(Ljava/lang/String;)Lorg/jboss/netty/logging/InternalLogger;

    move-result-object v0

    return-object v0
.end method

.method public static getInstance(Ljava/lang/String;)Lorg/jboss/netty/logging/InternalLogger;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 67
    invoke-static {}, Lorg/jboss/netty/logging/InternalLoggerFactory;->getDefaultFactory()Lorg/jboss/netty/logging/InternalLoggerFactory;

    move-result-object v0

    invoke-virtual {v0, p0}, Lorg/jboss/netty/logging/InternalLoggerFactory;->newInstance(Ljava/lang/String;)Lorg/jboss/netty/logging/InternalLogger;

    move-result-object v0

    return-object v0
.end method

.method public static setDefaultFactory(Lorg/jboss/netty/logging/InternalLoggerFactory;)V
    .locals 2
    .param p0, "defaultFactory"    # Lorg/jboss/netty/logging/InternalLoggerFactory;

    .prologue
    .line 50
    if-nez p0, :cond_0

    .line 51
    new-instance v0, Ljava/lang/NullPointerException;

    const-string v1, "defaultFactory"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 53
    :cond_0
    sput-object p0, Lorg/jboss/netty/logging/InternalLoggerFactory;->defaultFactory:Lorg/jboss/netty/logging/InternalLoggerFactory;

    .line 54
    return-void
.end method


# virtual methods
.method public abstract newInstance(Ljava/lang/String;)Lorg/jboss/netty/logging/InternalLogger;
.end method
