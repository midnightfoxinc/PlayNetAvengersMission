.class public Lorg/jboss/netty/logging/Slf4JLoggerFactory;
.super Lorg/jboss/netty/logging/InternalLoggerFactory;
.source "Slf4JLoggerFactory.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 26
    invoke-direct {p0}, Lorg/jboss/netty/logging/InternalLoggerFactory;-><init>()V

    return-void
.end method


# virtual methods
.method public newInstance(Ljava/lang/String;)Lorg/jboss/netty/logging/InternalLogger;
    .locals 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 30
    invoke-static {p1}, Lorg/slf4j/LoggerFactory;->getLogger(Ljava/lang/String;)Lorg/slf4j/Logger;

    move-result-object v0

    .line 32
    .local v0, "logger":Lorg/slf4j/Logger;
    new-instance v1, Lorg/jboss/netty/logging/Slf4JLogger;

    invoke-direct {v1, v0}, Lorg/jboss/netty/logging/Slf4JLogger;-><init>(Lorg/slf4j/Logger;)V

    return-object v1
.end method
