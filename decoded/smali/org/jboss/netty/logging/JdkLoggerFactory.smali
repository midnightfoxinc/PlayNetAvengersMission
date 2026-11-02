.class public Lorg/jboss/netty/logging/JdkLoggerFactory;
.super Lorg/jboss/netty/logging/InternalLoggerFactory;
.source "JdkLoggerFactory.java"


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
    invoke-static {p1}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    .line 32
    .local v0, "logger":Ljava/util/logging/Logger;
    new-instance v1, Lorg/jboss/netty/logging/JdkLogger;

    invoke-direct {v1, v0, p1}, Lorg/jboss/netty/logging/JdkLogger;-><init>(Ljava/util/logging/Logger;Ljava/lang/String;)V

    return-object v1
.end method
