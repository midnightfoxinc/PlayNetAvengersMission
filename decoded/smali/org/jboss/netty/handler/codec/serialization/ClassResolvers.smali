.class public final Lorg/jboss/netty/handler/codec/serialization/ClassResolvers;
.super Ljava/lang/Object;
.source "ClassResolvers.java"


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 98
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 100
    return-void
.end method

.method public static cacheDisabled(Ljava/lang/ClassLoader;)Lorg/jboss/netty/handler/codec/serialization/ClassResolver;
    .locals 2
    .param p0, "classLoader"    # Ljava/lang/ClassLoader;

    .prologue
    .line 30
    new-instance v0, Lorg/jboss/netty/handler/codec/serialization/ClassLoaderClassResolver;

    invoke-static {p0}, Lorg/jboss/netty/handler/codec/serialization/ClassResolvers;->defaultClassLoader(Ljava/lang/ClassLoader;)Ljava/lang/ClassLoader;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/jboss/netty/handler/codec/serialization/ClassLoaderClassResolver;-><init>(Ljava/lang/ClassLoader;)V

    return-object v0
.end method

.method static defaultClassLoader(Ljava/lang/ClassLoader;)Ljava/lang/ClassLoader;
    .locals 2
    .param p0, "classLoader"    # Ljava/lang/ClassLoader;

    .prologue
    .line 86
    if-eqz p0, :cond_0

    .line 95
    .end local p0    # "classLoader":Ljava/lang/ClassLoader;
    .local v0, "contextClassLoader":Ljava/lang/ClassLoader;
    :goto_0
    return-object p0

    .line 90
    .end local v0    # "contextClassLoader":Ljava/lang/ClassLoader;
    .restart local p0    # "classLoader":Ljava/lang/ClassLoader;
    :cond_0
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->getContextClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    .line 91
    .restart local v0    # "contextClassLoader":Ljava/lang/ClassLoader;
    if-eqz v0, :cond_1

    move-object p0, v0

    .line 92
    goto :goto_0

    .line 95
    :cond_1
    const-class v1, Lorg/jboss/netty/handler/codec/serialization/ClassResolvers;

    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object p0

    goto :goto_0
.end method

.method public static softCachingConcurrentResolver(Ljava/lang/ClassLoader;)Lorg/jboss/netty/handler/codec/serialization/ClassResolver;
    .locals 4
    .param p0, "classLoader"    # Ljava/lang/ClassLoader;

    .prologue
    .line 80
    new-instance v0, Lorg/jboss/netty/handler/codec/serialization/CachingClassResolver;

    new-instance v1, Lorg/jboss/netty/handler/codec/serialization/ClassLoaderClassResolver;

    invoke-static {p0}, Lorg/jboss/netty/handler/codec/serialization/ClassResolvers;->defaultClassLoader(Ljava/lang/ClassLoader;)Ljava/lang/ClassLoader;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/jboss/netty/handler/codec/serialization/ClassLoaderClassResolver;-><init>(Ljava/lang/ClassLoader;)V

    new-instance v2, Lorg/jboss/netty/handler/codec/serialization/SoftReferenceMap;

    new-instance v3, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v3}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    invoke-direct {v2, v3}, Lorg/jboss/netty/handler/codec/serialization/SoftReferenceMap;-><init>(Ljava/util/Map;)V

    invoke-direct {v0, v1, v2}, Lorg/jboss/netty/handler/codec/serialization/CachingClassResolver;-><init>(Lorg/jboss/netty/handler/codec/serialization/ClassResolver;Ljava/util/Map;)V

    return-object v0
.end method

.method public static softCachingResolver(Ljava/lang/ClassLoader;)Lorg/jboss/netty/handler/codec/serialization/ClassResolver;
    .locals 4
    .param p0, "classLoader"    # Ljava/lang/ClassLoader;

    .prologue
    .line 54
    new-instance v0, Lorg/jboss/netty/handler/codec/serialization/CachingClassResolver;

    new-instance v1, Lorg/jboss/netty/handler/codec/serialization/ClassLoaderClassResolver;

    invoke-static {p0}, Lorg/jboss/netty/handler/codec/serialization/ClassResolvers;->defaultClassLoader(Ljava/lang/ClassLoader;)Ljava/lang/ClassLoader;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/jboss/netty/handler/codec/serialization/ClassLoaderClassResolver;-><init>(Ljava/lang/ClassLoader;)V

    new-instance v2, Lorg/jboss/netty/handler/codec/serialization/SoftReferenceMap;

    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    invoke-direct {v2, v3}, Lorg/jboss/netty/handler/codec/serialization/SoftReferenceMap;-><init>(Ljava/util/Map;)V

    invoke-direct {v0, v1, v2}, Lorg/jboss/netty/handler/codec/serialization/CachingClassResolver;-><init>(Lorg/jboss/netty/handler/codec/serialization/ClassResolver;Ljava/util/Map;)V

    return-object v0
.end method

.method public static weakCachingConcurrentResolver(Ljava/lang/ClassLoader;)Lorg/jboss/netty/handler/codec/serialization/ClassResolver;
    .locals 4
    .param p0, "classLoader"    # Ljava/lang/ClassLoader;

    .prologue
    .line 67
    new-instance v0, Lorg/jboss/netty/handler/codec/serialization/CachingClassResolver;

    new-instance v1, Lorg/jboss/netty/handler/codec/serialization/ClassLoaderClassResolver;

    invoke-static {p0}, Lorg/jboss/netty/handler/codec/serialization/ClassResolvers;->defaultClassLoader(Ljava/lang/ClassLoader;)Ljava/lang/ClassLoader;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/jboss/netty/handler/codec/serialization/ClassLoaderClassResolver;-><init>(Ljava/lang/ClassLoader;)V

    new-instance v2, Lorg/jboss/netty/handler/codec/serialization/WeakReferenceMap;

    new-instance v3, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v3}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    invoke-direct {v2, v3}, Lorg/jboss/netty/handler/codec/serialization/WeakReferenceMap;-><init>(Ljava/util/Map;)V

    invoke-direct {v0, v1, v2}, Lorg/jboss/netty/handler/codec/serialization/CachingClassResolver;-><init>(Lorg/jboss/netty/handler/codec/serialization/ClassResolver;Ljava/util/Map;)V

    return-object v0
.end method

.method public static weakCachingResolver(Ljava/lang/ClassLoader;)Lorg/jboss/netty/handler/codec/serialization/ClassResolver;
    .locals 4
    .param p0, "classLoader"    # Ljava/lang/ClassLoader;

    .prologue
    .line 41
    new-instance v0, Lorg/jboss/netty/handler/codec/serialization/CachingClassResolver;

    new-instance v1, Lorg/jboss/netty/handler/codec/serialization/ClassLoaderClassResolver;

    invoke-static {p0}, Lorg/jboss/netty/handler/codec/serialization/ClassResolvers;->defaultClassLoader(Ljava/lang/ClassLoader;)Ljava/lang/ClassLoader;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/jboss/netty/handler/codec/serialization/ClassLoaderClassResolver;-><init>(Ljava/lang/ClassLoader;)V

    new-instance v2, Lorg/jboss/netty/handler/codec/serialization/WeakReferenceMap;

    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    invoke-direct {v2, v3}, Lorg/jboss/netty/handler/codec/serialization/WeakReferenceMap;-><init>(Ljava/util/Map;)V

    invoke-direct {v0, v1, v2}, Lorg/jboss/netty/handler/codec/serialization/CachingClassResolver;-><init>(Lorg/jboss/netty/handler/codec/serialization/ClassResolver;Ljava/util/Map;)V

    return-object v0
.end method
