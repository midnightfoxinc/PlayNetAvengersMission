.class public final Lorg/jboss/netty/util/internal/ByteBufferUtil;
.super Ljava/lang/Object;
.source "ByteBufferUtil.java"


# static fields
.field private static final CLEAN_SUPPORTED:Z

.field private static final directBufferCleaner:Ljava/lang/reflect/Method;

.field private static final directBufferCleanerClean:Ljava/lang/reflect/Method;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .prologue
    .line 30
    const/4 v1, 0x0

    .line 31
    .local v1, "directBufferCleanerX":Ljava/lang/reflect/Method;
    const/4 v0, 0x0

    .line 34
    .local v0, "directBufferCleanerCleanX":Ljava/lang/reflect/Method;
    :try_start_0
    const-string v4, "java.nio.DirectByteBuffer"

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    const-string v5, "cleaner"

    const/4 v6, 0x0

    new-array v6, v6, [Ljava/lang/Class;

    invoke-virtual {v4, v5, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 35
    const/4 v4, 0x1

    invoke-virtual {v1, v4}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 36
    const-string v4, "sun.misc.Cleaner"

    invoke-static {v4}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v4

    const-string v5, "clean"

    const/4 v6, 0x0

    new-array v6, v6, [Ljava/lang/Class;

    invoke-virtual {v4, v5, v6}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 37
    const/4 v4, 0x1

    invoke-virtual {v0, v4}, Ljava/lang/reflect/Method;->setAccessible(Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 38
    const/4 v3, 0x1

    .line 42
    .local v3, "v":Z
    :goto_0
    sput-boolean v3, Lorg/jboss/netty/util/internal/ByteBufferUtil;->CLEAN_SUPPORTED:Z

    .line 43
    sput-object v1, Lorg/jboss/netty/util/internal/ByteBufferUtil;->directBufferCleaner:Ljava/lang/reflect/Method;

    .line 44
    sput-object v0, Lorg/jboss/netty/util/internal/ByteBufferUtil;->directBufferCleanerClean:Ljava/lang/reflect/Method;

    .line 45
    return-void

    .line 39
    .end local v3    # "v":Z
    :catch_0
    move-exception v2

    .line 40
    .local v2, "e":Ljava/lang/Exception;
    const/4 v3, 0x0

    .restart local v3    # "v":Z
    goto :goto_0
.end method

.method private constructor <init>()V
    .locals 0

    .prologue
    .line 61
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 63
    return-void
.end method

.method public static destroy(Ljava/nio/ByteBuffer;)V
    .locals 3
    .param p0, "buffer"    # Ljava/nio/ByteBuffer;

    .prologue
    .line 51
    sget-boolean v1, Lorg/jboss/netty/util/internal/ByteBufferUtil;->CLEAN_SUPPORTED:Z

    if-eqz v1, :cond_0

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->isDirect()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 53
    :try_start_0
    sget-object v1, Lorg/jboss/netty/util/internal/ByteBufferUtil;->directBufferCleaner:Ljava/lang/reflect/Method;

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {v1, p0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    .line 54
    .local v0, "cleaner":Ljava/lang/Object;
    sget-object v1, Lorg/jboss/netty/util/internal/ByteBufferUtil;->directBufferCleanerClean:Ljava/lang/reflect/Method;

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {v1, v0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 59
    .end local v0    # "cleaner":Ljava/lang/Object;
    :cond_0
    :goto_0
    return-void

    .line 55
    :catch_0
    move-exception v1

    goto :goto_0
.end method
