.class public Lorg/jboss/netty/logging/CommonsLoggerFactory;
.super Lorg/jboss/netty/logging/InternalLoggerFactory;
.source "CommonsLoggerFactory.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 27
    invoke-direct {p0}, Lorg/jboss/netty/logging/InternalLoggerFactory;-><init>()V

    return-void
.end method


# virtual methods
.method public newInstance(Ljava/lang/String;)Lorg/jboss/netty/logging/InternalLogger;
    .locals 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 31
    invoke-static {p1}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/String;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    .line 33
    .local v0, "logger":Lorg/apache/commons/logging/Log;
    new-instance v1, Lorg/jboss/netty/logging/CommonsLogger;

    invoke-direct {v1, v0, p1}, Lorg/jboss/netty/logging/CommonsLogger;-><init>(Lorg/apache/commons/logging/Log;Ljava/lang/String;)V

    return-object v1
.end method
