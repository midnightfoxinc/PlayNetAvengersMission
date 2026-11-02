.class final Lcom/ning/http/client/providers/grizzly/ConnectionManager$NonCachingPool;
.super Ljava/lang/Object;
.source "ConnectionManager.java"

# interfaces
.implements Lcom/ning/http/client/providers/grizzly/ConnectionPool;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ning/http/client/providers/grizzly/ConnectionManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "NonCachingPool"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 278
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/ning/http/client/providers/grizzly/ConnectionManager$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/ning/http/client/providers/grizzly/ConnectionManager$1;

    .prologue
    .line 278
    invoke-direct {p0}, Lcom/ning/http/client/providers/grizzly/ConnectionManager$NonCachingPool;-><init>()V

    return-void
.end method


# virtual methods
.method public canCacheConnection()Z
    .locals 1

    .prologue
    .line 297
    const/4 v0, 0x1

    return v0
.end method

.method public destroy()V
    .locals 0

    .prologue
    .line 302
    return-void
.end method

.method public offer(Ljava/lang/String;Lorg/glassfish/grizzly/Connection;)Z
    .locals 1
    .param p1, "uri"    # Ljava/lang/String;
    .param p2, "connection"    # Lorg/glassfish/grizzly/Connection;

    .prologue
    .line 285
    const/4 v0, 0x0

    return v0
.end method

.method public poll(Ljava/lang/String;)Lorg/glassfish/grizzly/Connection;
    .locals 1
    .param p1, "uri"    # Ljava/lang/String;

    .prologue
    .line 289
    const/4 v0, 0x0

    return-object v0
.end method

.method public removeAll(Lorg/glassfish/grizzly/Connection;)Z
    .locals 1
    .param p1, "connection"    # Lorg/glassfish/grizzly/Connection;

    .prologue
    .line 293
    const/4 v0, 0x0

    return v0
.end method
