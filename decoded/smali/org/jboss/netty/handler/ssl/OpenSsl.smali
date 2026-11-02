.class public final Lorg/jboss/netty/handler/ssl/OpenSsl;
.super Ljava/lang/Object;
.source "OpenSsl.java"


# static fields
.field static final IGNORABLE_ERROR_PREFIX:Ljava/lang/String; = "error:00000000:"

.field private static final UNAVAILABILITY_CAUSE:Ljava/lang/Throwable;

.field private static final logger:Lorg/jboss/netty/logging/InternalLogger;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .prologue
    .line 31
    const-class v2, Lorg/jboss/netty/handler/ssl/OpenSsl;

    invoke-static {v2}, Lorg/jboss/netty/logging/InternalLoggerFactory;->getInstance(Ljava/lang/Class;)Lorg/jboss/netty/logging/InternalLogger;

    move-result-object v2

    sput-object v2, Lorg/jboss/netty/handler/ssl/OpenSsl;->logger:Lorg/jboss/netty/logging/InternalLogger;

    .line 37
    const/4 v0, 0x0

    .line 39
    .local v0, "cause":Ljava/lang/Throwable;
    :try_start_0
    const-string v2, "netty-tcnative"

    const-class v3, Lorg/apache/tomcat/jni/SSL;

    invoke-virtual {v3}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v3

    invoke-static {v2, v3}, Lorg/jboss/netty/util/internal/NativeLibraryLoader;->load(Ljava/lang/String;Ljava/lang/ClassLoader;)V

    .line 40
    const-string v2, "provided"

    invoke-static {v2}, Lorg/apache/tomcat/jni/Library;->initialize(Ljava/lang/String;)Z

    .line 41
    const/4 v2, 0x0

    invoke-static {v2}, Lorg/apache/tomcat/jni/SSL;->initialize(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    .line 48
    :goto_0
    sput-object v0, Lorg/jboss/netty/handler/ssl/OpenSsl;->UNAVAILABILITY_CAUSE:Ljava/lang/Throwable;

    .line 49
    return-void

    .line 42
    :catch_0
    move-exception v1

    .line 43
    .local v1, "t":Ljava/lang/Throwable;
    move-object v0, v1

    .line 44
    sget-object v2, Lorg/jboss/netty/handler/ssl/OpenSsl;->logger:Lorg/jboss/netty/logging/InternalLogger;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Failed to load netty-tcnative; "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-class v4, Lorg/jboss/netty/handler/ssl/OpenSslEngine;

    invoke-virtual {v4}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " will be unavailable."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3, v1}, Lorg/jboss/netty/logging/InternalLogger;->debug(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 83
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static ensureAvailability()V
    .locals 2

    .prologue
    .line 67
    sget-object v0, Lorg/jboss/netty/handler/ssl/OpenSsl;->UNAVAILABILITY_CAUSE:Ljava/lang/Throwable;

    if-eqz v0, :cond_0

    .line 68
    new-instance v0, Ljava/lang/UnsatisfiedLinkError;

    const-string v1, "failed to load the required native library"

    invoke-direct {v0, v1}, Ljava/lang/UnsatisfiedLinkError;-><init>(Ljava/lang/String;)V

    sget-object v1, Lorg/jboss/netty/handler/ssl/OpenSsl;->UNAVAILABILITY_CAUSE:Ljava/lang/Throwable;

    invoke-virtual {v0, v1}, Ljava/lang/UnsatisfiedLinkError;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    move-result-object v0

    check-cast v0, Ljava/lang/Error;

    throw v0

    .line 71
    :cond_0
    return-void
.end method

.method public static isAvailable()Z
    .locals 1

    .prologue
    .line 57
    sget-object v0, Lorg/jboss/netty/handler/ssl/OpenSsl;->UNAVAILABILITY_CAUSE:Ljava/lang/Throwable;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static unavailabilityCause()Ljava/lang/Throwable;
    .locals 1

    .prologue
    .line 80
    sget-object v0, Lorg/jboss/netty/handler/ssl/OpenSsl;->UNAVAILABILITY_CAUSE:Ljava/lang/Throwable;

    return-object v0
.end method
