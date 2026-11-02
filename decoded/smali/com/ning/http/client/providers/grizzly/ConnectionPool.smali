.class public interface abstract Lcom/ning/http/client/providers/grizzly/ConnectionPool;
.super Ljava/lang/Object;
.source "ConnectionPool.java"


# virtual methods
.method public abstract canCacheConnection()Z
.end method

.method public abstract destroy()V
.end method

.method public abstract offer(Ljava/lang/String;Lorg/glassfish/grizzly/Connection;)Z
.end method

.method public abstract poll(Ljava/lang/String;)Lorg/glassfish/grizzly/Connection;
.end method

.method public abstract removeAll(Lorg/glassfish/grizzly/Connection;)Z
.end method
